using Pronia.Attiributes.ValidationAttiributes;
using System.ComponentModel.DataAnnotations;

namespace Pronia.Areas.Manage.ViewModels
{
    public class SettingsViewModel
    {
        [MaxLength(250)]
        public string WelcomeMessage { get; set; }
        [MaxLength(250)]
        public string Adress { get; set; }
        [MaxLength(250)]
        public string ContactPhone { get; set; }
        [MaxLength(250)]
        public string SupportPhone { get; set; }
        [MaxLength(250)]
        public string Email { get; set; }
        [MaxLength(250)]
        public string FooterInfo { get; set; }
        public string HeaderLogoUrl { get; set; }
        public string FooterLogoUrl { get; set; }
        [MaxFileSize(2097152)]
        [AllowsFileType("image/jpeg", "image/png")]
        public IFormFile HeaderLogo { get; set; }
        [MaxFileSize(2097152)]
        [AllowsFileType("image/jpeg", "image/png")]
        public IFormFile FooterLogo { get; set; }
    }
}
