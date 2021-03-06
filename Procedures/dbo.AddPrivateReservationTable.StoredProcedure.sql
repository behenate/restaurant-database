USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddPrivateReservationTable]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPrivateReservationTable]
@reservationID int,
@tableID int,
@guestsNumber int
as
BEGIN
    SET NOCOUNT ON;
    DECLARE @timeFrom datetime = (SELECT TimeFrom from PrivateReservations where ReservationID=@reservationID);
    DECLARE @timeTo datetime = (SELECT TimeTo from PrivateReservations where ReservationID=@reservationID);
    Declare @T Table (TableID int);
    Insert @T Exec FindAvailableTables @timeFrom, @timeTo;
    if @tableID not in (Select TableID from @T) BEGIN
        DECLARE @message varchar (1000) = 'Stolik o ID: ' + Convert(Varchar, @tableID) + N' jest zajęty w podanym terminie';
        THROW 52000, @message, 1;
    end
    if(@guestsNumber<2)BEGIN
        DECLARE @message5 varchar (1000) = N'Liczba gości: ' + Convert(Varchar, @guestsNumber) + N' jest wystarczająca';
        THROW 52000, @message5, 1;
    end
    if (Select SeatsNo from Tables where TableID=@tableID) < @guestsNumber BEGIN
    DECLARE @message1 varchar (1000) = 'Stolik o ID: ' + Convert(Varchar, @tableID) + N' nie pomieści ' + CONVERT(varchar, @guestsNumber) + N' gości!';
        THROW 52000, @message1, 1;
        END
    BEGIN TRY
        Insert Into PrivateReservationDetails(ReservationID, TableID, GuestsNumber)
        values (@reservationID, @tableID, @guestsNumber)
    END TRY
    BEGIN CATCH
        DECLARE @message2 NVARCHAR(1000) = N'Nie udało się dodać stolika do rezerwacji!: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message2, 1;
    end catch
end
GO
