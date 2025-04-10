WITH stats AS (
  SELECT email_count FROM inbox_stats
),

-- 1. Mean
mean_cte AS (
  SELECT ROUND(AVG(email_count)) AS mean FROM stats
),

-- 2. Median
ordered_cte AS (
  SELECT 
    email_count,
    ROW_NUMBER() OVER (ORDER BY email_count) AS rn,
    COUNT(*) OVER () AS total_rows
  FROM stats
),
median_cte AS (
  SELECT 
    ROUND(AVG(email_count)) AS median
  FROM ordered_cte
  WHERE rn IN (
    (total_rows + 1) / 2, 
    (total_rows + 2) / 2
  )
),

-- 3. Mode
mode_cte AS (
  SELECT email_count AS mode
  FROM stats
  GROUP BY email_count
  ORDER BY COUNT(*) DESC
  LIMIT 1
)

-- Final SELECT combining all three
SELECT 
  mean_cte.mean,
  median_cte.median,
  mode_cte.mode
FROM mean_cte, median_cte, mode_cte;

