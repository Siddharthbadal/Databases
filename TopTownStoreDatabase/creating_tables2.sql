/*
11 -
Client has a new set of processes and 
now client has shered more fileds and asked to uploaded these files with existing data. 
Also there are two new tables has to be created.
 - websites_sessions
 - websites_priviliges 
 
*/

create table website_sessions(
	website_session_id bigint,
    created_at datetime,
    user_id bigint,
    is_repeat_session int,
    utm_source varchar(50),
    utm_campaign varchar(50),
    http_referer varchar(100),
    primary key (website_session_id)
);


create table website_pageviews(
	website_pageview_id bigint,
	created_at datetime,
	website_session_id bigint,
	pageview_url varchar(50),
	primary key (website_pageview_id)
);


# Data check.
select * from order_items; 
SELECT count(*) as total_rows FROM order_items;
SELECT count(*) as total_rows FROM order_item_refunds;

/*
12 -
	Get the monthly count for the tables
*/
select 
	year(created_at) as year,
    month(created_at) as month,
    count(*) as Total
from order_items
	group by 1,2
    order by 1,2;

select 
	year(created_at) as year,
    month(created_at) as month,
    count(*) as Total
from order_item_refunds
	group by 1,2
    order by 1,2;

select 
	year(created_at) as year,
    month(created_at) as month,
    count(*) as Total
from website_sessions
	group by 1,2
    order by 1,2;
        
select 
	year(created_at) as year,
    month(created_at) as month,
    count(*) as Total
from website_pageviews
	group by 1,2
    order by 1,2;








