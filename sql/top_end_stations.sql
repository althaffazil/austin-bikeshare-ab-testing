-- Top end stations for morning and evening trips
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
  END AS time_period,
  end_station_name,
  COUNT(*) AS trip_count
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11
   OR EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20
GROUP BY time_period, end_station_name
ORDER BY time_period, trip_count DESC
LIMIT 20;
