using HomeShare.DAL.Repositories;
using HomeShare.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeShare.Repositories
{
    public class BienRepository : BaseRepository<BienEntity>, IConcreteRepository<BienEntity>
    {
        public BienRepository(string cnstr): base(cnstr)
        {

        }
        public bool Delete(BienEntity toDelete)
        {
            throw new NotImplementedException();
        }

        public List<BienEntity> Get()
        {
            string requete = @"SELECT * FROM BienEchange";
            return base.Get(requete);
        }

        public BienEntity GetOne(int PK)
        {
            string requete = @"SELECT * From BienEchange where IdBien = " + PK;
            return base.GetOne(PK, requete);
        }

        public List<BienEntity> GetDerniersBiens()
        {
            string requete = @"SELECT * FROM Vue_CinqDernierBiens";
            return base.Get(requete);
        }

        public bool Insert(BienEntity toInsert)
        {
            string requete = @"INSERT INTO [dbo].[BienEchange] ([Titre],[NombrePerson],[Pays],[IdMembre],[DescCourte],[DescLong],[Ville],[Rue],[Numero],[CodePostal],[Photo])
                                VALUES
                              (@Titre,@NombrePerson,@Pays,@IdMembre,@DescCourte,@DescLong,@Ville,@Rue,@Numero,@CodePostal,@Photo)";
            

            return base.Insert(toInsert, requete);
        }

        public bool Update(BienEntity toUpdate)
        {
            throw new NotImplementedException();
        }
    }
}
