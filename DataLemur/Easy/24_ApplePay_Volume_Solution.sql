SELECT 
  merchant_id,
  SUM(CASE 
        WHEN lower(payment_method) = 'apple pay' THEN transaction_amount 
        ELSE 0 
      END) AS total_transaction
FROM transactions
GROUP BY merchant_id
ORDER BY total_transaction DESC;