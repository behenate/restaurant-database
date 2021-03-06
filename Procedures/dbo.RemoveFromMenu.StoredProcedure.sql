USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[RemoveFromMenu]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RemoveFromMenu] @entryID int
as
begin try
    update PriceHistory set TimeTo = getdate() where EntryID = @entryID
    if (@@ROWCOUNT = 0)
        throw 52000, N'Niepoprawne EntryID', 1;
end try
begin catch
    DECLARE @message NVARCHAR(1000) = N'Nie udało się ustawić terminu dotępości produktu: ' + ERROR_MESSAGE();
        THROW 52000, @message, 1;
end catch
GO
