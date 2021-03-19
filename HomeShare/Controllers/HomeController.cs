using HomeShare.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeShare.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Index = "active";
            HomeViewModel homeViewModel = new HomeViewModel();

            return View(homeViewModel);

        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.About = "active";


            return View();
        }

        public ActionResult Membres()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.Membres = "active";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            ViewBag.Contact = "active";

            return View();
        }
    }
}