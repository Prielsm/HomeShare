using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeShare.Models
{
    public class OptionsModel
    {
        int _idOption;
        string _libelle;

        public int IdOption
        {
            get
            {
                return _idOption;
            }

            set
            {
                _idOption = value;
            }
        }

        public string Libelle
        {
            get
            {
                return _libelle;
            }

            set
            {
                _libelle = value;
            }
        }
    }
}
