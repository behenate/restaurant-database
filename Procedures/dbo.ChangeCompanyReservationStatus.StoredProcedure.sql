USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[ChangeCompanyReservationStatus]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ChangeCompanyReservationStatus]
@companyReservationID int,
@newStatusID int
AS
BEGIN
     SET NOCOUNT ON;
     BEGIN TRY
        UPDATE CompanyStatusHistories SET TimeTo=GETDATE() where ReservationID=@companyReservationID;
        INSERT INTO CompanyStatusHistories (ReservationID, StatusID, TimeFrom, TimeTo)
        VALUES (@companyReservationID, @newStatusID, getdate(), null)
    END TRY
    BEGIN CATCH
        DECLARE @message NVARCHAR(1000) = N'Nie udało się zmienić statusu rezerwacji firmowej: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
end
GO
