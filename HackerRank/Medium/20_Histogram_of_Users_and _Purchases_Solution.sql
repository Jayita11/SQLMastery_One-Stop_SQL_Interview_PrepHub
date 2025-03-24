WITH CTE_PURCHASE AS (
SELECT product_id,
       user_id,
       spend,
       transaction_date,
       DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS RK 
FROM user_transactions
)

SELECT 
  transaction_date, 
  user_id,
  COUNT(product_id) AS purchase_count
FROM CTE_PURCHASE
WHERE RK = 1 
GROUP BY transaction_date, user_id
ORDER BY transaction_date;






