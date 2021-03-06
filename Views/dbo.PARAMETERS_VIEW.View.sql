USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[PARAMETERS_VIEW]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PARAMETERS_VIEW]
AS
SELECT EntryID, ParametersHistory.ParameterID, ParameterValue, ParameterName from ParametersHistory
INNER JOIN DiscountsParameters DP on DP.ParameterID = ParametersHistory.ParameterID
where ValidTo IS NULL or ValidTo > getdate()
GO
