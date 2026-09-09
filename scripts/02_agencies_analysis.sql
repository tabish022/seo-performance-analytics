## Workstream 1: Get to know the agencies


# Total agencies per area
select area, count(agency_name) as total_agency
from agencies
group by area
order by total_agency desc;
-- Highest -> Rajajipuram:7


# Top 10 highest-rated agencies
select agency_id, agency_name, google_rating 
from agencies
order by google_rating desc
limit 10;
-- Highest -> PixelMarketing:5.8


# Avg employee count per agency, and which agency is the biggest
select agency_name, employee_count
from agencies
order by employee_count desc;
-- Biggest -> ZenithInfotech:126 (We dont use avg function here as all the agency names are distinct and unique)


# Categorising agencies by size (using case expression)
select 
case
when employee_count < 30 then "small"
when employee_count < 80 then "mid"
else "Large"
end as companies_size,
count(agency_name) as total_agency
from agencies
group by companies_size
order by total_agency desc;
-- Small companies:7, Mid companies:23, Large companies:15