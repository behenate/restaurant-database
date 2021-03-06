USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddPrivateReservation]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPrivateReservation]
@customerID int,
@timeFrom datetime,
@timeTo datetime,
@orderID int
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @orderValue money = (Select Sum(Price) from OrderDetails where OrderID=@orderID);
    Declare @minValue money = (SELECT ConstValue from ReservationRequirements where ConstName like 'WZ')
    if not @customerID in (Select PrivateCustomerID from CUSTOMERS_THAT_CAN_MAKE_RESERVATIONS)
    BEGIN
        THROW 52000,N'Ten klient nie spełnia warunków rezerwacji indywidualnej!', 1;
    end
    if @orderValue<@minValue BEGIN
        THROW 52000,'Order Value is too small!', 1;
    end
    BEGIN TRY
        Insert Into PrivateReservations (CustomerID, OrderID, TimeFrom, TimeTo)
        values (@customerID, @orderID, @timeFrom, @timeTo);
        DECLARE @reservationID int = @@IDENTITY;
        Insert Into PrivateStatusHistories(ReservationID, StatusID, TimeFrom, TimeTo)
        values (@reservationID, 1, getdate(), null);
    END TRY
    BEGIN CATCH
        DECLARE @message NVARCHAR(1000) = N'Nie udało się zarejestrować reserwacji!: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message, 1;
     END CATCH
end
GO
