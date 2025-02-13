/*
File Name: azure_blob_stirage_access.sql

Purpose:
This script sets up the necessary components to enable secure access to Azure Blob Storage
from within SQL Server. It creates a master key, a database scoped credential, and an
external data source, which are prerequisites for performing operations like BULK INSERT
from Azure Blob Storage.

Components:
1. Master Key: Encrypts the credential's secret at the database level.
2. Database Scoped Credential: Stores the Shared Access Signature (SAS) for Azure Blob Storage access.
3. External Data Source: Defines the connection to the Azure Blob Storage container.

Usage:
Execute this script once to set up the Azure Blob Storage access. After execution, these
objects will be available for use in other scripts or stored procedures that need to
interact with the specified Azure Blob Storage container.

Security Note:
- The master key password and SAS token in this script should be replaced with secure values.
- In a production environment, consider using Azure Key Vault to manage these secrets.

Maintenance:
- The SAS token has an expiration date. Update the credential before the token expires.
- If the Azure Blob Storage location changes, update the external data source accordingly.
*/

-- Create a Master Key 
-- Which is required to create database scoped credentials since the blob storage 
-- is not configured to allow public (anonymous) access. 
CREATE MASTER KEY
ENCRYPTION BY PASSWORD= 'MasterKeyPsw*'
GO

-- Create a database scope credentials - SAS
CREATE DATABASE SCOPED CREDENTIAL = [https://emissiondata.blob.core.windows.net/data/]
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'sp=r&st=2025-02-12T21:48:40Z&se=2025-02-20T05:48:40Z&sv=2022-11-02&sr=c&sig=GMdLGZ2oqt6HjbExDxbdnv1EgZF5gzBvCW5W04DK3Nc%3D';
GO

-- Create an external data source 
CREATE EXTERNAL DATA SOURCE data
WITH 
(
    TYPE = BLOB_STORAGE,
    LOCATION = 'https://emissiondata.blob.core.windows.net/data',
    CREDENTIAL = [https://emissiondata.blob.core.windows.net/data/]
); 
GO