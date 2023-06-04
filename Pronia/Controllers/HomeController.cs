using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Pronia.DAL;
using Pronia.Models;
using Pronia.ViewModels;

namespace Pronia.Controllers
{
	public class HomeController:Controller
	{
		private readonly ProniaContext _context;

		public HomeController(ProniaContext context)
		{
			_context = context;
		}

		public IActionResult Index()
		{
            HomeViewModel vm = new HomeViewModel();
            vm.FeaturedBooks = _context.Books.Include(x => x.Author).Include(x => x.BookImages).Where(x => x.IsFeatured == true).Take(10).ToList();
            vm.NewBooks = _context.Books.Include(x => x.Author).Include(x => x.BookImages).Where(x => x.IsNew == true).Take(10).ToList();
            vm.DiscountedBooks = _context.Books.Include(x => x.Author).Include(x => x.BookImages).Where(x => x.DiscountPerctent > 0).Take(10).ToList();
            vm.Slides = _context.Slides.ToList();
            vm.Features = _context.Features.ToList();
            return View();
		}

        public IActionResult Detail(int id)
        {
            Plant plant = _context.Plants
                .Include(x => x.PlantImages)
                .Include(x => x.Category)
                .Include(x => x.plantReviews).ThenInclude(x => x.AppUser)
                .Include(x=>x.PlantTags).ThenInclude(pt=>pt.Tag).FirstOrDefault(x=>x.Id == id);

            if (plant == null) return View("Error");

            PlantDetailViewModel vm = new PlantDetailViewModel
            {
                Plant = plant,
                RelatedPlants = _context.Plants.Include(x => x.PlantImages).Where(x => x.CategoryId == plant.CategoryId).ToList(),
                Review = new PlantReview { PlantId = id }
            };

            return View(vm);
        }
    }
}
