/*
Question 5) Find the names of all the subscribers who subscribe to at least three services.
*/
create temporary table count_service as
  select line, count(*) as counter from service_subscribers group by line;

select name
from subscribers, count_service
where portid =line and counter > 2;


/*
name
--------------
Michael Jordan
Joe Carter
Homer Simpson
Vince Carter
Chris Pronger
Frank Thomas
Steve Sampras
Matt Stajan
*/
