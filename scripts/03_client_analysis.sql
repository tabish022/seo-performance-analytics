## Workstream 2: Get to know the clients


# Clients per agency
select agency_name , count(distinct client_id) as total_clients
from clients c
join agencies a
on c.agency_id = a.agency_id
group by agency_name
order by total_clients desc;
-- Highest -> ZenithGrowth Partners:11


# Active vs Inactive clients
select client_status, count(client_id) as total_clients
from clients
group by client_status
order by total_clients desc;
-- Active: 251, Inactive: 69


# Industry with the most clients
select industry, count(client_id) as total_clients
from clients
group by industry
order by total_clients desc
limit 1;
-- Fitness & wellness with 28 clients


# Avg monthly_retainer_inr per industry
select industry, round(avg(monthly_retainer_inr),2) as avg_monthly_retainer_inr 
from clients
group by industry
order by avg_monthly_retainer_inr;
-- Highest monthly_retainer_inr -> Restaurants & Cafes:20533.71