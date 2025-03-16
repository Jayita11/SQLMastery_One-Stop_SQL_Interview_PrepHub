select category,
       SUM(amount) AS total_sales
from sales
WHERE YEAR(order_date) = 2022 AND MONTH(order_date) = 02 AND DAYOFWEEK(order_date) BETWEEN 2 AND 6
GROUP BY category
ORDER BY total_sales;