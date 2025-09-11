-- Rider type distribution by time period
SELECT
    CASE 
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
        ELSE 'Other'
    END AS trip_period,
    COALESCE(subscriber_type, 'Unknown') AS rider_type,
    COUNT(*) AS total_trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE duration_minutes IS NOT NULL
GROUP BY trip_period, rider_type
HAVING trip_period IN ('Morning','Evening')
ORDER BY trip_period, total_trips DESC;
