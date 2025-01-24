 create database day6;
 use day6;
 
 create table emp(
 id int primary key not null auto_increment,
 name varchar(45) not null,
 department varchar(45) not null,
 salary decimal(10,2),
 date timestamp default current_timestamp
 );
 
 insert into emp(name, department, salary)values
 ('akash', 'devloper', 40000.00),
 ('nitin', 'devloper', 45000.00),
 ('pradip', 'dedigner', 50000.00),
 ('abhi', 'devloper', 60000.00),
 ('darshan', 'manager', 45000.00);
 
 select * from emp;
 
 -- 1. Demonstrate different Aggregate Functions.
 select min(salary)from emp;
 select max(salary)from emp;
 select count(name)from emp;
 select avg(salary)from emp;
 select sum(salary)from emp;
 
 select min(salary), max(salary), count(name), avg(salary), sum(salary)from emp;
 
 
 -- 2. Demonstrate different Character Functions.
 select concat('akash','','devloper');
 select upper('akash');
 select lower('AKASH');
 select length('suresh1');
 select trim('      pradip    ');
 select substring('hello world',  1,8);
 select replace('hello world', 'world','Mysql');
 
 --  3. Demonstrate different Date Functions.
 select now();
 select current_date();
 select current_time();
 select name,date(date)as birthdate from day6.emp;
 select name, date_add(date, interval 1 year) as birthModified from day6.emp;
 
 
 -- 4. Demonstrate different Time Functions. 
select hour('12:34:56');
select minute('12:34:56');
select second('12:34:56');
 