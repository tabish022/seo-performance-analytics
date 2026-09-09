# Fixing few data types before writing queries

alter table agencies
modify founded_year year,
modify agency_id char(5),
modify employee_count int;

alter table campaign
modify campaign_id char(8),
modify client_id char(6),
modify start_date date,
modify end_date date;

alter table campaign_performances
modify campaign_id char(8),
modify date date;

alter table clients
modify client_id char(6),
modify agency_id char(5),
modify onboarding_date date;