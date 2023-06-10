using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Pronia.DAL;
using Pronia.ViewModels;

namespace Pronia.Controllers
{
    public class ShopController : Controller
    {
        private readonly ProniaContext _context;

        public ShopController(ProniaContext context)
        {
            _context = context;
        }
        public IActionResult Index(int? categoryId, int? tagId, double? minPrice = null, double? maxPrice = null,string search = null, string sort = "AToZ")
        {
            ShopViewModel shopVM = new ShopViewModel
            {
                Categorys = _context.Category.Include(x => x.Plants).ToList(),
                Tags = _context.Tags.ToList()
            };

            var query = _context.Plants.Include(x => x.PlantImages.Where(x => x.PosterStatus != null)).AsQueryable();


            if (categoryId != null)
                query = query.Where(x => x.CategoryId == categoryId);

            //if (tagId.Count > 0)
            //    query = query.Where(x => tagId.ContainsAl(x.TagIds.);

            if (minPrice != null && maxPrice != null)
                query = query.Where(x => x.SalePrice >= (decimal)minPrice && x.SalePrice <= (decimal)maxPrice);

            switch (sort)
            {
                case "AToZ":
                    query = query.OrderBy(x => x.Name);
                    break;
                case "ZToA":
                    query = query.OrderByDescending(x => x.Name);
                    break;
                case "LowToHigh":
                    query = query.OrderBy(x => x.SalePrice);
                    break;
                case "HighToLow":
                    query = query.OrderByDescending(x => x.SalePrice);
                    break;
            }

            if (search != null)
                query = query.Where(x => x.Name.Contains(search));

            ViewBag.Search = search;
            ViewBag.PlantCount = _context.Plants.Count();

            shopVM.Plants = query.ToList();

            ViewBag.MaxPriceLimit = _context.Plants.Max(x => x.SalePrice);

            ViewBag.SortList = new List<SelectListItem>
            {
                new SelectListItem {Value="AToZ",Text= "Sort By:Name (A - Z)",Selected=sort=="AToZ"},
                new SelectListItem { Value = "ZToA", Text = "Sort By:Name (Z - A)", Selected = sort == "ZToA" },
                new SelectListItem { Value = "LowToHigh", Text = "Sort By:Name (Low - High)", Selected = sort == "LowToHigh" },
                new SelectListItem { Value = "HighToLow", Text = "Sort By:Name (High - Low)", Selected = sort == "HighToLow" }
            };


            ViewBag.Sort = sort;
            ViewBag.categoryId = categoryId;
            ViewBag.tagId = tagId;
            ViewBag.MinPrice = minPrice ?? 0;
            ViewBag.MaxPrice = maxPrice ?? ViewBag.MaxPriceLimit;


            return View(shopVM);
        }
    }
}
