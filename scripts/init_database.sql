/*
========================================================================
Create Database and Schemas
========================================================================

Script Purpose :
  This script creates a new database called 'DataWarehouse' after checking if it already exsists.
  If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
  within the database : "Bronze" , "Silver" and "Gold".

WARNING:
  Running this script will drop the entire "DataWarehouse" database if it exists.
  All the data in the database will be permanently deleted. Proceed with caution 
  and ensure you have proper backups before running this script.
*/

-- 1. Create Database 'Datawarehouse'

USE master; -- Switches to the master database
GO

--Drop and Recreate the 'Datawarehouse' Database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'Datawarehouse' Database
CREATE DATABASE DataWarehouse; -- Creates a new database
GO

USE DataWarehouse;
GO

-- Creating Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
