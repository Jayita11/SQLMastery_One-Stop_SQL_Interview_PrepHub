WITH first_operation AS (
    SELECT city_id, MIN(YEAR(business_date)) AS first_operation_year
    FROM business_operations
    GROUP BY city_id
)
SELECT first_operation_year, COUNT(city_id) AS no_of_new_cities
FROM first_operation
GROUP BY first_operation_year
ORDER BY first_operation_year;

