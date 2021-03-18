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
PRINT N'Suppression de [dbo].[FK_Bien_User]...';


GO
ALTER TABLE [dbo].[Bien] DROP CONSTRAINT [FK_Bien_User];


GO
PRINT N'Suppression de [dbo].[FK_ECHANGE_USER]...';


GO
ALTER TABLE [dbo].[Echange] DROP CONSTRAINT [FK_ECHANGE_USER];


GO
PRINT N'Suppression de [dbo].[FK_User_Role]...';


GO
ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role];


GO
PRINT N'Début de la régénération de la table [dbo].[User]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_User] (
    [IdUser]    INT            IDENTITY (1, 1) NOT NULL,
    [Nom]       NVARCHAR (50)  NOT NULL,
    [Prenom]    NVARCHAR (50)  NOT NULL,
    [Email]     NVARCHAR (50)  NOT NULL,
    [Pays]      NVARCHAR (50)  NOT NULL,
    [Telephone] NVARCHAR (50)  NOT NULL,
    [Login]     NVARCHAR (50)  NOT NULL,
    [Password]  NVARCHAR (600) NOT NULL,
    [Salt]      NVARCHAR (250) NULL,
    [IdRole]    INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([IdUser] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[User])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_User] ON;
        INSERT INTO [dbo].[tmp_ms_xx_User] ([IdUser], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [IdRole])
        SELECT   [IdUser],
                 [Nom],
                 [Prenom],
                 [Email],
                 [Pays],
                 [Telephone],
                 [Login],
                 [Password],
                 [IdRole]
        FROM     [dbo].[User]
        ORDER BY [IdUser] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_User] OFF;
    END

DROP TABLE [dbo].[User];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_User]', N'User';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Création de [dbo].[FK_Bien_User]...';


GO
ALTER TABLE [dbo].[Bien] WITH NOCHECK
    ADD CONSTRAINT [FK_Bien_User] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


GO
PRINT N'Création de [dbo].[FK_ECHANGE_USER]...';


GO
ALTER TABLE [dbo].[Echange] WITH NOCHECK
    ADD CONSTRAINT [FK_ECHANGE_USER] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[User] ([IdUser]);


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
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Bien] WITH CHECK CHECK CONSTRAINT [FK_Bien_User];

ALTER TABLE [dbo].[Echange] WITH CHECK CHECK CONSTRAINT [FK_ECHANGE_USER];

ALTER TABLE [dbo].[User] WITH CHECK CHECK CONSTRAINT [FK_User_Role];

ALTER TABLE [dbo].[User] WITH CHECK CHECK CONSTRAINT [CK_User_Email];


GO
PRINT N'Mise à jour terminée.';


GO
