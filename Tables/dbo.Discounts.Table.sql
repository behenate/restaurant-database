USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountID] [int] NOT NULL,
	[DiscountPercentage] [float] NOT NULL,
	[MinOrdersAmount] [int] NOT NULL,
	[MinOrdersValue] [float] NOT NULL,
	[CalculateFrom] [datetime] NOT NULL,
	[CalculateTo] [datetime] NULL,
	[isOneTIme] [bit] NOT NULL
) ON [PRIMARY]
GO
