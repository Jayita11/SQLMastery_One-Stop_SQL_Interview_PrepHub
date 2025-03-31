SELECT employee_id
FROM employee_expertise
GROUP BY employee_id
HAVING 
  MAX(years_of_experience) >= 8
  OR (COUNT(*) = 2 AND SUM(years_of_experience) >= 12);