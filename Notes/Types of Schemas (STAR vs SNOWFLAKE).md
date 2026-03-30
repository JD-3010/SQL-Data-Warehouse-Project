
For Data Warehouse or data analysis , we need a data model that is optimized for reporting and analysis , it should be flexible , scable and easy to understand . 

We have 2 Main Data models for that :
- Star Schema
- Snowflake Schema 

### 1. STAR Schema :

- It has a **==central FACT table in the middle and surrounded by DIMENIONAL tables ==** 
- Fact Table --> Contains transactions & events
- Dimensional Table --> Contains different information
- The way the Fact table in the middle and the dimensional tables around it forms like a STAR . Thus the name Star Schema

![[Pasted image 20260317102117.png|430]]


### 2. SNOWFLAKE Schema :

- It is somewhat similar to Star schema , we have a FACT Table in the middle and is surrounded by dimensional tables **==which are further connected to smaller dimensional tables called sub dimensions ==**

![[Pasted image 20260317102356.png|471]]

---

- Star Schema is easier to understand and simple to handle and construct . It is very good for analyses 
- But the Only issue with Star schema is that the Dimensions might have duplicates and the dimensions gets bigger over time.

- In Snowflake Schema it is more Complex compared to star schema . It needs more efforts to Handle and construct properly 
- The main advantage here is , as we are breaking large datasets into smaller chucks it greatly helps in data normalization and makes it better to handle large amounts of data 

----
