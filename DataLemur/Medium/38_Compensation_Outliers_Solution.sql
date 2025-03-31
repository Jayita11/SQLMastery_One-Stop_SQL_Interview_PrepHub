WITH avg_salary_per_title AS (
    SELECT 
        title,
        AVG(salary) AS avg_salary
    FROM employee_pay
    GROUP BY title
),
flagged_employees AS (
    SELECT 
        e.employee_id,
        e.salary,
        CASE 
            WHEN e.salary < 0.5 * a.avg_salary THEN 'Underpaid'
            WHEN e.salary > 2 * a.avg_salary THEN 'Overpaid'
            ELSE NULL
        END AS status
    FROM employee_pay e
    JOIN avg_salary_per_title a
      ON e.title = a.title
)
SELECT 
    employee_id,
    salary,
    status
FROM flagged_employees
WHERE status IS NOT NULL;
