WITH CTE_CALLER_INFO AS (
SELECT pc.caller_id,
       pc.receiver_id,
       pf_caller.country_id AS caller_country,
       pf_receiver.country_id AS receiver_country
FROM phone_calls AS pc 
LEFT JOIN phone_info AS pf_caller
ON pc.caller_id = pf_caller.caller_id
LEFT JOIN phone_info AS pf_receiver
ON pc.receiver_id = pf_receiver.caller_id
)

SELECT ROUND(COUNT(CASE 
       WHEN caller_country <> receiver_country THEN 1
       END) *100.0 / COUNT(*),1) AS international_calls_pct
FROM CTE_CALLER_INFO
;




