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
        private UnitOfWork uof = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);

    }
}