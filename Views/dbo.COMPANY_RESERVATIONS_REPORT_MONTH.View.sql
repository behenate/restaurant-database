USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[COMPANY_RESERVATIONS_REPORT_MONTH]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[COMPANY_RESERVATIONS_REPORT_MONTH]
as
SELECT YEAR(TimeFrom) as Year, DATEPART(month, TimeFrom) as Month,  count(ReservationID) as 'ReservationsNumber', AVG(DATEDIFF(minute ,TimeFrom, TimeTo))/60.0 as 'Average Duration' from CompanyReservations
group by  YEAR(TimeFrom), DATEPART(month , TimeFrom)
GO
