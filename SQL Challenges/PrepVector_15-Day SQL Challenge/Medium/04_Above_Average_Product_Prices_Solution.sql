#Given a table of transactions and products, write a query to return the product ID, product price, and average transaction price of 
#all products with a price greater than the average transaction price.

#Output Schema:

#Column                  Type
#product_id               INT
#product_price           FLOAT
#avg_transaction_price   FLOAT





WITH avg_transaction_price_cte AS (
    SELECT AVG(amount) AS avg_transaction_price
    FROM transactions
)

SELECT 
    p.product_id,
    p.price AS product_price,
    a.avg_transaction_price
FROM products p
INNER JOIN avg_transaction_price_cte a
    ON p.price > a.avg_transaction_price;
