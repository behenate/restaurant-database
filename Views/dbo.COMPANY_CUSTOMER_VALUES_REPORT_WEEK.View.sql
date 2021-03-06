USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[COMPANY_CUSTOMER_VALUES_REPORT_WEEK]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[COMPANY_CUSTOMER_VALUES_REPORT_WEEK]
AS
Select YEAR(OrderDate) as Year,
DATEPART(week, OrderDate) as WEEK,
CustomerID,
CC.CompanyName as Name,
SUM([Order Value]) as 'TotalValue',
COUNT(OrderID) 'OrderCount'
from ORDER_VALUES_COMPANY
inner join CompanyCustomers CC on ORDER_VALUES_COMPANY.CustomerID = CC.CompanyCustomerID
group by CustomerID, CC.CompanyName, YEAR(OrderDate), DATEPART(week, OrderDate)
GO
