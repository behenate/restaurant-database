USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddEmployee] @firstName nvarchar(50),
                             @lastname varchar(50),
                             @role varchar(50),
                             @roleDescription text = null,
                             @reportsTo int = null,
                             @birthDate date
as
begin
    begin try
        insert into Employees values (@firstName, @lastname, @role, @roleDescription, @reportsTo, @birthDate)
    end try
    begin catch
        DECLARE @message NVARCHAR(1000) = N'Nie udało się dodać pracownika: ' + ERROR_MESSAGE();
        THROW 52000, @message, 1;
    end catch
end
GO
