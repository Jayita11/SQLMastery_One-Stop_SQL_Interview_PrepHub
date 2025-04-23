WITH CTE_DRUG AS (
SELECT manufacturer,
       drug,
       ROW_NUMBER() OVER(PARTITION BY manufacturer ORDER BY units_sold DESC) AS rk
FROM pharmacy_sales
)

SELECT manufacturer,
       drug
FROM CTE_DRUG 
WHERE rk<=2
ORDER BY manufacturer