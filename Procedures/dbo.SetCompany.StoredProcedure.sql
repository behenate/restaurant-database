USE [u_wdrozdz]
GO
/****** Object:  StoredProcedure [dbo].[SetCompany]    Script Date: 18.03.2022 12:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SetCompany] @companyid int, @privatecustomerid int
as
begin
  begin try
      update PrivateCustomers set CompanyID = @companyid where PrivateCustomerID=@privatecustomerid
   end try
  begin catch
      DECLARE @message NVARCHAR(1000) = N'Nie udało się przypisać firmy do klienta: ' + ERROR_MESSAGE();
      THROW 52000, @message, 1;
  end catch
end
GO
