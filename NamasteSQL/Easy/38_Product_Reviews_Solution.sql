SELECT review_id,product_id,review_text
FROM product_reviews
WHERE(lower(review_text) LIKE '% excellent%' 
	  OR 
      lower(review_text) LIKE '% amazing%') 
AND lower(review_text) NOT LIKE '%not excellent%'
AND lower(review_text) NOT LIKE '%not amazing%'
ORDER BY review_id ASC;
