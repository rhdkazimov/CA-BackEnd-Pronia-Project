using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Pronia.Models
{
    public class Feature
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(40)]
        public string Name { get; set; }
        [Required]
        [MaxLength(60)]
        public string Desc { get; set; }

        [MaxLength(30)]
        public string Icon { get; set; }

        [NotMapped]
        public IFormFile IconFile { get; set; }
    }
}
