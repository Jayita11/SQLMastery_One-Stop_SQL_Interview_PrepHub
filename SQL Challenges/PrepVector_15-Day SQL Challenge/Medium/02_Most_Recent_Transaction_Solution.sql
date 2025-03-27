#Given a table of customer sales in a retail store with columns id, transaction_value, and created_at representing the date and time for each transaction, 
#write a query to get the last transaction for each day.
#The output should include the ID of the transaction, datetime of the transaction, and the transaction amount. Order the transactions by datetime.

#Output Schema:

#Column                  Type
#id                       INT
#created_at              DATETIME
#transaction_value        FLOAT


WITH CTE_TRANS AS (
SELECT *,
       ROW_NUMBER() OVER(PARTITION BY DATE(created_at) ORDER BY created_at DESC) rk_date
FROM customer_sales
)
SELECT id,
       created_at,
       transaction_value
FROM CTE_TRANS
WHERE rk_date = 1
ORDER BY created_at;