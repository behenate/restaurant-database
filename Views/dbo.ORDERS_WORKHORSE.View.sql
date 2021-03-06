USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ORDERS_WORKHORSE]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ORDERS_WORKHORSE]
as
select O.OrderID,
       P.ProductID,
       ProductName,
       O.CustomerID,
       O.EmployeeID,
       OrderDate,
       Quantity,
       OrderDetails.Price,
       PayLater,
       ISNULL(IIF(PH.ParameterValue < PH1.ParameterValue, PH1.ParameterValue, PH.ParameterValue), 0) as 'DiscountPercentage',
       (1-ISNULL(IIF(PH.ParameterValue < PH1.ParameterValue, PH1.ParameterValue, PH.ParameterValue)*0.01, 0)) * OrderDetails.Price as 'DiscountedPrice',
       IIF(PH.ParameterValue < PH1.ParameterValue, PH1.ParameterID, PH.ParameterID) as 'DiscountID',
       IIF(C.CustomerID in (Select PrivateCustomerID from PrivateCustomers), 'Private', 'Company') as CustomerType
       from OrderDetails
Inner Join Orders O on O.OrderID = OrderDetails.OrderID
inner join Customers C on C.CustomerID = O.CustomerID
inner join PriceHistory PrH on OrderDetails.EntryID = PrH.EntryID
inner join Products P on PrH.ProductID = P.ProductID
left join GrantedOneTimeDiscounts GOTD on C.CustomerID = GOTD.CustomerID
left join GrantedTimedDiscounts GTD on C.CustomerID = GTD.CustomerID and GTD.ActiveTo >= O.OrderDate  and GTD.ActiveFrom <= O.OrderDate
left join ParametersHistory PH on GOTD.DiscountID = PH.EntryID
left join ParametersHistory PH1 on GTD.DiscountID = PH1.EntryID
GO
