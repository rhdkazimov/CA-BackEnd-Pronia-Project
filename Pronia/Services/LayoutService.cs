﻿using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using Pronia.DAL;
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


        //public BasketViewModel GetBasket()
        //{
        //    if (_httpContextAccessor.HttpContext.User.Identity.IsAuthenticated && _httpContextAccessor.HttpContext.User.IsInRole("Member"))
        //    {
        //        var basketItems = _context.BasketItems.Include(x => x.Book).ThenInclude(x => x.BookImages).Where(x => x.AppUserId == _httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier)).ToList();
        //        var bv = new BasketViewModel();
        //        foreach (var ci in basketItems)
        //        {
        //            BasketItemViewModel bi = new BasketItemViewModel
        //            {
        //                Count = ci.Count,
        //                Book = ci.Book
        //            };
        //            bv.BasketItems.Add(bi);
        //            bv.TotalPrice += (bi.Book.DiscountPercent > 0 ? (bi.Book.SalePrice * (100 - bi.Book.DiscountPercent) / 100) : bi.Book.SalePrice) * bi.Count;
        //        }
        //        return bv;
        //    }
        //    else
        //    {
        //        var bv = new BasketViewModel();
        //        var basketJson = _httpContextAccessor.HttpContext.Request.Cookies["basket"];

        //        if (basketJson != null)
        //        {
        //            var cookieItems = JsonConvert.DeserializeObject<List<BasketItemCookieViewModel>>(basketJson);

        //            foreach (var ci in cookieItems)
        //            {
        //                BasketItemViewModel bi = new BasketItemViewModel
        //                {
        //                    Count = ci.Count,
        //                    Book = _context.Books.Include(x => x.BookImages).FirstOrDefault(x => x.Id == ci.BookId)
        //                };
        //                bv.BasketItems.Add(bi);
        //                bv.TotalPrice += (bi.Book.DiscountPercent > 0 ? (bi.Book.SalePrice * (100 - bi.Book.DiscountPercent) / 100) : bi.Book.SalePrice) * bi.Count;
        //            }
        //        }

        //        return bv;
        //    }

        //}
    }
}
