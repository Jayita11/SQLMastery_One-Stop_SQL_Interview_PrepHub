WITH stock_with_month AS (
    SELECT 
        ticker,
        open,
        TO_CHAR(date, 'Mon-YYYY') AS month_year,
        date
    FROM stock_prices
),
ranked_open_prices AS (
    SELECT *,
           RANK() OVER (PARTITION BY ticker ORDER BY open DESC) AS high_rank,
           RANK() OVER (PARTITION BY ticker ORDER BY open ASC) AS low_rank
    FROM stock_with_month
)
SELECT 
    ticker,
    MAX(CASE WHEN high_rank = 1 THEN month_year END) AS highest_mth,
    MAX(CASE WHEN high_rank = 1 THEN open END) AS highest_open,
    MAX(CASE WHEN low_rank = 1 THEN month_year END) AS lowest_mth,
    MAX(CASE WHEN low_rank = 1 THEN open END) AS lowest_open
FROM ranked_open_prices
GROUP BY ticker
ORDER BY ticker;
