USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[DiscountsParameters]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountsParameters](
	[ParameterID] [int] IDENTITY(1,1) NOT NULL,
	[ParameterName] [nvarchar](50) NULL,
	[Unit] [nchar](10) NULL,
 CONSTRAINT [PK_TimedDiscounts] PRIMARY KEY CLUSTERED 
(
	[ParameterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
