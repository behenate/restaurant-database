USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[TOP_PRODUCTS_VALUE]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TOP_PRODUCTS_VALUE]
AS
SELECT TOP 10 P.ProductID, P.ProductName, SUM(Quantity*OrderDetails.Price) as 'Total Quantity' from OrderDetails
INNER JOIN PriceHistory PH on PH.EntryID = OrderDetails.EntryID
INNER JOIN Products P on P.ProductID = PH.ProductID
group by P.ProductID, P.ProductName
order by 3 desc
GO
