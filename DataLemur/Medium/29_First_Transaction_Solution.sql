WITH cte_spend AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date, transaction_id) AS rn
  FROM user_transactions
)
SELECT COUNT(*) AS users
FROM cte_spend
WHERE rn = 1 AND spend >= 50;




