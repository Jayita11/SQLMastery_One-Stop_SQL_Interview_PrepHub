select category,
       ROUND(AVG(price),2)
from electronic_items
WHERE warranty_months >= 12
GROUP BY category
HAVING ROUND(AVG(price),2) > 500.00
AND SUM(quantity)>= 20 
ORDER BY AVG(price) DESC;