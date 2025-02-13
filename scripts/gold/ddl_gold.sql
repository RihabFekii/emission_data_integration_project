/*
===============================================================================
DDL Script: Create Gold Table
===============================================================================
Script Purpose:
    This script creates a Table for the Gold layer in the data warehouse. 
    The Gold layer represents a Flat Table

    This table combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - This table can be queried directly for analytics and reporting or AI.
===============================================================================
*/


IF OBJECT_ID ('gold.emission_factors' , 'U') IS NOT NULL
    DROP TABLE gold.emission_factors;

-- Create the merged table in the gold layer
CREATE TABLE gold.emission_factors (
    activity_name VARCHAR(200),
    sector VARCHAR(50),
    category VARCHAR(50),
    unit VARCHAR(50),
    kg_co2e FLOAT,
    kg_co2 FLOAT,
    kg_ch4 FLOAT,
    kg_n2o FLOAT,
    assesment_report VARCHAR(50),
    scope INT,
    life_cylce_assesment VARCHAR(100),
    validity_year INT,
    validity_region VARCHAR(50)
);