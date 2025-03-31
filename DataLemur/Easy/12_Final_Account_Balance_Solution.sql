SELECT COUNT(CASE
       WHEN product = 'TurboTax Desktop 2019' OR product = 'TurboTax Deluxe' OR product = 'TurboTax Online'
       THEN 1
       END) AS turbotax_total,
       
      COUNT(CASE
       WHEN product = 'QuickBooks Desktop Pro' OR product = 'QuickBooks Online'
       THEN 1
       END) AS quickbooks_total
FROM filed_taxes