USE [u_wdrozdz]
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrderCount]    Script Date: 18.03.2022 12:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetOrderCount](
@customerID int
) RETURNS int as
    Begin
        declare @res int = (Select count( Distinct OrderID) from ORDERS_WORKHORSE where CustomerID=@customerID);
        return @res;
    end
GO
