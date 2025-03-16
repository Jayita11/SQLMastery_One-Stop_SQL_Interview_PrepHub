SELECT store_id,
       category,
       SUM(total_sales)
FROM gap_sales
WHERE YEAR(sale_date) = 2023 AND QUARTER(sale_date) = 2
GROUP BY store_id,category
ORDER BY SUM(total_sales)