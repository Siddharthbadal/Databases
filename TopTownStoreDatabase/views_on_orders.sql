/*
During an disscussin when client asked to gt the data on monthy basis.
Created multiple views which will give the monthly and yearly group by data from tables.
*/
-- monthly sessions views
create view monthly_sessions as
select 
	year(created_at) as year,
	month(created_at) as month,
	utm_source,
    utm_campaign,
	count(website_session_id) as number_of_sessions	
from website_sessions
group by
	1,2,3,4
order by 
	1,2;
        
select * from monthly_sessions;

-- a view with monthly order volume and revenue 
create view monthly_orders_revenue as 
	select year(created_at) as year,
			month(created_at) as month,
            count(order_id) as orders,
            sum(price_usd) as revenue
		from orders
        group by 1,2
        order by 1,2;
            
            
select * from monthly_orders_revenue;            

-- view for monthly website traffic 
create view monthly_website_session as 
	select 
		year(created_at) as year,
        month(created_at) as month,
        count(website_session_id) as sessions_ids
	from website_sessions
        group by 1,2
        order by 1,2;

select * from monthly_website_session;        











