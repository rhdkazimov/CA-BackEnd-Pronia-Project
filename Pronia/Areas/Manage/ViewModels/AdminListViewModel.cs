using System.ComponentModel.DataAnnotations;

namespace Pronia.Areas.Manage.ViewModels
{
    public class AdminListViewModel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set;}
        [Required]
        public string Email { get; set;}
        [Required]
        public string UserName { get; set;}
    }
}
