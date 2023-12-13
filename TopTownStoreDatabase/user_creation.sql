-- Create a user for views who only has access for views in the database

create user 'views_user'@'localhost' IDENTIFIED BY 'user1234';
grant select, show view on toptownstore.monthly_orders_revenue to views_user@localhost;
grant select, show view on toptownstore.monthly_sessions to views_user@localhost;
grant select, show view on toptownstore.monthly_website_session to views_user@localhost;

-- REVOKE ALL PRIVILEGES ON *.* FROM 'views_user'@'localhost';
-- show grants for views_user@localhost;