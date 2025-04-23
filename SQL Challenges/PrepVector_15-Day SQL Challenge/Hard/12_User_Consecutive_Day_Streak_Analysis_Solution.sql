#Given a table with event logs, find the top five users with the longest continuous streak of visiting the platform in 2020.
#Note: A continuous streak counts if the user visits the platform at least once per day on consecutive days.

#Output Schema
#Column         Type
#user_id        INT
#streak_length  INT




WITH event_dates AS (
  SELECT DISTINCT user_id, DATE(created_at) AS event_date
  FROM events
  WHERE strftime('%Y', created_at) = '2020'
),
ranked_visits AS (
  SELECT
    user_id,
    event_date,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date) AS visit_rank
  FROM event_dates
),
streak_groups AS (
  SELECT
    user_id,
    event_date,
    DATE(event_date, '-' || visit_rank || ' days') AS group_key
  FROM ranked_visits
),
user_streaks AS (
  SELECT
    user_id,
    group_key,
    COUNT(*) AS streak_length
  FROM streak_groups
  GROUP BY user_id, group_key
),
longest_streaks AS (
  SELECT
    user_id,
    MAX(streak_length) AS streak_length
  FROM user_streaks
  GROUP BY user_id
)
SELECT
  user_id,
  streak_length
FROM longest_streaks
ORDER BY streak_length DESC, user_id
LIMIT 5;
