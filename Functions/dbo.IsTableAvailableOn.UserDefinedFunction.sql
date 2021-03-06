USE [u_wdrozdz]
GO
/****** Object:  UserDefinedFunction [dbo].[IsTableAvailableOn]    Script Date: 18.03.2022 12:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[IsTableAvailableOn](
@tableID int,
@timeFrom datetime,
@timeTo datetime
)
RETURNS bit AS
    BEGIN
        declare @occupiedTable int = (SELECT TOP 1 TableID from Tables
            where Tables.TableID not in (
                Select TableID from PrivateReservations PR
                inner join PrivateReservationDetails PRD on PR.ReservationID = PRD.ReservationID
                where PR.TimeTo >= @timeFrom and PR.TimeTo <= @timeTo  or PR.TimeFrom <= @timeTo and PR.TimeTo >= @timeTo
                UNION
                Select TableID from CompanyReservations PR
                inner join CompanyReservationDetails PRD on PR.ReservationID = PRD.ReservationID
                where PR.TimeTo >= @timeFrom and PR.TimeTo <= @timeTo  or PR.TimeFrom <= @timeTo and PR.TimeTo >= @timeTo
                ) and Tables.TableID = @tableID)
        declare @result bit = 0;
        if (@occupiedTable is not null)BEGIN
            set @result = 1;
        END
        RETURN @result
        END
GO
