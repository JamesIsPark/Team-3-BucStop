using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using System.Text.RegularExpressions;
using BucStop.Models;
using System.Reflection;
using System.Threading.Tasks;

namespace BucStop.Controllers
{
    public class AccountController : Controller
    {
        //public string email { get; set; } = string.Empty;
        [AllowAnonymous]
        public IActionResult Login()
        {
            
            return View(new LoginViewModel());
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            if (Regex.IsMatch(model.Email, @"\b[A-Za-z0-9._%+-]+@etsu\.edu\b"))
            {
                var claims = new[]
                {
                    new Claim(ClaimTypes.Name, model.Email),
                    new Claim(ClaimTypes.NameIdentifier, "user_id"),
                };

                var claimsIdentity = new ClaimsIdentity(claims, "custom");
                var userPrincipal = new ClaimsPrincipal(claimsIdentity);

                await HttpContext.SignInAsync("CustomAuthenticationScheme", userPrincipal);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("Email", "Only ETSU students can play, sorry :(");
                return View(model);
            }
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync("CustomAuthenticationScheme");
            return RedirectToAction("Login");
        }


    }
}
