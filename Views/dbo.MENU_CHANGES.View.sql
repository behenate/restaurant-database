USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[MENU_CHANGES]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MENU_CHANGES]
AS
SELECT DISTINCT * from MENU_HISTORY
where DATEDIFF(day, TimeFrom, getdate()) <= 14 or (DATEDIFF(day, TimeTo, getdate()) <= 14 and TimeTo IS NOT NULL)
GO
