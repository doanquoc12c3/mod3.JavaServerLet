create database `QuanLiSinhVien`;
use  `QuanLiSinhVien`;

create table Class(
ClassID int not null primary key auto_increment,
ClassName varchar(50) not null,
StartDate datetime not null ,
status bit
);

create table Student(
StudentID int not null primary key auto_increment,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int not null,
foreign key (ClassID) references Class(ClassID)
);

create table Subject(
SubID int not null primary key auto_increment,
SubName varchar(30) not null,
Credit tinyint not null default(1) check(Credit >=1), 
Status bit default(1)
);


create table Mark(
MarkID int not null primary key auto_increment,
SubID int not null,
StudentID int not null,
Mark float default 0 check ( Mark between 0 and 100),
ExamTimes tinyint default(1),
unique(SubID, StudentID),
foreign key(SubID) references Subject(SubID),
foreign key(StudentID) references Student(StudentID)
);


