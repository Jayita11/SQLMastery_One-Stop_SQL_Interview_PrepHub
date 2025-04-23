WITH contract_data AS (
    SELECT 
        c.customer_id,
        num_seats * yearly_seat_cost AS annual_revenue,
        CASE 
            WHEN cu.employee_count < 100 THEN 'SMB'
            WHEN cu.employee_count BETWEEN 100 AND 999 THEN 'Mid-Market'
            ELSE 'Enterprise'
        END AS segment
    FROM contracts c
    JOIN customers cu ON c.customer_id = cu.customer_id
),
customer_revenue AS (
    SELECT 
        customer_id,
        segment,
        SUM(annual_revenue) AS total_revenue
    FROM contract_data
    GROUP BY customer_id, segment
)

SELECT 
    FLOOR(AVG(CASE WHEN segment = 'SMB' THEN total_revenue END)) AS smb_avg_revenue,
    FLOOR(AVG(CASE WHEN segment = 'Mid-Market' THEN total_revenue END)) AS mid_avg_revenue,
    FLOOR(AVG(CASE WHEN segment = 'Enterprise' THEN total_revenue END)) AS enterprise_avg_revenue
FROM customer_revenue;
