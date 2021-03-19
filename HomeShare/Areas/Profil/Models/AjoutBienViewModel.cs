using HomeShare.Infra;
using HomeShare.Models;
using HomeShare.Repositories;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace HomeShare.Areas.Profil.Models
{
    public class AjoutBienViewModel
    {
        private MembreModel _membreModel;
        private readonly UnitOfWork uof;
        private BienInsertModel _bienInsertModel;

        public MembreModel MembreModel
        {
            get
            {
                return _membreModel;
            }

            set
            {
                _membreModel = value;
            }
        }

        public BienInsertModel BienInsertModel
        {
            get
            {
                return _bienInsertModel;
            }

            set
            {
                _bienInsertModel = value;
            }
        }

        public AjoutBienViewModel()
        {
            uof = new UnitOfWork(ConfigurationManager.ConnectionStrings["Cnstr"].ConnectionString);
            BienInsertModel = new BienInsertModel();

        }
        
    }
}