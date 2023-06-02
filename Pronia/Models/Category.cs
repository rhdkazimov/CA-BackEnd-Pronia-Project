﻿using System.ComponentModel.DataAnnotations;

namespace Pronia.Models
{
	public class Category
	{
		public int Id { get; set; }
		[Required]
		[MaxLength(20)]
		public string Name { get; set; }

		public List<Plant> Plants { get; set; }
	}
}
