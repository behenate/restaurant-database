USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[PrivateReservations]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateReservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[TimeFrom] [datetime] NOT NULL,
	[TimeTo] [datetime] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrivateReservations]  WITH CHECK ADD  CONSTRAINT [FK_PrivateReservations_PrivateCustomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[PrivateCustomers] ([PrivateCustomerID])
GO
ALTER TABLE [dbo].[PrivateReservations] CHECK CONSTRAINT [FK_PrivateReservations_PrivateCustomers]
GO
ALTER TABLE [dbo].[PrivateReservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[PrivateReservations] CHECK CONSTRAINT [FK_Reservations_Orders]
GO
ALTER TABLE [dbo].[PrivateReservations]  WITH CHECK ADD  CONSTRAINT [CK_PrivateReservations] CHECK  (([TimeFrom]>'01-01-1900' AND [TimeTo]>'01-01-1900' AND [TimeFrom]<[TimeTo]))
GO
ALTER TABLE [dbo].[PrivateReservations] CHECK CONSTRAINT [CK_PrivateReservations]
GO
