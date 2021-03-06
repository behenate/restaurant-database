USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[AWAITING_APPROVAL]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AWAITING_APPROVAL]
AS
Select ReservationID, [Reservation Start], [Reservation End], Status from PRIVATE_RESERVATIONS where Status='Placed' and [Status End] is NULL
UNION
Select ReservationID, [Reservation Start], [Reservation End], Status from COMPANY_RESERVATIONS where Status='Placed' and [Status End] is NULL
GO
