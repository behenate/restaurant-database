USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRODUCTS_VALUES_MONTH]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PRODUCTS_VALUES_MONTH]
as
SELECT Year(OrderDate) as Year, MONTH(OrderDate) as Month, ProductID, ProductName,
       SUM(DiscountedPrice) as TotalValue, COUNT(ProductID) as TimesSold from ORDERS_WORKHORSE
GROUP BY Year(OrderDate), MONTH(OrderDate), ProductID, ProductName
GO
