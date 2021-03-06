USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[MENU_HISTORY]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MENU_HISTORY]
AS
SELECT DISTINCT PH.EntryID, ProductName, C.CategoryName, PH.Price, PH.TimeFrom, PH.TimeTo from Products
inner join Categories C on C.CategoryID = Products.CategoryID
inner join PriceHistory PH on Products.ProductID = PH.ProductID
GO
