USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[PrivateReservationDetails]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateReservationDetails](
	[ReservationID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[GuestsNumber] [int] NOT NULL,
 CONSTRAINT [PK_PrivateReservationDetails] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC,
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrivateReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationDetails_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[PrivateReservations] ([ReservationID])
GO
ALTER TABLE [dbo].[PrivateReservationDetails] CHECK CONSTRAINT [FK_ReservationDetails_Reservations]
GO
ALTER TABLE [dbo].[PrivateReservationDetails]  WITH CHECK ADD  CONSTRAINT [FK_ReservationDetails_Tables] FOREIGN KEY([TableID])
REFERENCES [dbo].[Tables] ([TableID])
GO
ALTER TABLE [dbo].[PrivateReservationDetails] CHECK CONSTRAINT [FK_ReservationDetails_Tables]
GO
ALTER TABLE [dbo].[PrivateReservationDetails]  WITH CHECK ADD  CONSTRAINT [CK_PrivateReservationDetails] CHECK  (([GuestsNumber]>=(0)))
GO
ALTER TABLE [dbo].[PrivateReservationDetails] CHECK CONSTRAINT [CK_PrivateReservationDetails]
GO
