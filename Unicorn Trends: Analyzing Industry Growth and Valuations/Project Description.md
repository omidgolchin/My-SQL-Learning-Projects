# Unicorn Trends: Analyzing Industry Growth and Valuations

## Project Overview  
This analysis was based on data from the **Unicorns Database**, which contains comprehensive information on unicorn companies across multiple industries, including their **valuation, funding, founding year,** and the **date they reached unicorn status**. The database consists of multiple tables:  
- **dates** (tracking when companies became unicorns),  
- **funding** (including valuation and funding raised),  
- **industries** (categorizing companies by sector), and  
- **companies** (detailing headquarters locations).  

## SQL Approach and Considerations  
The project was executed using **SQL** to extract and process meaningful insights.  

1. **Identifying Top-Performing Industries (2019-2021)**  
   - A **JOIN** was performed between the `industries` and `dates` tables to filter companies that achieved unicorn status within the target years.  
   - A **GROUP BY** operation helped count the number of unicorns per industry.  
   - The industries were sorted by unicorn count, selecting the **top three**.  

2. **Extracting Industry-Specific Metrics**  
   - A **JOIN** between the `industries`, `dates`, and `funding` tables allowed the extraction of key financial data.  
   - **Aggregation functions (`COUNT`, `AVG`)** were applied to compute the number of unicorns per industry per year and their average valuation.  
   - The valuation was converted to **billions of dollars** using division and formatted with `ROUND` to **two decimal places**.  
   - The final results were sorted in **descending order by year and unicorn count** for clarity.  

## Key Findings  
- **Fintech** led the unicorn race, with **138 new unicorns in 2021** and an **average valuation of $2.75 billion**.  
- **Internet Software & Services** and **E-commerce & Direct-to-Consumer** were also among the top-performing sectors across **2019-2021**, but with slightly lower average valuations.  

## Conclusion  
This project demonstrates how **SQL can efficiently analyze industry trends and investment opportunities**. The insights generated provide a **data-driven approach for investment firms** to understand high-growth industries and optimize their portfolio strategies.  
