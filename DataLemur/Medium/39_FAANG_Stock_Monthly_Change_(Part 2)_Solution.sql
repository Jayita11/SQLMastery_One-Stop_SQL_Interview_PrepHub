WITH cte_monthly_change AS (
  SELECT
    ticker,
    date,
    close,
    LAG(close) OVER (
      PARTITION BY ticker 
      ORDER BY date
    ) AS previous_month_close
  FROM stock_prices
)

SELECT
  ticker,
  date,
  close,
  ROUND((close - previous_month_close) * 100.0 / previous_month_close, 2) AS intermth_change_pct
FROM cte_monthly_change
ORDER BY ticker, date;
