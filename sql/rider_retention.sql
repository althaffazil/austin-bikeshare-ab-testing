-- Simulate rider retention using bike_id as proxy for user
WITH rider_period AS (
  SELECT
    bike_id,
    EXTRACT(WEEK FROM start_time) AS week_num,
    CASE
      WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
      WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
    END AS time_period
  FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
  WHERE EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11
     OR EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20
)
SELECT
  week_num,
  COUNT(DISTINCT bike_id) AS total_bikes_used,
  COUNT(DISTINCT CASE WHEN time_period = 'Morning' THEN bike_id END) AS morning_bikes,
  COUNT(DISTINCT CASE WHEN time_period = 'Evening' THEN bike_id END) AS evening_bikes,
  COUNT(DISTINCT CASE 
                   WHEN bike_id IN (SELECT bike_id FROM rider_period WHERE time_period='Morning') 
                    AND bike_id IN (SELECT bike_id FROM rider_period WHERE time_period='Evening') 
                 THEN bike_id 
             END) AS retained_bikes
FROM rider_period
GROUP BY week_num
ORDER BY week_num;
