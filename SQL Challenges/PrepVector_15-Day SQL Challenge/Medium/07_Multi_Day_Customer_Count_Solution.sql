#We’re given a table of product purchases. Each row in the table represents an individual user product purchase.
#Write a query to get the number of customers that were upsold by purchasing additional products.
#Note: If a customer purchased multiple products on the same day, it does not count as an upsell. 
#An upsell is considered only if they made purchases on separate days

#Output Schema:

#Column                     Type
#upsold_customer_count        INT



WITH daily_purchase_summary AS (
  SELECT 
    user_id, 
    COUNT(DISTINCT DATE(created_at)) AS unique_purchase_days
  FROM transactions
  GROUP BY user_id
)
SELECT 
  COUNT(*) AS customers_with_multiple_days
FROM daily_purchase_summary
WHERE unique_purchase_days > 1;
