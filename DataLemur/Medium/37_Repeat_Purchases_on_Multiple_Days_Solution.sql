WITH repeat_purchases AS (
    SELECT 
        user_id, 
        product_id, 
        COUNT(DISTINCT DATE(purchase_date)) AS purchase_days
    FROM purchases
    GROUP BY user_id, product_id
    HAVING COUNT(DISTINCT DATE(purchase_date)) >= 2
)

SELECT COUNT(DISTINCT user_id) AS repeat_purchasers
FROM repeat_purchases;

