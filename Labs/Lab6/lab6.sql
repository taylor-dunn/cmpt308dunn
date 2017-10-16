--
--
--Lab 6--
--
--10.15.17                      
    
    
    
    
--1--    
select distinct customers.name, customers.city
from customers 
inner join products on products.city = customers.city
where products.city in (select city
                        from (select city, count(*)
                              from products
                              group by city                       
                              order by count ASC                            
                    		  
                              limit 1
                              )sub
                        );
                        
                        
--2--
select distinct name 
from products 
where priceUSD>(select avg (priceUSD)
                        from products)
                        order by name desc;
                        
                        
--3--
select distinct customers.name, orders.pid, orders.totalUSD 
from customers 
inner join orders on orders.cid = customers.cid
order by orders.totalUSD ASC;

--4--
select name, sum(COALESCE(totalUSD,0) ) as "totalAmountOrdered"
from customers 
left outer join orders on orders.cid = customers.cid
group by customers.name
order by customers.name asc;

--5--
select customers.name, products.name, agents.name
from customers  
inner join orders on customers.cid = orders.cid 
inner join agents on orders.aid = agents.aid
inner join products on orders.pid = products.pid
where agents.city = 'Newark';

--6--
select ordno, month, orders.cid, orders.aid, orders.pid, orders.quantity,
totalUSD as "totalUSDfromOrders",
(orders.quantity*products.priceUSD - (orders.quantity*products.priceUSD*(customers.discountpct/100))) as "CalculatedUSD"
from orders
inner join products on orders.pid = products.pid
inner join customers on orders.cid = customers.cid
where orders.totalUSD != (orders.quantity*products.priceUSD -(orders.quantity*products.priceUSD*(customers.discountpct/100)))
;

--7--
--What is the difference between a left outer join and a right outer join? 

To explain I will use an example. Let us imagine that each student is assigned a textbook at the beginning of the year.
This would mean that under the table student, each student has a TextbookNumber. In this example, there are 50 students and
only 30 textbooks. This means that 30 students will have textbooks, and 20 will not. 

A left outer join would basically state, output all of the students with their TextbookNumber if they have one. If not, the 
output would return as NULL.

A right outer join would return all of the textbooks, with their corresponding numbers if they have them, if there are any to return.
                        
The left statement is whichever is written first in the join query, so it is incredibly important to be mindful of this 
when conducting queries.

Basically, right and left outer joins are the same thing. The only difference is that the left will output all of the "left" 
column values with their corresponding values whether null or not, and the right will output all of the right columns
information with the corresponding left table output, null or not.
                        
                        


