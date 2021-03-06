USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ProductID] [int] NOT NULL,
	[TimeFrom] [date] NOT NULL,
	[TimeTo] [date] NULL,
	[EntryID] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [CK_Menu] CHECK  (([TimeFrom]>=getdate() AND [TimeTo]>getdate()))
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [CK_Menu]
GO
