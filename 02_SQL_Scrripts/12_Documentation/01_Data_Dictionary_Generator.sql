USE Chocolate_Manufacturing_DW;
GO

/*
==========================================================
Chocolate Manufacturing Data Warehouse
Data Dictionary Generator
Author : Alaa Hamed
==========================================================
*/

SELECT
    t.name AS Table_Name,

    c.column_id AS Column_Order,

    c.name AS Column_Name,

    ty.name AS Data_Type,

    CASE
        WHEN ty.name IN
        (
            'varchar','nvarchar',
            'char','nchar'
        )
        THEN c.max_length

        WHEN ty.name IN
        (
            'decimal','numeric'
        )
        THEN c.precision

        ELSE NULL
    END AS Length_or_Precision,

    c.scale,

    CASE
        WHEN c.is_nullable = 1
        THEN 'YES'
        ELSE 'NO'
    END AS Nullable,

    CASE
        WHEN pk.column_id IS NOT NULL
        THEN 'YES'
        ELSE 'NO'
    END AS Primary_Key,

    CASE
        WHEN fk.parent_column_id IS NOT NULL
        THEN 'YES'
        ELSE 'NO'
    END AS Foreign_Key

FROM sys.tables t

INNER JOIN sys.columns c
ON t.object_id = c.object_id

INNER JOIN sys.types ty
ON c.user_type_id = ty.user_type_id

LEFT JOIN
(
    SELECT
        ic.object_id,
        ic.column_id
    FROM sys.indexes i
    INNER JOIN sys.index_columns ic
        ON i.object_id = ic.object_id
       AND i.index_id = ic.index_id
    WHERE i.is_primary_key = 1
) pk
ON c.object_id = pk.object_id
AND c.column_id = pk.column_id

LEFT JOIN sys.foreign_key_columns fk
ON c.object_id = fk.parent_object_id
AND c.column_id = fk.parent_column_id

WHERE SCHEMA_NAME(t.schema_id) = 'dw'

ORDER BY
t.name,
c.column_id;
GO