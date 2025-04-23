#Using the transactions table, identify any payments made at the same merchant with the same credit card for the same amount 
#within 10 minutes of each other. Count such repeated payments.

#Assumption: The first transaction of such payments should not be counted as a repeated payment. This means that if a merchant performs 
#2 transactions with the same credit card and for the same amount within 10 minutes, there will only be 1 repeated payment.

#Output Schema
#Column                      Type
#repeated_payment_count      INT



WITH repeated_transactions AS (
  SELECT t2.id
  FROM transactions t1
  JOIN transactions t2
    ON t1.merchant = t2.merchant
   AND t1.credit_card = t2.credit_card
   AND t1.amount = t2.amount
   AND t2.transaction_time > t1.transaction_time
   AND t2.transaction_time <= datetime(t1.transaction_time, '+10 minutes')
)
SELECT COUNT(*) AS repeated_payment_count
FROM repeated_transactions;
