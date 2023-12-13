/*
Adding a New Process 
Company is planing for a chat support to the website. 
Client has asked to desgin a database and create tables to track 
which all customers and sessions are invloved in the chat. 
Also need details about the chat support representative
*/
-- Database Desgin
-- Tables
	-- users
		-- user_id
        -- created_at
        -- first_name
        -- last_name
	-- support_members 
		-- support_member_id
        -- created_at
        -- first_name
        -- last_name
	-- chat session
		-- chat_session_id
        -- created_at
        -- user_id
        -- support_member_id
		-- website_session_id
	-- chat messages
		-- chat_message_id
        -- created_at 
        -- chat_session_id
        -- user_id [not applicable for support members]
        -- support_member_id [ not applicable for users ]
        -- message_text
        
/*
 Also Need to create an EER daiagram with the existing tables in the database
 and build relationships. 
 
 TopandTownDB-EER Daiigram image attached
*/

/*
-- creating tables for chat process.
*/        
        
create table users(
		user_id bigint,
        created_at bigint,
        first_name bigint,
        last_name bigint,
        primary key(user_id)                
);
create table support_members (
		support_member_id bigint,
        created_at datetime,
        first_name varchar(55),
        last_name varchar(55),
        primary key(support_member_id)
);

create table chat_sessions(
		chat_session_id bigint,
        created_at datetime,
        user_id bigint,
        support_member_id bigint,
		website_session_id bigint,
        primary key(chat_session_id),
  		foreign key (user_id) references users(user_id),
        foreign key (support_member_id) references support_members(support_member_id),
        foreign key (website_session_id) references website_sessions(website_session_id)
);
        
create table messages(
		chat_message_id bigint,
        created_at datetime,
        chat_session_id bigint,
        user_id bigint,
        support_member_id bigint,
        message_text text, 
        primary key(chat_message_id),
        foreign key (user_id) references users(user_id),
        foreign key (support_member_id) references support_members(support_member_id),
        foreign key (chat_session_id) references chat_sessions(chat_session_id)
        );
    
        
        