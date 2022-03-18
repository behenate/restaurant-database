USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddTable]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddTable] @seatsno int
as
begin
	begin try
        insert into Tables(SeatsNo) values (@seatsno)
    end try
	begin catch
    	DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać nowego stolika: ' + ERROR_MESSAGE();
    	THROW 52000, @message, 1;
	end catch
end
GO
