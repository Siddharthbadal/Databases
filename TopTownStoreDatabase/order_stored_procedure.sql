/*
client has asked to create a data report that would show them a data figure
for a product in a defined time period. this is for the yealy count and revenue of orders.

*/
-- created a stored_procedure for the client. 
-- stored_procedure takes two arguments : start_date and end_date

DELIMITER //

create procedure order_performance_yearly(in start_date date, in end_date date)
begin
select 
	count(order_id) as total_orders,
    sum(price_usd) as total_revenue
from order_items
where date(created_at)  between start_date and end_date;

end //
DELIMITER ;

call order_performance_yearly('2013-01-01', '2013-12-31')
-- drop procedure order_performance_yearly;  -- delete the procedure



