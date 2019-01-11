/*
Question 9) Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel.
That is, write an SQL query that will produce in one table a list of all the acceptable trunks that
can be used to route a call to the 416 area code, office code 334 have at least one idle channel.
This query should list the trunks in the order of preference.
(The answer should list trunks routes 416,334 then 416,000 then 000,000 for example)
*/

create temporary table count1 as
  select service, count(*) as counter from service_subscribers group by service;

  select trunk_routes.portid, area, office
  from trunk_routes, lines
  where ( area = 416 and office =334 and area =areacode and office = officecode and state ='IDLE') or
        (area = 416 and office ='000'and area =areacode and office = officecode and state ='IDLE') or
        ( area = '000' and office ='000'and area =areacode and office = officecode and state ='IDLE')
  order by area DESC, office DESC;

/*
select distinct trunk_routes.portid, area, office
from trunk_routes,lines
where area = 416 and office =334 and area =areacode and office = officecode and state ='IDLE'
UNION ALL
select distinct trunk_routes.portid, area, office
from trunk_routes,lines
where area = 416 and office ='000'and area =areacode and office = officecode and state ='IDLE'
UNION ALL
select distinct trunk_routes.portid, area, office
from trunk_routes,lines
where area = '000' and office ='000'and area =areacode and office = officecode and state ='IDLE';
*/
/*order by area, office DESC;
ASK TA ORDER
*/
/*
portid      area        office
----------  ----------  ----------
102         416         334
*/
