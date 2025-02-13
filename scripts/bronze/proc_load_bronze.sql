/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV & Excel files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from CSV & Excel Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

    TRUNCATE TABLE bronze.emission_factors_11;

    BULK INSERT bronze.emission_factors_11
    FROM 'File 1-1.csv'  -- within the container, the location of the file
    WITH(
        DATA_SOURCE = 'data',
        FIRSTROW = 2,
        FIELDTERMINATOR = ';',
        TABLOCK -- Minimize the number of log records for the insert operation
    );

    TRUNCATE TABLE bronze.emission_factors_21;

    BULK INSERT bronze.emission_factors_21
    FROM 'File 2-1.csv'  -- within the container, the location of the file
    WITH(
        DATA_SOURCE = 'data',
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK -- Minimize the number of log records for the insert operation
    );

    TRUNCATE TABLE bronze.emission_factors_31;

    BULK INSERT bronze.emission_factors_31
    FROM 'File 3-1.csv'  -- within the container, the location of the file
    WITH(
        DATA_SOURCE = 'data',
        FIRSTROW = 2,
        FIELDTERMINATOR = ';',
        TABLOCK -- Minimize the number of log records for the insert operation
    );

END