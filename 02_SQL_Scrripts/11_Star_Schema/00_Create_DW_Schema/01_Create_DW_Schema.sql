USE Chocolate_Manufacturing_DW;
GO

-- Create Data Warehouse Schema
IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'dw'
)
BEGIN
    EXEC('CREATE SCHEMA dw');
END
GO

PRINT 'DW Schema Created Successfully';