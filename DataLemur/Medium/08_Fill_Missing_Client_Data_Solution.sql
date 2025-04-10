WITH filled_category AS (
  SELECT
    *,
    COUNT(category) OVER (ORDER BY product_id) AS grp
  FROM products
) 

SELECT
    product_id,
    MAX(category) OVER (PARTITION BY grp ORDER BY product_id) AS category,
    name
  FROM filled_category