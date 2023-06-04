using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Pronia.Models;

namespace Pronia.DAL
{
	public class ProniaContext : IdentityDbContext
	{
		public ProniaContext(DbContextOptions<ProniaContext> options) : base(options){ }

        public DbSet<Plant> Plants { get; set; }
        public DbSet<Category> Category { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<OrderItem> OrderItem { get; set; }
        public DbSet<AppUser> AppUser { get; set; }
        public DbSet<Setting> Setting { get; set; }
        public DbSet<Slider> Sliders { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<PlantTag> PlantTags { get; set; }
        public DbSet<BasketItem> BasketItems { get; set; }
        public DbSet<PlantImage> PlantImages { get; set; }
        public DbSet<PlantReview> PlantReviews { get; set; }
        public DbSet<Feature> Features { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PlantTag>().HasKey(x => new { x.TagId, x.PlantId });
            modelBuilder.Entity<Setting>().HasKey(x => x.Key);

            base.OnModelCreating(modelBuilder);
        }
    }
}
