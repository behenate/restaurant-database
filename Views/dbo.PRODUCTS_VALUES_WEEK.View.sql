USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRODUCTS_VALUES_WEEK]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PRODUCTS_VALUES_WEEK]
as
SELECT Year(OrderDate) as Year, DATEPART(Week,OrderDate) as Week, ProductID, ProductName,
       SUM(DiscountedPrice) as TotalValue, COUNT(ProductID) as TimesSold from ORDERS_WORKHORSE
GROUP BY Year(OrderDate), DATEPART(WEEK, OrderDate), ProductID, ProductName
GO
