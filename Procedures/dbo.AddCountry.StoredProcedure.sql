USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddCountry]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCountry] @countryName varchar(50)
as
BEGIN
    begin try
        insert into Countries values (@countryName)
    end try
    begin catch
        declare @message nvarchar(1000) = N'Nie udało się dodać kraju: ' + ERROR_MESSAGE();
        throw 52000, @message, 1;
    end catch
end
GO
