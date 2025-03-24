WITH CTE_MODE AS (
    SELECT item_count,
           order_occurrences,
           DENSE_RANK() OVER(ORDER BY order_occurrences DESC) AS rk
    FROM items_per_order
)
SELECT item_count AS mode
FROM CTE_MODE
WHERE rk = 1
ORDER BY mode;