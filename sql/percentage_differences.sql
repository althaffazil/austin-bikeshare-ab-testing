-- Percentage Differences between Morning and Evening Trips
WITH trip_counts AS (
    SELECT
        CASE 
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
        END AS trip_period,
        COUNT(*) AS total_trips,
        ROUND(AVG(duration_minutes), 2) AS avg_duration
    FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
    WHERE duration_minutes IS NOT NULL
    AND (EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 
      OR EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20)
    GROUP BY trip_period
)
SELECT
    MAX(CASE WHEN trip_period = 'Morning' THEN total_trips END) AS morning_trips,
    MAX(CASE WHEN trip_period = 'Evening' THEN total_trips END) AS evening_trips,
    ROUND(
        SAFE_DIVIDE(
            MAX(CASE WHEN trip_period = 'Evening' THEN total_trips END) -
            MAX(CASE WHEN trip_period = 'Morning' THEN total_trips END),
            MAX(CASE WHEN trip_period = 'Morning' THEN total_trips END)
        ) * 100, 2
    ) AS pct_diff_trips,
    MAX(CASE WHEN trip_period = 'Morning' THEN avg_duration END) AS morning_duration,
    MAX(CASE WHEN trip_period = 'Evening' THEN avg_duration END) AS evening_duration,
    ROUND(
        SAFE_DIVIDE(
            MAX(CASE WHEN trip_period = 'Evening' THEN avg_duration END) -
            MAX(CASE WHEN trip_period = 'Morning' THEN avg_duration END),
            MAX(CASE WHEN trip_period = 'Morning' THEN avg_duration END)
        ) * 100, 2
    ) AS pct_diff_duration
FROM trip_counts;
