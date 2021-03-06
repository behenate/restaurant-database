USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[CUSTOMERS_THAT_CAN_MAKE_RESERVATIONS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[CUSTOMERS_THAT_CAN_MAKE_RESERVATIONS] as
select PrivateCustomerID, Fristname, Lastname
from PrivateCustomers PC
    inner join Customers C on PC.PrivateCustomerID = C.CustomerID
    inner join Orders O on C.CustomerID = O.CustomerID
    inner join OrderDetails OD on O.OrderID = OD.OrderID
group by PrivateCustomerID, Fristname, Lastname
having count(Distinct O.OrderID) >= (SELECT ConstValue from ReservationRequirements where ConstName = 'WK')
and sum(Price*OD.Quantity) > (SELECT ConstValue from ReservationRequirements where ConstName = 'WZ')
GO
