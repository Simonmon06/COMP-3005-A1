/*
Question 6) Produce a table that lists the most popular service (or services).
That is, give the name of the service that has the most subscribers.
*/
create temporary table count1 as
  select service, count(*) as counter from service_subscribers group by service;


select services.service
from services, count1
where scode =count1.service and counter = (SELECT max(counter) FROM count1);


/*
service
--------------
Message Answer
*/
