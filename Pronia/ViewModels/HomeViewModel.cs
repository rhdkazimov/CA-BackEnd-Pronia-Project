using Org.BouncyCastle.Bcpg.Sig;
using Pronia.Models;

namespace Pronia.ViewModels
{
    public class HomeViewModel
    {
        public List<Plant> FeaturedBooks { get; set; }
        public List<Plant> NewBooks { get; set; }
        public List<Plant> DiscountedBooks { get; set; }
        public List<Slider> Slides { get; set; }
        //public List<Features> Features { get; set; }

    }
}
