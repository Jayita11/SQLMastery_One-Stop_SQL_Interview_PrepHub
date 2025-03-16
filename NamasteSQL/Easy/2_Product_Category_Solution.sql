WITH CTE_CATEGORY AS (
	SELECT product_id, 
           product_name, 
           price,
           CASE
           WHEN price < 100 THEN 'Low Price'
           WHEN price BETWEEN 100 AND 500 THEN 'Medium Price'
  		   ELSE 'High Price'
           END AS product_category
	FROM Products
  )
  
  SELECT product_category AS category,
         COUNT(*) AS no_of_products 
  FROM CTE_CATEGORY
  GROUP BY category 
  ORDER BY no_of_products  DESC