--Taylor Dunn--
--Database Final--
--12-4-2017--



-- CREATE STATEMENTS-----------------------------


﻿--create table attractions --
CREATE TABLE attractions (
    attraction_id				char(3)			not null,
    attraction_name				text			not null,
    attraction_description		text			not null,
    primary key (attraction_id)  
);


--create table hotels--
CREATE TABLE hotels (
    hotel_id				char(7)			not null,
    street_address			text			not null,
    city					text			not null,
    state					text			not null,
    zipcode					integer			not null,
    hotel_name				text			not null,
    owner_firstname			text			not null,
    owner_lastname			text			not null,
    attraction_id			char(3)			not null,
    primary key (hotel_id),
    foreign key (attraction_id) references attractions (attraction_id)   
);


--create table people--

CREATE TABLE people (
   PID				char(5)		not null,		
   first_name		text		not null,
   last_name		text		not null,
   street_address	text		not null,
	state	   		text		not null,
    zipcode	   		integer		not null,
   birthday 		date 		not null,
   contact_number	text		not null,
   email_address	text		not null,
primary key (PID)
);



 --create table job type--   

CREATE TABLE job_type (
   job_id		 	char(2)		not null,
   job_name			text		not null,
   job_description	text		not null,
primary key (job_id)
);


--create table employees--

CREATE TABLE employees (
	employee_id		char(3)		not null,
	PID			 	char(5) 	not null,
    job_id		 	char(2)		not null,
    hire_date		date		not null,
    hourly_wageusd  decimal(15,2) not null,   
primary key (employee_id),
foreign key (PID) references people(pid),
foreign key (job_id) references job_type (job_id)
);
    


--create table timesheet--

CREATE TABLE timesheet (
    timesheet_insert_id 	char(10)         not null,
    employee_id				char(3)			not null,
    date					date			not null,
    time_in					time			not null,
    time_out				time			not null,
    total_hours				integer			not null,
    primary key (timesheet_insert_id),
    foreign key (employee_id) references employees (employee_id)
);

  

-- create table customer ---

CREATE TABLE customers (
    PID				char(3) 	not null,
    customer_id		char(3)		not null,  
primary key (customer_id),
foreign key (pid) references people (pid)
);



--create table miscellaneous charges--

CREATE TABLE miscellaneous_charges (
    miscellaneous_charges_id			char(3)			not null,
    name								text			not null,
    chargesUSD							decimal(15,2)  	not null,
    description							text			not null,    
primary key (miscellaneous_charges_id)
);



--create table room_status --

CREATE TABLE room_status (
    status_id			char(2)			not null,
    status_name			text			not null,
    status_description	text   	    	not null,   
primary key (status_id)
);


--create table room_type --

CREATE TABLE room_type (
    roomtype_id			char(8)			not null,
    room_name			text			not null,
    max_guest			integer   	    not null,
    smoking				boolean   	    not null,
    description			text  	    	not null,
    room_priceUSD		decimal(15,2)  	 not null, 
primary key (roomtype_id)
);


--create table rooms--

CREATE TABLE rooms (
    room_id				char(6)			not null,
    roomtype_id			char(10)			not null,
    room_number			char(5) 		not null,
    floor_number		integer   	    not null,
    status_id 			char(2)			not null, 
primary key (room_id),
foreign key (roomtype_id) references room_type (roomtype_id),
foreign key (status_id) references room_status (status_id)
);


--create table reservations--

CREATE TABLE reservations (
    reservation_id		char(8)			not null,
    room_id				char(6)			not null,
    check_in			date 			not null,
    check_out			date   	    	not null,
    no_of_guests  		char(8)			not null,
    smoking 			boolean			not null, 
primary key (reservation_id),
foreign key (room_id) references rooms (room_id)
);




-- create table payment type ---

CREATE TABLE payment_type (
    payment_type_id	char(2) 	not null,
    payment_name 	text		not null,  
primary key (payment_type_id)
);


-- create table payment ---

CREATE TABLE payment (
	payment_id			char(3) 	not null,
    payment_type_id		char(2)		not null,
primary key (payment_id),
foreign key (payment_type_id) references payment_type (payment_type_id)
);


