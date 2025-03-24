WITH cte_trans AS (
SELECT user_id,
       spend,
       transaction_date,
       ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) rk
       FROM transactions
)

SELECT user_id,
       spend,
       transaction_date
FROM cte_trans
WHERE rk = 3;




