USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[ChangePrivateReservationStatus]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ChangePrivateReservationStatus]
@privateReservationID int,
@newStatusID int
AS
    BEGIN
         SET NOCOUNT ON;
         BEGIN TRY
            UPDATE PrivateStatusHistories SET TimeTo=GETDATE() where ReservationID=@privateReservationID;
            INSERT INTO PrivateStatusHistories (ReservationID, StatusID, TimeFrom, TimeTo)
            VALUES (@privateReservationID, @newStatusID, getdate(), null)
        END TRY
        BEGIN CATCH
            DECLARE @message NVARCHAR(1000) = N'Nie udało się zmienić statusu rezerwacji prywatnej: ' + char(13) + char(10) + ERROR_MESSAGE();
            THROW 52000, @message, 1;
        end catch
    end
GO
