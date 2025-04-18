USE [WideWorldImporters]
GO
/****** Object:  StoredProcedure [dbo].[sp_SupplierCategoryName]    Script Date: 4/8/2025 12:13:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Akin	
-- Create date: 4/8/2025
-- Description:	Returns SupplierCategoryID and SupplierCategoryName
-- from Purchasing.SupplierCategories. 
-- =============================================
ALTER PROCEDURE [dbo].[sp_SupplierCategoryName]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT SupplierCategoryID
	 , SupplierCategoryName
FROM Purchasing.SupplierCategories
ORDER BY SupplierCategoryID 
END
