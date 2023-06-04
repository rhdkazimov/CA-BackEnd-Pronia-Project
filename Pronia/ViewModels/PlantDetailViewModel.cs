﻿using Pronia.Models;

namespace Pronia.ViewModels
{
    public class PlantDetailViewModel
    {
        public Plant Plant { get; set; }
        public List<Plant> RelatedPlants { get; set; }
        public PlantReview Review { get; set; }
    }
}
