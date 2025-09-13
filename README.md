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

Perfect 👍 Since we just updated the query to **bucket subscriber types into Casual, Subscriber, and Unknown**, let’s also update the **Analysis** section of your `README.md` so it reflects this change.

Here’s a clean, reordered version of the **Key Analysis** section with the new **Morning vs Evening Rider Type Distribution** included:

---

## Key Analysis

1. **Morning vs Evening Trip Patterns (`morning_vs_evening_summary.sql`)**

   * Compared overall ride counts between **morning (6–11 AM)** and **evening (4–8 PM)**.
   * Helps identify when riders are most active.

2. **Percentage Differences (`percentage_differences.sql`)**

   * Calculated the **percentage gap** between morning and evening trips.
   * Useful for quantifying **time-of-day preference shifts**.

3. **Rider Retention (`rider_retention.sql`)**

   * Analyzed **weekly unique riders** and how many return across weeks.
   * Provides insights into **user loyalty and repeat usage**.

4. **Rider Type Distribution (`rider_type_distribution.sql`)**

   * Consolidated 50+ raw `subscriber_type` values into:

     * **Subscriber** (annual, student, local passes, memberships)
     * **Casual** (single rides, day passes, pay-as-you-go, event specials)
     * **Unknown** (null or unclassified)
   * Shows which groups dominate platform usage.

5. **Morning vs Evening Rider Type Breakdown (`rider_type_morning_evening.sql`)**

   * Compared **Casual vs Subscriber riders** in **morning vs evening trips**.
   * Useful for testing whether **casuals ride more in evenings (leisure)** while **subscribers ride more in mornings (commute)**.

6. **Top Start Stations (`top_start_stations.sql`)**

   * Identified the most common **starting locations**.
   * Highlights areas of **high demand entry points**.

7. **Top End Stations (`top_end_stations.sql`)**

   * Identified the most common **ending locations**.
   * Useful for analyzing **commute patterns and demand sinks**.

8. **Weekly Trip Trends (`weekly_trip_trends.sql`)**

   * Tracked ride volumes across weeks.
   * Shows **seasonal fluctuations and long-term trends**.

---

## Tech Stack
- **Google BigQuery (SQL)** → Data analysis and querying  
- **Google Sheets** → Connected via BigQuery for storing query results  
- **CSV exports** → Final results for sharing/visualization  

---

## Notes
- Queries are written for **BigQuery SQL** and may use functions like `SAFE_DIVIDE`, `FORMAT_DATE`, and `EXTRACT`.  
- Recruiters/hiring managers can explore results directly in the `/results/` folder without running queries.  
