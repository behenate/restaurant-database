USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddParameter]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddParameter] @parametername nvarchar(50),
                            @unit nchar(10)
as
begin
  begin try
       insert into DiscountsParameters(ParameterName, Unit) values (@parametername, @unit)
   end try
  begin catch
      DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać parametru: ' + ERROR_MESSAGE();
      THROW 52000, @message, 1;
  end catch
end
GO
