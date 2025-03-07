WITH CTE_MEAN AS (
    SELECT 
        SUM(order_occurrences) OVER () AS total_orders,
        (item_count * order_occurrences) AS count_items
    FROM items_per_order
)

SELECT ROUND(SUM(count_items)::NUMERIC / MAX(total_orders), 2) AS mean
FROM CTE_MEAN;