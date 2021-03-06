USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddCategory] @categoryname nvarchar(50)
as
begin
	begin try
        insert into Categories(CategoryName) values (@categoryname)
    end try
	begin catch
    	DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać kategorii: ' + ERROR_MESSAGE();
    	THROW 52000, @message, 1;
	end catch
end
GO
