SELECT account_id,
       SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS final_balance
FROM transactions
GROUP BY account_id;




//Alternative solutions
WITH cte_deposit AS (
  SELECT account_id,
         SUM(amount) AS deposit_amount
  FROM transactions
  WHERE transaction_type = 'Deposit'
  GROUP BY account_id
),
cte_withdrawal AS (
  SELECT account_id,
         SUM(amount) AS withdrawal_amount
  FROM transactions
  WHERE transaction_type = 'Withdrawal'
  GROUP BY account_id
)

SELECT 
  COALESCE(d.account_id, w.account_id) AS account_id,
  COALESCE(d.deposit_amount, 0) - COALESCE(w.withdrawal_amount, 0) AS final_balance
FROM cte_deposit d
FULL OUTER JOIN cte_withdrawal w
  ON d.account_id = w.account_id;