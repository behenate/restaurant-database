USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddOrderProduct]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOrderProduct]
@orderID int,
@entryID int,
@quantity int
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @orderDate datetime = (Select OrderDate from Orders where OrderID = @orderID)
    DECLARE @productID int = (Select ProductID from PriceHistory where EntryID = @entryID);
    DECLARE @productCategory int = (Select CategoryID from Products where ProductID=@productID);
    DECLARE @orderDay int = (Select DATEPART(weekday, @orderDate));
    DECLARE @collectDay int = (Select DATEPART(weekday, (SELECT TargetDate from ORders Where OrderID=@orderID)));
    DECLARE @pickupWeek int = (SELECT DATEPART(Week, (SELECT TargetDate from Orders Where OrderID=@orderID)));
    DECLARE @orderWeek int = (SELECT DATEPART(week, @orderDate));
    Declare @timeFrom date = (Select timeFrom from PriceHistory where EntryID=@entryID);
    DECLARE @timeTo date = (Select TimeTo from PriceHistory where EntryID=@entryID);
    BEGIN
        IF @productCategory = 5 and @collectDay NOT IN (5,6,7)
            BEGIN
                DECLARE @mess NVARCHAR(1000) = N'Owoce morza można zamówić tylko na czwartki, piątki i soboty';
                THROW 52000,@mess,1;
            end
        IF @pickupWeek = @orderWeek and  @productCategory = 5
            BEGIN
                DECLARE @mess1 NVARCHAR(1000) = N'Owoce należy zamówić przed poniedziałkiem poprzedzającym odbiór';
                THROW 52000,@mess1,1;
            end
        IF  @orderDate < @timeFrom or (@orderDate > @timeTo and @timeTo is not NULL)
            BeGIN
               DECLARE @mess2 NVARCHAR(1000) = N'Wybrany produkt nie jest dostępny!';
                THROW 52000,@mess2,1;
            end
    END
    BEGIN TRY
        DECLARE @Price money = (SELECT Price from PriceHistory where EntryID=@entryID);
        INSERT INTO OrderDetails(OrderID, EntryID, Quantity, Price)
        VALUES(@orderID,@entryID,@quantity,@Price)
    END TRY
    BEGIN CATCH
        DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać produktu do Zamówienia: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
end
GO
