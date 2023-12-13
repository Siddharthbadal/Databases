# Database Design and Creation For a Retail  Store

### Project Overview
Client apprached me to create a database for his retail business. and asked to design a database with tables and mutliple constraints, 
relationships and automated process. Initailly it was a order monitoing database with few tables, however as progressed client also 
aksed to add new multiple tables and new processes.

### Tools
- MySQL WorkBench
- MySQL Command Line

Initial Setup required to design a database and created tables. client also shared few csv files to upload. as we moved further added 
multiple new tables. Firgured out relationships among tables; eestablished primary keys and forgein keys with constraints and users.

### Database Schema
  - Tables
      - orders
      - order_items
      - order_item_refund
      - products
      - support_members
      - support_members
      - websites_sessions
      - users

Created an EER Diagram of the database.

![Diagram1](https://github.com/Siddharthbadal/Databases/assets/55015090/1922fc76-50f2-4eaa-9272-5164e669a3e4)

![Diagram2](https://github.com/Siddharthbadal/Databases/assets/55015090/f3cfe69f-966c-4b3a-a39a-803d36e86602)


For the convenience of the client, also created:
   - Views
       - monthly_sessions
       - monthly_orders_revenue
       - monthly_website_session
    - Triggers
       - order_summary_trigger
    - Stored Procedures
      -  orders_sp
      -  members_sp
    


Few most important tasks were creating triggers, views and stored procedures. these were created after a lot of disscussions and trial-errors.
a seperate user with only view permissions on database views was created.

Most of the tasks were performed by using mysql workbench and command line. For all the tasks sql queries were written. 
and for times workbench was used. 


Note: This is a freeelancing project. Original work done for a client. this is a replica of the work. Dummy data and tables name were used. 
Also database is fully functional on mysql.



