WITH customer_orders AS (
    SELECT customer_name, COUNT(order_id) AS no_of_orders
    FROM orders
    GROUP BY customer_name
),
avg_orders AS (
    SELECT AVG(no_of_orders) AS avg_order_count
    FROM customer_orders
)
SELECT c.customer_name AS premium_customers, c.no_of_orders
FROM customer_orders c
JOIN avg_orders a
ON c.no_of_orders > a.avg_order_count
ORDER BY c.no_of_orders DESC;



