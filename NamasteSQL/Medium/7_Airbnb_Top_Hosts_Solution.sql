WITH cte AS (
    SELECT host_id, 
           listing_id,
           COUNT(*) OVER (PARTITION BY host_id) AS cnt_listings
    FROM listings
)
SELECT cte.host_id, 
       cte.cnt_listings AS no_of_listings, 
       ROUND(AVG(r.rating), 2) AS avg_rating
FROM cte
JOIN reviews r ON cte.listing_id = r.listing_id
WHERE cte.cnt_listings >= 2
GROUP BY cte.host_id, cte.cnt_listings
ORDER BY avg_rating DESC
LIMIT 2;
