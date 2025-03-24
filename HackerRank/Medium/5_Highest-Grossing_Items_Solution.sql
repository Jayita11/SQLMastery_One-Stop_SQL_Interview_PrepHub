WITH CTE_SPEND AS (
SELECT category,
       product,
       SUM(spend) AS total_spend,
       ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) rk
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product
)

SELECT category,
       product,
       total_spend
FROM CTE_SPEND
WHERE rk <= 2 ;






