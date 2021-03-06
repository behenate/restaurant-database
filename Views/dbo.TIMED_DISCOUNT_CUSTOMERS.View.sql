USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[TIMED_DISCOUNT_CUSTOMERS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TIMED_DISCOUNT_CUSTOMERS] as
select CustomerID, DiscountID, ActiveFrom, ActiveTo, Name, ParameterValue, Unit
from GrantedTimedDiscounts GTD
         inner join (
             select CompanyCustomerID as ID, CompanyName as Name from CompanyCustomers
             union
             select PrivateCustomerID as ID, Fristname+' '+Lastname as Name from PrivateCustomers
    ) as C on GTD.CustomerID = C.ID
         inner join ParametersHistory PH on GTD.DiscountID = PH.EntryID
         inner join DiscountsParameters DP on PH.ParameterID = DP.ParameterID
where ActiveFrom <= getdate()
  and ActiveTo >= getdate()
GO
