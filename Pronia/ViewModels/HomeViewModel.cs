using Org.BouncyCastle.Bcpg.Sig;
using Pronia.Models;

namespace Pronia.ViewModels
{
    public class HomeViewModel
    {
        public List<Plant> FeaturedPlants { get; set; }
        public List<Plant> NewPlants { get; set; }
        public List<Plant> DiscountedPlants { get; set; }
        public List<Slider> Slides { get; set; }
        public List<Feature> Features { get; set; }
        public List<PlantReview> Reviews { get; set; } = new List<PlantReview>();

    }
}
