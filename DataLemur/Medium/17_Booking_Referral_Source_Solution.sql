WITH click_to_trip AS (
  SELECT 
    bookings.booking_id,
    ROW_NUMBER() OVER (
      PARTITION BY bookings.user_id
      ORDER BY bookings.booking_date) AS booking_no,
    channels.channel
  FROM bookings
  INNER JOIN booking_attribution AS channels
    ON bookings.booking_id = channels.booking_id
), 
first_impressions AS (
  SELECT 
    channel, 
    COUNT(*) AS channel_booking
  FROM click_to_trip
  WHERE booking_no = 1
  GROUP BY channel
)

SELECT 
  channel, 
  ROUND(100.0 * (channel_booking / 
    (SELECT SUM(channel_booking) FROM first_impressions)), 0) AS first_booking_pct
FROM first_impressions
WHERE channel IS NOT NULL
ORDER BY first_booking_pct DESC
LIMIT 1;
