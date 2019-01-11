/*
Question 10) Produce a table that lists the name
of all the service-subscribers that subscribe
to at least all the same services as Jason Allison
subscribes to but possibly others as well. J
ason Allison rents the line with portID=2.
*/
select portid, name from subscribers s
where not exists
(select service from service_subscribers
where line = 2
except
select service
from service_subscribers
where line = s.portid
);

/*
portid      name
----------  -------------
2           Jason Allison
6           Michael Jorda
10          Joe Carter
18          Homer Simpson
48          Matt Stajan
*/
