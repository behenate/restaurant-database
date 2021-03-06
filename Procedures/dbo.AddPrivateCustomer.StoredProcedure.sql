USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[AddPrivateCustomer]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPrivateCustomer]
@firstname nvarchar(50),
@lastname nvarchar(50),
@phone varchar(15),
@city int,
@companyId int
as
BEGIN
    DECLARE @customerID int;
    SET NOCOUNT ON;
    Begin TRY
        Insert Into Customers(City, Phone) values (@city, @phone)
        SET @customerID = @@IDENTITY
        Insert INTO PrivateCustomers(PrivateCustomerID, CompanyID, Fristname, Lastname)
        values(
               @customerID,
               @companyId,
               @firstname,
               @lastname
              );
    end TRY
    BEGIN CATCH
        DECLARE @message NVARCHAR(1000) = N'Nie udało dodać się klienta prywatnego: ' + char(13) + char(10) + ERROR_MESSAGE();
        THROW 52000, @message, 1;
end catch

end
GO
