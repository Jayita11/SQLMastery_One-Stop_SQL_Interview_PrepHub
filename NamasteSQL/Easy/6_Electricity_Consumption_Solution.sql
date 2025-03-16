SELECT household_id ,
       LEFT(billing_period,4) AS  bill_year ,
       SUM(consumption_kwh) AS consumption_kwh,
       SUM(total_cost) AS total_cost,
       AVG(consumption_kwh) AS avg_consumption_kwh
 FROM electricity_bill
 GROUP BY household_id , bill_year
 ORDER BY household_id , bill_year
       