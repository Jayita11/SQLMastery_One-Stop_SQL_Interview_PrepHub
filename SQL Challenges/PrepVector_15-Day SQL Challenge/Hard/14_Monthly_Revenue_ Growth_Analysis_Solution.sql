#Given a table of transactions and products, write a function to get the month_over_month change in revenue for the year 2019. 
#Make sure to round month_over_month to 2 decimal places.

#Output Schema
#Column                Type
#month                  INT
#month_over_month      FLOAT



WITH monthly_revenue AS (
  SELECT
    CAST(strftime('%m', created_at) AS INT) AS month,
    SUM(p.price * t.quantity) AS revenue
  FROM transactions t
  JOIN products p
    ON t.product_id = p.id
  WHERE strftime('%Y', created_at) = '2019'
  GROUP BY month
),
revenue_with_prev AS (
  SELECT
    curr.month,
    ROUND(((curr.revenue - prev.revenue) * 100.0 / prev.revenue), 2) AS month_over_month
  FROM monthly_revenue curr
  LEFT JOIN monthly_revenue prev
    ON curr.month = prev.month + 1
)
SELECT * FROM revenue_with_prev
ORDER BY month;
