**What is Data Warehouse ?**
	"A subject-oriented , integrated, time-variant and non volatile collection of data design to support of management's decision making process "
 
- **Subject-Oriented :** It means it always focused on a specific business area like , Sales , customers , finance and so on.
- **Integrated :** It has the capability to integrate multiple source systems and generates an single end output.
- **Time Variant :** We can keep and maintain all historical data inside the data ware house.
- **Non-Volatile :** Once the Raw data enters the data warehouse the data is not deleted or modified 


  **Why Data Warehousing ?**
	  Lets say we have 3 different systems and 3 different data analyst are are collecting the data from each systems respectively and analyzing it . In this was the analyst will spend days and week to collect the raw data and transform it into something meaningful so that the business users can obtain meaningful insights . 
	  Here , Each data analysts are collecting 3 different data from 3 different data sources and giving the end reports in different reporting tools like Excel , PowerPoint , PowerBI etc 
- In this type of process , It will take a along time maybe weeks to process the data by the time the data might become irrelevant as new data comes in 
- Another negative is that , the generated report will be inconsistent as 1 engineer will present the report in 10 days another engineer might present the report the data in 15 and another in 20 days . Which makes the reports inconsistent
- And this way makes it hard to handle big data which makes the process very slow 
- and in this way if a business owner asks for a integrated report with multiple data sources and different data types . it is not possible in this way of process.
![[Pasted image 20260121121740.png]]

But if we have Data Warehousing , Instead of a data team collecting various data we will be having an Important Element called **==ETL - Extract , Transform , Load ==** Component . This ETL will extract the data from various sources and apply multiple transformations and it load the final unified data to the warehouse and this Unified Data where all types of data from different sources are integrated is called a ==Data Warehouse==. From this Unified data we will be creating the reports where we can create multiple reports and all the reports and insights will be in same page as other reports. 
   ![[Pasted image 20260121122747.png]]

The Entire Process is automated and no manual work is done as a result the process is fast and time efficient and as well reduces the human error . The main Advanced is that it is totally Integrated from various Data sources and it will to keep historical data as well .

Here From building this architecture and maintaining the Data warehouse we will need data engineers to do it . 

For Analyzing the Unified data and creating business reports we will need data analysts to do it 

![[Pasted image 20260121123024.png]]