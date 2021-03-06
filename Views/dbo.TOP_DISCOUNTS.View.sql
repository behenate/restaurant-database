USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[TOP_DISCOUNTS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TOP_DISCOUNTS]
AS
Select top 10 EntryID as 'Discount ID', [Discount Percentage],  Count(*) as 'GrantedTimes', Type from DISCOUNTS_VIEW
where EntryID is not NULL
group by EntryID, [Discount Percentage], Type
order by 2 desc
GO
