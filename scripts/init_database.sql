/*
===================================================
Create Database and Schemas
===================================================
Script Purpose: 
    This script creates a new database names 'EmissionDataWarehouse' after checking if it already exists. 
    IF the database exists, it is dropped and recreated. 
    Additionaly, the script sets up three schemas within the database: 'bronze', 'silver' and 'gold'. 

WARNING: 
    Running this script will drop the entire 'EmissionDataWarehouse' database if it exists. 
    All data in this database will be premanently deleted. Proceed with caution
    and ensure you have a proper backup before running this script. 
*/ 

USE master; 
GO 

-- Drop and create the 'EmissionDataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'EmissionDataWarehouse')
BEGIN 
    ALTER DATABASE EmissionDataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 
    DROP DATABASE EmissionDataWarehouse; 
END; 
GO

-- Create Database 'DataWarehouse'
CREATE DATABASE EmissionDataWarehouse; 
GO 

USE EmissionDataWarehouse; 
GO 

-- Create Schemas
CREATE SCHEMA bronze; 
GO

CREATE SCHEMA silver; 
GO

CREATE SCHEMA gold; 
GO