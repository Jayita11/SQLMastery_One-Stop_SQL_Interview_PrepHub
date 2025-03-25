SELECT t.store_id,
       SUM(tp.payout_amount) AS payout_total
FROM trade_in_transactions t 
INNER JOIN trade_in_payouts tp 
ON t.model_id = tp.model_id
GROUP BY t.store_id
ORDER BY payout_total DESC;