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




