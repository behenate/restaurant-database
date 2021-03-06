USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddProduct] @description nvarchar(1000) = null,
                            @price money,
                            @categoryID int,
                            @productName nvarchar(100)
as
begin
    begin try
        insert into Products values (@description, @price, @categoryID, @productName)
    end try
    begin catch
        DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać produktu: ' + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
end
GO
