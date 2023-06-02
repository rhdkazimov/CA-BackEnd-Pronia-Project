using Microsoft.EntityFrameworkCore;
using Pronia.DAL;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddRazorPages();


builder.Services.AddControllersWithViews();

//builder.Services.AddDbContext<ProniaContext>(opt =>
//{
//    opt.UseSqlServer(builder.Configuration.GetConnectionString("Default"));
//});

var app = builder.Build();

if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Error");
	app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
//app.UseSession();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapRazorPages();

app.MapControllerRoute(
	name: "areas",
	pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}");


app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();