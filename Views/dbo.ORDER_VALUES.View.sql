USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ORDER_VALUES]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ORDER_VALUES] as
select O.OrderID, O.CustomerID, OrderDate,
       ROUND(SUM(Quantity*OrderDetails.Price*
       (1-ISNULL(IIF(PH.ParameterValue < PH1.ParameterValue, PH1.ParameterValue, PH.ParameterValue)*0.01, 0))),2) as 'Order Value' from OrderDetails
Inner Join Orders O on O.OrderID = OrderDetails.OrderID
inner join Customers C on C.CustomerID = O.CustomerID
left join GrantedOneTimeDiscounts GOTD on C.CustomerID = GOTD.CustomerID
left join GrantedTimedDiscounts GTD on C.CustomerID = GTD.CustomerID and GTD.ActiveTo >= O.OrderDate  and GTD.ActiveFrom <= O.OrderDate
left join ParametersHistory PH on GOTD.DiscountID = PH.EntryID
left join ParametersHistory PH1 on GTD.DiscountID = PH1.EntryID
group by OrderDetails.OrderID, O.OrderID, OrderDate, GOTD.CUstomerID, O.CustomerID, GTD.CustomerID, PH.ParameterValue, PH1.ParameterValue
GO
