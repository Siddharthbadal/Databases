/*
	After disscussion on orders and To make things easier, advised clint to have some automation in orders data.
    a table is to be crated that would auto populate the data on new order.    
    So a trigger [automated procedure] for whenever a new order added, 
    insert or update the orders data
    
    Steps:
		- create a tables - orders
        - inserted the data from orders_items
        - created a trigger on orders table
*/

create table orders(
	order_id bigint,
    created_at datetime,
    website_session_id bigint,
    primary_product_id bigint,
    item_pruchased bigint,
    price_usd decimal(6,2),
    cogs_usd decimal(6,2),
    primary key (order_id)
);

insert into orders
select
	order_id,
    min(created_at) as created_at,
    min(website_session_id) as website_session_id,
    sum(case 
			when is_primary_item = 1 then product_id
			else null
			end) as primary_product_id,
    count(order_item_id) as item_pruchased,
    sum(price_usd) as price_usd,
    sum(cogs_usd) as cogs_usd
from order_items
group by order_id
order by order_id;

-- Trigger 
create trigger insert_new_orders 
after insert on order_items
for each row

replace into orders
select
	order_id,
    min(created_at) as created_at,
    min(website_session_id) as website_session_id,
    sum(case 
			when is_primary_item = 1 then product_id
			else null
			end) as primary_product_id,
    count(order_item_id) as item_pruchased,
    sum(price_usd) as price_usd,
    sum(cogs_usd) as cogs_usd
from order_items
where order_id = new.order_id
group by order_id
order by order_id;


-- testing the trigger 
-- SELECT max(created_at), max(order_id), max(website_session_id) FROM toptownstore.order_items;
-- insert into order_items values
-- 	(14344,'2015-01-01 10:00:00', 14344, 59.99,29.99,239373, 2,1)








    