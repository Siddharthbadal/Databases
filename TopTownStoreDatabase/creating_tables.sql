/*
1 -
Client asked to create a table for products with three values. 
The database name for now is toptownstore
	- product_id,
    - created_at
    - product_name
    
And gave two products details to be added.
	- The Original Jacket
    - The Formal jacket
*/
create database toptownstore;
create table products 
	(product_id INT,
    created_at timestamp,
    product_name varchar(55),
    primary key(product_id)
    );

insert into products values
	(1,'2012-04-14 09:00:00', 'The Original Jacket'),
    (2,'2012-04-14 09:00:00','The Formal jacket');

/*
2 -
Create two more tables. and import data from order and refund sheets csv file to these tables.
- order_items
- order_item_refunds

 imported the data usng import wizard, checked for any discrepancy. 
*/

/*
3 -
 for earlier data add product_id coulmn and value of 1
 order ids 153,154,218,220,288,287,371,375,389,391 are the only products for product_id 2.
*/

alter table order_items add product_id INT;

update order_items 
set product_id = 1
where order_item_id not in (153,154,218,220,288,287,371,375,389,391);

/*
4 -
# update further data by importing files in the both tables;
select * from order_items;
*/

# basic data check. 
SELECT count(*) as total_rows, max(created_at) as created_at_recent FROM order_items;
SELECT count(*) as total_rows, max(created_at) as created_at_recent FROM order_item_refunds;


/*
5 - 
# validate and  update table structure.
-- Management wants to try a new feature for existing clients where they are planning to 
-- cross sell products of the same category, if client has a product in cart
-- so the product added by customer is a primary item. this would help them understand is item sold was primary or not.
-- need a new column in in order_items table called is_primary_item

*/


alter table order_items add is_primary_item INT;
select * from order_items;
select * from order_item_refunds;


/*
6  - 
	Set new column is_primary_item = 1 for all privious records. 
	1 : all products cross sold.
	0 : not cross sold. (not added)
*/
-- SET SQL_SAFE_UPDATES = 0;
update order_items 
set is_primary_item = 1
where order_item_id > 0 ;


/*
7 -
	Add two new products. and also insert a new order and refund file in the database.
*/
select * from products;
insert into products values
	(3,'2013-12-11 09:00:00', 'The Ballon Shirt'),
    (4,'2014-02-04 10:00:00','The Logon Shorts');


/* 
9 - 
	Another  point raised by clinet was to check for any data related issues or intregity problems. 

	As a result
	-- Added constraints Not Null and Unique with primary keys in the tables; 
*/



