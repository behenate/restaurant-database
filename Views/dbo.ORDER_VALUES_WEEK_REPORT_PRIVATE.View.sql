USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ORDER_VALUES_WEEK_REPORT_PRIVATE]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ORDER_VALUES_WEEK_REPORT_PRIVATE] as
select datepart(year, [OrderDate]) as Year, datepart(week, [OrderDate]) as Week, sum([Order Value]) as [Order Value]
from ORDER_VALUES_PRIVATE
group by datepart(year, [OrderDate]) , datepart(week, [OrderDate])
GO
