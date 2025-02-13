/*
===============================================================================
Stored Procedure: Load Gold Layer (Silver -> Gold)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    merge emission factor data from multiple tables in the 'silver' schema into 
    a single table in the 'gold' schema.

Actions Performed:
    - Truncates the Gold 'emission_factors' table to ensure a clean merge.
    - Combines data from three Silver tables (emission_factors_11, 
      emission_factors_21, emission_factors_31) into the Gold 'emission_factors' 
      table using UNION ALL.

Parameters:
    None. 
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC gold.merge_emission_factors;

Note:
    - Ensure that all three source tables in the Silver layer have identical 
      structures before executing this procedure.
    - This procedure uses UNION ALL, which preserves all rows including 
      potential duplicates.
===============================================================================
*/



-- Create the procedure to merge the tables
CREATE PROCEDURE gold.merge_emission_factors AS
BEGIN
    -- Truncate the target table to ensure a clean merge
    TRUNCATE TABLE gold.emission_factors;

    -- Insert data from all three silver layer tables
    INSERT INTO gold.emission_factors
    SELECT * FROM silver.emission_factors_11
    UNION ALL
    SELECT * FROM silver.emission_factors_21
    UNION ALL
    SELECT * FROM silver.emission_factors_31;
END;

