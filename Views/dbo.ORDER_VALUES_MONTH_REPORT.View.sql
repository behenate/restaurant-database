USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ORDER_VALUES_MONTH_REPORT]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ORDER_VALUES_MONTH_REPORT] as
select datepart(year, [OrderDate]) as Year, datepart(month, [OrderDate]) as Month, sum([Order Value]) as [Order Value]
from ORDER_VALUES
group by datepart(year, [OrderDate]), datepart(month, [OrderDate])
GO
