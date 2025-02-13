/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

-- Truncating & Loading emission_factory_11 to the silver layer

TRUNCATE TABLE silver.emission_factors_11;

INSERT INTO silver.emission_factors_11(
    activity_name,
    sector,
    category,
    unit,
    kg_co2e, 
    kg_co2,
    kg_ch4,
    kg_n2o,
    assesment_report,
    scope,
    life_cylce_assesment,
    validity_year,
    validity_region
)
SELECT 
    activity_name_1 AS activity_name,
    LEFT(activity_name_2, CHARINDEX('/', activity_name_2) - 1) AS sector,
    SUBSTRING(activity_name_2, CHARINDEX('/', activity_name_2) + 1, LEN(activity_name_2)) AS category,
    unit,
    emission_kg_co2e AS kg_co2e,
    kg_co2,
    kg_ch4,
    CASE 
        WHEN kg_n2o = 'not-supplied' THEN 0
    END AS kg_n2o, 
    assesment_report,
    scope,
    life_cylce_assesment,
    validity_year,
    validity_region
FROM bronze.emission_factors_11


-- Truncating & Loading emission_factory_21 to the silver layer

TRUNCATE TABLE silver.emission_factors_21;

INSERT INTO silver.emission_factors_11(
    activity_name,
    sector,
    category,
    unit,
    kg_co2e, 
    kg_co2,
    kg_ch4,
    kg_n2o,
    assesment_report,
    scope,
    life_cylce_assesment,
    validity_year,
    validity_region
)
SELECT 
    activity_name,
    sector,
    category,
    unit,
    kg_co2e,
    kg_co2,
    CASE 
        WHEN kg_ch4 is NULL THEN 0
    END AS kg_ch4,
    CASE 
        WHEN kg_n2o is NULL THEN 0
        ELSE kg_n2o
    END AS kg_n2o,
    assesment_report,
    scope,
    life_cylce_assesment,
    validity_year,
    validity_region
FROM bronze.emission_factors_21

-- Truncating & Loading emission_factory_21 to the silver layer

TRUNCATE TABLE silver.emission_factors_31;

INSERT INTO silver.emission_factors_11(
    activity_name,
    sector,
    category,
    unit,
    kg_co2e, 
    kg_co2,
    kg_ch4,
    kg_n2o,
    assesment_report,
    scope,
    life_cylce_assesment,
    validity_year,
    validity_region
)
SELECT 
    activity_name,
    sector,
    category,
    unit,
    kg_co2e,
    kg_co2,
    kg_ch4,
    kg_n2o,
    assesment_report,
    CASE 
        WHEN scope = 'Unknown' THEN 0
        ELSE scope
    END AS scope,
    l_c_a AS life_cylce_assesment,
    year_valid_from AS validity_year,
    region AS validity_region
FROM bronze.emission_factors_31