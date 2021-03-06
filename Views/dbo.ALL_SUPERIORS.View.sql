USE [u_wdrozdz]
GO
/****** Object:  View [dbo].[ALL_SUPERIORS]    Script Date: 18.03.2022 12:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ALL_SUPERIORS]
as
SELECT m.FirstName + ' ' +  m.LastName as Supervisor, s.FirstName + ' ' + S.LastName Subordinate From Employees m
    INNER JOIN Employees s on m.EmployeeID = s.ReportsTo
GO
