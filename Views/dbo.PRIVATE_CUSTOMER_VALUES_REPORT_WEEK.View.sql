USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PRIVATE_CUSTOMER_VALUES_REPORT_WEEK]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PRIVATE_CUSTOMER_VALUES_REPORT_WEEK]
AS
Select YEAR(OrderDate) as Year, DATEPART(week, OrderDate) as Week, CustomerID, PC.Fristname + ' ' + PC.Lastname as Name,  SUM([Order Value]) as 'TotalValue',
     COUNT(OrderID) 'OrderCount' from ORDER_VALUES_PRIVATE
inner join PrivateCustomers PC on ORDER_VALUES_PRIVATE.CustomerID = PC.PrivateCustomerID
group by CustomerID, PC.Fristname, PC.Lastname, YEAR(OrderDate), DATEPART(week, OrderDate)
GO
