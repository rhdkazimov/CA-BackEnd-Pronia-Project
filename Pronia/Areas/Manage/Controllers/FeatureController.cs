using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Pronia.DAL;
using Pronia.Helper.FileManager;
using Pronia.Models;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class FeatureController : Controller
    {
        private readonly ProniaContext _context;
        private readonly IWebHostEnvironment  _env;
        public FeatureController(ProniaContext context,IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index()
        {
            List<Feature> features = _context.Features.ToList();

            return View(features);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Feature feature)
        {
            if(!ModelState.IsValid)
            {
                return View(feature);
            }
            if (feature.IconFile == null)
            {
                ModelState.AddModelError("IconFile", "IconFile is required");
                return View();
            }

            feature.Icon = FileManager.Save(_env.WebRootPath, "uploads/features", feature.IconFile);

            _context.Features.Add(feature);
            _context.SaveChanges();


            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Feature editFeature = _context.Features.FirstOrDefault(x => x.Id == id);

            if (editFeature == null)
            {
                return View("Error");
            }


            return View(editFeature);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Feature feature)
        {
            if(!ModelState.IsValid)
            {
                return View(feature);
            }
            Feature existFeature = _context.Features.FirstOrDefault(x=>x.Id==feature.Id);

            if(feature.IconFile!= null)
            {
                existFeature.Icon = FileManager.Save(_env.WebRootPath, "uploads/features", feature.IconFile);
                FileManager.Delete(_env.WebRootPath, "uploads/features", existFeature.Icon);
            }

            existFeature.Name = feature.Name;
            existFeature.Desc = feature.Desc;

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Feature ft = _context.Features.FirstOrDefault(x=>x.Id== id);

            if(ft == null)
            {
                return View("Error");
            }

            _context.Features.Remove(ft);
            FileManager.Delete(_env.WebRootPath, "uploads/features", ft.Icon);
            return RedirectToAction("index");
        }
    }
}
