-- Member vs Casual Riders by Morning and Evening (Bucketed)
SELECT
    CASE 
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20 THEN 'Evening'
    END AS trip_period,
    CASE
        -- Casual Riders (short-term, pay-as-you-go, special/event passes)
        WHEN subscriber_type IS NULL THEN 'Unknown'
        WHEN LOWER(subscriber_type) LIKE '%single%'
          OR LOWER(subscriber_type) LIKE '%walk up%'
          OR LOWER(subscriber_type) LIKE '%24 hour%'
          OR LOWER(subscriber_type) LIKE '%3-day%'
          OR LOWER(subscriber_type) LIKE '%weekender%'
          OR LOWER(subscriber_type) LIKE '%explorer%'
          OR LOWER(subscriber_type) LIKE '%pay%'
          OR LOWER(subscriber_type) LIKE '%funfunfun%'
          OR LOWER(subscriber_type) LIKE '%acl%'
          OR LOWER(subscriber_type) LIKE '%ridescout%'
        THEN 'Casual'

        -- Subscribers (long-term members, students, annual/365-day, monthly, youth, founding)
        WHEN LOWER(subscriber_type) LIKE '%annual%'
          OR LOWER(subscriber_type) LIKE '%local30%'
          OR LOWER(subscriber_type) LIKE '%local31%'
          OR LOWER(subscriber_type) LIKE '%local365%'
          OR LOWER(subscriber_type) LIKE '%membership%'
          OR LOWER(subscriber_type) LIKE '%member%'
          OR LOWER(subscriber_type) LIKE '%pass%'
          OR LOWER(subscriber_type) LIKE '%republic%'
          OR LOWER(subscriber_type) LIKE '%youth%'
          OR LOWER(subscriber_type) LIKE '%student%'
          OR LOWER(subscriber_type) LIKE '%semester%'
          OR LOWER(subscriber_type) LIKE '%madtown%'
          OR LOWER(subscriber_type) LIKE '%heartland%'
          OR LOWER(subscriber_type) LIKE '%plus%'
          OR LOWER(subscriber_type) LIKE '%founding%'
          OR LOWER(subscriber_type) LIKE '%aluminum%'
        THEN 'Subscriber'

        ELSE 'Unknown'
    END AS rider_group,
    COUNT(*) AS total_trips
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE duration_minutes IS NOT NULL
  AND (EXTRACT(HOUR FROM start_time) BETWEEN 6 AND 11 
       OR EXTRACT(HOUR FROM start_time) BETWEEN 16 AND 20)
GROUP BY trip_period, rider_group
ORDER BY trip_period, total_trips DESC;
