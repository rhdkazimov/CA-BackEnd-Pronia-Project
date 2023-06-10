using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Org.BouncyCastle.Bcpg.Sig;
using Pronia.DAL;
using Pronia.Models;
using Pronia.ViewModels;
using System.Security.Claims;

namespace Pronia.Controllers
{
    public class PlantController : Controller
    {
        private readonly ProniaContext _context;

        public PlantController(ProniaContext context)
        {
            _context = context;
        }

        public IActionResult PlantDetail(int id)
        {
            PlantModalViewModel pm = new PlantModalViewModel
            {
                plant = _context.Plants
                 .Include(x => x.Category)
                 .Include(x => x.PlantImages)
                 .FirstOrDefault(x => x.Id == id),
                 features = _context.Features.ToList(),
            };

            return PartialView("_PlantModalPartialView", pm);
        }

        public IActionResult AddToBasket(int id,int count=1)
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("Member"))
            {
                string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                var basketItem = _context.BasketItems.FirstOrDefault(x => x.PlantId == id && x.AppUserId == userId);
                if (basketItem != null) basketItem.Count++;
                else
                {
                    basketItem = new BasketItem { AppUserId = userId, PlantId = id, Count = count };
                    _context.BasketItems.Add(basketItem);
                }
                _context.SaveChanges();
                var basketItems = _context.BasketItems.Include(x => x.Plant).ThenInclude(x => x.PlantImages).Where(x => x.AppUserId == userId).ToList();


                return PartialView("_BasketPartialView", GenerateBasketVM(basketItems));
            }
            else
            {
                List<BasketItemCookieViewModel> cookieItems = new List<BasketItemCookieViewModel>();

                BasketItemCookieViewModel cookieItem;
                var basketStr = Request.Cookies["basket"];
                if (basketStr != null)
                {
                    cookieItems = JsonConvert.DeserializeObject<List<BasketItemCookieViewModel>>(basketStr);

                    cookieItem = cookieItems.FirstOrDefault(x => x.PlantId == id);

                    if (cookieItem != null)
                    {
                        cookieItem.Count++;
                    }
                    else
                    {
                        cookieItem = new BasketItemCookieViewModel { PlantId = id, Count = 1 };
                        cookieItems.Add(cookieItem);
                    }
                }
                else
                {
                    cookieItem = new BasketItemCookieViewModel { PlantId = id, Count = 1 };
                    cookieItems.Add(cookieItem);
                }
                Response.Cookies.Append("Basket", JsonConvert.SerializeObject(cookieItems));
                return PartialView("_BasketPartialView", GenerateBasketVM(cookieItems));
            }
        }

        private BasketViewModel GenerateBasketVM(List<BasketItem> basketItems)
        {
            BasketViewModel bv = new BasketViewModel();
            foreach (var item in basketItems)
            {
                BasketItemViewModel bi = new BasketItemViewModel
                {
                    Count = item.Count,
                    Plant = item.Plant
                };
                bv.BasketItems.Add(bi);
                bv.TotalPrice += (bi.Plant.DiscountPercent > 0 ? (bi.Plant.SalePrice * (100 - bi.Plant.DiscountPercent) / 100) : bi.Plant.SalePrice) * bi.Count;
            }
            return bv;
        }

        private BasketViewModel GenerateBasketVM(List<BasketItemCookieViewModel> cookieItems)
        {
            BasketViewModel bv = new BasketViewModel();
            foreach (var ci in cookieItems)
            {
                BasketItemViewModel bi = new BasketItemViewModel
                {
                    Count = ci.Count,
                    Plant = _context.Plants.Include(x => x.PlantImages).FirstOrDefault(x => x.Id == ci.PlantId)
                };
                bv.BasketItems.Add(bi);
                bv.TotalPrice += (bi.Plant.DiscountPercent > 0 ? (bi.Plant.SalePrice * (100 - bi.Plant.DiscountPercent) / 100) : bi.Plant.SalePrice) * bi.Count;
            }

            return bv;
        }


        public IActionResult RemoveBasket(int id)
        {
            var basketStr = Request.Cookies["basket"];
            if (basketStr == null)
                return StatusCode(404);

            List<BasketItemCookieViewModel> cookieItems = JsonConvert.DeserializeObject<List<BasketItemCookieViewModel>>(basketStr);

            BasketItemCookieViewModel item = cookieItems.FirstOrDefault(x => x.PlantId == id);

            if (item == null)
                return StatusCode(404);

            if (item.Count > 1)
                item.Count--;
            else
                cookieItems.Remove(item);

            Response.Cookies.Append("basket", JsonConvert.SerializeObject(cookieItems));

            BasketViewModel bv = new BasketViewModel();
            foreach (var ci in cookieItems)
            {
                BasketItemViewModel bi = new BasketItemViewModel
                {
                    Count = ci.Count,
                    Plant = _context.Plants.Include(x => x.PlantImages).FirstOrDefault(x => x.Id == ci.PlantId)
                };
                bv.BasketItems.Add(bi);
                bv.TotalPrice += (bi.Plant.DiscountPercent > 0 ? (bi.Plant.SalePrice * (100 - bi.Plant.DiscountPercent) / 100) : bi.Plant.SalePrice) * bi.Count;
            }

            return PartialView("_BasketPartialView", bv);
        }

        public IActionResult Detail(int id)
        {
            Plant plant = _context.Plants
                .Include(x => x.PlantImages)
                .Include(x => x.Category)
                .Include(x => x.plantReviews).ThenInclude(x => x.AppUser)
                .Include(x => x.PlantTags).ThenInclude(pt => pt.Tag).FirstOrDefault(pt => pt.Id == id);


            if (plant == null) return View("Error");

            PlantDetailViewModel vm = new PlantDetailViewModel
            {
                Plant = plant,
                RelatedPlants = _context.Plants.Include(x => x.PlantImages).Where(x => x.CategoryId == plant.CategoryId).Take(4).ToList(),
                Review = new PlantReview { PlantId = id }
            };

            ViewBag.Feature = _context.Features.ToList();

            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Comment(PlantReview review)
        {

            if (!User.Identity.IsAuthenticated || !User.IsInRole("Member"))
                return RedirectToAction("login", "account", new { returnUrl = Url.Action("detail", "plant", new { id = review.PlantId }) });


            if (!ModelState.IsValid)
            {
                Plant plant = _context.Plants
            .Include(x => x.PlantImages)
            .Include(x => x.Category)
                .Include(x => x.plantReviews).ThenInclude(x => x.AppUser)
            .Include(x => x.PlantTags).ThenInclude(bt => bt.Tag).FirstOrDefault(x => x.Id == review.PlantId);

                if (plant == null) return View("Error");

                PlantDetailViewModel vm = new PlantDetailViewModel
                {
                    Plant = plant,
                    RelatedPlants = _context.Plants.Include(x => x.PlantImages).Where(x => x.CategoryId == plant.CategoryId).Take(4).ToList(),
                    Review = new PlantReview { PlantId = review.PlantId }
                };
                vm.Review = review;
                return View("Detail", vm);
            }

            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            review.AppUserId = userId;
            review.CreatedAt = DateTime.UtcNow.AddHours(4);

            _context.PlantReviews.Add(review);
            _context.SaveChanges();

            return RedirectToAction("detail", new { id = review.PlantId });

        }
    }
}   
