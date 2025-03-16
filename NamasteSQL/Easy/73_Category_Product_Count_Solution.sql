SELECT category, 
       LENGTH(products) - LENGTH(REPLACE(products, ',', '')) + 1 AS product_count
FROM categories
ORDER BY product_count;
