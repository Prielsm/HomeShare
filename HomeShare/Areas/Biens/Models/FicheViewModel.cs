using HomeShare.Models;
using HomeShare.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeShare.Areas.Biens.Models
{
    public class FicheViewModel
    {
        private UnitOfWork uof = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
        private BienModel _bienModel;

        public FicheViewModel(int idBien)
        {
            BienModel = uof.GetBienById(idBien);
        }

        public BienModel BienModel
        {
            get
            {
                return _bienModel;
            }

            set
            {
                _bienModel = value;
            }
        }
    }
}