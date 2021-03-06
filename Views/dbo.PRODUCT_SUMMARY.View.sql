USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRODUCT_SUMMARY]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[PRODUCT_SUMMARY] as
select ProductName, CategoryName, OrderDate, sum(Quantity) as 'Total Quantity' from Products P
    inner join PriceHistory PH on P.ProductID = PH.ProductID
    inner join Categories C on P.CategoryID = C.CategoryID
    inner join OrderDetails OD on PH.EntryID = OD.EntryID
    inner join Orders O on OD.OrderID = O.OrderID
group by P.ProductID, ProductName, CategoryName, OrderDate
GO
