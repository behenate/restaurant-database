USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddCompanyReservation]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AddCompanyReservation]
@customerID int,
@timeFrom datetime,
@timeTo datetime
AS
BEGIN
   SET NOCOUNT ON;
   if not @customerID in (Select  CompanyCustomerID from CompanyCustomers)
   BEGIN
       THROW 52000,'This customer ID cant make company reservations', 1;
   end
   BEGIN TRY
       Insert Into CompanyReservations (CompanyID, TimeFrom, TimeTo)
       values (@customerID, @timeFrom, @timeTo);
       DECLARE @reservationID int = @@IDENTITY;
       Insert Into CompanyStatusHistories(ReservationID, StatusID, TimeFrom, TimeTo)
       values (@reservationID, 1, getdate(), null);
   END TRY
   BEGIN CATCH
       DECLARE @message NVARCHAR(1000) = N'Nie udało się zarejestrować firmowej reserwacji: ' + char(13) + char(10) + ERROR_MESSAGE();
       THROW 52000, @message, 1;
    END CATCH
end
GO