--create table transactions--

CREATE TABLE transactions (
    transaction_id 					char(8)			not null,
    reservation_id					char(8) 		not null,
    employee_id						char(3) 		not null,
    payment_id						char(3)			not null,
    customer_id						char(3) 		not null,
    hotel_id						char(3)     	not null,  
primary key (transaction_id),
foreign key (hotel_id) references hotels (hotel_id),
foreign key (reservation_id) references reservations (reservation_id),
foreign key (employee_id) references employees (employee_id),
foreign key (payment_id) references payment (payment_id)
);


--create table miscellaneous charges add--

CREATE TABLE miscellaneous_charges_add (
    miscellaneous_charges_id					char(3)			not null,
    transaction_id								char(8)			not null,
    foreign key (miscellaneous_charges_id) references miscellaneous_charges (miscellaneous_charges_id),
    foreign key (transaction_id) references transactions (transaction_id)
);




--create table memberships--

CREATE TABLE memberships (
   membership_id 			char(8)		not null,
    PID						char(3)		not null, 					
    customer_id				char(3)    	not null,
    username				text		not null,
    password				text 		not null,
    date_of_membership 		date		not null,  
primary key (membership_id),
foreign key (pid) references people (pid),
foreign key (customer_id) references customers (customer_id)
);




--DROP TABLES --
DROP TABLE IF EXISTS attractions CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS hotels CASCADE;
DROP TABLE IF EXISTS job_type CASCADE;
DROP TABLE IF EXISTS memberships CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS miscellaneous_charges CASCADE;
DROP TABLE IF EXISTS miscellaneous_charges_add CASCADE;
DROP TABLE IF EXISTS payment_type CASCADE;
DROP TABLE IF EXISTS people CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS room_status CASCADE;
DROP TABLE IF EXISTS room_type CASCADE;
DROP TABLE IF EXISTS rooms CASCADE;
DROP TABLE IF EXISTS timesheet CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;




﻿--INSERT STATEMENTS--

--attractions--

insert into attractions 
values ('a1', 'Hotel', 'Places to stay in the area');

insert into attractions 
values ('a2', 'FDR Museum', 'Places to check out history of the area');

insert into attractions 
values ('a3', 'Riverwalk', 'Places to explore the area');

insert into attractions 
values ('a4', 'Restaurants', 'Places to eat in the area');


--hotels--
insert into hotels 
values ('h1', '123 Galway Lane', 'Liverpool', 'Texas', '12894', 'The Dunn Hotel', 'Taylor', 'Dunn', 'a1');

insert into hotels 
values ('h2', '134 Hello Street', 'Hampton Bays' , 'New York' , '12345', 'The Hilly Hall', 'John', 'Cena', 'a1');


--people--
    
insert into people 
values ('p1','Jason','Haley','13 School Street', 'New York', '11946', '1978-11-08', '4587390869', 'jason.haley@gmail.com');

insert into people 
values ('p2','Scott','Fritsch','10 Emerson Court', 'New York', '11946', '1989-06-04', '1234567890', 'scott.fritsch@gmail.com');

insert into people 
values ('p3','Jami','Domenico','15 Maple Court', 'New Jersey', '18977', '1997-04-01', '6312546789', 'jami.domenico@optonline.com');

insert into people 
values ('p4','Alan','Laboseur','255 Honey Drive', 'New York', '12601', '1985-09-02', '1118675301', 'alan.lab@coolguy.com');

insert into people 
values ('p5','Jack','Heuber','123 Talk Road', 'New York', '12445', '1998-10-07', '1345879978', 'talkingguy@talksalot.com');

insert into people 
values ('p6','Dave','Connelly','15 Bae Court', 'Rhode Island', '12366', '1997-11-10', '1879087890', 'jefferyjeffery@fake.com');

insert into people 
values ('p7','Taylor','Connelly','17 Harbor Road', 'Riverhead', '14577', '1997-11-01', '6316805787', 'taylor.kathryn@marist.edu');

insert into people 
values ('p8','John','Sasso','40 Bestfriend Lane', 'New Jersey', '12889', '1997-12-17', '2267897765', 'john.sasso@bestie.com');

