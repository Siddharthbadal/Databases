/*
For the new chat process created, client would also like 
to get a process query created that show chat count in a period for a support member.

-- Created a stored process with three arguments:
	- support member id
    - start dtae
    - end date
*/


delimiter //

create procedure support_member_chat_details
(in supportmemberid bigint, instare_date date, in end_date date)
begin
	select 
		count(chat_session_id) as chat_count
	from 	
		chat_sessions
	where date(created_at) between start_date and end_date
    and support_member_id = supportmemberid;

end//

delimiter ;

-- call support_member_chat_details(1, '2015-01-01','2015-06-310')