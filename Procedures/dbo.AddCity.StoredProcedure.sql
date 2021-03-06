USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddCity]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddCity] @cityName nvarchar(100),
                         @countryID int
as
begin
    begin try
        insert into Cities values (@cityName, @countryID)
    end try
    begin catch
        DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać miasta: ' + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
end
GO
