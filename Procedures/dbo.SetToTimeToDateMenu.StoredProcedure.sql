USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[SetToTimeToDateMenu]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SetToTimeToDateMenu] @entryID int, @dateOfRemoval date
as
begin try
    update PriceHistory set TimeTo = @dateOfRemoval where EntryID = @entryID
end try
begin catch
    DECLARE @message NVARCHAR(1000) = N'Nie udało się ustawić terminu dotępości produktu: ' + ERROR_MESSAGE();
        THROW 52000, @message, 1;
end catch
GO
