create database student_management;
use `student_management`;

create table Students(
id int auto_increment primary key,
name varchar(50) not null, 
address varchar(50) not null, 
sex int default(1) not null,
age int not null check(age between 10 and 50),
email varchar(50) not null unique, 
phone varchar(10));



create table Classes(
id int auto_increment primary key,
name varchar(50) not null unique
);

alter table Students
add classId int ;

alter table Students
add foreign key (classId) references Classes(id);

insert into Classes(id, name)
values( 1, 'lop1'),
(2, 'lop2'),
(3, 'lop3'),
(4, 'lop4'),
(5, 'lop5');



insert into Students(name, address, sex, age , email, phone)
values('A', 'hn',1, 12, 'a@gmail.com', 123243),
('A', 'hn', 0, 12, 'a1@gmail.com', 123243),
('B', 'lao', 0, 23, 'a2@gmail.com', 123243),
('C', 'dn', 0, 12, 'a3@gmail.com', 123243),
('D', 'uc', 1, 24, 'a4@gmail.com', 123243),
('E', 'cam', 1, 26, 'a5@gmail.com', 123243),
('F', 'dailoan', 1, 32, 'a6@gmail.com', 123243),
('G', 'hcm', 1, 12, 'a@gma7il.com', 123243),
('H', 'han', 1, 12, 'a@gmail7.com', 123243),
('J', 'mi', 1, 12, 'a@gmail.c7om', 123243),
('K', 'ango', 0, 12, 'a@gmail.7com', 123243);



select * from Students;
select * from Students
where sex = 1;

select * from Students
where age <20;

select * from Students
where address = 'hn' or address = 'hcm' or address = 'dn';

select * from Students
where not address = 'hn';

select * from Students
where address like "h%";

select name from Students;



