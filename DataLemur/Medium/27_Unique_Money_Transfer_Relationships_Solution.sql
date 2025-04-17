WITH mutual AS (
  SELECT 
    p.payer_id AS user1,
    p.recipient_id AS user2
  FROM payments p
  JOIN payments p2
    ON p.payer_id = p2.recipient_id 
   AND p.recipient_id = p2.payer_id
  WHERE p.payer_id < p.recipient_id
)
SELECT COUNT(DISTINCT (user1, user2)) AS unique_relationships
FROM mutual;
