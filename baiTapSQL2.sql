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


update Students
set classId=1
where id =1;

update Students
set classId=2
where id =2;

update Students
set classId=3
where id =3;

update Students
set classId=4
where id =4;

update Students
set classId=5
where id =5;

update Students
set classId=1
where id =6;

update Students
set classId=2
where id =7;

update Students
set classId=3
where id =8;

update Students
set classId=4
where id =9;

update Students
set classId=5
where id =10;







select * from Students
order by id;

select * from Students
order by name desc;

select * from Students
order by age;


select classId as Lop, count(classId) as SoLuongHocSinh   from Students
group by classId;



