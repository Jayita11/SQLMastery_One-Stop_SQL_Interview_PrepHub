SELECT 
    d.department_name, 
    round(AVG(e.salary),2) AS average_salary
FROM 
    Employees e
JOIN 
    Departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
having COUNT(*) > 2
ORDER BY average_salary desc;
