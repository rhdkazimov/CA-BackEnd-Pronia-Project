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
            vm.FeaturedPlants = _context.Plants.Include(x => x.PlantImages).Include(x => x.Category).Where(x => x.IsFeatured == true).Take(10).ToList();
            vm.NewPlants = _context.Plants.Include(x => x.PlantImages).Include(x => x.Category).Where(x => x.IsNew == true).Take(10).ToList();
            vm.DiscountedPlants = _context.Plants.Include(x=>x.PlantImages).Include(x=>x.Category).Where(x=>x.DiscountPercent>0).ToList();
            vm.Slides = _context.Sliders.OrderBy(x=>x.Order).ToList();
            vm.Features = _context.Features.ToList();
            vm.Reviews = _context.PlantReviews.Take(3).ToList();
            vm.NewProducts = _context.Plants.Include(x => x.PlantImages).Include(x => x.Category).Where(x => x.IsNew == true).Take(4).ToList();
            vm.CollectionItems = _context.CollectionItems.ToList();
            vm.AllPlants = _context.Plants.Include(x=>x.plantReviews).ToList();

            return View(vm);
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

        public IActionResult AboutUs()
        {
            List<Feature> ft = _context.Features.ToList();
            return View(ft);
        }

        public IActionResult Contact() 
        { 
            return View(); 
        }
    }
}
