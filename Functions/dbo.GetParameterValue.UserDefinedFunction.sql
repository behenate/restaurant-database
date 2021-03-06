USE [u_wdrozdz]
GO
/****** Object:  UserDefinedFunction [dbo].[GetParameterValue]    Script Date: 18.03.2022 12:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   function [dbo].[GetParameterValue](@par_name nvarchar(50))
    returns TABLE as
    return (select top 1 ParameterValue
            from ParametersHistory PH
                     inner join DiscountsParameters DP on DP.ParameterID = PH.ParameterID
        where ParameterName = @par_name order by ValidFrom desc)
GO
