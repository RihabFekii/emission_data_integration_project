/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

IF OBJECT_ID ('silver.emission_factors_11' , 'U') IS NOT NULL
    DROP TABLE silver.emission_factors_11;

CREATE TABLE silver.emission_factors_11 (
    activity_name NVARCHAR(200),
    sector NVARCHAR(50),
    category NVARCHAR(50),
    unit NVARCHAR(50),
    kg_co2e NUMERIC, 
    kg_co2 DECIMAL,
    kg_ch4 DECIMAL,
    kg_n2o FLOAT,
    assesment_report NVARCHAR(50),
    scope INTEGER,
    life_cylce_assesment NVARCHAR(200),
    validity_year INTEGER,
    validity_region NVARCHAR(50)
); 

IF OBJECT_ID ('silver.emission_factors_21' , 'U') IS NOT NULL
    DROP TABLE silver.emission_factors_21;

CREATE TABLE silver.emission_factors_21 (
    activity_name NVARCHAR(200),
    sector NVARCHAR(50),
    category NVARCHAR(50),
    unit NVARCHAR(50),
    kg_co2e DECIMAL, 
    kg_co2 DECIMAL,
    kg_ch4 DECIMAL,
    kg_n2o FLOAT,
    assesment_report NVARCHAR(50),
    scope INTEGER,
    life_cylce_assesment NVARCHAR(200),
    validity_year INTEGER,
    validity_region NVARCHAR(50)
); 

IF OBJECT_ID ('silver.emission_factors_31' , 'U') IS NOT NULL
    DROP TABLE silver.emission_factors_31;

CREATE TABLE silver.emission_factors_31 (
    activity_name NVARCHAR(200),
    sector NVARCHAR(50),
    category NVARCHAR(50),
    unit NVARCHAR(50),
    kg_co2e DECIMAL, 
    kg_co2 DECIMAL,
    kg_ch4 DECIMAL,
    kg_n2o FLOAT,
    assesment_report NVARCHAR(50),
    scope INTEGER,
    life_cylce_assesment NVARCHAR(200),
    validity_year INTEGER,
    validity_region NVARCHAR(50)
);