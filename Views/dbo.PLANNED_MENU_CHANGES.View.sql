USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PLANNED_MENU_CHANGES]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PLANNED_MENU_CHANGES](ProductName, TimeFrom, TimeTo, Description, CategoryName) as
select ProductName, TimeFrom, TimeTo, Description, CategoryName
from PriceHistory M
         inner join Products P on M.ProductID = P.ProductID
         inner join Categories C on C.CategoryID = P.CategoryID
where TimeFrom > getdate()
GO
