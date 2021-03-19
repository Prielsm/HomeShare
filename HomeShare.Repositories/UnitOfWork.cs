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
        public UnitOfWork(string connectionString)
        {
            _membreRepo = new MembreRepository(connectionString);
        }
        #region Account
        public bool CreateMembre(MembreModel um)
        {
            MembreEntity userEntity = new MembreEntity()
            {
                Nom = um.Nom,
                Prenom = um.Prenom,
                Email = um.Email,
                Pays = um.Pays,
                Telephone = um.Telephone,
                Login = um.Login,
                Password = um.Password
            };

            return _membreRepo.Insert(userEntity);
        }

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
        #endregion Account
    }
}
