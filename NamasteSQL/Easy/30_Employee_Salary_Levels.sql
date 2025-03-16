WITH CTE_SALARY_LEVEL AS (
select employee_id,
       employee_name,
       salary,
       CASE
       WHEN salary < 50000 THEN 'Low'
       WHEN salary BETWEEN 50000 and 100000 THEN 'Medium'
       ELSE 'High'
       END AS salary_level
from employees 
)
SELECT salary_level,
       ROUND(AVG(salary)) AS avg_salary
FROM CTE_SALARY_LEVEL
GROUP BY salary_level
ORDER BY salary_level;