using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeShare.Areas.Biens.Controllers
{
    public class HomeController : Controller
    {
        // GET: Biens/Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Recherche()
        {
            return View();
        }
    }
}