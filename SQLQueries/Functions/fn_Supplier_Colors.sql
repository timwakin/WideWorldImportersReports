USE [WideWorldImporters]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Supplier_Colors]    Script Date: 4/11/2025 9:09:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Akin
-- Create date: 4/9/2025
-- Description:	Returns suppliers that have 
-- color options from tables: 
--		Purchasing.Suppliers
--		Warehouse.StockItems
--		Warehouse.Colors
-- Created for use in reports to limit select 
-- of Suppliers and available color options to 
-- those that have colors (Insurance Proividers,
-- for example don't have color options, so shouldn't
-- be included in the available parameter list. 
-- =============================================
CREATE FUNCTION [dbo].[fn_Supplier_Colors]()

RETURNS TABLE 

AS
RETURN 

	SELECT 
		S.SupplierID,
		S.SupplierName,
		WSI.ColorID,
		WC.ColorName
	FROM Purchasing.Suppliers S  
	INNER JOIN Warehouse.StockItems WSI on S.SupplierID = WSI.SupplierID
	INNER JOIN Warehouse.Colors WC on WSI.ColorID = WC.ColorID

