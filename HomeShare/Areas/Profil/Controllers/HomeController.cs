using HomeShare.Areas.Profil.Models;
using HomeShare.Infra;
using HomeShare.Models;
using HomeShare.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HomeShare.Areas.Profil.Controllers
{
    public class HomeController : Controller
    {
        UnitOfWork uof = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        // GET: Profil/Home
        public ActionResult Index()
        {
            if (!SessionUtils.IsLogged) return RedirectToAction("Login", "Account", new { area = "" });
            MembreModel mm = SessionUtils.ConnectedUser;

            return View(mm);
        }

        [HttpGet]
        public ActionResult Edit()
        {
            MembreModel mm = SessionUtils.ConnectedUser;

            return View(mm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MembreModel mm)
        {
            MembreModel am = SessionUtils.ConnectedUser;
            mm.IdMembre = am.IdMembre;

            if (ModelState.IsValid)
            {
                UnitOfWork uof = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
                if (uof.CreateMembre(mm))
                {
                    ViewBag.SuccessMessage = "Message bien envoyé";
                    return RedirectToAction("Index", "Home", new { area = "Profil" });
                }
                else
                {
                    ViewBag.ErrorMessage = "Message non enregistré";
                    return View(am);
                }
            }
            else
            {
                ViewBag.ErrorMessage = "Formulaire error";
                return View(am);
            }
        }

        public ActionResult MesBiens()
        {
            MembreModel mm = SessionUtils.ConnectedUser;

            return View(mm);
        }

        [HttpGet]
        public ActionResult AjoutBien()
        {
            AjoutBienViewModel ajoutBienViewModel = new AjoutBienViewModel();
            ajoutBienViewModel.MembreModel = SessionUtils.ConnectedUser;
            return View(ajoutBienViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AjoutBien(BienInsertModel bienInsertModel)
        {
            AjoutBienViewModel ajoutBienViewModel = new AjoutBienViewModel();
            ajoutBienViewModel.MembreModel = SessionUtils.ConnectedUser;

            bienInsertModel.IdMembre = SessionUtils.ConnectedUser.IdMembre;
            if (ModelState.IsValid)
            {
                if (uof.InsertBienMembre(bienInsertModel))
                {
                    return RedirectToAction("Index", "Home", new { area = "Profil" });
                }
                else
                {
                    ViewBag.Error = "Erreur Login/Password";
                    return View(ajoutBienViewModel);
                }
            }
            else
            {
                return View(ajoutBienViewModel);
            }
        }
        public ActionResult DemandesEchange()
        {
            MembreModel mm = SessionUtils.ConnectedUser;

            return View(mm);
        }
    }
}