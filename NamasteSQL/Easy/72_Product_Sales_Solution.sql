select p.product_name,
       SUM(p.price * s.quantity) AS total_sales
from products p
INNER JOIN sales s
ON p.product_id = s.product_id 
GROUP BY p.product_name
ORDER BY p.product_name;
