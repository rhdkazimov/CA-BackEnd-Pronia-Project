﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Pronia.DAL;
using Pronia.Models;
using Pronia.ViewModels;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class TagController : Controller
    {
        private readonly ProniaContext _context;
        public TagController(ProniaContext context)
        {
            _context = context;

        }

        public IActionResult Index(int page = 1)
        {
            var query =
                _context.Tags.Include(x => x.PlantTags).AsQueryable();
            return View(PaginatedList<Tag>.Create(query, page, 2));
        }
        public IActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public IActionResult Create(Tag tag)
        {

            if (!ModelState.IsValid)
            {
                return View();
            }
            if (_context.Tags.Any(x => x.Name == tag.Name))
            {
                ModelState.AddModelError("Name", "Name is already used");
                return View();
            }
            _context.Tags.Add(tag);
            _context.SaveChanges();

            return RedirectToAction("index");
        }
        public IActionResult Edit(int id)
        {
            Tag tag = _context.Tags.Find(id);
            return View(tag);
        }
        [HttpPost]
        public IActionResult Edit(Tag tag)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            Tag existaTag = _context.Tags.FirstOrDefault(x => x.Id == tag.Id);
            if (existaTag == null)
            {
                return View("Error");
            }
            if (tag.Name != existaTag.Name && _context.Tags.Any(x => x.Name == tag.Name))
            {
                ModelState.AddModelError("Name", "Tag name already used");
                return View(tag);
            }
            existaTag.Name = tag.Name;
            _context.SaveChanges();
            return RedirectToAction("index");
        }
        public IActionResult Delete(int id)
        {
            Tag existTag = _context.Tags.Find(id);
            if (existTag == null)
            {
                return StatusCode(404);
            }
            _context.Tags.Remove(existTag);
            _context.SaveChanges();
            return StatusCode(200);

        }
    }
}
