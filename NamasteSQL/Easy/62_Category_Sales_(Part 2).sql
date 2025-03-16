select c.category_name,
       COALESCE(SUM(s.amount),0) AS total_sales
from  Categories c
LEFT JOIN sales s
ON s.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales;