using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Pronia.DAL;
using Pronia.Helper.FileManager;
using Pronia.Models;
using Pronia.ViewModels;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin , Admin")]

    [Area("manage")]
    public class SliderController : Controller
    {
        private readonly ProniaContext _context;
        private readonly IWebHostEnvironment _env;

        public SliderController(ProniaContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index(int page = 1)
        {
            var query =
                _context.Sliders.OrderBy(x => x.Order).AsQueryable();
            return View(PaginatedList<Slider>.Create(query, page, 2));
        }

        public IActionResult Create()
        {
            ViewBag.NextOrder = _context.Sliders.Any() ? _context.Sliders.Max(x => x.Order) + 1 : 1;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Slider slide)
        {
            ViewBag.NextOrder = slide.Order;

            if (!ModelState.IsValid)
            {
                return View();
            }

            if (slide.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "Image is required");
                return View();
            }


            //if (slide.Order >= _context.Sliders.Max(x => x.Order) + 1)
            //{
            //    ModelState.AddModelError("Order", "Please write what is offered");
            //    return View();
            //}


            foreach (var item in _context.Sliders.Where(x => x.Order >= slide.Order))
            {
                item.Order++;
            }

            slide.ImageName = FileManager.Save(_env.WebRootPath, "uploads/sliders", slide.ImageFile);
            
            _context.Sliders.Add(slide);
            _context.SaveChanges();
            
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            Slider slide = _context.Sliders.Find(id);
            if (slide == null)
            {
                return View("Error");
            }
            return View(slide);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Slider slide)
        {
            if (!ModelState.IsValid)
            {
                return View(slide);
            }

            Slider existslide = _context.Sliders.FirstOrDefault(x => x.Id == slide.Id);
            if (existslide == null)
            {
                return View("Error");
            }

            existslide.Title = slide.Title;
            existslide.Name = slide.Name;
            existslide.Order = slide.Order;
            existslide.BtnText = slide.BtnText;
            existslide.BtnUrl = slide.BtnUrl;
            existslide.Desc = slide.Desc;

            string oldFileName = null;
            if (slide.ImageFile != null)
            {
                oldFileName = existslide.ImageName;
                existslide.ImageName = FileManager.Save(_env.WebRootPath, "uploads/sliders", slide.ImageFile);
            }


            if (oldFileName != null)
            {
                FileManager.Delete(_env.WebRootPath, "uploads/sliders", oldFileName);
            }

            _context.SaveChanges();
            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Slider existSlide = _context.Sliders.Find(id);
            if (existSlide == null)
            {
                return StatusCode(404);
            }
            _context.Sliders.Remove(existSlide);
            _context.SaveChanges();

            FileManager.Delete(_env.WebRootPath, "uploads/sliders", existSlide.ImageName);
            return RedirectToAction("index");
        }

    }
}
