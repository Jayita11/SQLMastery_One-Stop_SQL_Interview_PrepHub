WITH CTE_RANK AS (
SELECT 
date(measurement_time) as measurement_day,
measurement_value,
DENSE_RANK() OVER(PARTITION BY date(measurement_time) ORDER BY measurement_time) AS rk
FROM measurements
)

SELECT 
measurement_day,
SUM(CASE WHEN rk%2 = 1 THEN measurement_value END) AS odd_sum,
SUM(CASE WHEN rk%2 = 0 THEN measurement_value END) AS even_sum
FROM CTE_RANK
GROUP BY measurement_day;






