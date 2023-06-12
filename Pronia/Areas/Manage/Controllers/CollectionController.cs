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
    public class CollectionController : Controller
    {
        private readonly ProniaContext _context;
        private readonly IWebHostEnvironment _env;

        public CollectionController(ProniaContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public IActionResult Index()
        {
            List<CollectionItems> collectionItems = _context.CollectionItems.ToList();
            return View(collectionItems);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(CollectionItems ci)
        {
            if (!ModelState.IsValid)
            {
                return View(ci);
            }
            if (ci.ImageFile == null)
            {
                ModelState.AddModelError("ImageFile", "ImageFile is required");
                return View();
            }

            ci.ImageName = FileManager.Save(_env.WebRootPath, "uploads/collections", ci.ImageFile);

            _context.CollectionItems.Add(ci);
            _context.SaveChanges();


            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            CollectionItems ci = _context.CollectionItems.FirstOrDefault(x => x.Id == id);

            if (ci == null)
            {
                return View("Error");
            }


            return View(ci);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(CollectionItems ci)
        {
            if (!ModelState.IsValid)
            {
                return View(ci);
            }
            CollectionItems existCol = _context.CollectionItems.FirstOrDefault(x => x.Id == ci.Id);

            if (ci.ImageFile != null)
            {
                existCol.ImageName = FileManager.Save(_env.WebRootPath, "uploads/collections", ci.ImageFile);
                FileManager.Delete(_env.WebRootPath, "uploads/collections", existCol.ImageName);
            }

            existCol.Name = ci.Name;
            existCol.Title = ci.Title;
            existCol.BtnUrl = ci.BtnUrl;

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            CollectionItems ci = _context.CollectionItems.FirstOrDefault(x => x.Id == id);

            if (ci == null)
            {
                return View("Error");
            }

            _context.CollectionItems.Remove(ci);
            FileManager.Delete(_env.WebRootPath, "uploads/collections", ci.ImageName);
            return RedirectToAction("index");
        }

    }
}
