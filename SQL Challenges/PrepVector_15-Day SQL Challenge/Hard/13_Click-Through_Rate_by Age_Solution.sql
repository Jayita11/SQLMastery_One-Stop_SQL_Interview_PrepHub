#Given two tables, search_events and users, write a query to find the three age groups 
#(bucketed by decade: 0-9, 10-19, 20-29, …,80-89, 90-99, with the end point included) with the highest clickthrough rate in 2021. 
#If two or more groups have the same clickthrough rate, the older group should have priority.

#Hint: if a user that clicked the link on 1/1/2021 who is 29 years old on that day and has a birthday tomorrow on 2/1/2021, 
#they fall into the [20-29] category. If the same user clicked on another link on 2/1/2021, he turned 30 and will fall into 
#the [30-39] category.

#Output Schema
#Column        Type
#age_group     STRING
#ctr           FLOAT



WITH age_at_click AS (
  SELECT
    u.id,
    u.birthdate,
    CAST((JULIANDAY(se.search_time) - JULIANDAY(u.birthdate)) / 365.25 AS INT) AS age
  FROM search_events se
  JOIN users u ON se.user_id = u.id
  WHERE strftime('%Y', se.search_time) = '2021'
),
age_groups AS (
  SELECT
    id,
    printf('%d-%d', CAST(age / 10 AS INT) * 10, CAST(age / 10 AS INT) * 10 + 9) AS age_group,
    has_clicked,
    age
  FROM age_at_click
),
ctr_by_group AS (
  SELECT
    age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN has_clicked THEN 1 ELSE 0 END) AS clicks,
    1.0 * SUM(CASE WHEN has_clicked THEN 1 ELSE 0 END) / COUNT(*) AS ctr,
    MAX(age) AS max_age_in_group
  FROM age_groups
  GROUP BY age_group
),
ordered_groups AS (
  SELECT *
  FROM ctr_by_group
  ORDER BY ctr, max_age_in_group DESC
)
SELECT age_group, ROUND(ctr, 2) AS ctr
FROM ordered_groups
LIMIT 3;
