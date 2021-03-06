USE [u_wdrozdz]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMaxOrderValue]    Script Date: 18.03.2022 12:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMaxOrderValue](
@customerID int
) RETURNS money as
    Begin
        declare @res money = (Select top 1 SUM(Price*Quantity) from ORDERS_WORKHORSE where CustomerID=@customerID group by OrderID order by 1 desc );
        return @res;
    end
GO
