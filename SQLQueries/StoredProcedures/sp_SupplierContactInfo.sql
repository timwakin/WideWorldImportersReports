-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Akin	
-- Create date: 4/8/2023	
-- Description:	Gets supplier contact information from
-- Purchasing.Suppliers
-- =============================================
CREATE PROCEDURE sp_SupplierContactInfo
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  SELECT SupplierCategoryID
, SupplierName
, PhoneNumber
, FaxNumber
FROM Purchasing.Suppliers
END
GO
