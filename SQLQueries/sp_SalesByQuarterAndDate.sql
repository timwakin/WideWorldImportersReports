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
-- Create date: 4/8/2025
-- Description:	Gets sales and product information
-- From the Sales.Orders,Sales.OrderLines,Warehous.StockItems,
-- Sales.Invoices, and Sales.CustomerTransactions tables.  Receives
-- Three parameters: StartDate, EndDate, and ProductName that are 
-- optional.  ProductName can be partial to use in a fuzzy search.
-- =============================================
CREATE PROCEDURE sp_SalesByQuarterAndDate(@StartDate Date = NULL, @EndDate Date = NULL, @ItemName NVarchar(255) = NULL)
AS
BEGIN
SELECT SO.OrderDate
, CASE
	WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 'Quarter 1'
	WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 'Quarter 2'
	WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 'Quarter 3'
	ELSE 'Quarter 4'
END 'Quarter'
, DATEPART(YEAR,SO.OrderDate) AS 'Order Year'
, SO.OrderID
, SOL.Quantity
, WSI.StockItemID
, WSI.StockItemName
, SCT.TransactionAmount
FROM SALES.Orders AS SO
INNER JOIN Sales.OrderLines AS SOL
ON SO.OrderID = SOL.OrderID
INNER JOIN Warehouse.StockItems AS WSI
ON SOL.StockItemID = WSI.StockItemID
INNER JOIN Sales.Invoices AS SI
ON SO.OrderID = SI.OrderID
INNER JOIN Sales.CustomerTransactions AS SCT
ON SCT.InvoiceID = SI.InvoiceID
WHERE SO.OrderDate BETWEEN COALESCE(@StartDate,SO.OrderDate) AND COALESCE(@EndDate,SO.OrderDate)
AND WSI.StockItemName LIKE '%' + COALESCE(@ItemName,WSI.StockItemName) + '%' 
GROUP BY SO.OrderID, SO.OrderDate, SOL.Quantity,SCT.TransactionAmount, WSI.StockItemID, WSI.StockItemName



END
GO
