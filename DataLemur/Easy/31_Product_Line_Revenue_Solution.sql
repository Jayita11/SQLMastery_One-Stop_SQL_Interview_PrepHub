SELECT pin.product_line,
       SUM(t.amount) AS total_revenue
FROM product_info pin 
INNER JOIN transactions t 
ON pin.product_id = t.product_id
GROUP BY pin.product_line
ORDER BY total_revenue DESC;