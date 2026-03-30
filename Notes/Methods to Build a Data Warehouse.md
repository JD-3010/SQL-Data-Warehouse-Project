There are 4 Methods to Build a Data Warehouse
## 1. Inmon Method (Top-Down Approach)
Build a **central enterprise data warehouse first**, then create data marts for departments.
### **Layman Example 🏢**
First build a **big head office**, then create branch offices from it.
### **How it Works**
Sources → Enterprise Data Warehouse (3NF) → Data Marts → Reports
![[Pasted image 20260206093850.png]]
### **Pros**
- Strong data consistency
- Enterprise-wide view of data
- High data quality
### **Cons**
- Takes long time to build
- Complex design
- Not agile
### **Best Used When**
- Large, stable organizations
- Strong governance required
- Long-term strategic reporting
## 2. Kimball Method
Build **department-level data marts first**, then integrate them into a warehouse.
### **Layman Example 🏬**
First open **small shops**, then connect them into a mall.
### **How it Works**
Sources → Dimensional Data Marts → Integrated Warehouse
![[Pasted image 20260206093907.png]]
### **Pros**
- Faster delivery
- Easy for business users
- Flexible and scalable
### **Cons**
- Risk of inconsistent dimensions
- Requires good design discipline
### **Best Used When**
- Agile teams
- Business-focused analytics
- Most modern BI use cases
## 3. Data vault

A modeling approach designed to **store historical data and track changes easily**.

![[Pasted image 20260206093952.png]]
### **Layman Example 📦**
A **warehouse with labeled boxes**—one for people, one for relationships, one for changes.
### **Core Components**
- **Hubs** → Business keys
- **Links** → Relationships
- **Satellites** → Attributes & history
### **Pros**
- Excellent for historization
- Scales well
- Auditable and flexible
### **Cons**
- Complex for analysts
- More tables
- Requires transformation layer
### **Best Used When**
- Highly regulated industries
- Frequent schema changes
- Need full audit history
## 4. Medallion Architecture 

Organizes data into **quality layers**, from raw to business-ready.

![[Pasted image 20260206094009.png]]
### **Layman Example 🥉🥈🥇**
Raw material → semi-finished → finished product.
### **Layers**
- **Bronze** → Raw data --> Keeps the Raw Original Data intact while we work in copies of the original data 
- **Silver** → Cleaned & enriched data --> All Transformations and Data Cleansing
- **Gold** → Aggregated & business-ready --> Application of Business Rules and necessities

![[Pasted image 20260206094414.png]]
### **Pros**

- Clear data quality stages
- Easy troubleshooting
- Perfect for lakehouse systems
### **Cons**

- Needs storage discipline
- Layer management overhead
### **Best Used When**

- Cloud & Lakehouse platforms
- BI + ML pipelines
- Large-scale analytics

==**Note:**==
	Best Practice is to have **Views as Object Type** for the **Last Layer in a Data Warehouse** as it will give more Dynamic and visibility  