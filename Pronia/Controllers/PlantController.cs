using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Org.BouncyCastle.Bcpg.Sig;
using Pronia.DAL;
using Pronia.Models;
using Pronia.ViewModels;

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

        public IActionResult AddToBasket(int id)
        {
            List<BasketItemCookieViewModel> cookieItems = new List<BasketItemCookieViewModel>();

            BasketItemCookieViewModel cookieItem;
            var basketStr = Request.Cookies["basket"];
            if (basketStr != null)
            {
                cookieItems = JsonConvert.DeserializeObject<List<BasketItemCookieViewModel>>(basketStr);

                cookieItem = cookieItems.FirstOrDefault(x => x.PlantId == id);

                if (cookieItem != null)
                    cookieItem.Count++;
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

            BasketViewModel bv = new BasketViewModel();

            foreach (var ci in cookieItems)
            {
                BasketItemViewModel bi = new BasketItemViewModel
                {
                    Count = ci.Count,
                    Plant = _context.Plants.Include(x => x.PlantImages).FirstOrDefault(x => x.Id == ci.PlantId),
                };
                bv.BasketItems.Add(bi);
                bv.TotalPrice += (bi.Plant.DiscountPercent > 0 ? (bi.Plant.SalePrice * (100 - bi.Plant.DiscountPercent) / 100) : (bi.Plant.SalePrice)) * bi.Count;
            }

            return PartialView("_BasketPartialView", bv);
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
    }
}   
