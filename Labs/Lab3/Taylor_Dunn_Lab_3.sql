--
--Lab 3
--
--Taylor Dunn

select * 
from orders;

select *
from products;

select * 
from customers;

select * 
from agents;

-- 1 --
select ordno, totalusd
from orders;


-- 2 --
select name, city 
from agents 
where name = 'Smith';


-- 3 --
select pid, name, priceusd
from products
where qty > 200010;


-- 4 --
select name, city
from customers
where city = 'Duluth';

-- 5 --
select name 
from agents
where city != 'New York' AND city != 'Duluth';

-- 6 --
select * 
from products 
where city != 'Duluth'AND city != 'Dallas' AND 
priceusd >= 1.00;

-- 7 --
select *
from orders 
where month = 'Mar' OR month = 'May';

-- 8 --
select *
from orders 
where month = 'Feb' AND totalusd >=500.00;

-- 9 --
select *
from orders
where cid = 'c005';


