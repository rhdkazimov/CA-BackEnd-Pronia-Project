using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Pronia.DAL;
using Pronia.Helper.FileManager;
using Pronia.Models;
using Pronia.ViewModels;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class PlantController : Controller
    {
        private readonly ProniaContext _context;
        private readonly IWebHostEnvironment _env;

        public PlantController(ProniaContext proniaContext, IWebHostEnvironment env)
        {
            _context = proniaContext;
            _env = env;
        }

        public IActionResult Index(int page = 1, string search = null)
        {
            var query = _context.Plants.Include(x => x.Category).Include(x => x.PlantImages.Where(bi => bi.PosterStatus == true)).AsQueryable();

            if (search != null)
                query = query.Where(x => x.Name.Contains(search));

            ViewBag.Search = search;

            return View(PaginatedList<Plant>.Create(query, page, 3));
        }

        public IActionResult Create()
        {
            ViewBag.Category = _context.Category.ToList();
            ViewBag.Tags = _context.Tags.ToList();

            return View();
        }

        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult Create(Plant plant)
        {
            if (!ModelState.IsValid) return View();


            if (!_context.Category.Any(x => x.Id == plant.CategoryId))
            {
                ModelState.AddModelError("CategoryId", "CategoryId is not correct");
                return View();
            }

            if (plant.PosterImage == null)
            {
                ModelState.AddModelError("PosterImage", "posterImage is required");
                return View();
            }

            if (plant.HoverPosterImage == null)
            {
                ModelState.AddModelError("HoverPosterImage", "posterImage is required");
                return View();
            }

            if(plant.SKU==null)
            {
                ModelState.AddModelError("SKU", "SKU is required");
                return View();
            }

            foreach (var tagId in plant.TagIds)
            {
                PlantTag plantTag = new PlantTag
                {
                    TagId = tagId,
                };

                plant.PlantTags.Add(plantTag);
            }

            PlantImage poster = new PlantImage
            {
                ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", plant.PosterImage),
                PosterStatus = true,
            };
            plant.PlantImages.Add(poster);

            PlantImage hoverPoster = new PlantImage
            {
                ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", plant.HoverPosterImage),
                PosterStatus = false,
            };
            plant.PlantImages.Add(hoverPoster);

            foreach (var img in plant.Images)
            {
                PlantImage plantImage = new PlantImage
                {
                    ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", img),
                };
                plant.PlantImages.Add(plantImage);
            }



            _context.Plants.Add(plant);
            _context.SaveChanges();

            return RedirectToAction("index");
        }


        public IActionResult Edit(int id)
        {
            ViewBag.Category = _context.Category.ToList();
            ViewBag.Tags = _context.Tags.ToList();


            Plant plant = _context.Plants.Include(x => x.PlantImages).Include(x => x.PlantTags).FirstOrDefault(x => x.Id == id);

            plant.TagIds = plant.PlantTags.Select(x => x.TagId).ToList();


            return View(plant);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Plant plant)
        {
            if (!ModelState.IsValid) return View();

            Plant existPlant = _context.Plants.Include(x => x.PlantTags).Include(x => x.PlantImages).FirstOrDefault(x => x.Id == plant.Id);

            if (existPlant == null) return View("Error");

            if (plant.CategoryId != existPlant.CategoryId && !_context.Plants.Any(x => x.Id == plant.CategoryId))
            {
                ModelState.AddModelError("AuthorId", "AuthorIs is not correct");
                return View();
            }


            existPlant.PlantTags.RemoveAll(x => !plant.TagIds.Contains(x.TagId));

            var newTagIds = plant.TagIds.FindAll(x => !existPlant.PlantTags.Any(bt => bt.TagId == x));
            foreach (var tagId in newTagIds)
            {
                PlantTag plantTag = new PlantTag { TagId = tagId };
                existPlant.PlantTags.Add(plantTag);
            }


            string oldPoster = null;
            if (plant.PosterImage != null)
            {
                PlantImage poster = existPlant.PlantImages.FirstOrDefault(x => x.PosterStatus == true);
                oldPoster = poster?.ImageName;

                if (poster == null)
                {
                    poster = new PlantImage { PosterStatus = true };
                    poster.ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", plant.PosterImage);
                    existPlant.PlantImages.Add(poster);
                }
                else
                    poster.ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", plant.PosterImage);
            }

            string oldHoverPoster = null;
            if (plant.HoverPosterImage != null)
            {
                PlantImage hoverPoster = existPlant.PlantImages.FirstOrDefault(x => x.PosterStatus == false);
                oldHoverPoster = hoverPoster?.ImageName;

                if (hoverPoster == null)
                {
                    hoverPoster = new PlantImage { PosterStatus = false };
                    hoverPoster.ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", plant.HoverPosterImage);
                    existPlant.PlantImages.Add(hoverPoster);
                }
                else
                    hoverPoster.ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", plant.HoverPosterImage);
            }

            var removedImages = existPlant.PlantImages.FindAll(x => x.PosterStatus == null && !plant.PlantImageIds.Contains(x.Id));
            existPlant.PlantImages.RemoveAll(x => x.PosterStatus == null && !plant.PlantImageIds.Contains(x.Id));

            foreach (var item in plant.Images)
            {
                PlantImage bookImage = new PlantImage
                {
                    ImageName = FileManager.Save(_env.WebRootPath, "uploads/plants", item),
                };
                existPlant.PlantImages.Add(bookImage);
            }

            existPlant.Name = plant.Name;
            existPlant.SalePrice = plant.SalePrice;
            existPlant.CostPrice = plant.CostPrice;
            existPlant.Desc = plant.Desc;
            existPlant.IsFeatured = plant.IsFeatured;
            existPlant.IsNew = plant.IsNew;
            existPlant.StockStatus = plant.StockStatus;
            existPlant.DiscountPercent = plant.DiscountPercent;
            existPlant.CategoryId = plant.CategoryId;

            _context.SaveChanges();


            if (oldPoster != null) FileManager.Delete(_env.WebRootPath, "uploads/plants", oldPoster);
            if (oldHoverPoster != null) FileManager.Delete(_env.WebRootPath, "uploads/plants", oldHoverPoster);

            if (removedImages.Any())
                FileManager.DeleteAll(_env.WebRootPath, "uploads/plants", removedImages.Select(x => x.ImageName).ToList());


            return RedirectToAction("index");
        }


        public IActionResult Delete(int id)
        {
            Plant existPlant = _context.Plants.Find(id);
            if (existPlant == null)
            {
                return StatusCode(404);
            }
            _context.Plants.Remove(existPlant);
            _context.SaveChanges();

            foreach (var item in existPlant.PlantImages)
            {
            FileManager.Delete(_env.WebRootPath, "uploads/plants", item.ImageName);
            }


            return RedirectToAction("index");
        }
    }
}
