/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID ('bronze.emission_factors_11' , 'U') IS NOT NULL
    DROP TABLE bronze.emission_factors_11;

CREATE TABLE bronze.emission_factors_11 (
    activity_name_1 NVARCHAR(200),
    activity_name_2 NVARCHAR(200),
    unit NVARCHAR(50),
    emission_kg_co2e NUMERIC, 
    kg_co2 DECIMAL,
    kg_ch4 DECIMAL,
    kg_n2o NVARCHAR(50),
    assesment_report NVARCHAR(50),
    scope INTEGER,
    life_cylce_assesment NVARCHAR(200),
    validity_year INTEGER,
    validity_region NVARCHAR(50)
); 

IF OBJECT_ID ('bronze.emission_factors_21' , 'U') IS NOT NULL
    DROP TABLE bronze.emission_factors_21;

CREATE TABLE bronze.emission_factors_21 (
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

IF OBJECT_ID ('bronze.emission_factors_31' , 'U') IS NOT NULL
    DROP TABLE bronze.emission_factors_31;

CREATE TABLE bronze.emission_factors_31 (
    ActivityName NVARCHAR(255),
    Unit NVARCHAR(50),
    kgCO2e DECIMAL(18, 12),
    kgCO2 DECIMAL(18, 14),
    kgCH4 DECIMAL(18, 14),
    kgN2O DECIMAL(18, 18),
    AssessmentReport NVARCHAR(50),
    Scope NVARCHAR(50),
    LCA NVARCHAR(255),
    Sector NVARCHAR(255),
    Category NVARCHAR(255),
    YearValidFrom INT,
    Region NVARCHAR(50)
);