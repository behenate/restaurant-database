USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[CompanyReservations]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[TimeFrom] [datetime] NOT NULL,
	[TimeTo] [datetime] NOT NULL,
 CONSTRAINT [PK_CompanyReservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyReservations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReservations_CompanyCustomers] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[CompanyCustomers] ([CompanyCustomerID])
GO
ALTER TABLE [dbo].[CompanyReservations] CHECK CONSTRAINT [FK_CompanyReservations_CompanyCustomers]
GO
ALTER TABLE [dbo].[CompanyReservations]  WITH CHECK ADD  CONSTRAINT [CK_CompanyReservations] CHECK  (([TimeFrom]>'01-01-1900' AND [TimeTo]>'01-01-1900' AND [TimeTo]>[TimeFrom]))
GO
ALTER TABLE [dbo].[CompanyReservations] CHECK CONSTRAINT [CK_CompanyReservations]
GO
