WITH cte_deal AS (
  SELECT employee_id,
         SUM(deal_size) AS total_deal
  FROM deals
  GROUP BY employee_id
)

SELECT sq.employee_id,
       CASE 
         WHEN COALESCE(cd.total_deal, 0) >= sq.quota THEN 'yes'
         ELSE 'no'
       END AS made_quota
FROM sales_quotas sq
LEFT JOIN cte_deal cd
  ON sq.employee_id = cd.employee_id
ORDER BY sq.employee_id;
