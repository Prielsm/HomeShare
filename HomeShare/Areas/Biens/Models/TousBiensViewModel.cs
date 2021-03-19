using HomeShare.Models;
using HomeShare.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeShare.Areas.Biens.Models
{
    public class TousBiensViewModel
    {
        private List<BienModel> bienModels;
        private UnitOfWork uof = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

        public List<BienModel> BienModels
        {
            get
            {
                return bienModels;
            }

            set
            {
                bienModels = value;
            }
        }

        public TousBiensViewModel()
        {
            bienModels = uof.GetAllBiens();
        }
    }
}