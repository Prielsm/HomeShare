using HomeShare.DAL.Repositories;
using HomeShare.Entities;
using HomeShare.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tools;

namespace HomeShare.Repositories
{
    public class UnitOfWork
    {
        IConcreteRepository<MembreEntity> _membreRepo;
        IConcreteRepository<BienEntity> _bienRepo;
        public UnitOfWork(string connectionString)
        {
            _membreRepo = new MembreRepository(connectionString);
            _bienRepo = new BienRepository(connectionString);
        }
        #region CreateMembre
        public bool CreateMembre(MembreModel um)
        {
            MembreEntity membreEntity = new MembreEntity()
            {
                Nom = um.Nom,
                Prenom = um.Prenom,
                Email = um.Email,
                Pays = um.Pays,
                Telephone = um.Telephone,
                Login = um.Login,
                Password = um.Password
            };

            return _membreRepo.Insert(membreEntity);
        }
        #endregion

        #region InsertBienMembre
        public bool InsertBienMembre(BienInsertModel bm)
        {
            BienEntity bienEntity = new BienEntity()
            {
                Titre = bm.Titre,
                NombrePerson = bm.NombrePerson,
                Pays = bm.Pays,
                IdMembre = bm.IdMembre,
                DescCourte = bm.DescCourte,
                DescLong = bm.DescLong,
                Ville = bm.Ville,
                Rue = bm.Rue,
                Numero = bm.Numero,
                CodePostal = bm.CodePostal,
                Photo = bm.Photo
            };
            return _bienRepo.Insert(bienEntity);


        }
        #endregion

        #region UpdateProfil
        public bool UpdateProfil(MembreModel mm)
        {
            MembreEntity me = new MembreEntity()
            {
                IdMembre = mm.IdMembre,
                Nom = mm.Nom,
                Prenom = mm.Prenom,
                Email = mm.Email,
                Pays = mm.Pays,
                Telephone = mm.Telephone,
                Login = mm.Login,
            };
            return _membreRepo.Update(me);
        }
        #endregion

        #region UserAuth
        public MembreModel UserAuth(LoginModel lm)
        {
            MembreEntity ue = ((MembreRepository)_membreRepo).GetFromLogin(lm.Login);
            if (ue == null) return null;
            SecurityHelper sh = new SecurityHelper();
            if (sh.VerifyHash(lm.Password, ue.Password, ue.Salt))
            {
                return new MembreModel()
                {
                    IdMembre = ue.IdMembre,
                    Nom = ue.Nom,
                    Prenom = ue.Prenom,
                    Email = ue.Email,
                    Pays = ue.Pays,
                    Telephone = ue.Telephone,
                    Login = ue.Login,
                };
            }
            else
            {
                return null;
            }
        } 
        #endregion

        public List<BienModel> GetAllBiens()
        {
            List<BienModel> bienModels = new List<BienModel>();
            List<BienEntity> bienEntities = _bienRepo.Get();

            foreach (BienEntity bienEntity in bienEntities)
            {
                BienModel bienModel = new BienModel()
                {
                    IdBien = bienEntity.IdBien,
                    AssuranceObligatoire = bienEntity.AssuranceObligatoire,
                    Titre = bienEntity.Titre,
                    NombrePerson = bienEntity.NombrePerson,
                    Pays = bienEntity.Pays,
                    IdMembre = bienEntity.IdMembre,
                    DescCourte = bienEntity.DescCourte,
                    DescLong = bienEntity.DescLong,
                    Ville = bienEntity.Ville,
                    Rue = bienEntity.Rue,
                    Numero = bienEntity.Numero,
                    CodePostal = bienEntity.CodePostal,
                    Photo = bienEntity.Photo,
                    IsEnabled = bienEntity.IsEnabled,
                    DisabledDate = bienEntity.DisabledDate,
                };
                bienModels.Add(bienModel);
            }

            return bienModels;
        }

        public BienModel GetBienById(int idBien)
        {
            BienEntity bienEntity = _bienRepo.GetOne(idBien);
            BienModel bienModel = new BienModel()
            {
                IdBien = bienEntity.IdBien,
                AssuranceObligatoire = bienEntity.AssuranceObligatoire,
                Titre = bienEntity.Titre,
                NombrePerson = bienEntity.NombrePerson,
                Pays = bienEntity.Pays,
                IdMembre = bienEntity.IdMembre,
                DescCourte = bienEntity.DescCourte,
                DescLong = bienEntity.DescLong,
                Ville = bienEntity.Ville,
                Rue = bienEntity.Rue,
                Numero = bienEntity.Numero,
                CodePostal = bienEntity.CodePostal,
                Photo = bienEntity.Photo,
                IsEnabled = bienEntity.IsEnabled,
                DisabledDate = bienEntity.DisabledDate,
            };

            return bienModel;
        }

        public List<BienModel> Get5DerniersBiens()
        {
            List<BienModel> bienModels = new List<BienModel>();
            List<BienEntity> bienEntities = ((BienRepository)_bienRepo).GetDerniersBiens();

            foreach (BienEntity bienEntity in bienEntities)
            {
                BienModel bienModel = new BienModel()
                {
                    IdBien = bienEntity.IdBien,
                    AssuranceObligatoire = bienEntity.AssuranceObligatoire,
                    Titre = bienEntity.Titre,
                    NombrePerson = bienEntity.NombrePerson,
                    Pays = bienEntity.Pays,
                    IdMembre = bienEntity.IdMembre,
                    DescCourte = bienEntity.DescCourte,
                    DescLong = bienEntity.DescLong,
                    Ville = bienEntity.Ville,
                    Rue = bienEntity.Rue,
                    Numero = bienEntity.Numero,
                    CodePostal = bienEntity.CodePostal,
                    Photo = bienEntity.Photo,
                    IsEnabled = bienEntity.IsEnabled,
                    DisabledDate = bienEntity.DisabledDate,
                };
                bienModels.Add(bienModel);
            }

            return bienModels;
        }
    }
}
