USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[GrantedOneTimeDiscounts]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrantedOneTimeDiscounts](
	[CustomerID] [int] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
	[DiscountID] [int] NOT NULL,
 CONSTRAINT [PK_GrantedOneTimeDiscounts] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GrantedOneTimeDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_GrantedOneTimeDiscounts_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[GrantedOneTimeDiscounts] CHECK CONSTRAINT [FK_GrantedOneTimeDiscounts_Customer]
GO
ALTER TABLE [dbo].[GrantedOneTimeDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_GrantedOneTimeDiscounts_ParametersHistory] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[ParametersHistory] ([EntryID])
GO
ALTER TABLE [dbo].[GrantedOneTimeDiscounts] CHECK CONSTRAINT [FK_GrantedOneTimeDiscounts_ParametersHistory]
GO
ALTER TABLE [dbo].[GrantedOneTimeDiscounts]  WITH CHECK ADD  CONSTRAINT [CK_GrantedOneTimeDiscounts] CHECK  (([ActiveFrom]>='01-01-1900'))
GO
ALTER TABLE [dbo].[GrantedOneTimeDiscounts] CHECK CONSTRAINT [CK_GrantedOneTimeDiscounts]
GO
