--
--Lab 2
--
--Taylor Dunn

select * 
from orders;

select ordno, totalusd
from orders;

select * 
from agents;

select name, city 
from agents 
where name = 'Smith';

select *
from products;

select pid, name, priceusd
from products
where qty > 200010;

select * 
from customers;

select name, city
from customers
where city = 'Duluth';

select name 
from agents
where city != 'New York' AND city != 'Duluth';

select * 
from products 
where city != 'Duluth'AND city != 'Dallas' AND 
priceusd >= 1.00;

select *
from orders 
where month = 'Mar' OR month = 'May';

select *
from orders 
where month = 'Feb' AND totalusd >=500.00;

select *
from orders
where cid = 'c005';


