SELECT v.customer_id,
      COUNT(COALESCE(T.visit_id,0)) as count_no_trans
FROM Visits AS v
LEFT JOIN Transactions AS T
ON v.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
GROUP BY v.customer_id;
