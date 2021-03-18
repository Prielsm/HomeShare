SELECT TOP (100) PERCENT dbo.Bien.Titre, dbo.Bien.DescrCourte, dbo.Bien.DescrLongue, dbo.Bien.Photo, dbo.Bien.Capacite, dbo.Bien.NbrSDB, dbo.Bien.NbrWC, dbo.Adresse.Pays, dbo.Adresse.Ville, dbo.Adresse.Rue, dbo.Adresse.Numero, 
                  dbo.Adresse.CodePostal
FROM     dbo.Bien INNER JOIN
                  dbo.Adresse ON dbo.Bien.IdAdresse = dbo.Adresse.IdAdresse
ORDER BY dbo.Adresse.Pays