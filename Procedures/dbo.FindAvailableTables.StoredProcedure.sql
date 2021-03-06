USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[FindAvailableTables]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindAvailableTables]
@timeFrom datetime,
@timeTo datetime
AS
SELECT TableID from Tables
where TableID not in (
    Select TableID from PrivateReservations PR
    inner join PrivateReservationDetails PRD on PR.ReservationID = PRD.ReservationID
    where PR.TimeTo >= @timeFrom and PR.TimeTo <= @timeTo  or PR.TimeFrom <= @timeTo and PR.TimeTo >= @timeTo
    UNION
    Select TableID from CompanyReservations PR
    inner join CompanyReservationDetails PRD on PR.ReservationID = PRD.ReservationID
    where PR.TimeTo >= @timeFrom and PR.TimeTo <= @timeTo  or PR.TimeFrom <= @timeTo and PR.TimeTo >= @timeTo
    )
GO
