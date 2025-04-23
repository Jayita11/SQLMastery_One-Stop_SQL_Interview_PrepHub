#Given a table of song_plays and a table of users, write a query to extract the earliest date each user played 
#their third unique song and order by date played.

#Output Schema:
#Column       Type
#username    STRING
#song_id      INT
#created_at  DATETIME


WITH first_song_plays AS (
    SELECT 
        user_id,
        song_id,
        MIN(played_at) AS first_played_at
    FROM 
        song_plays
    GROUP BY 
        user_id, song_id
),
ranked_song_plays AS (
    SELECT 
        user_id,
        song_id,
        first_played_at,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY first_played_at) AS song_rank
    FROM 
        first_song_plays
),
third_song_plays AS (
    SELECT 
        user_id,
        song_id,
        first_played_at AS created_at
    FROM 
        ranked_song_plays
    WHERE 
        song_rank = 3
)
SELECT 
    u.username,
    t.song_id,
    t.created_at
FROM 
    third_song_plays t
JOIN 
    users u ON u.id = t.user_id
ORDER BY 
    t.created_at;