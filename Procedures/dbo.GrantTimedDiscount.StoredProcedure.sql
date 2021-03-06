USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[GrantTimedDiscount]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrantTimedDiscount]
@CustomerID int
AS
BEGIN
    DECLARE @discountID int = (SELECT TOP 1 EntryID from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName like 'TimedR%' and ValidFrom < getdate() and (ValidTo > getdate() or ValidTo is NULL))
    DECLARE @duration int = (SELECT TOP 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName like 'TimedD%' and ValidFrom < getdate() and (ValidTo > getdate() or ValidTo is NULL))
    DECLARE @ordersRequiredValue int = (SELECT TOP 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName like 'TimedK%' and ValidFrom < getdate() and (ValidTo > getdate() or ValidTo is NULL));
    DECLARE @orderMaxValue money = (SELECT MAX (la.total) from (SELECT sum(Price*Quantity) as total from ORDERS_WORKHORSE where CustomerID=@CustomerID group by OrderID) as la);

    If @orderMaxValue <= @ordersRequiredValue
        BEGIN
            declare @message100 VARCHAR(1000)= N'Maksymalna wartość zamówienia dla klienta o ID!' + CONVERT(Varchar, @orderMaxValue) +
                                               N'Jest mniejsza od wymaganej'+ CONVERT(Varchar, @ordersRequiredValue);
            Throw 52000, @message100 ,1;
        END
    ELSE
        BEGIN 
            BEGIN TRY
                Insert Into GrantedTimedDiscounts (CustomerID, DiscountID, ActiveFrom, ActiveTo)
                values (@CustomerID, @discountID, getdate(), DATEADD(day, @duration, getdate()));
            END TRY
            BEGIN CATCH
                DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać zniżki czasowej: ' + char(13) + char(10) + ERROR_MESSAGE();
                THROW 52000, @message, 1;
            end catch
        END 
    
END
GO
