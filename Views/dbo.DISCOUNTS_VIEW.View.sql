USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[DISCOUNTS_VIEW]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DISCOUNTS_VIEW]
AS
SELECT C.CustomerID, PH.EntryID, PH.ParameterValue as 'Discount Percentage', ActiveFrom, ActiveTo, 'Timed' as Type from Customers C
left join GrantedTimedDiscounts GTD on C.CustomerID = GTD.CustomerID
left join ParametersHistory PH on GTD.DiscountID = PH.EntryID
UNION
SELECT C.CustomerID, PH.EntryID, PH.ParameterValue as 'Discount Percentage', ActiveFrom, Null, 'Lifetime' as Type from Customers C
left join GrantedOneTimeDiscounts GOTD on C.CustomerID = GOTD.CustomerID
left join ParametersHistory PH on GOTD.DiscountID = PH.EntryID
GO
