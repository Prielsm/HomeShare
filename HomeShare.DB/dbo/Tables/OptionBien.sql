CREATE TABLE [dbo].[OptionBien]
(
	[IdOption]  INT NOT NULL,
    [idBien] INT NOT NULL,
    CONSTRAINT [PK_OptionBien] PRIMARY KEY CLUSTERED ([IdOption] ASC, [idBien] ASC),
    CONSTRAINT [FK_OptionBien_ToOption] FOREIGN KEY ([IdOption]) REFERENCES [dbo].[Option] ([IdOption]),
    CONSTRAINT [FK_OptionBien_ToBien] FOREIGN KEY ([idBien]) REFERENCES [dbo].[Bien] ([IdBien])
)
