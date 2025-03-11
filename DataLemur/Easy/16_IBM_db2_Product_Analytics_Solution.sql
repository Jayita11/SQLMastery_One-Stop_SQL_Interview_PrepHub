WITH query_counts AS (
    
    SELECT employee_id, COUNT(DISTINCT query_id) AS unique_queries
    FROM queries
    WHERE query_starttime >= '2023-07-01' 
    AND query_starttime < '2023-10-01'  
    GROUP BY employee_id
)
SELECT 
    COALESCE(qc.unique_queries, 0) AS unique_queries, 
    COUNT(e.employee_id) AS employee_count
FROM employees e
LEFT JOIN query_counts qc ON e.employee_id = qc.employee_id
GROUP BY unique_queries
ORDER BY unique_queries;




