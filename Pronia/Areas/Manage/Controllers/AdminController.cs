using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Pronia.DAL;
using Pronia.Models;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin")]
    [Area("manage")]
    public class AdminController : Controller
    {
        private readonly ProniaContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        public AdminController(ProniaContext context, UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _context = context;
            _userManager = userManager;
            _roleManager = roleManager;
        }


        public IActionResult Index()
        {
            List<AppUser> adminUsers = _context.AppUser.Where(x => x.IsAdmin == true).ToList();

            return View(adminUsers);
        }

        public IActionResult Edit(string id)
        {
            AppUser editAdmin = _context.AppUser.Where(x => x.IsAdmin == true).FirstOrDefault(x=>x.Id==id);

            return View(editAdmin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(AppUser editAdmin)
        {
            if(!ModelState.IsValid)
            {
                return View();
            }

            if(editAdmin == null)
            {
                return View("Error");
            }

            AppUser existAdminUser = _context.AppUser.Where(_ => _.IsAdmin == true).FirstOrDefault(x=>x.Id== editAdmin.Id);

            existAdminUser.FullName = editAdmin.FullName;
            existAdminUser.UserName = editAdmin.UserName;
            existAdminUser.Email = editAdmin.Email;

            _context.SaveChanges();

            return RedirectToAction("index");
        }

        public IActionResult Create() 
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(AppUser newAdmin)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            if (newAdmin == null)
            {
                return View("Error");
            }

            AppUser user = new AppUser
            {
                FullName = newAdmin.FullName,
                Email = newAdmin.Email,
                UserName = newAdmin.UserName,
                IsAdmin = true,
            };

            var result = await _userManager.CreateAsync(user, newAdmin.Password);

            await _userManager.AddToRoleAsync(user, "Admin");

            return RedirectToAction("index");
        }


        public async Task<IActionResult> DeleteAdmin(string id)
        {
            AppUser existAdminUser = _context.AppUser.Where(_ => _.IsAdmin == true).FirstOrDefault(x => x.Id == id);

            if (existAdminUser == null)
                return View();

            await _userManager.DeleteAsync(existAdminUser);
            _context.AppUser.Remove(existAdminUser);

            _context.SaveChanges();

            return RedirectToAction("index");
        }
    }
}
