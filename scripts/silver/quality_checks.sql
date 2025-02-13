SELECT * from bronze.emission_factors_11; 

SELECT * from bronze.emission_factors_21; 

SELECT * from bronze.emission_factors_31; 

-- Table 11

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
FROM bronze.emission_factors_11;

-- Table 21 


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

-- Table 31

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
