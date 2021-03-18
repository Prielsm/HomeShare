/*
Script de déploiement pour HomeShare

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HomeShare"
:setvar DefaultFilePrefix "HomeShare"
:setvar DefaultDataPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\User\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé fb2a96fb-cb25-4fe5-b151-3815153182ef est ignorée, l''élément [dbo].[Bien].[Id] (SqlSimpleColumn) ne sera pas renommé en IdBien';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 2636537a-797c-4886-9087-74fe8e680b95 est ignorée, l''élément [dbo].[User].[Id] (SqlSimpleColumn) ne sera pas renommé en IdUser';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 6fc1a536-070f-4944-b7b5-298cd4e303b9 est ignorée, l''élément [dbo].[Role].[Id] (SqlSimpleColumn) ne sera pas renommé en IdRole';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 370fd0f7-6d17-4b9a-91de-5aa5027aa33a est ignorée, l''élément [dbo].[Echange].[Id] (SqlSimpleColumn) ne sera pas renommé en IdEchange';


GO
PRINT N'L''opération de refactorisation de changement de nom avec la clé 10cacf94-9f73-434b-bbff-483ff6b171ff est ignorée, l''élément [dbo].[Avis].[Id] (SqlSimpleColumn) ne sera pas renommé en IdAvis';


GO
PRINT N'Suppression de contrainte sans nom sur [dbo].[Option]...';


GO
ALTER TABLE [dbo].[Option] DROP CONSTRAINT [DF__Option__EstDispo__267ABA7A];


GO
PRINT N'Création de [dbo].[Avis]...';


GO
CREATE TABLE [dbo].[Avis] (
    [IdAvis]      INT            IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (255) NOT NULL,
    [EstValide]   BIT            NOT NULL,
    [IdEchange]   INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdAvis] ASC)
);


GO
PRINT N'Création de [dbo].[Bien]...';


GO
CREATE TABLE [dbo].[Bien] (
    [IdBien]       INT            IDENTITY (1, 1) NOT NULL,
    [Titre]        NVARCHAR (50)  NOT NULL,
    [DescrCourte]  NVARCHAR (255) NOT NULL,
    [DescrLongue]  NVARCHAR (MAX) NOT NULL,
    [Photo]        NVARCHAR (255) NOT NULL,
    [Capacite]     INT            NOT NULL,
    [NbrSDB]       INT            NOT NULL,
    [NbrWC]        INT            NOT NULL,
    [EstDesactive] BIT            NULL,
    [Assurance]    INT            NULL,
    [IdAdresse]    INT            NOT NULL,
    [IdUser]       INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdBien] ASC)
);


GO
PRINT N'Création de [dbo].[Echange]...';


GO
CREATE TABLE [dbo].[Echange] (
    [IdEchange] INT  IDENTITY (1, 1) NOT NULL,
    [DateDebut] DATE NOT NULL,
    [DateFin]   DATE NOT NULL,
    [Montant]   INT  NULL,
    [IdBien]    INT  NOT NULL,
    [IdUser]    INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEchange] ASC)
);


GO
PRINT N'Création de [dbo].[OptionBien]...';


GO
CREATE TABLE [dbo].[OptionBien] (
    [IdOption] INT NOT NULL,
    [idBien]   INT NOT NULL,
    CONSTRAINT [PK_OptionBien] PRIMARY KEY CLUSTERED ([IdOption] ASC, [idBien] ASC)
);


GO
PRINT N'Création de [dbo].[Role]...';


GO
CREATE TABLE [dbo].[Role] (
    [IdRole] INT           IDENTITY (1, 1) NOT NULL,
    [Nom]    NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([IdRole] ASC)
);


GO
PRINT N'Création de [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [IdUser]    INT            IDENTITY (1, 1) NOT NULL,
    [Nom]       NVARCHAR (50)  NOT NULL,
    [Prenom]    NVARCHAR (50)  NOT NULL,
    [Email]     NVARCHAR (50)  NOT NULL,
    [Pays]      NVARCHAR (50)  NOT NULL,
    [Telephone] NVARCHAR (50)  NOT NULL,
    [Login]     NVARCHAR (50)  NOT NULL,
    [Password]  VARBINARY (50) NOT NULL,
    [IdRole]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUser] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC)
);


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Bien]...';


GO
ALTER TABLE [dbo].[Bien]
    ADD DEFAULT 0 FOR [EstDesactive];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Bien]...';


GO
ALTER TABLE [dbo].[Bien]
    ADD DEFAULT 0 FOR [Assurance];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Echange]...';


GO
ALTER TABLE [dbo].[Echange]
    ADD DEFAULT 5 FOR [Montant];


GO
PRINT N'Création de [dbo].[FK_AVIS_ECHANGE]...';


GO
ALTER TABLE [dbo].[Avis] WITH NOCHECK
    ADD CONSTRAINT [FK_AVIS_ECHANGE] FOREIGN KEY ([IdEchange]) REFERENCES [dbo].[Echange] ([IdEchange]);


GO
PRINT N'Création de [dbo].[FK_Bien_Adresse]...';


GO
ALTER TABLE [dbo].[Bien] WITH NOCHECK
    ADD CONSTRAINT [FK_Bien_Adresse] FOREIGN KEY ([IdAdresse]) REFERENCES [dbo].[Adresse] ([IdAdresse]);


GO
PRINT N'Création de [dbo].[FK_Bien_User]...';


GO
ALTER TABLE [dbo].[Bien] WITH NOCHECK
    ADD CONSTRAINT [FK_Bien_User] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


GO
PRINT N'Création de [dbo].[FK_ECHANGE_BIEN]...';


GO
ALTER TABLE [dbo].[Echange] WITH NOCHECK
    ADD CONSTRAINT [FK_ECHANGE_BIEN] FOREIGN KEY ([IdBien]) REFERENCES [dbo].[Bien] ([IdBien]);


GO
PRINT N'Création de [dbo].[FK_ECHANGE_USER]...';


GO
ALTER TABLE [dbo].[Echange] WITH NOCHECK
    ADD CONSTRAINT [FK_ECHANGE_USER] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


GO
PRINT N'Création de [dbo].[FK_OptionBien_ToOption]...';


GO
ALTER TABLE [dbo].[OptionBien] WITH NOCHECK
    ADD CONSTRAINT [FK_OptionBien_ToOption] FOREIGN KEY ([IdOption]) REFERENCES [dbo].[Option] ([IdOption]);


GO
PRINT N'Création de [dbo].[FK_OptionBien_ToBien]...';


GO
ALTER TABLE [dbo].[OptionBien] WITH NOCHECK
    ADD CONSTRAINT [FK_OptionBien_ToBien] FOREIGN KEY ([idBien]) REFERENCES [dbo].[Bien] ([IdBien]);


GO
PRINT N'Création de [dbo].[FK_User_Role]...';


GO
ALTER TABLE [dbo].[User] WITH NOCHECK
    ADD CONSTRAINT [FK_User_Role] FOREIGN KEY ([IdRole]) REFERENCES [dbo].[Role] ([IdRole]);


GO
PRINT N'Création de [dbo].[CK_User_Email]...';


GO
ALTER TABLE [dbo].[User] WITH NOCHECK
    ADD CONSTRAINT [CK_User_Email] CHECK ([Email] LIKE '___%@___%.__%');


GO
-- Étape de refactorisation pour mettre à jour le serveur cible avec des journaux de transactions déployés
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fb2a96fb-cb25-4fe5-b151-3815153182ef')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fb2a96fb-cb25-4fe5-b151-3815153182ef')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2636537a-797c-4886-9087-74fe8e680b95')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2636537a-797c-4886-9087-74fe8e680b95')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6fc1a536-070f-4944-b7b5-298cd4e303b9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6fc1a536-070f-4944-b7b5-298cd4e303b9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '370fd0f7-6d17-4b9a-91de-5aa5027aa33a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('370fd0f7-6d17-4b9a-91de-5aa5027aa33a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '10cacf94-9f73-434b-bbff-483ff6b171ff')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('10cacf94-9f73-434b-bbff-483ff6b171ff')

GO

GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Avis] WITH CHECK CHECK CONSTRAINT [FK_AVIS_ECHANGE];

ALTER TABLE [dbo].[Bien] WITH CHECK CHECK CONSTRAINT [FK_Bien_Adresse];

ALTER TABLE [dbo].[Bien] WITH CHECK CHECK CONSTRAINT [FK_Bien_User];

ALTER TABLE [dbo].[Echange] WITH CHECK CHECK CONSTRAINT [FK_ECHANGE_BIEN];

ALTER TABLE [dbo].[Echange] WITH CHECK CHECK CONSTRAINT [FK_ECHANGE_USER];

ALTER TABLE [dbo].[OptionBien] WITH CHECK CHECK CONSTRAINT [FK_OptionBien_ToOption];

ALTER TABLE [dbo].[OptionBien] WITH CHECK CHECK CONSTRAINT [FK_OptionBien_ToBien];

ALTER TABLE [dbo].[User] WITH CHECK CHECK CONSTRAINT [FK_User_Role];

ALTER TABLE [dbo].[User] WITH CHECK CHECK CONSTRAINT [CK_User_Email];


GO
PRINT N'Mise à jour terminée.';


GO
