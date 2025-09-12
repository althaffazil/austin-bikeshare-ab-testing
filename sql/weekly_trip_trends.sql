-- Number of trips by day of week for morning and evening
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
  END AS time_period,
  EXTRACT(DAYOFWEEK FROM start_time) AS day_of_week,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11
   OR EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20
GROUP BY time_period, day_of_week
ORDER BY time_period, day_of_week;
