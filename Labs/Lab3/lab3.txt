-- 
-- Lab 3
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
