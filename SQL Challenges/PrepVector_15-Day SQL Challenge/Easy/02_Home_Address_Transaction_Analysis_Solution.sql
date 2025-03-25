#Given a table of transactions and a table of users, write a query to determine if users tend to order more to their primary address versus other addresses.
#Note: Return the percentage of transactions ordered to their home address as home_address_percent.

#Output Schema:
#Column.                    Type
#home_address_percent      FLOAT




with cte_address as (
              SELECT u.id,
                     u.name,
                     u.address,
                     t.user_id,
                     t.shipping_address
FROM  users u
JOIN transactions t
ON u.id = t.user_id
)

SELECT 
       ROUND(COUNT(CASE
       WHEN address = shipping_address THEN 1
       END)* 100.0 / COUNT(*),2) AS home_address_percent
FROM cte_address;
