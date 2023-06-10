using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace Pronia.Models
{
	public class AppUser:IdentityUser
	{
		public string FullName { get; set; }
		public bool IsAdmin { get; set; }
		public string Phone { get; set; }
		public string Address { get; set; }

		[NotMapped]
		public string Password { get; set; }
	}
}
