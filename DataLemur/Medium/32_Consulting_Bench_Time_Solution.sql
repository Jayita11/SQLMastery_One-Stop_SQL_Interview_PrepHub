SELECT 
  s.employee_id,
  365 - COALESCE(SUM(ce.end_date - ce.start_date + 1), 0) AS bench_days
FROM staffing s
JOIN consulting_engagements ce
  ON s.job_id = ce.job_id
WHERE s.is_consultant = 'true'
  AND ce.start_date >= '2021-01-01'
  AND ce.end_date <= '2021-12-31'
GROUP BY s.employee_id
ORDER BY s.employee_id;


