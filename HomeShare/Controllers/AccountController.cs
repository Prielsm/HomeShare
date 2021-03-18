using HomeShare.Infra;
using HomeShare.Models;
using HomeShare.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeShare.Controllers
{
    public class AccountController : Controller
    {
        UnitOfWork ctx = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel lm)
        {
            if (ModelState.IsValid)
            {
                MembreModel um = ctx.UserAuth(lm);

                if (um == null)
                {
                    ViewBag.Error = "Erreur login ou password";
                    return View();

                }
                else
                {
                    SessionUtils.IsLogged = true;
                    SessionUtils.ConnectedUser = um;

                    return RedirectToAction("Index", "Home", new { area = "Membre" });
                }
            }
            else
            {
                return View();
            }

        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(MembreModel um)
        {
            if (ModelState.IsValid)
            {
                if (ctx.CreateMembre(um))
                {
                    SessionUtils.IsLogged = true;
                    SessionUtils.ConnectedUser = um;
                    return RedirectToAction("Index", "Home", new { area = "Membre" });
                }
                else
                {
                    ViewBag.Error = "Erreur Login/Password";
                    return View(um);
                }
            }
            else
            {
                ViewBag.Error = "Erreur Login/Password";
                return View(um);
            }
        }
    }
}