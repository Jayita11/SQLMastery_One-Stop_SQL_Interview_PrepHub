WITH CTE_RANK AS (
SELECT user_id,
       transaction_date,
       ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rk
FROM transactions
)

SELECT user_id
FROM CTE_RANK
WHERE rk = 3;


