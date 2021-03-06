USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ORDER_VALUES_REPORT_COMPANY]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ORDER_VALUES_REPORT_COMPANY] as
select datepart(year, [OrderDate])  as Year,
       datepart(month, [OrderDate]) as Month,
       datepart(week , [OrderDate]) as Week,
       sum([Order Value])           as [Order Value]
from ORDER_VALUES_COMPANY
group by datepart(year, [OrderDate]), datepart(month, [OrderDate]), datepart(week , [OrderDate])
GO
