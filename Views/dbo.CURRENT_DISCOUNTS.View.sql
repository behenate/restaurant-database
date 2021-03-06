USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[CURRENT_DISCOUNTS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CURRENT_DISCOUNTS]
AS
SELECT PH.EntryID, C.CustomerID, PH.ParameterValue as 'Discount Percentage', ActiveFrom, ActiveTo from Customers C
inner join GrantedTimedDiscounts GTD on C.CustomerID = GTD.CustomerID
inner join ParametersHistory PH on GTD.DiscountID = PH.EntryID
where ActiveTo IS Null or ActiveTo > getdate()
UNION
SELECT PH.EntryID, C.CustomerID, PH.ParameterValue as 'Discount Percentage', ActiveFrom, Null from Customers C
inner join GrantedOneTimeDiscounts GOTD on C.CustomerID = GOTD.CustomerID
inner join ParametersHistory PH on GOTD.DiscountID = PH.EntryID
GO
