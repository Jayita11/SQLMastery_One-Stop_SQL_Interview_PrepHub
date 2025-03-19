WITH ProductSales AS (
    SELECT 
        category, 
        product_id, 
        SUM(quantity) AS total_quantity, 
        SUM(quantity * unit_price) AS total_sales
    FROM orders
    GROUP BY category, product_id
),
RankedProducts AS (
    SELECT 
        category, 
        product_id, 
        total_quantity, 
        total_sales,
        RANK() OVER (PARTITION BY category ORDER BY total_quantity DESC, total_sales DESC) AS rnk
    FROM ProductSales
)
SELECT category, product_id
FROM RankedProducts
WHERE rnk = 1
ORDER BY category;
