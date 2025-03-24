#Solution using Window FUNCTION RANK

WITH RankedCards AS (
    SELECT 
        card_name, 
        issued_amount, 
        issue_year, 
        issue_month, 
        RANK() OVER (PARTITION BY card_name ORDER BY issue_year ASC, issue_month ASC) AS rk
    FROM monthly_cards_issued
)
SELECT card_name, issued_amount
FROM RankedCards
WHERE rk = 1
ORDER BY issued_amount DESC;



#Solution using Window function FIRST_VALUE
SELECT DISTINCT card_name,
  FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year, issue_month)
  AS issued_amount
FROM monthly_cards_issued
ORDER BY issued_amount DESC