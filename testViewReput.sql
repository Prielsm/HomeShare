SELECT dbo.Bien.Titre, dbo.Bien.DescrCourte, dbo.Bien.DescrLongue, dbo.Bien.Photo, dbo.Bien.NbrSDB, dbo.Bien.Capacite, dbo.Bien.NbrWC, dbo.Adresse.Pays, dbo.Adresse.Ville, dbo.Adresse.Rue, dbo.Adresse.Numero, 
                  dbo.Adresse.CodePostal, dbo.Avis.Note
FROM     dbo.Bien INNER JOIN
                  dbo.Echange ON dbo.Bien.IdBien = dbo.Echange.IdBien INNER JOIN
                  dbo.Avis ON dbo.Echange.IdEchange = dbo.Avis.IdEchange INNER JOIN
                  dbo.Adresse ON dbo.Bien.IdAdresse = dbo.Adresse.IdAdresse
WHERE  (dbo.Avis.Note > 6)