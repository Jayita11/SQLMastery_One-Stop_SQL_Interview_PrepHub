SELECT candidate_id
FROM candidates
WHERE skill = 'Python' 
    OR skill = 'Tableau' 
    OR skill = 'PostgreSQL'
GROUP BY candidate_id
HAVING COUNT(SKILL) =3
ORDER BY candidate_id;