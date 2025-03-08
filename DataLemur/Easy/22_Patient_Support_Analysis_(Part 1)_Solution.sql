WITH CTE_COUNT AS (
SELECT COUNT(policy_holder_id) AS count_total
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(policy_holder_id) >= 3
)

SELECT COUNT(count_total)
FROM CTE_COUNT;