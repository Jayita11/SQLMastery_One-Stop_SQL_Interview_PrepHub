#You’re given two tables: users and events. The events table holds values of all of the user events in the action column (‘like’, ‘comment’, or ‘post’).
#Write a query to get the percentage of users that have never liked or commented, rounded to two decimal places.

#Output Schema:
#Column       Type
#percentage   FLOAT




SELECT 
  ROUND(
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM users), 
    2
  ) AS percentage
FROM users u
WHERE NOT EXISTS (
  SELECT 1
  FROM events e
  WHERE e.user_id = u.user_id
    AND e.action IN ('like', 'comment')
);




