using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeShare.Models
{
    public class BienInsertModel
    {
        int _nombrePerson, _pays, _idMembre;
        string _titre, _descCourte, _descLong, _ville, _rue, _numero, _codePostal, _photo;
        bool? _assuranceObligatoire;
        //List<OptionsModel> optionsModels;



        [Required]
        public int NombrePerson
        {
            get
            {
                return _nombrePerson;
            }

            set
            {
                _nombrePerson = value;
            }
        }

        [Required]
        public int Pays
        {
            get
            {
                return _pays;
            }

            set
            {
                _pays = value;
            }
        }

        public int IdMembre
        {
            get
            {
                return _idMembre;
            }

            set
            {
                _idMembre = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string Titre
        {
            get
            {
                return _titre;
            }

            set
            {
                _titre = value;
            }
        }

        [Required]
        [MaxLength(150)]
        public string DescCourte
        {
            get
            {
                return _descCourte;
            }

            set
            {
                _descCourte = value;
            }
        }

        [Required]
        public string DescLong
        {
            get
            {
                return _descLong;
            }

            set
            {
                _descLong = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string Ville
        {
            get
            {
                return _ville;
            }

            set
            {
                _ville = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string Rue
        {
            get
            {
                return _rue;
            }

            set
            {
                _rue = value;
            }
        }

        [Required]
        [MaxLength(5)]
        public string Numero
        {
            get
            {
                return _numero;
            }

            set
            {
                _numero = value;
            }
        }

        [Required]
        [MaxLength(50)]
        public string CodePostal
        {
            get
            {
                return _codePostal;
            }

            set
            {
                _codePostal = value;
            }
        }

        [Required]
        public string Photo
        {
            get
            {
                return _photo;
            }

            set
            {
                _photo = value;
            }
        }

        public bool? AssuranceObligatoire
        {
            get
            {
                return _assuranceObligatoire;
            }

            set
            {
                _assuranceObligatoire = value;
            }
        }

        //public List<OptionsModel> OptionsModels
        //{
        //    get
        //    {
        //        return optionsModels;
        //    }

        //    set
        //    {
        //        optionsModels = value;
        //    }
        //}
    }
}
