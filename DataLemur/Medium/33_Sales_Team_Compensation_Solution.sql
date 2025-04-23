WITH total_deals AS (
    SELECT 
        employee_id, 
        SUM(deal_size) AS total_sales
    FROM deals
    GROUP BY employee_id
),
compensation_calc AS (
    SELECT 
        ec.employee_id,
        ec.base,
        ec.commission,
        ec.quota,
        ec.accelerator,
        COALESCE(td.total_sales, 0) AS total_sales,
        CASE 
            WHEN COALESCE(td.total_sales, 0) >= ec.quota THEN 
                ec.base 
                + ec.quota * ec.commission 
                + (COALESCE(td.total_sales, 0) - ec.quota) * ec.commission * ec.accelerator
            ELSE 
                ec.base + COALESCE(td.total_sales, 0) * ec.commission
        END AS total_compensation
    FROM employee_contract ec
    LEFT JOIN total_deals td ON ec.employee_id = td.employee_id
)

SELECT 
    employee_id, 
    ROUND(total_compensation) AS total_compensation
FROM compensation_calc
ORDER BY total_compensation DESC, employee_id ASC;
