USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[ReservationRequirements]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequirements](
	[ConstID] [int] IDENTITY(1,1) NOT NULL,
	[ConstName] [varchar](50) NOT NULL,
	[ConstValue] [int] NOT NULL,
 CONSTRAINT [PK_ReservationRequirements] PRIMARY KEY CLUSTERED 
(
	[ConstID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
