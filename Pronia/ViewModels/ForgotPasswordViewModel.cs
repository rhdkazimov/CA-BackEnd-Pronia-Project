using System.ComponentModel.DataAnnotations;

namespace Pronia.ViewModels
{
    public class ForgotPasswordViewModel
    {
        [Required]
        [MaxLength(100)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
    }
}
