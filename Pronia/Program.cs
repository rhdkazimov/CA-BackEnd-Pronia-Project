using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Pronia.DAL;
using Pronia.Models;
using Pronia.Services;
using NuGet.Packaging.Signing;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddRazorPages();


builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<ProniaContext>(opt =>
{
	opt.UseSqlServer(builder.Configuration.GetConnectionString("Default"));
});

builder.Services.AddIdentity<AppUser, IdentityRole>(opt =>
{
    opt.Password.RequireNonAlphanumeric = false;
    opt.Password.RequiredLength = 8;
    opt.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromSeconds(10);
}).AddDefaultTokenProviders().AddEntityFrameworkStores<ProniaContext>();

builder.Services.AddAuthentication().AddGoogle(opt =>
{
    opt.ClientId = "652274005227-sm0l466nrbmjqcqajsh1lnpna2nc7scs.apps.googleusercontent.com";
    opt.ClientSecret ="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";
});


builder.Services.ConfigureApplicationCookie(options =>
{
    options.Events.OnRedirectToLogin = options.Events.OnRedirectToAccessDenied = context =>
    {
        if (context.HttpContext.Request.Path.Value.StartsWith("/manage"))
        {
            var redirectUri = new Uri(context.RedirectUri);
            context.Response.Redirect("/manage/account/login" + redirectUri.Query);
        }
        else
        {
            var redirectUri = new Uri(context.RedirectUri);
            context.Response.Redirect("/account/login" + redirectUri.Query);
        }

        return Task.CompletedTask;
    };
});


builder.Services.AddScoped<LayoutService>();
builder.Services.AddScoped<IEmailSender, EmailSender>();

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
    name: "about-us",
    pattern: "about-us",
    defaults: new { controller = "Home", action = "aboutus" });

app.MapControllerRoute(
    name: "contact-us",
    pattern: "contact-us",
    defaults: new { controller = "Home", action = "contact" });

app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();