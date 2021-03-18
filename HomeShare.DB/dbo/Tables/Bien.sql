CREATE TABLE [dbo].[Bien]
(
	[IdBien] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Titre] NVARCHAR(50) NOT NULL, 
    [DescrCourte] NVARCHAR(255) NOT NULL, 
    [DescrLongue] NVARCHAR(MAX) NOT NULL, 
    [Photo] NVARCHAR(255) NOT NULL, 
    [Capacite] INT NOT NULL, 
    [NbrSDB] INT NOT NULL, 
    [NbrWC] INT NOT NULL, 
    [EstDesactive] BIT NULL DEFAULT 0, 
    [Assurance] INT NULL DEFAULT 0,
    [IdAdresse] INT NOT NULL,
    [IdUser] INT NOT NULL,

    CONSTRAINT FK_Bien_Adresse FOREIGN KEY ([IdAdresse]) REFERENCES [Adresse],
    CONSTRAINT FK_Bien_User FOREIGN KEY ([IdUser]) REFERENCES [User]
)