insert into people 
values ('p9','Shannon','Cover','33 Oak Ave', 'New York', '89059', '1990-06-19', '0987654321', 'shannon.cover5@gmail.com');

insert into people 
values ('p10','Sreya','Sobti','1334 Linda Lane', 'Pennsylvania', '37890', '1995-12-30', '7778987654', 'sreyasobti@india.com');



--job type --
insert into job_type 
values ('90', 'Front Desk', 'Person aids customers at the front desk' );

insert into job_type 
values ('91', 'Housekeeping', 'Person cleans the hotel rooms once guests leave' );

insert into job_type 
values ('92', 'Manager', 'Person looks over other staff in hotel' );

insert into job_type 
values ('93', 'Bell Hop', 'Person takes guests bags to their room' );


--employee--
insert into employees 
values ('e1','p6','90','2017-03-05', '10.00');

insert into employees 
values ('e2','p7','91','2012-08-15', '10.00');

insert into employees 
values ('e3','p8','91','2011-07-19', '10.00');

insert into employees 
values ('e4','p9','92','2009-05-26', '20.00');

insert into employees 
values ('e5','p10','93','2017-08-13', '15.00');


--timesheet--
insert into timesheet 
values ('time1', 'e1', '2017-08-19', '11:00', '17:00', '6' );

insert into timesheet 
values ('time2', 'e1', '2017-08-20', '10:00', '18:00', '8' );

insert into timesheet 
values ('time3', 'e2', '2017-08-19', '11:00', '18:00', '7' );

insert into timesheet 
values ('time4', 'e3', '2017-08-21', '08:00', '16:00', '8' );

insert into timesheet 
values ('time5', 'e4', '2017-08-19', '11:00', '17:00', '6' );

insert into timesheet 
values ('time6', 'e4', '2017-08-21', '11:00', '17:00', '6' );

insert into timesheet 
values ('time7', 'e5', '2017-08-18', '11:00', '19:00', '8' );

insert into timesheet 
values ('time8', 'e5', '2017-08-19', '11:00', '19:00', '8' );

insert into timesheet 
values ('time9', 'e5', '2017-08-20', '11:00', '19:00', '8' );


--customers--
insert into customers 
values ('p1','c1');

insert into customers 
values ('p2','c2');

insert into customers 
values ('p3','c3');

insert into customers 
values ('p4','c4');

insert into customers 
values ('p5','c5');

--miscellaneous charges --

insert into miscellaneous_charges
values ('m1', 'Stolen Item', '50.00', 'Something from the room is missing.');

insert into miscellaneous_charges
values ('m2', 'Broken Furniture', '200.00', 'Something from the room is broken and needs to be replaced.');

insert into miscellaneous_charges
values ('m3', 'Food', '25.00', 'All room service for food is under a $25 buffet, all you can eat style.');

--room_status--
insert into room_status
values ('s1', 'Booked', 'This room is booked.');

insert into room_status
values ('s2', 'Vacant', 'This room is completely empty, and able to be booked.');


--roomtype--

insert into room_type
values ('type1', 'Double Queen Deluxe', '5', 'False', 'Two double queen beds and a pullout couch.', '150.00');

insert into room_type
values ('type2', 'Single King', '2', 'False', 'One king sized bed with a desk and TV.', '120.00');

insert into room_type
values ('type3', 'Suite Style', '8', 'True', 'Two bedrooms. One with a King bed, and other with two queen. Living area with pullout couch and TV.', '300.00'); 

  

 --rooms--
 
 insert into rooms
 values ('rm1', 'type1', '100', '1', 's1');
 
 
 insert into rooms
 values ('rm2', 'type2', '200', '2', 's2');
 
 
 insert into rooms
 values ('rm3', 'type3', '300', '3', 's1');
 
 
 insert into rooms
 values ('rm4', 'type3', '120', '1', 's1');
 
 
 insert into rooms
 values ('rm5', 'type2', '220', '2', 's2');
 
 insert into rooms 
 values ('rm6', 'type3', '305', '3', 's2');
 
 insert into rooms 
 values ('rm7', 'type1', '205', '2', 's1');
 
 
 --reservations --

