SELECT COALESCE(eu.unique_id,NULL) AS unique_id,
       e.name
FROM Employees e 
LEFT JOIN EmployeeUNI eu
ON e.id = eu.id;