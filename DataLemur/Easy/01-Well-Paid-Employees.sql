SELECT emp.employee_id AS employee_id,
       emp.name AS employee_name
FROM employee AS mngr -- Represents the manager's table
INNER JOIN employee AS emp -- Represent the employee's table
ON mngr.employee_id = emp.manager_id
WHERE emp.salary > mngr.salary; 