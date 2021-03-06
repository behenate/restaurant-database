USE [u_wdrozdz]
GO
/****** Object:  UserDefinedFunction [dbo].[CheckMenuUpdate]    Script Date: 18.03.2022 12:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[CheckMenuUpdate]()
returns varchar(max)
as begin
    declare @entriesNo float = (Select Count(*) from CURRENT_MENU);
    declare @updatedEntriesNo float = (Select Count(*) from CURRENT_MENU where DATEDIFF(day, TimeFrom, getdate()) < 14);
    declare @result varchar(max) = '';
    if (@updatedEntriesNo/@entriesNo > 0.5)
        BEGIN
            set @result =  'Menu Nie Wymaga Aktualizacji';
        END
    else
        BEGIN
            set @result = 'Przynajmniej ' +CONVERT(varchar, ROUND(@entriesNo*(0.5) - @updatedEntriesNo, 0)) + ' pozycji/e wymaga aktualizacji';
        END
    return @result;
end
GO