insert into reservations 
values ('rv1', 'rm1', '2017-09-02', '2017-09-05', '4', true);

insert into reservations 
values ('rv2', 'rm3', '2016-03-23', '2016-03-25', '1', false);

insert into reservations 
values ('rv3', 'rm4', '2017-05-18', '2017-05-28', '5', false);

insert into reservations
values ('rv4', 'rm4', '2017-09-09', '2017-09-14', '5', true); 

insert into reservations
values ('rv5', 'rm5', '2017-07-18', '2017-07-28','4', false);

insert into reservations
values ('rv6', 'rm2', '2013-08-19', '2013-08-23','1', false);

insert into reservations
values ('rv7', 'rm7', '2012-06-25', '2012-07-01','2', false);

insert into reservations
values ('rv8', 'rm1', '2015-09-01', '2015-09-07','4', true);

insert into reservations
values ('rv9', 'rm3', '2011-03-15', '2011-03-18','3', false);




--payment type--
insert into payment_type
values ('t1', 'Cash');

insert into payment_type
values ('t2', 'Card');

insert into payment_type
values ('t3', 'Bitcoin');


--payment--

insert into payment 
values ('b1', 't1');

insert into payment 
values ('b2', 't2');

insert into payment 
values ('b3', 't1');

insert into payment 
values ('b4', 't3');

insert into payment 
values ('b5', 't2');

insert into payment 
values ('b6', 't3');

insert into payment 
values ('b7', 't1');

insert into payment 
values ('b8', 't3');

insert into payment 
values ('b9', 't1');

insert into payment 
values ('b10', 't2');


--transactions--

insert into transactions 
values ('11111', 'rv1', 'e1', 'b1', 'c1', 'h1');

insert into transactions 
values ('12222', 'rv2', 'e1', 'b2', 'c2', 'h1');

insert into transactions 
values ('13333', 'rv4', 'e3', 'b3', 'c3', 'h1');

insert into transactions 
values ('14444', 'rv3', 'e1', 'b4', 'c1', 'h1');

insert into transactions 
values ('155555', 'rv5', 'e3', 'b5', 'c5', 'h1');

insert into transactions 
values ('166666', 'rv6', 'e3', 'b6', 'c1', 'h1');

insert into transactions 
values ('177777', 'rv7', 'e1', 'b7', 'c3', 'h1');

insert into transactions 
values ('188888', 'rv8', 'e3', 'b8', 'c3', 'h1');

insert into transactions 
values ('199999', 'rv9', 'e1', 'b9', 'c4', 'h1');

insert into transactions 
values ('112222', 'rv10', 'e1', 'b10', 'c4', 'h1');


 

--miscellaneous charges add--

insert into miscellaneous_charges_add 
values ('m1' , '11111');

insert into miscellaneous_charges_add 
values ('m2' , '155555');


insert into miscellaneous_charges_add 
values ('m3' , '199999');




--memberships--

insert into memberships 
values ('m1111111', 'p1', 'c1', 'thisguy17', 'nymets17', '2016-09-18');

insert into memberships 
values ('m2222222', 'p2','c2', 'coolgirl12', 'stuff1790', '2013-10-23');

insert into memberships 
values ('m3333333', 'p4', 'c4', 'useruser20', 'nv.Pass3', '2012-12-20');




--Queries--

--Views: TotalPay-- 

select (

(select hourly_wageusd 
from employees
where pid in (select pid 
             from people
              where first_name = 'Taylor' AND
              last_name = 'Connelly'))
    *
              
              
(select total_hours
from timesheet
where employee_id in (select employee_id 
                     from employees 
                     where pid in (select pid 
                                  from people 
                                  where first_name = 'Taylor'
                                  AND 
                                  last_name ='Connelly')))) as TotalPay;  
                                  
﻿

--Views: TotalCost--
select ((
select chargesusd 
from miscellaneous_charges 
where miscellaneous_charges_id in (select miscellaneous_charges_id
                                  from miscellaneous_charges_add
                                   where transaction_id in (select transaction_id
                                                           from transactions 
                                                           where reservation_id ='rv5')))
															 +
(select room_priceusd 
from room_type 
where roomtype_id in (select roomtype_id
                     from rooms 
                     where room_id in (select room_id 
                                      from reservations 
                                      where reservation_id in (select reservation_id
                                                           from transactions
                                                           where reservation_id = 'rv5'))))) as totalCost; 
                                  



