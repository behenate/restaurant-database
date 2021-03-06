USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[GrantDiscounts]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrantDiscounts]
    @CustomerID int,
    @orderID int
as
Begin
    declare @constZ int = (Select top 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName LIKE 'ConstZ%' and ValidFrom <= getdate() and (ValidTo >= getdate() or ValidTo is NULL));
    declare @constK int = (Select top 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName LIKE 'ConstK%' and ValidFrom <= getdate() and (ValidTo >= getdate() or ValidTo is NULL));
    declare @constID int = (Select top 1 ParametersHistory.ParameterID from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName LIKE 'ConstR%' and ValidFrom <= getdate() and (ValidTo >= getdate() or ValidTo is NULL));

    declare @timedK int = (Select top 1 ParameterValue from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName LIKE 'TimedK%' and ValidFrom <= getdate() and (ValidTo >= getdate() or ValidTo is NULL));
     declare @timedID int = (Select top 1 ParametersHistory.ParameterID from ParametersHistory
        inner join DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
        where DP.ParameterName LIKE 'TimedR%' and ValidFrom <= getdate() and (ValidTo >= getdate() or ValidTo is NULL));
    declare @hasGrantedTimed bit = 0;
    declare @hasGrantedConst bit = 0;

    if (@CustomerID in (Select CustomerID from GrantedTimedDiscounts where CustomerID=@CustomerID and DiscountID=@timedID))
        begin
            set @hasGrantedTimed = 1;
        end
    if (@CustomerID in (Select CustomerID from GrantedOneTimeDiscounts where CustomerID=@CustomerID))
        begin
            set @hasGrantedConst = 1;
        end

    declare @orderCount int = (Select Count(OrderID) from ORDERS_WORKHORSE where CustomerID=@CustomerID HAVING SUM(Quantity*Price)>@constK)
    if (@orderCount >= @constZ and @hasGrantedConst=0) BEGIN
        Execute GrantLifetimeDiscount @CustomerID;
    end
    declare @orderValue money = (Select SUM(Price*Quantity) from ORDERS_WORKHORSE where CustomerID=@CustomerID and OrderID=@orderID);
    if (@orderValue > @timedK and @hasGrantedTimed=0)BEGIN
        Execute GrantTimedDiscount @CustomerID;
    end
end
GO
