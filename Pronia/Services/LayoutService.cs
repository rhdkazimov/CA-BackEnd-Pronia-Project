using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Pronia.DAL;
using Pronia.ViewModels;
using System.Security.Claims;

namespace Pronia.Services
{
    public class LayoutService
    {
        private readonly ProniaContext _context;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LayoutService(ProniaContext context, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _httpContextAccessor = httpContextAccessor;
        }
        public Dictionary<string, string> GetSettings()
        {
            return _context.Setting.ToDictionary(x => x.Key, x => x.Value);
        }

        public BasketViewModel GetBasket()
        {
            var bv = new BasketViewModel();
            var basketJson = _httpContextAccessor.HttpContext.Request.Cookies["basket"];
            if (basketJson != null)
            {
                var cookieItems = JsonConvert.DeserializeObject<List<BasketItemCookieViewModel>>(basketJson);

                foreach (var ci in cookieItems)
                {
                    BasketItemViewModel bi = new BasketItemViewModel
                    {
                        Count = ci.Count,
                        Plant = _context.Plants.Include(x => x.PlantImages).FirstOrDefault(x => x.Id == ci.PlantId)
                    };
                    bv.BasketItems.Add(bi);
                    bv.TotalPrice += (bi.Plant.DiscountPercent > 0 ? (bi.Plant.SalePrice * (100 - bi.Plant.DiscountPercent) / 100) : bi.Plant.SalePrice) * bi.Count;
                }
            }
            return bv;
        }

    }
}
