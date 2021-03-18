CREATE TABLE [dbo].[User]
(
	[IdUser] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Nom] NVARCHAR(50) NOT NULL, 
    [Prenom] NVARCHAR(50) NOT NULL, 
    [Email] NVARCHAR(50) NOT NULL UNIQUE, 
    [Pays] NVARCHAR(50) NOT NULL, 
    [Telephone] NVARCHAR(50) NOT NULL, 
    [Login] NVARCHAR(50) NOT NULL UNIQUE, 
    [Password] NVARCHAR(600) NOT NULL,
    [Salt] NVARCHAR(250) NULL,
    [IdRole] INT NOT NULL, 

    CONSTRAINT CK_User_Email CHECK ([Email] LIKE '___%@___%.__%'),
    CONSTRAINT FK_User_Role FOREIGN KEY ([IdRole]) REFERENCES [Role],
)
