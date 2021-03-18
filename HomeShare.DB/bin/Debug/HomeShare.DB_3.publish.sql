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
/*
La colonne [dbo].[Avis].[Note] de la table [dbo].[Avis] doit être ajoutée mais la colonne ne comporte pas de valeur par défaut et n'autorise pas les valeurs NULL. Si la table contient des données, le script ALTER ne fonctionnera pas. Pour éviter ce problème, vous devez ajouter une valeur par défaut à la colonne, la marquer comme autorisant les valeurs Null ou activer la génération de smart-defaults en tant qu'option de déploiement.
*/

IF EXISTS (select top 1 1 from [dbo].[Avis])
    RAISERROR (N'Lignes détectées. Arrêt de la mise à jour du schéma en raison d''''un risque de perte de données.', 16, 127) WITH NOWAIT

GO
PRINT N'Modification de [dbo].[Avis]...';


GO
ALTER TABLE [dbo].[Avis]
    ADD [Note] INT NOT NULL;


GO
PRINT N'Création de [dbo].[CK_Avis_Note]...';


GO
ALTER TABLE [dbo].[Avis] WITH NOCHECK
    ADD CONSTRAINT [CK_Avis_Note] CHECK ([Note] <= 10);


GO
PRINT N'Création de [dbo].[CK_Avis_Note2]...';


GO
ALTER TABLE [dbo].[Avis] WITH NOCHECK
    ADD CONSTRAINT [CK_Avis_Note2] CHECK ([Note] >= 0);


GO
PRINT N'Vérification de données existantes par rapport aux nouvelles contraintes';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Avis] WITH CHECK CHECK CONSTRAINT [CK_Avis_Note];

ALTER TABLE [dbo].[Avis] WITH CHECK CHECK CONSTRAINT [CK_Avis_Note2];


GO
PRINT N'Mise à jour terminée.';


GO
