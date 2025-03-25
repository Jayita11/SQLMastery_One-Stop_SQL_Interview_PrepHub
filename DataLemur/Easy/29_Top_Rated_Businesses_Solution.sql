SELECT COUNT(business_id) AS business_count,
       ROUND(COUNT(business_id) * 100.0 / (SELECT COUNT(*) FROM reviews),0) AS top_rated_pct
FROM reviews
WHERE review_stars IN (4, 5);