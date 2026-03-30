Almost 90% of any data analytical process is mostly building an ETL Component 
- ==ETL is the core element of Data warehouse==

**ETL = Extract → Transform → Load**

Think of ETL as a **data pipeline** that takes raw data from different places, cleans it, and puts it in one place where analysts can actually use it.

> **Goal of ETL:**  
> Turn _messy, scattered data_ into _clean, structured, analysis-ready data_.

**ETL is a process of extracting data from multiple sources, transforming it into a clean and consistent format, and loading it into a data warehouse for analysis and reporting.

- Let's say there is a raw data of a collage which has many tables a student table , staff table , marks table , staff performance table , staff salary table , etc . This is the ==SOURCE== 
- Let's say we want to build a ==TARGET== Analysis Dashboard for only the Staff data and their performance respective to salary
- Here , we identify that from all these raw data we don't need the student tables as it is irrelevant to the targeted output . So we ==**Fetch/Extract**== only the Tables or data we need . This is the ==**EXTRACT**== step.
- After we have extracted the required data , we need to check for inconsistency . such as 
	- Duplicates
	- Different data formats 
	- NULL Values
	- Incorrect Values , Etc
	Now we will be rectifying these by certain changes or ==**Transformation**== . This is the ==**TRANSFORM**== step.
- Then After we Transformed the data as per our liking we will ==**load**== the New data in a required file format or Database. This is the ==**LOAD**== step.
- After this we will import this Newly obtained Loaded Data into a analytical / Visualization Tool to generate reports and present to the customer or client.

![[Pasted image 20260205095825.png]]

**NOTE:**
	In Actual Corporate environment the ETL process might vary according to the Data architecture setted up in the organization.
	For Eg: The Architecture might have several layers and in each layer we will only what we need from one layer to another.
	![[Pasted image 20260205100707.png]]
	

---
## Data Architecture

Data Sources
   ↓
ETL Pipeline
   ↓
Data Warehouse
   ↓
Power BI / Tableau / SQL Analysis

-----------------------------------------------
## Step 1: Extract (Getting the data)

**Extract = Collecting data from different sources**
### Common data sources:

- Databases (MySQL, PostgreSQL)
- Excel / CSV files
- APIs (Google Ads, payment gateways)
- Cloud apps (Salesforce, Shopify)
### Example:

A company has:
- **Sales data** in MySQL
- **Customer data** in Excel
- **Website traffic** from Google Analytics API
---
## Step 2: Transform (The MOST IMPORTANT part)

**Transform = Cleaning, modifying, and structuring data**

This is where **90% of real work happens** 
### Common transformations:

- Remove duplicates
- Handle null values
- Change data types
- Rename columns
- Join tables
- Create new calculated columns
### Simple Example

#### Raw Sales Data (Extracted)

|order_id|order_date|revenue|
|---|---|---|
|101|2024-1-5|"500"|
|102|05/01/24|NULL|
|103|2024-01-06|700|

### Transformations applied:

- Standardize date format
- Convert revenue to number
- Replace NULL revenue with 0
- Rename columns
#### Transformed Data

|order_id|order_date|revenue|
|---|---|---|
|101|2024-01-05|500|
|102|2024-01-05|0|
|103|2024-01-06|700|

---
## Step 3: Load (Store for analysis)

**Load = Putting transformed data into a final system**
### Where do we load data?

- Data Warehouse (BigQuery, Snowflake, Redshift)
- Data Mart
- Analytics Database
### Why?

Because:
- BI tools (Power BI, Tableau) need clean data
- Analysts don’t query raw systems
- Performance is much better

---
## DIFFERENT TECHNIQUES / METHODS IN ETL 

![[Pasted image 20260205115250.png]]

### 1. EXTRACTION
#### ->Extraction Methods:

- **Pull Extraction** --> Pulling the Data from the Source Systems
- **Push Extraction** --> Pushing the Data from the Source System to Data Warehouse

#### ->Extraction Types:

- **Full Extraction** --> We will be Extracting the entire data from the source system
- **Incremental Extraction** --> Every day we will be extracting only the new data and will be adding into the data warehouse where already previous data is present.

#### ->Extraction Techniques:

- **Manual Data Extraction** --> Data is collected manually by downloading files or copying data from systems.  Used when data volume is small or automation is not available.

- **Database Querying** --> Data is extracted by running SQL queries on databases.  Common for pulling structured data from production or reporting databases.

- **File Parsing** --> Data is extracted by reading files like CSV, Excel, JSON, or XML.  The file structure is interpreted to convert data into usable tables.

- **API Calls** -->Data is fetched from applications using APIs (Application Programming Interfaces). Mostly used for SaaS tools like Google Analytics, Salesforce, or payment systems.

- **Event Based Streaming** --> Data is captured in real time as events occur in a system.  Used for live data like clicks, transactions, or IoT events.

- **CDC(Change Data Capture)** -->Only the changes (inserts, updates, deletes) in a database are extracted.  Helps reduce load and keeps data in sync in near real time.

- **Web Scraping** -->Data is extracted directly from websites by reading HTML content.  Used when no API or database access is available.

