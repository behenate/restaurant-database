USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddPrivateReservationWithOrder]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPrivateReservationWithOrder]
@CustomerID int,
@timeFrom datetime,
@timeTo datetime,
@TableID int,
@guestsNumber int,
@employeeID int
as
BEGIN
    BEGIN TRY
        BEGIN TRAN
            declare @currentTime datetime = (Select getdate());
            EXECUTE AddOrder @CustomerID, @employeeID, @currentTime, @timeFrom, True;
            declare @orderID int = @@IDENTITY;
            EXECUTE AddPrivateReservation @CustomerID, @timeFrom, @timeTo, @orderID;
            declare @reservationID int = (Select top 1 ReservationID from PrivateReservations order by ReservationID desc);
            EXECUTE AddPrivateReservationTable @reservationID, @tableID, @guestsNumber;
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        declare @message Varchar(1000) = N'Nie udało się dodać rezerwacji z zamówieniem: ' + ERROR_MESSAGE();
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN;
        THROW 52000, @message, 1;
    END CATCH



end
GO
