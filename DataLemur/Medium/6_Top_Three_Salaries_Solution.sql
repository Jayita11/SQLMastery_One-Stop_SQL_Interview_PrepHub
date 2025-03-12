WITH CTE_SALARY AS (
SELECT d.department_name,
       e.name,
       e.salary,
       DENSE_RANK() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) rk
FROM employee e 
INNER JOIN department d 
ON e.department_id = d.department_id
)

SELECT department_name,
       name,
       salary
FROM CTE_SALARY
WHERE rk <=3
ORDER BY department_name ASC, salary DESC, name ASC;






