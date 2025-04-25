SELECT p.product_name,
       s.year,
       s.price
FROM Sales AS s
LEFT JOIN Product AS p
on s.product_id = p.product_id;

