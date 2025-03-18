WITH ProjectCount AS (
    SELECT 
        employee_name,
        DATE_FORMAT(project_completion_date, '%Y%m') AS month_year,
        COUNT(project_id) AS project_count
    FROM projects
    GROUP BY employee_name, DATE_FORMAT(project_completion_date, '%Y%m')
),
RankedProjects AS (
    SELECT 
        employee_name,
        month_year,
        project_count,
        RANK() OVER (PARTITION BY month_year ORDER BY project_count DESC) AS ranked
    FROM ProjectCount
)
SELECT 
    employee_name, 
    project_count,
    month_year AS project_completion_date
FROM RankedProjects
WHERE ranked = 1
ORDER BY project_count DESC;
