-- Morning vs Evening Trips and Average Duration
SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
        ELSE 'Other'
    END AS trip_period,
    COUNT(*) AS total_trips,
    ROUND(AVG(duration_minutes), 2) AS avg_duration_minutes
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE duration_minutes IS NOT NULL
GROUP BY trip_period
HAVING trip_period IN ('Morning','Evening')
ORDER BY total_trips DESC;
