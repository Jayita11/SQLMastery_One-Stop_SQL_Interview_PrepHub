SELECT Email,
       SUBSTRING(Email, LOCATE('@', Email) + 1) AS domain_name 
FROM customers;
