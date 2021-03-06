USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[GrantedTimedDiscounts]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrantedTimedDiscounts](
	[CustomerID] [int] NOT NULL,
	[DiscountID] [int] NOT NULL,
	[ActiveFrom] [datetime] NOT NULL,
	[ActiveTo] [datetime] NOT NULL,
 CONSTRAINT [PK_GrantedTimedDiscounts] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_GrantedTimedDiscounts_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts] CHECK CONSTRAINT [FK_GrantedTimedDiscounts_Customer]
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_GrantedTimedDiscounts_ParametersHistory] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[ParametersHistory] ([EntryID])
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts] CHECK CONSTRAINT [FK_GrantedTimedDiscounts_ParametersHistory]
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts]  WITH CHECK ADD  CONSTRAINT [CK_GrantedTimedDiscounts] CHECK  (([ActiveFrom]>'01-01-1900'))
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts] CHECK CONSTRAINT [CK_GrantedTimedDiscounts]
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts]  WITH CHECK ADD  CONSTRAINT [CK_GrantedTimedDiscounts_1] CHECK  (([ActiveTo]>=[ActiveFrom]))
GO
ALTER TABLE [dbo].[GrantedTimedDiscounts] CHECK CONSTRAINT [CK_GrantedTimedDiscounts_1]
GO
