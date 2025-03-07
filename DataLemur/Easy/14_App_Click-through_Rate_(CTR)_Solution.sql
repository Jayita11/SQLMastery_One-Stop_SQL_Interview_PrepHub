WITH CTE_CLICK AS 
(
    SELECT app_id,
           COUNT(CASE WHEN event_type = 'impression' THEN 1 END) AS impression_count,
           COUNT(CASE WHEN event_type = 'click' THEN 1 END) AS click_count
    FROM events
    WHERE timestamp BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
    GROUP BY app_id
)

SELECT app_id,
       ROUND((click_count * 100.0 / NULLIF(impression_count, 0)), 2) AS ctr
FROM CTE_CLICK;