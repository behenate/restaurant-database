USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[City] [int] NOT NULL,
	[Phone] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([City])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customer_City]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabela Wszystkich Klientów' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers'
GO
