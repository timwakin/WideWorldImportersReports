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
-- Description:	Returns Delivery information to be used in 
-- a map report from Sales.Customers and Sales.CustomerTransactions
-- =============================================
CREATE PROCEDURE sp_MapReport
	
AS
BEGIN
SELECT SCT.CustomerID
, SC.DeliveryPostalCode
, SC.DeliveryLocation
, SCT.CustomerTransactionID
, SCT.TransactionAmount
FROM Sales.Customers AS SC
INNER JOIN Sales.CustomerTransactions AS SCT
ON SC.CustomerID = SCT.CustomerID
ORDER BY SCT.CustomerTransactionID
OFFSET 0 ROWS
FETCH FIRST 500 ROWS ONLY
END
GO
