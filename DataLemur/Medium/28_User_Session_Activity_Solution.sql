WITH CTE_DURATION AS (
SELECT user_id,
       session_type,
       SUM(duration) AS total_duration
FROM sessions
WHERE start_date >= '2022-01-01' 
AND start_date <= '2022-02-01' 
GROUP BY user_id, session_type
)

SELECT user_id,
       session_type,
       ROW_NUMBER() OVER(PARTITION BY session_type ORDER BY total_duration DESC) AS ranking
FROM CTE_DURATION
ORDER BY session_type, ranking;