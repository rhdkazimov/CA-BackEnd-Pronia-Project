using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace Pronia.Areas.Controllers
{
	[Authorize(Roles = "SuperAdmin,Admin")]
	[Area("manage")]
	public class DashboardController:Controller
	{
		public IActionResult Index()
		{
			return View();
		}
	}
}
