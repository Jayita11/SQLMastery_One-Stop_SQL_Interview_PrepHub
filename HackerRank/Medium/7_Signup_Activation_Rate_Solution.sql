SELECT ROUND(COUNT(t.email_id) * 1.0 / COUNT(e.email_id), 2) AS confirm_rate
FROM emails e
LEFT JOIN texts t
ON e.email_id = t.email_id AND t.signup_action = 'Confirmed';






