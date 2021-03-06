USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[CompanyCustomers]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyCustomers](
	[CompanyCustomerID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[HomePage] [nvarchar](50) NULL,
 CONSTRAINT [PK_CompanyCustomers] PRIMARY KEY CLUSTERED 
(
	[CompanyCustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyCustomers]  WITH CHECK ADD  CONSTRAINT [FK_CompanyCustomers_Customers] FOREIGN KEY([CompanyCustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CompanyCustomers] CHECK CONSTRAINT [FK_CompanyCustomers_Customers]
GO
