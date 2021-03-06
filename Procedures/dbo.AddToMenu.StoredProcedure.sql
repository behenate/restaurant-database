USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddToMenu]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddToMenu] @productID int, @price money, @timeFrom date, @timeTo date = null
as
begin
    begin try
        if @timeFrom is null
            set @timeFrom = getdate()
        insert into PriceHistory values (@productID, @price, @timeFrom, @timeTo)
    end try
    begin catch
        DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać produktu do menu: ' + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
end
GO
