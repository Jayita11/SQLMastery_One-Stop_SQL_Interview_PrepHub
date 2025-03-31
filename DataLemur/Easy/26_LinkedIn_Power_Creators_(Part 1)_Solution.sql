SELECT pp.profile_id
FROM personal_profiles pp
INNER JOIN company_pages cp
ON pp.employer_id = cp.company_id
WHERE pp.followers > cp.followers
ORDER BY pp.profile_id;
