CREATE TABLE [dbo].[Avis]
(
	[IdAvis] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Description] NVARCHAR(255) NOT NULL, 
    [EstValide] BIT NOT NULL, 
    [IdEchange] INT NOT NULL,
    [Note] INT NOT NULL,

    CONSTRAINT FK_AVIS_ECHANGE FOREIGN KEY ([IdEchange]) REFERENCES [Echange],
    CONSTRAINT CK_Avis_Note CHECK ([Note] <= 10),
    CONSTRAINT CK_Avis_Note2 CHECK ([Note] >= 0),
)
