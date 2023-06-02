using Microsoft.AspNetCore.Mvc;

namespace Pronia.Controllers
{
	public class HomeController:Controller
	{
		//private readonly PustokContext _context;

		//public HomeController(PustokContext context)
		//{
		//	_context = context;
		//}

		public IActionResult Index()
		{
			ViewData["Title"] = "Esas Sehife";

			return View();
		}
	}
}
