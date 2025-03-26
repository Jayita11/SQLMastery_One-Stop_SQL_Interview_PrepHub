#Given a table of job postings, write a query to retrieve the number of users that have posted each job only once and the number of users 
#that have posted at least one job multiple times.

#Output Schema:

#Column                 Type
#single_post_users       INT
#multiple_post_users.    INT



WITH job_counts AS (
  SELECT user_id, job_id, COUNT(*) AS post_count
  FROM job_postings
  GROUP BY user_id, job_id
),
user_classification AS (
  SELECT user_id,
         MAX(CASE WHEN post_count > 1 THEN 1 ELSE 0 END) AS has_multiple_post
  FROM job_counts
  GROUP BY user_id
)
SELECT
  COUNT(CASE WHEN has_multiple_post = 0 THEN 1 END) AS single_post_users,
  COUNT(CASE WHEN has_multiple_post = 1 THEN 1 END) AS multiple_post_users
FROM user_classification;
