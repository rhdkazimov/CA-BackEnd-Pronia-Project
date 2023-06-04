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

    }
}
