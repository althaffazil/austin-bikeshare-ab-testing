# A/B Testing Simulation on Austin Bikeshare Data  

This project simulates **A/B testing** using the **Austin Bikeshare public dataset** on Google BigQuery.  
The analysis compares **Morning (6–11 AM)** vs **Evening (4–8 PM)** riders to uncover behavioral differences in usage patterns, retention, and trip characteristics.  

---

## Dataset
- Source: [Google BigQuery Public Dataset – Austin Bikeshare](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sbigquery-public-data!2saustin_bikeshare)  
- Tables used:  
  - `bikeshare_trips`  
  - `bikeshare_stations`

---

## Project Structure

- **`/sql/`** → Contains all BigQuery SQL queries (each analysis in its own file).  
- **`/results/`** → CSV exports of query results (for easy viewing without running BigQuery).  
- **`README.md`** → Project overview, objectives, and outcomes.  

---

## Key Analyses

1. **top_start_stations.sql**  
   - Finds the most frequently used **starting stations** in the dataset.  

2. **top_end_stations.sql**  
   - Finds the most frequently used **ending stations** in the dataset.  

3. **morning_vs_evening_summary.sql**  
   - Summarizes **total trips** during morning (6–11 AM) vs evening (4–8 PM).  

4. **percentage_differences.sql**  
   - Calculates **percentage differences** in trip counts and **average duration** between morning and evening riders.  

5. **weekly_trip_trends.sql**  
   - Tracks **weekly trip volumes** to identify long-term usage patterns across both groups.  

6. **rider_type_distribution.sql**  
   - Analyzes distribution of **subscriber types** (casual vs registered) across morning and evening periods.  

7. **rider_retention.sql**  
   - Simulates **rider retention** by checking how many bikes (proxy for users) appear in **both morning and evening trips** across weeks.  


---

## Tech Stack
- **Google BigQuery (SQL)** → Data analysis and querying  
- **Google Sheets** → Connected via BigQuery for storing query results  
- **CSV exports** → Final results for sharing/visualization  

---

## Notes
- Queries are written for **BigQuery SQL** and may use functions like `SAFE_DIVIDE`, `FORMAT_DATE`, and `EXTRACT`.  
- Recruiters/hiring managers can explore results directly in the `/results/` folder without running queries.  
