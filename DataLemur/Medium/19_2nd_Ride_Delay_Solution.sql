
WITH in_the_moment_users AS (
  SELECT DISTINCT u.user_id
  FROM users u
  INNER JOIN rides r
    ON u.user_id = r.user_id
    AND u.registration_date = r.ride_date
),
ranked_rides AS (
  SELECT 
    r.user_id,
    r.ride_date,
    ROW_NUMBER() OVER (
      PARTITION BY r.user_id 
      ORDER BY r.ride_date
    ) AS ride_number,
    LAG(r.ride_date) OVER (
      PARTITION BY r.user_id 
      ORDER BY r.ride_date
    ) AS previous_ride_date
  FROM in_the_moment_users u
  LEFT JOIN rides r
    ON u.user_id = r.user_id
)

SELECT 
  ROUND(AVG(ride_date - previous_ride_date), 2) AS average_delay
FROM ranked_rides
WHERE ride_number = 2;
