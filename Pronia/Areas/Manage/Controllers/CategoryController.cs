using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Pronia.DAL;
using Pronia.Models;
using Pronia.ViewModels;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class CategoryController : Controller
    {
        private readonly ProniaContext _context;

        public CategoryController(ProniaContext context)
        {
            _context = context;
        }
        public IActionResult Index(int page=1)
        {
            var query = _context.Category.Include(x => x.Plants).AsQueryable();

            return View(PaginatedList<Category>.Create(query, page, 2));
        }

        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Category category)
        {
            if (!ModelState.IsValid)
                return View();

            if (_context.Category.Any(x => x.Name == category.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }


            _context.Category.Add(category);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Edit(int id)
        {
            Category category = _context.Category.Find(id);

            if (category == null) return View("Error");

            return View(category);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(Category category)
        {
            if (!ModelState.IsValid) return View();

            Category existCategory = _context.Category.Find(category.Id);

            if (existCategory == null) return View("Error");

            if (category.Name != existCategory.Name && _context.Category.Any(x => x.Name == category.Name))
            {
                ModelState.AddModelError("Name", "Name is already taken");
                return View();
            }

            existCategory.Name = category.Name;

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Delete(int id)
        {
            Category category = _context.Category.Include(x => x.Plants).FirstOrDefault(x => x.Id == id);

            if (category == null) return View("Error");
            return View(category);
        }

        [HttpPost]
        public IActionResult Delete(Category category)
        {
            Category existCategory = _context.Category.Find(category.Id);

            if (existCategory == null) return View("Error");

            _context.Category.Remove(existCategory);
            _context.SaveChanges();

            return RedirectToAction("index");
        }

    }
}
