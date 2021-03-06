USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[CURRENT_MENU]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CURRENT_MENU]
as
SELECT ProductName as 'Product Name', C.CategoryName as Category, PH.Price, Ph.TimeFrom, PH.TimeTo from Products
inner join Categories C on C.CategoryID = Products.CategoryID
inner join PriceHistory PH on Products.ProductID = PH.ProductID
where PH.TimeTo > getdate() or PH.TimeTo is NULL
GO
