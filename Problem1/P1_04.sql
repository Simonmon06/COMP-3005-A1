/*
Question 4) Find the names and address of all subscribers who
subscribe to all of the available services.
(Note the result for the current data might be empty
but your query should work if the TA's add more data to the databse.)
*/
create temporary table count_service as
  select line, count(*) as service_count from service_subscribers group by line;

create temporary table num_service as
  select count(*) as service_num from services;

select name, address
from subscribers, count_service, num_service
where subscribers.portid = count_service.line and service_count = service_num;

/*

No expected output, because in current database there are  no subscriber who subscribe
to all of the available services.
*/
