USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOrder]
@CustomerID int,
@EmployeeID int,
@OrderDate datetime,
@TargetDate datetime,
@PayLater bit
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY Insert Into Orders (CustomerID, OrderDate, TargetDate, EmployeeID, PayLater)
    VALUES (@CustomerID, @OrderDate, @TargetDate, @EmployeeID, @PayLater);
    end TRY
    BEGIN CATCH
         DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać zamówienia: ' + char(13) + char(10) + ERROR_MESSAGE();
    THROW 52000, @message, 1;
    end catch
end
GO