--Views: non-smoking rooms available currently--

select rooms.room_id, room_status.status_description, rooms.room_number, room_type.smoking 
from rooms
inner join room_type on room_type.roomtype_id = rooms.roomtype_id
inner join room_status on rooms.status_id = room_status.status_id
and room_status.status_id = 's2'
and room_type.smoking = false;


--Views: Quick View -- 


select room_id, room_number, floor_number, status_description, 
room_name, room_priceusd, max_guest
from rooms
inner join room_status on 
rooms.status_id = room_status.status_id
inner join room_type on 
rooms.roomtype_id = room_type.roomtype_id; 


--Customer Info- Booked Rooms--

select first_name, last_name, contact_number
from people 
where pid in (select pid 
             from customers 
             where customer_id in (select customer_id 
                                  from transactions 
                                   where reservation_id in (select reservation_id
                                                           from reservations 
                                                            FULL outer join people ON people.pid = reservations.reservation_id)));  

--Views: Gold Member--
select first_name, last_name, contact_number, email_address
from people
where pid in (select pid
             from memberships
             where date_of_membership < '2017-12-01');


--Views: Room Status--  
 
select room_id, room_number, floor_number, status_description
from rooms
inner join room_status on rooms.status_id = room_status.status_id; 
                                         


--Report: Popular Room--
SELECT rooms.roomtype_id, COUNT(reservations.room_id) 
AS NumberOfRooms 
FROM reservations
LEFT JOIN rooms 
ON reservations.room_id = rooms.room_id
GROUP BY roomtype_id;


﻿--Report: Reservations--
select count(reservation_id) 
from reservations 
where check_in >= '2015-01-01'; 


--Report: Employee Hours--
select count(employee_id)
from timesheet
where total_hours >= '8'; 

 


--trigger getAge--                                  
create or replace function getAge()
returns trigger as 
$$
begin 
	if (NEW.birthday > '2000-12-12') then 
    delete from people where birthday = NEW.birthday;
    end if;
    
    return new;
    end;
    $$ language plpgsql;
    
create trigger getAge 
after insert on people
for each row 
execute procedure getAge(); 


--trigger maxOccupants--
create or replace function maxOccupants()
returns trigger as 
$$
begin 
	if (NEW.no_of_guests > '6') then 
    delete from reservations where no_of_guests = NEW.no_of_guests;
    end if;
    
    return new;
    end;
    $$ language plpgsql;

create trigger maxOccupants
after insert on reservations
for each row 
execute procedure maxOccupants();


--Stored Procedure: findCustomer--
create or replace function findCustomer (TEXT, TEXT, REFCURSOR) returns refcursor as 
$$

declare 
searchFirstName TEXT := $1;
searchLastName TEXT := $2;
resultSet REFCURSOR := $3;

begin 
open resultset for 
select *
from people 
where first_name like searchFirstName
and 
last_name like searchLastName;
return resultSet;
end;
$$
LANGUAGE plpgsql;



--Stored Procedure: findReservation--
create or replace function findReservation (TEXT, REFCURSOR) returns refcursor as 
$$

declare 
searchReservation TEXT := $1;
resultSet REFCURSOR := $2;

begin 
open resultset for 
select *
from reservations 
where reservation_id like searchReservation;
return resultSet;
end;
$$
LANGUAGE plpgsql;
                 




--security roles--
create role admin;
grant all on 
all tables 
in schema public 
to admin;
           

CREATE ROLE hotel_manager;
GRANT SELECT, INSERT, UPDATE
ON ALL TABLES IN SCHEMA PUBLIC
TO hotel_manager;



CREATE	ROLE housekeepers;
GRANT	SELECT	ON	room_status, rooms
TO	housekeepers;


CREATE ROLE front_desk;
GRANT SELECT, INSERT, UPDATE 
ON reservations, customer
TO front_desk;
    
    
    
    

  






