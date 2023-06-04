using Pronia.Attiributes.ValidationAttiributes;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Pronia.Models
{
	public class Slider
	{
		public int Id { get; set; }
		public int Order { get; set; }
		[MaxLength(20)]
		public string Title { get; set; }
		[Required]
		[MaxLength(20)]
		public string Name { get; set; }
		[MaxLength(50)]
		public string Desc { get; set; }
		[MaxLength(15)]
		public string BtnText { get; set; }
		[MaxLength(150)]
		public string BtnUrl { get; set; }
		[MaxLength(100)]
		public string ImageName { get; set; }
		[MaxFileSize(2097152)]
		[AllowsFileType("image/jpeg", "image/png", "image/jpg")]
		[NotMapped]
		public IFormFile ImageFile { get; set; }
	}
}
