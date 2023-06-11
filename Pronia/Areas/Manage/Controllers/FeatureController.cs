using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Pronia.DAL;
using Pronia.Models;
using System.Data;

namespace Pronia.Areas.Manage.Controllers
{
    [Authorize(Roles = "SuperAdmin,Admin")]
    [Area("manage")]
    public class FeatureController : Controller
    {
        private readonly ProniaContext _context;
        public FeatureController(ProniaContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View(_context.Features.ToList());
        }
    }
}
