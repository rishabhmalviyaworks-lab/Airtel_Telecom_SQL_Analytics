                                                                Airtel Telecom Customer Analytics System

use airtel;

# Q1. Top 5 customers who made the highest total payments

SELECT c.customer_id,c.name,SUM(p.amount) AS total_payment FROM customer1 c
JOIN payments1 p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_payment DESC LIMIT 5;

# Q2. How many customers have an active OTT subscription

SELECT COUNT(DISTINCT customer_id) AS total_ott_users FROM  ott_subscription;

# Q3 Most Popular Plan (Highest Recharges)

SELECT p.plan_name, COUNT(r.recharge_id) AS total_recharges
FROM plans1 p
JOIN recharge r ON p.plan_id = r.plan_id
GROUP BY plan_name
ORDER BY total_recharges DESC LIMIT 5;

# Q4 Total Revenue Collected Per Plan

SELECT pl.plan_name, SUM(p.amount) AS total_revenue FROM  payments1 p
JOIN plans1 pl ON p.plan_id = pl.plan_id
GROUP BY pl.plan_name
ORDER BY total_revenue DESC;

# Q5. Most Active Customers by Number of Calls

SELECT c.customer_id, c.name, COUNT(cr.call_id) AS total_calls FROM  call_records cr
JOIN customer1 c ON cr.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_calls DESC LIMIT 10;

#Q6 Count of OTT Subscriptions per Platform

SELECT platform, COUNT(*) AS total_subscriptions FROM ott_subscription
GROUP BY platform;

# Q7 Customer with Longest Average Call Duration

SELECT c.customer_id, c.name, AVG(cr.duration_minutes) AS avg_call_duration FROM call_records cr
JOIN  customer1 c ON cr.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY avg_call_duration DESC LIMIT 10;

# Q8 Customer Without OTT Subscription 

CREATE VIEW no_ott_customerss AS
SELECT c.customer_id,c.name FROM customer1 c
LEFT JOIN ott_subscription o ON c.customer_id = o.customer_id
WHERE o.subscription_id IS NULL;
# views
select * from no_ott_customerss;






