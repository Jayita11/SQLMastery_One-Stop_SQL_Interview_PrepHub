#Given a table containing data for monthly sales, write a query to find the total amount of each product sold for each month, 
#with each product as its own column in the output table.

#Output Schema:

#Column           Type
#month            DATE
#product_1        INT
#product_2.       INT
#product_3.       INT
#product_4.       INT


SELECT 
month,
SUM(CASE WHEN product_id = 1 THEN amount_sold ELSE 0 END) AS product_1,
SUM(CASE WHEN product_id = 2 THEN amount_sold ELSE 0 END) AS product_2,
SUM(CASE WHEN product_id = 3 THEN amount_sold ELSE 0 END) AS product_3,
SUM(CASE WHEN product_id = 4 THEN amount_sold ELSE 0 END) AS product_4 
FROM monthly_sales
GROUP BY month
ORDER BY month;
