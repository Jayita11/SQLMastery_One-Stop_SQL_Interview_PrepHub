SELECT 
       ROUND(COUNT(CASE WHEN call_category	= 'n/a' OR call_category IS NULL 
                        THEN 1 END)*100.0 / COUNT(*),1) AS uncategorised_call_pct

FROM callers;




