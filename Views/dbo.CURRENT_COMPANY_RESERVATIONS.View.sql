USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[CURRENT_COMPANY_RESERVATIONS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CURRENT_COMPANY_RESERVATIONS]
as
SELECT ReservationID, [Reservation Start], [Reservation End], Status, [Person Assigned], [Assigned Table]
FROM COMPANY_RESERVATIONS
where [Status End] IS NULL and [Reservation End] < GETDATE()
GO
