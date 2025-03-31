SELECT  ROUND(SUM(CASE
        WHEN event_type = 'webinar' THEN 1
       ELSE 0
       END) * 100 / COUNT(event_type) ,0) AS webinar_pct
FROM marketing_touches
WHERE EXTRACT (YEAR from event_date) = 2022 
AND   EXTRACT (MONTH from event_date) = 4;