/*
====================================================================================
Quality Checks - Silver Layer
====================================================================================
  Script Purpose:
      This Script performs various quality checks for data consistency , accuracy
      and standardization across the 'Silver' Schemas. 

  It Includes checks for :
      --> Null or Duplicate Primary Keys
      --> Unwanted spaces in string fields
      --> Data standardization and consistency
      --> Invalid date ranges and orders
      --> Data Consistency between related fields

  Usage Notes :
      --> Run these checks after data loading silver layer.
      --> Investigate and resolve any discrepencies found during the checks.

====================================================================================
*/

-- ==============================================================
-- Checking 'silver.crm_cust_info'
-- ==============================================================

-- 1. Check for Null / Duplicates in Primary Key

SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info

-- Checks and Groups only the values that are having more than 1 Count
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--------------------------------------------------------------------------

-- 2. Check for Unwanted Spaces

SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

--------------------------------------------------------------------------

-- 3. Data Standardization & Consistency

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info

--------------------------------------------------------------------------

-- ==============================================================
-- Checking 'silver.crm_prd_info'
-- ==============================================================

-- 1. Checking Duplicates or Nulls in Primary Key

SELECT
	prd_id,
COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

--------------------------------------------------------------------------
-- 2. Splitting a String into 2 Different Columns

SELECT prd_id,
      prd_key,
	  REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') AS cat_key,
	  SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,
      prd_nm,
      prd_cost,
      prd_line,
      prd_start_dt,
      prd_end_dt
  FROM bronze.crm_prd_info

--------------------------------------------------------------------------
-- 3. Check for Unwanted Spaces

SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

--------------------------------------------------------------------------
-- 4. Check the quality of numerical values --> Check for Negatives or NULL values

SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

SELECT prd_cost,
	ISNULL(prd_cost, 0)
FROM bronze.crm_prd_info

--------------------------------------------------------------------------
-- 5. Check the Cardinality & Standardize the abbreviated Values

SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

SELECT prd_line,
CASE WHEN UPPER(TRIM(prd_line)) = 'M' THEN 'Mountain'
	WHEN UPPER(TRIM(prd_line)) = 'R' THEN 'Road'
	WHEN UPPER(TRIM(prd_line)) = 'S' THEN 'Other Sales'
	WHEN UPPER(TRIM(prd_line)) = 'T' THEN 'Touring'
	ELSE 'N/A'
END AS prd_line2
FROM bronze.crm_prd_info

--------------------------------------------------------------------------
-- 6. Check for Date & Timing consistency

SELECT *
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt

SELECT prd_id,
      prd_key,
      prd_nm,
      prd_cost,
      prd_line,
      prd_start_dt,
	  LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS prd_end_dt
  FROM bronze.crm_prd_info

--------------------------------------------------------------------------

-- ==============================================================
-- Checking 'silver.crm_sales_details'
-- ==============================================================

-- 1. Check for Invalid Dates

SELECT 
NULLIF(sls_due_dt,0) sls_due_dt
FROM silver.crm_sales_details
WHERE sls_due_dt <= 0 
OR LEN(sls_due_dt) != 8
OR sls_due_dt > 20250101 
OR sls_due_dt < 19990101

--------------------------------------------------------------------------

-- 2. Checking for Invalid Date Orders (Order Date > Shipping/Due Dates)

SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
OR sls_order_dt > sls_due_dt

--------------------------------------------------------------------------

-- 3. Check Data Consistency : (Sales = Quantity * Price)

SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price

FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price --> checking whether Sales = Quantity * Price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL --> Checking whether the 3 cols have Null values
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0 --> Checking any negative values
ORDER BY sls_sales, sls_quantity , sls_price

--------------------------------------------------------------------------

-- ==============================================================
-- Checking 'silver.erp_cust_az12'
-- ==============================================================

-- 1. Identifying the Out-of-range dates

SELECT DISTINCT 
bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

--------------------------------------------------------------------------

-- 2. Checking the Data standardization & consistency :

SELECT DISTINCT gen
FROM bronze.erp_cust_az12

--------------------------------------------------------------------------

-- ==============================================================
-- Checking 'silver.erp_loc_a101'
-- ==============================================================

-- 1. Data Standardization & Consistency

SELECT DISTINCT
    cntry
FROM silver.erp_loc_a101
ORDER by cntry;

--------------------------------------------------------------------------

-- ==============================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ==============================================================

-- 1. Check for unwanted spaces

SELECT 
    *
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat)
    OR subcat != TRIM(subcat)
    OR maintainence != TRIM(maintenance);

-- 2. Data Standardization & Consistency

SELECT DISTINCT
    mainenance
FROM silver.erp_px_cat_g1v2

--------------------------------------------------------------------------
