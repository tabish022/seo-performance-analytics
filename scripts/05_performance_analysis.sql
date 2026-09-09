## Workstream 4: Performance analysis


# Total spend_inr & total revenue_inr for the whole market
select 'total_spending' as measure_name,
round(sum(spend_inr),2) as measure_value
from campaign_performances
union all
select 'total_revenue' as measure_name,
round(sum(revenue_inr),2) as measure_value
from campaign_performances;
--  total_spending:653288094.17, total_revenue:3295303581.77


# Which campaign_type generates the most total revenue?
select c.campaign_type, round(sum(ca.revenue_inr),2) as total_revenue
from campaign_performances ca
join campaign c
on c.campaign_id = ca.campaign_id
group by c.campaign_type
order by total_revenue desc
limit 1;
-- Payperclick:1605939843.57


# Avg conversion_rate_pct per platform
select c.platform, round(avg(ca.conversion_rate_pct),2) as avg_conversion_rate_pct
from campaign_performances ca
join campaign c
on c.campaign_id = ca.campaign_id
group by c.platform
order by avg_conversion_rate_pct desc;
-- Highest -> Google My Business:7.2


# Rank agencies by total revenue generated for their clients, using RANK()  
select a.agency_name, 
round(sum(cp.revenue_inr),2) as total_revenue,
rank() over(order by round(sum(cp.revenue_inr),2) desc) as revenue_rnk
from campaign_performances cp
join campaign ca
on ca.campaign_id = cp.campaign_id
join clients c
on c.client_id = ca.client_id
join agencies a
on a.agency_id = c.agency_id
group by a.agency_name
order by revenue_rnk;
-- Rank 1 -> PixelGrowth Partners:174717109.13