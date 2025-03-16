SELECT course_name,AVG(score) as avg_score
FROM students
WHERE student_id IN (
    SELECT DISTINCT student_id
    FROM students
    WHERE score < 70
)
GROUP BY course_name
HAVING AVG(score) > 70
order by avg_score desc
;