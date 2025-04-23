WITH CTE_FOLLOWERS  AS (
SELECT pp.profile_id,
       pp.followers AS influencer_follower,
       ec.company_id,
       cp.name,
       cp.followers AS company_follower,
       ROW_NUMBER() OVER(PARTITION BY pp.profile_id ORDER BY cp.followers DESC) AS rnk
FROM employee_company ec  
INNER JOIN personal_profiles pp 
ON ec.personal_profile_id = pp.profile_id
INNER JOIN company_pages cp 
ON ec.company_id = cp.company_id
)

SELECT DISTINCT profile_id AS profile_id
FROM CTE_FOLLOWERS 
WHERE influencer_follower > company_follower AND rnk = 1
ORDER BY profile_id;