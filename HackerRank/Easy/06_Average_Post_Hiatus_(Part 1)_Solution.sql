#Solved using CTE
WITH cte_post AS
(
SELECT user_id,
       MIN(post_date) AS first_date,
       MAX(post_date) AS last_date,
       COUNT(user_id)
FROM posts
WHERE post_date BETWEEN '01/01/2021' AND '12/31/2021'
GROUP BY user_id
HAVING COUNT(user_id) >= 2
)

SELECT user_id,
       EXTRACT(DAY FROM (last_date - first_date)) AS days_between
FROM cte_post;
