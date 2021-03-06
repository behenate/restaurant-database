USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ORDERS_SUMMARY]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ORDERS_SUMMARY] as
select CustomerID, sum([Order Value]) as 'Order Value Combined', count([OrderID]) as 'Number of orders' from ORDER_VALUES
group by CustomerID
GO
