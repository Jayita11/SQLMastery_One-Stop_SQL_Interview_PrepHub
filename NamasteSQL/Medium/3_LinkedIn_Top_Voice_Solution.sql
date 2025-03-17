select c.creator_name,
       COUNT(p.post_id) as no_of_posts, 
       SUM(p.impressions) as total_impressions
from creators c
INNER JOIN posts p
ON c.creator_id = p.creator_id
WHERE MONTH(p.publish_date) = 12 AND YEAR(p.publish_date) = 2023 AND c.followers > 50000
GROUP BY c.creator_name
having total_impressions>100000 and no_of_posts>=3 ;


