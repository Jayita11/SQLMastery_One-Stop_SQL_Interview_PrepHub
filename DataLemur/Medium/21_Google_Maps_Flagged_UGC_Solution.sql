WITH reviews AS (
    SELECT
        place_category,
        COUNT(ugc.content_id) AS content_count
    FROM place_info place
    INNER JOIN maps_ugc_review ugc
        ON place.place_id = ugc.place_id
    WHERE LOWER(content_tag) = 'off-topic'
    GROUP BY place_category
),
top_place_category AS (
    SELECT
        place_category,
        content_count,
        RANK() OVER (
            ORDER BY content_count DESC
        ) AS top_place
    FROM reviews
)
SELECT place_category AS off_topic_places
FROM top_place_category
WHERE top_place = 1
ORDER BY place_category;
