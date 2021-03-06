USE [u_wdrozdz]
GO
/****** Object:  UserDefinedFunction [dbo].[ReservationStatusCompany]    Script Date: 18.03.2022 12:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[ReservationStatusCompany](@reservationID int)
    returns table as
        return
            (
                select top 1 StatusName
                from CompanyStatusHistories CSH
                         inner join ReservationStatuses RS on CSH.StatusID = RS.StatusID
                where ReservationID = @reservationID
            order by TimeFrom
            )
GO
