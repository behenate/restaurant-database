USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRIVATE_RESERVATIONS_REPORT_WEEK]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[PRIVATE_RESERVATIONS_REPORT_WEEK]
as
SELECT YEAR(TimeFrom) as Year, DATEPART(week, TimeFrom) as Week,  count(ReservationID) as 'Reservations Number', AVG(DATEDIFF(minute ,TimeFrom, TimeTo))/60.0 as 'Average Duration'  from PrivateReservations
group by  YEAR(TimeFrom), DATEPART(week, TimeFrom)
GO
