#Consider the events table, which contains information about the phases of writing a new social media post.
#The action column can have values post_enter, post_submit, or post_canceled for when a user starts to write (post_enter), 
#ends up canceling their post (post_cancel), or posts it (post_submit). Write a query to get the post-success rate for each day in the month of January 2020.

#Note: Post Success Rate is defined as the number of posts submitted (post_submit) divided by the number of posts entered (post_enter) for each day.

#Output Schema:

#Column                  Type
#date                    DATE
#total_enters             INT
#total_submits            INT
#success_rate            FLOAT


SELECT 
  DATE(created_at) AS date,
  SUM(CASE WHEN action = 'post_enter' THEN 1 ELSE 0 END) AS total_enters,
  SUM(CASE WHEN action = 'post_submit' THEN 1 ELSE 0 END) AS total_submits,
  ROUND(
    SUM(CASE WHEN action = 'post_submit' THEN 1 ELSE 0 END) * 1.0 / 
    NULLIF(SUM(CASE WHEN action = 'post_enter' THEN 1 ELSE 0 END), 0), 
  2) AS success_rate
FROM events
WHERE strftime('%Y', created_at) = '2024'
GROUP BY DATE(created_at)
ORDER BY DATE(created_at);
