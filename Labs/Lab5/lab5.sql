-- 
-- Lab 5 --
-- 
-- Taylor Dunn
--
--10.9.17

-- 1 --
select agents.city
	from agents
	inner join orders on agents.aid = orders.aid
	where cid = 'c006';


-- 2 --
select distinct products.pid 
	from products, orders agentO, orders o1, customers
	where products.pid = o1.pid
	and customers.city = 'Beijing'
	and customers.cid = agentO.cid
	and agentO.aid = o1.aid
	order by products.pid desc;
   
   
-- 3 --
select distinct name from customers
      where not cid in 
      (select cid 
       from orders
      );
      
-- 4 --
select distinct customers.name
      from customers 
      left join orders on customers.cid = orders.cid
      where orders.cid is null;
      
-- 5 --
select distinct customers.name, agents.name 
		from customers, agents, orders 
		where customers.city = agents.city
		and customers.cid = orders.cid
		and orders.aid = agents.aid;

-- 6 -- 
select distinct customers.name, agents.name, agents.city 
      from customers, agents
      where customers.city = agents.city;
     
-- 7 --
select distinct customers.name, customers.city 
      from customers
      where city in (select city
                     from products 
                     group by city
                     order by count(pid) asc 
                     limit 1
                     );

