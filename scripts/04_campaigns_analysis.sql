## Workstream 3: Get to know the campaigns


# Number of Campaigns fall under each campaign_type
select campaign_type, count(campaign_id) as total_campaign
from campaign
group by campaign_type
order by total_campaign desc;
-- Highest -> Socialmediamarketing: 284


# Avg budget_inr per campaign_type
select campaign_type, round(avg(budget_inr),2) as avg_budget_inr
from campaign
group by campaign_type
order by avg_budget_inr desc;
-- Highest -> Payperclick: 82976.47


# Top 10 campaigns with the highest budget
select campaign_name, budget_inr 
from campaign
order by budget_inr desc
limit 10;
-- Highest -> PPC - App Installs: 149994


# Which clients are currently running 3 or more marketing campaigns? (calculate it by using cte as well as having)
select c.client_id, c.business_name, count(*) as total_campaigns
from clients c
join campaign ct 
on ct.client_id = c.client_id
group by c.client_id, c.business_name
having COUNT(*) >= 3
order by total_campaigns desc;
-- Highest: -> client_id: CL0245 (10)

-- using cte
with campaign_counts as(
select client_id, count(*) as total_campaigns
from campaign
group by client_id
)
select c.client_id, c.business_name, cc.total_campaigns
from campaign_counts cc
join clients c
on c.client_id = cc.client_id
where cc.total_campaigns >= 3
order by cc.total_campaigns desc;