## 2. TRANSFORMATION

#### ->Data Cleaning

- **Remove Duplicates** --> Identifies and deletes repeated records in the dataset. Ensures each entity or transaction appears only once.

- **Data Filtering** --> Removes unnecessary or irrelevant rows based on conditions. Helps focus analysis on valid and useful data only.

- **Handling Missing Data** --> Deals with null or blank values by filling, removing, or flagging them. Prevents errors and inaccurate analysis results.

- **Handling Invalid Values** --> Detects values that do not follow business rules or data ranges. These values are corrected, replaced, or removed.

- **Handling Unwanted Spaces** --> Removes extra spaces before, after, or between text values. Ensures consistent formatting and accurate comparisons.

- **Data Type Casting** --> Converts columns to the correct data type (e.g., text to number or date). Required for proper calculations and filtering.

- **Outlier Detection** --> Identifies data points that are significantly different from others. Helps reduce skewed analysis caused by extreme values.

#### ->Data Enrichment
- Adds additional information to existing data from internal or external sources.  
- Used when you want more context, like adding customer location or demographics.
#### ->Data Integration
- Combines data from multiple sources into a single unified dataset.  
- Used when analysis requires data from different systems together.
#### ->Derived Columns
- Creates new columns using calculations or logic from existing data.  
- Used to generate metrics like profit, age, or status flags.
#### ->Data Normalization & Standardization
- Normalizes removes redundancy, and standardization makes data formats consistent.  
- Used to improve data quality and ensure uniform reporting.
#### ->Business Rules & Logic
- Applies company-specific or client specific rules to classify or transform data.  
- Used to align data with how the business actually operates or a client wants.
#### ->Data Aggregations
- Summarizes detailed data into totals or averages.  
- Used for dashboards, reports, and performance tracking.

## 3. LOAD

#### ->Processing Types

- **Batch Processing** --> Loads data in large chunks/Batches at scheduled intervals like hourly or daily. Used when real-time updates are not required, such as daily reports or billing data.
- **Stream Processing** --> Loads data continuously in real time as events occur through all the layers of the data warehouse. Used when immediate insights are needed, like fraud detection or live dashboards.

#### ->Load Methods

- **Full Load**: --> Loads the entire dataset every time, replacing existing data completely. Used when data size is small or when a full refresh is required.
	1. **Truncate & Insert :** Deletes all existing records/data and inserts fresh data. Used when source data is fully reliable and needs complete replacement.
	2. **Upsert :** Updates existing records and inserts new ones. Used when full data is available but changes must be preserved accurately.
	3. **Drop, Create, Insert :** - Drops the table, recreates it, and then inserts data. Used when schema changes or a clean rebuild is required.

- **Incremental Load**: --> Loads only new or changed data since the last run. Used to improve performance and reduce processing time.
	1. **Upsert :** Updates changed records and inserts new ones. Used when both updates and new data exist.
	2. **Append :** Inserts only new records without updating existing ones. Used when historical data never changes.
	3. **Merge :** Compares source and target data to insert, update, or delete records. Used for complex synchronization between systems.

#### ->Slowly Changing Dimensions (SCD)

SCD defines how changes in dimension data are handled over time in a data warehouse.  
Used preventively to manage historical vs current data correctly.

There are 6 SCD Types :
- **SCD 0** → No changes allowed
- **SCD 1** → Overwrite old data
- **SCD 2** → Maintain full history
- **SCD 3** → Store limited history
- **SCD 4** → Separate history table
- **SCD 5** → Hybrid approach

- **SCD 0 (No Historization)** : Dimension data is never changed once loaded. Used when data should remain constant, like date or country codes.
- **SCD 1 (Overwrite) :** Old data is overwritten with new values and history is lost. Used when historical changes are not important, like correcting spelling mistakes.
- **SCD 2 (Historization) :** Maintains full history by creating a new record for each change.  Used when tracking historical changes is critical, like customer address changes.

## **Simple Table Example**

### **Customer Dimension – Original Data**

|customer_id|name|city|
|---|---|---|
|101|Rahul|Mumbai|

👉 Now the customer **moves from Mumbai to Bangalore**.

---

### **SCD 1 (Overwrite – No History)**

|customer_id|name|city|
|---|---|---|
|101|Rahul|Bangalore|

**What happened?**  
Old city is overwritten and **history is lost**.

---

### **SCD 2 (Historization – Maintain History)**

|customer_id|name|city|start_date|end_date|is_current|
|---|---|---|---|---|---|
|101|Rahul|Mumbai|2023-01-01|2024-01-31|No|
|101|Rahul|Bangalore|2024-02-01|NULL|Yes|

**What happened?**  
A new record is created and **full history is preserved**.

## **SCD 1 vs SCD 2 (Comparison Table)**

|Feature|SCD 1|SCD 2|
|---|---|---|
|History maintained|❌ No|✅ Yes|
|Number of records|One|Multiple|
|Storage usage|Low|Higher|
|Query complexity|Simple|Moderate|
|Use case|Data correction|Historical tracking|
|Example|Fixing spelling|Address change|

---
