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


-- 1. Write an alter query to add a column into the table. (3 examples)
 alter table day6.emp add column age int;
 alter table day6.emp add column create_at timestamp default current_timestamp;
 alter table day6.emp add column order_status varchar(30) not null default 'pending';
 
 -- 2.Write an alter query to delete a column from the table. (3 examples)
alter table day6.emp drop column age;
alter table day6.emp drop column create_at;
alter table day6.emp drop column order_status;

-- 3. Write an alter query to rename a column in the table. (3 examples)
alter table day6.emp rename column age to person_age;
alter table day6.emp rename column create_at to registration;
alter table day6.emp rename column order_status to curr_status;

-- 4. Write an alter query to change the datatype of a colum in the table. (3 examples)
alter table day6.emp change column  person_age p_age int;
alter table day6.emp change column registration login varchar(55);
alter table day6.emp change column curr_status status_now varchar(44);

-- Write a query to demonstrate NOT NULL constraint. (2 examples)
-- Write a query to demonstrate CHECK constraint. (2 examples)
use day6;
create table emp2(
id int primary key not null auto_increment,
name varchar(45) not null,
email varchar(45) not null
);
insert into emp2(name, email)values
('shailesh', 'shailesh@gmail.com'),
('abhi', 'abhi@gmail.com');

select * from emp2;

alter table day6.emp2 add column phoneNO bigint not null default '7709822300';
alter table day6.emp2 modify column phoneNO varchar(20) not null default '7709822300';

-- Write a query to demonstrate CHECK constraint. (2 examples)
use day6;
create table emp3(
id int primary key not null auto_increment,
name varchar(45) not null,
age int check(age>=18 and age<=65) not null
);
insert into emp3(name,age)values
('shailesh', 22),
('abhi', 34);

select * from emp3;


-- Write a query to demonstrate DEFAULT constraint. (2 examples)
alter table day6.emp3 add column email varchar(45) not null default 'shailesh@gmail.com';
alter table day6.emp3 add column date timestamp default current_timestamp;

-- 2. Create two tables namely employee and department. Fetch the employee name and department by using primary key and foreign key.

use day6;
create table employee(
id int primary key not null auto_increment,
name varchar(45)
);
insert into employee(name)values('shailesh'),('abhi'),('akash');
select * from employee;

use day6;
create table department(
id int primary key not null auto_increment,
name varchar(45),
ref_id int references employee(id)
);
insert into department(name,ref_id)values('computer',1),('science',2),('commerce',3);
select * from department;

select employee.name, department.name from employee join department on employee.id = department.ref_id;


-- 3. Create two tables namely student and subject. Fetch the student name and subject by using primary key and foreign key.

use day6;
create table student(
id int primary key not null auto_increment,
name varchar(45)not null,
schoole varchar(45)
);
insert into student(name,schoole)values('shailesh','ecti'),('abhi','ecti'),('naval','ecti');
select * from student;

use day6;
create table sub(
id int primary key not null auto_increment,
name varchar(45)not null,
ref_id int references student(id)
);
insert into sub(name,ref_id)values('English',1),('Science',2),('mathematics',3);
select * from sub;

select student.name, sub.name from student join sub on student.id = sub.ref_id;