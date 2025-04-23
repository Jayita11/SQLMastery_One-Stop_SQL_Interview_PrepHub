#Write a query to return pairs of projects where the end date of one project matches the start date of another project.

#Output Schema:
#Column                     Type
#project_title_end         STRING
#project_title_start       STRING
#date                       DATE


SELECT 
  proj_end.title AS project_title_end,
  proj_start.title AS project_title_start,
  DATE(proj_end.end_date) AS date
FROM projects AS proj_end
JOIN projects AS proj_start
  ON proj_end.end_date = proj_start.start_date
ORDER BY date;
