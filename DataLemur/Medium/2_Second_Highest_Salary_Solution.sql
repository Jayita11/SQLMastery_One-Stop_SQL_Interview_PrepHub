WITH cte_rank AS (
SELECT employee_id,
       name,
       salary,
       department_id,
       manager_id,
       DENSE_RANK() OVER(ORDER BY salary DESC) rk 
FROM employee
)

SELECT MAX(salary) AS second_highest_salary
FROM cte_rank
WHERE rk = 2;





