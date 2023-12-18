-- Show the email, name and surname of the users ordered by their surname and name.

select email, name, surnames
from uuser
order by surnames, name;

-- E-mail of the users whose postal code is not either 02012, 02018 or 02032.
select email from uuser
where postcode not in ('02012','02018','02032');

-- Birth date of the oldest user.
SELECT birthday
FROM uuser
WHERE age = (SELECT MAX(SYSDATE - birthday) FROM uuser);

--or
SELECT MIN(birthday)
FROM uuser

-- Orders (order number and user) that contain more than four different articles.
select orr.numOrder,orr.uuser, count(distinct article)
from orrder orr, linorder lin
where orr.numOrder=lin.numOrder
group by orr.numOrder,orr.uuser
having count(distinct article)>4;

-- E-mail and name of the users that have made none or only one order.
SELECT uu.email, uu.name
FROM uuser uu LEFT JOIN
orrder orr
ON uu.email= orr.uuser
HAVING COUNT(orr.numOrder) <=1 OR COUNT(orr.numOrder) IS NULL

-- Order number and user of the orders with a cost higher than 4000 euros.
select orr.numOrder,orr.uuser
from orrder orr, linOrder lin
where orr.numOrder=lin.numOrder
group by orr.numOrder,orr.uuser
having sum(lin.amount*lin.price)>4000;

-- Create a view called “v_double_check” that contains the room numbers of category
-- D. Create it using WITH CHECK OPTION
create view v_double_check
as select roomNumber 
   from room
  where category='D'
with check option;