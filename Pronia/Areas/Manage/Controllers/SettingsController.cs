using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Pronia.Areas.Manage.ViewModels;
using Pronia.DAL;
using Pronia.Helper.FileManager;
using Pronia.Models;

namespace Pronia.Areas.Manage.Controllers
{
    [Area("manage")]
    public class SettingsController : Controller
    {
        private readonly ProniaContext _context;
        private readonly IWebHostEnvironment _env;

        public SettingsController(ProniaContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public IActionResult Edit()
        {
            SettingsViewModel sm = new SettingsViewModel
            {
                WelcomeMessage = _context.Setting.FirstOrDefault(x => x.Key == "WelcomeMessage").Value,
                Adress = _context.Setting.FirstOrDefault(x => x.Key == "Adress").Value,
                ContactPhone = _context.Setting.FirstOrDefault(x => x.Key == "ContactPhone").Value,
                SupportPhone = _context.Setting.FirstOrDefault(x => x.Key == "SupportPhone").Value,
                Email = _context.Setting.FirstOrDefault(x => x.Key == "Email").Value,
                FooterInfo = _context.Setting.FirstOrDefault(x => x.Key == "FooterInfo").Value,
                HeaderLogoUrl = _context.Setting.FirstOrDefault(x => x.Key == "HeaderLogo").Value,
                FooterLogoUrl = _context.Setting.FirstOrDefault(x => x.Key == "FooterLogo").Value
            };

            return View(sm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(SettingsViewModel sm)
        {
            if (!ModelState.IsValid)
                return View();

            if (sm.HeaderLogo != null)
            {
                _context.Setting.FirstOrDefault(x => x.Key == "HeaderLogo").Value = FileManager.Save(_env.WebRootPath, "uploads/settings", sm.HeaderLogo);
            }
            if (sm.FooterLogo != null)
            {
                _context.Setting.FirstOrDefault(x => x.Key == "HeaderLogo").Value = FileManager.Save(_env.WebRootPath, "uploads/settings", sm.FooterLogo);
            }


            _context.Setting.FirstOrDefault(x=>x.Key == "WelcomeMessage").Value = sm.WelcomeMessage;
            _context.Setting.FirstOrDefault(x=>x.Key == "Adress").Value = sm.Adress;
            _context.Setting.FirstOrDefault(x=>x.Key == "ContactPhone").Value = sm.ContactPhone;
            _context.Setting.FirstOrDefault(x=>x.Key == "SupportPhone").Value = sm.SupportPhone;
            _context.Setting.FirstOrDefault(x=>x.Key == "Email").Value = sm.Email;
            _context.Setting.FirstOrDefault(x=>x.Key == "FooterInfo").Value = sm.FooterInfo;

            _context.SaveChanges();

            return RedirectToAction("Edit");
        }
    }
}
