USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ALL_EMPLOYEES]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ALL_EMPLOYEES]
as
select Firstname, Lastname, Role, (
    select Firstname + ' ' + Lastname from Employees E2 where E1.ReportsTo = E2.EmployeeID
    ) as ReportsTo from Employees E1
GO
