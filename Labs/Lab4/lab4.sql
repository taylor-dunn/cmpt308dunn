-- 
-- Lab 4
-- 
-- Taylor Dunn 

--1--
select city
from agents 
where aid in 
	(select aid 
    from orders 
    where cid = 'c006');
    
--2--    
select distinct pid
from orders 
where aid in 
	(select aid 
    from orders 
    where cid in
    	(select cid 
    	from customers 
    	where city = 'Beijing'))
        order by pid DESC;
        
--3--
select distinct cid, name 
from customers 
where cid not in
	(select distinct cid 
    from orders 
    where aid = 'a03');
    
    
--4--
select distinct cid 
from customers 
where cid in 
	(select cid 
    from orders 
    where pid = 'p01'
    intersect
    select cid 
    from orders 
    where pid = 'p07');
    
--5--
select distinct pid 
from products
where pid not in (
     select pid
     from orders
     where aid in (
    	select aid 
    	from orders
        where aid ='a02'
        or aid = 'a03'))
		order by pid DESC;
      
--6--     
select distinct name, discountpct, city 
from customers 
where cid in
	(select distinct cid 
    from orders 
    where aid in (
        select distinct aid
        from agents 
        where city =
        'Tokyo' or city ='New York'));
        
--7--
select * 
from customers
where  not city = 'Duluth' 
intersect 
select *
from customers 
where not city = 'London' and 
discountpct in (
    select discountpct 
    from customers  
     where city = 'Duluth' or city = 'London');
     
--8--     
Check constraints are limitations that put a control to the values that are accepted by the columns 
being returned. A check constraint can be used with any logical expression that returns True or False.
Check constraints are useful because they control the data being outputted, in turn increasing dsta validity
and integrity. It is also very helpful because it enforces rules throughout the database, without 
adding additional logic to the application. Some good uses of a test constraint would be when trying to only
find the salary between two values, you could insert salary >= 15000 AND salary <= 100000. This will only 
return values between the two, and give valid data that is wanted. A bad test constraint would be one where 
you check for values and leave out important ones, or maybe include too much information when it could have 
been limited even more.

http://www.datanamic.com/support/checkconstraintbenefits.html
https://technet.microsoft.com/en-us/library/ms188258(v=sql.105).aspx
