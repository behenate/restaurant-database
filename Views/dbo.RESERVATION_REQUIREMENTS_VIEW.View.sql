USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[RESERVATION_REQUIREMENTS_VIEW]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RESERVATION_REQUIREMENTS_VIEW]
AS
SELECT ConstName, ConstValue from ReservationRequirements
GO
