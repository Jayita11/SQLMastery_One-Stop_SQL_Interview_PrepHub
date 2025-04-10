WITH array_table AS (
SELECT 
  transaction_id, 
  ARRAY_AGG(CAST(product_id AS TEXT) ORDER BY product_id) as combination
FROM transactions
GROUP BY transaction_id
)

SELECT DISTINCT combination
FROM array_table
WHERE ARRAY_LENGTH(combination, 1) > 1
ORDER BY combination;