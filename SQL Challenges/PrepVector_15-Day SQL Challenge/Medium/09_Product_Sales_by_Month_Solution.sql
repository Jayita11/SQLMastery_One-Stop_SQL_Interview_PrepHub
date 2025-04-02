select 
month,
SUM(CASE WHEN product_id = 1 THEN amount_sold ELSE 0 END) AS product_1,
SUM(CASE WHEN product_id = 2 THEN amount_sold ELSE 0 END) AS product_2,
SUM(CASE WHEN product_id = 3 THEN amount_sold ELSE 0 END) AS product_3,
SUM(CASE WHEN product_id = 4 THEN amount_sold ELSE 0 END) AS product_4 
from monthly_sales
GROUP BY month
ORDER BY month;
