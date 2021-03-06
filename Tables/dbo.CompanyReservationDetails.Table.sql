USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[CompanyReservationDetails]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReservationDetails](
	[ReservationID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[GuestsNumber] [int] NOT NULL,
 CONSTRAINT [PK_CompanyReservationDetails_1] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC,
	[TableID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyReservationDetails] ADD  DEFAULT ((2)) FOR [GuestsNumber]
GO
ALTER TABLE [dbo].[CompanyReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservationDetails_CompanyReservations1] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[CompanyReservations] ([ReservationID])
GO
ALTER TABLE [dbo].[CompanyReservationDetails] CHECK CONSTRAINT [FK_CompanyReservationDetails_CompanyReservations1]
GO
ALTER TABLE [dbo].[CompanyReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservationDetails_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CompanyReservationDetails] CHECK CONSTRAINT [FK_CompanyReservationDetails_Customers]
GO
ALTER TABLE [dbo].[CompanyReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservationDetails_Tables] FOREIGN KEY([TableID])
REFERENCES [dbo].[Tables] ([TableID])
GO
ALTER TABLE [dbo].[CompanyReservationDetails] CHECK CONSTRAINT [FK_CompanyReservationDetails_Tables]
GO
