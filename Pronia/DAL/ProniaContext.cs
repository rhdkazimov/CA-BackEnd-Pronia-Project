using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Pronia.Models;

namespace Pronia.DAL
{
	public class ProniaContext : IdentityDbContext
	{
		public ProniaContext(DbContextOptions<ProniaContext> options) : base(options){ }

		DbSet<Plant> Plants { get; set; }
		DbSet<Category> Category { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PlantTag>().HasKey(x => new { x.TagId, x.PlantId });
            modelBuilder.Entity<Setting>().HasKey(x => x.Key);

            base.OnModelCreating(modelBuilder);
        }
    }
}
