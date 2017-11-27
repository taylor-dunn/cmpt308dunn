--First function--

--1. func1on	PreReqsFor(courseNum)	-	Returns	the	immediate	prerequisites	for	the	
passed-in	course	number.	--


create or replace function prerequisite_finder_coursenum(int, REFCURSOR) returns REFCURSOR as $$
	declare 
    insert_course_num    int := $1;
    resultset REFCURSOR := $2;
    
    begin 
    open resultset for 
    select preReqNum
    from Prerequisites 
    where courseNum = insert_course_num;
    
    return resultset;
    end;
    $$
    language plpgsql;
    
    
--Second function --
-- 2. func1on	IsPreReqFor(courseNum)	-	Returns	the	courses	for	which	the	passed-in	course	
number	is	an	immediate	pre-requisite -- 

﻿create or replace function is_a_prereq_coursenum(int, REFCURSOR) returns REFCURSOR as $$
	declare 
    insert_course_num    int := $1;
    resultset REFCURSOR := $2;
    
    begin 
    open resultset for 
    select courseNum
    from Prerequisites 
    where prereqNum = insert_course_num;
    
    return resultset;
    end;
    $$
    language plpgsql;