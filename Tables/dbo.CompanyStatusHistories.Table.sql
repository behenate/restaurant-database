USE [u_wdrozdz]
GO
/****** Object:  Table [dbo].[CompanyStatusHistories]    Script Date: 18.03.2022 12:33:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyStatusHistories](
	[ReservationID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[TimeFrom] [datetime] NOT NULL,
	[TimeTo] [datetime] NULL,
 CONSTRAINT [PK_CompanyStatusHistories] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStatusHistories_CompanyReservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[CompanyReservations] ([ReservationID])
GO
ALTER TABLE [dbo].[CompanyStatusHistories] CHECK CONSTRAINT [FK_CompanyStatusHistories_CompanyReservations]
GO
ALTER TABLE [dbo].[CompanyStatusHistories]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStatusHistories_ReservationStatuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ReservationStatuses] ([StatusID])
GO
ALTER TABLE [dbo].[CompanyStatusHistories] CHECK CONSTRAINT [FK_CompanyStatusHistories_ReservationStatuses]
GO
ALTER TABLE [dbo].[CompanyStatusHistories]  WITH CHECK ADD  CONSTRAINT [CK_CompanyStatusHistories] CHECK  (([TimeFrom]>'01-01-1900' AND [TimeTo]>'01-01-1900' AND [TimeTo]>=[TimeFrom]))
GO
ALTER TABLE [dbo].[CompanyStatusHistories] CHECK CONSTRAINT [CK_CompanyStatusHistories]
GO
