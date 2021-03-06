USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRODUCTS_ORDERED_REPORT_MONTH]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PRODUCTS_ORDERED_REPORT_MONTH] as
select year(TargetDate) as YEAR, month(TargetDate) as Month, ProductName, SUM(Quantity) as TotalQauntityOrdered
from Orders O
         inner join OrderDetails OD on O.OrderID = OD.OrderID
         inner join Products P on OD.Price = P.Price
group by year(TargetDate), month(TargetDate), ProductName
GO
