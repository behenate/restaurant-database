USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddCompanyReservationTable]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCompanyReservationTable]
@reservationID int,
@tableID int,
@representantID int,
@guestsNumber int
as
BEGIN
    SET NOCOUNT ON;
    DECLARE @companyID int = (Select CompanyID from CompanyReservations where ReservationID=@reservationID);
    DECLARE @timeFrom datetime = (SELECT TimeFrom from CompanyReservations where ReservationID=@reservationID);
    DECLARE @timeTo datetime = (SELECT TimeTo from CompanyReservations where ReservationID=@reservationID);
    Declare @T Table (TableID int);
    Insert @T Exec FindAvailableTables @timeFrom, @timeTo;
    if @tableID not in (Select TableID from @T) BEGIN
        DECLARE @message varchar (1000) = 'Stolik o ID: ' + Convert(Varchar, @tableID) + N' jest zajęty w podanym terminie';
        THROW 52000, @message, 1;
    end
    if (Select SeatsNo from Tables where TableID=@tableID) < @guestsNumber BEGIN
    DECLARE @message1 varchar (1000) = 'Stolik o ID: ' + Convert(Varchar, @tableID) + N' nie pomieści ' + CONVERT(varchar, @guestsNumber) + N' gości!';
        THROW 52000, @message1, 1;
    END
    DECLARE @repCompanyID int = ISNULL((Select CompanyID from PrivateCustomers where PrivateCustomerID=@representantID), -1);
    IF @repCompanyID != @companyID and @representantID != @companyID
    BEGIN
        DECLARE @message3 varchar (1000) = N'Użytkownik o ID: ' + Convert(Varchar, @representantID) + N' nie jest reprezentatntem firmy ani samą firmą';
        THROW 52000, @message3, 1;
    END
    BEGIN TRY
        Insert Into CompanyReservationDetails(ReservationID, TableID, CustomerID, GuestsNumber)
        values (@reservationID, @tableID, @representantID, @guestsNumber)
    END TRY
    BEGIN CATCH
        DECLARE @message2 NVARCHAR(1000) = N'Nie udało się dodać stolika do rezerwacji firmowej: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message2, 1;
    end catch
end
GO
