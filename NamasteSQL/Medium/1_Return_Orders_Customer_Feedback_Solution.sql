select o.customer_name ,
       ROUND((COUNT(r.order_id)*100)/ COUNT(o.order_id),2) AS return_percentage
from orders o
LEFT JOIN returns r
ON o.order_id  = r.order_id 
GROUP BY o.customer_name
HAVING return_percentage > 50.00;





