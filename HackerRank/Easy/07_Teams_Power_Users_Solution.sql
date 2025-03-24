SELECT sender_id,
       COUNT(*) AS message_count
FROM messages
WHERE sent_date BETWEEN '2022-08-01 00:00:00' AND '2022-08-31 23:59:59'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
