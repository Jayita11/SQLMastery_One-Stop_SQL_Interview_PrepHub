select customer_id,
       SUM(total_cost) AS total_expense
from orders
GROUP BY customer_id
ORDER BY total_expense DESC LIMIT 1;