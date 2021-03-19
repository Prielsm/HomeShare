/*
Script de déploiement pour HomeShareDBASP

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HomeShareDBASP"
:setvar DefaultFilePrefix "HomeShareDBASP"
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
PRINT N'Modification de [dbo].[BienEchange]...';


GO
ALTER TABLE [dbo].[BienEchange] ALTER COLUMN [Latitude] NVARCHAR (50) NULL;

ALTER TABLE [dbo].[BienEchange] ALTER COLUMN [Longitude] NVARCHAR (50) NULL;


GO
PRINT N'Actualisation de [dbo].[Vue_BiensParPays]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Vue_BiensParPays]';


GO
PRINT N'Actualisation de [dbo].[Vue_CinqDernierBiens]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Vue_CinqDernierBiens]';


GO
PRINT N'Actualisation de [dbo].[Vue_MeilleursAvis]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Vue_MeilleursAvis]';


GO
PRINT N'Actualisation de [dbo].[sp_RecupBienDispo]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_RecupBienDispo]';


GO
PRINT N'Actualisation de [dbo].[sp_RecupBienMembre]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_RecupBienMembre]';


GO
PRINT N'Actualisation de [dbo].[sp_RecupToutesInfosBien]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[sp_RecupToutesInfosBien]';


GO
PRINT N'Mise à jour terminée.';


GO
