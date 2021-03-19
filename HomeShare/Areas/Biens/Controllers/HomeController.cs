using HomeShare.Areas.Biens.Models;
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
            TousBiensViewModel tousBiensViewModel = new TousBiensViewModel();
            return View(tousBiensViewModel);
        }

        [HttpGet]
        public ActionResult Recherche()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Recherche(string searchString)
        {
            return View();
        }

        public ActionResult Fiche(int idBien)
        {
            FicheViewModel ficheViewModel = new FicheViewModel(idBien);

            return View(ficheViewModel);
        }
        public ActionResult Echanger()
        {
            return View();
        }
    }
}