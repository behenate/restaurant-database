USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[GrantLifetimeDiscount]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrantLifetimeDiscount]
@CustomerID int
AS
BEGIN
    DECLARE @discountID int = (SELECT TOP 1 EntryID from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName like 'ConstR%' and ValidFrom < getdate() and (ValidTo > getdate() or ValidTo is NULL))
    DECLARE @requiredOrders int = (SELECT TOP 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName like 'ConstZ%' and ValidFrom < getdate() and (ValidTo > getdate() or ValidTo is NULL))
   DECLARE @ordersCount int = (SELECT Count(*) from (Select distinct OrderID from ORDERS_WORKHORSE where CustomerID = @CustomerID
    group by OrderID
    HAVING Sum(Price*ORDERS_WORKHORSE.Quantity) >=
        (SELECT TOP 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName like 'ConstK%' and ValidFrom < getdate() and (ValidTo > getdate() or ValidTo is NULL))) as la);
    If @ordersCount < @requiredOrders
        BEGIN
            DECLARE @message12 NVARCHAR(1000) = 'The customer with ID: ' + CONVERT(varchar, @customerID) + ' doesnt meet the current lifetime discount parameters!';
            Throw 52000, @message12,1;
        END
    
    BEGIN TRY
        Insert Into GrantedOneTimeDiscounts (CustomerID, ActiveFrom, DiscountID)
        values (@CustomerID, getdate(), @discountID);
    END TRY
    BEGIN CATCH
        DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać zniżki!: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
END
GO
