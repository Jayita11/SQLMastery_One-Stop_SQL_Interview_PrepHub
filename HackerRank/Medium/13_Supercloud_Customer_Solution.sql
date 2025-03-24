WITH CTE_COUNT AS (
    SELECT cc.customer_id,
           COUNT(DISTINCT p.product_category) AS product_count
    FROM customer_contracts cc 
    INNER JOIN products p
    ON cc.product_id = p.product_id
    GROUP BY cc.customer_id
)

SELECT customer_id
FROM CTE_COUNT
WHERE product_count = (SELECT COUNT(DISTINCT product_category) FROM products);






