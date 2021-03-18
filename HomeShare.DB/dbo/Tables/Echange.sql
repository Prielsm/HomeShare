﻿CREATE TABLE [dbo].[Echange]
(
	[IdEchange] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DateDebut] DATE NOT NULL, 
    [DateFin] DATE NOT NULL, 
    [Montant] INT NULL DEFAULT 5, 
    [IdBien] INT NOT NULL, 
    [IdUser] INT NOT NULL,

    CONSTRAINT FK_ECHANGE_BIEN FOREIGN KEY ([IdBien]) REFERENCES [Bien],
    CONSTRAINT FK_ECHANGE_USER FOREIGN KEY ([IdUser]) REFERENCES [User],
)