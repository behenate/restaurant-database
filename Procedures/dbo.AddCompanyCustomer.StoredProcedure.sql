USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddCompanyCustomer]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddCompanyCustomer]
@companyName nvarchar(50),
@phone varchar(15),
@city int,
@contactName nvarchar(50),
@homePage nvarchar(50)
as
BEGIN
    DECLARE @customerID int;
    SET NOCOUNT ON;
    Begin TRY
        Insert Into Customers(City, Phone) values (@city, @phone)
        SET @customerID = @@IDENTITY
        Insert INTO CompanyCustomers(companycustomerid, companyname, contactname, homepage)
        values(
               @customerID,
               @companyName,
               @contactName,
               @homePage
              );
    end TRY
    BEGIN CATCH
        DECLARE @message NVARCHAR(1000) = N'Nie udało dodać się klienta firmowego: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message, 1;
end catch

end
GO
