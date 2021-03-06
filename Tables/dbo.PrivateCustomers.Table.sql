USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[PrivateCustomers]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateCustomers](
	[PrivateCustomerID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[Fristname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PrivateCustomers] PRIMARY KEY CLUSTERED 
(
	[PrivateCustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrivateCustomers]  WITH CHECK ADD  CONSTRAINT [FK_PrivateCustomers_CompanyCustomers] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[CompanyCustomers] ([CompanyCustomerID])
GO
ALTER TABLE [dbo].[PrivateCustomers] CHECK CONSTRAINT [FK_PrivateCustomers_CompanyCustomers]
GO
ALTER TABLE [dbo].[PrivateCustomers]  WITH CHECK ADD  CONSTRAINT [FK_PrivateCustomers_Customers] FOREIGN KEY([PrivateCustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[PrivateCustomers] CHECK CONSTRAINT [FK_PrivateCustomers_Customers]
GO
