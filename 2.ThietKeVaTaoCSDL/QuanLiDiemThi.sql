create database `QuanLiDiemThi`;
drop database `QuanLiDiemThi`;
use `QuanLiDiemThi`;

create table HocSinh(
MaHS int primary key,
TenHS varchar(100),
NgaySinh datetime,
Lop varchar(50),
GT int);

create table MonHoc(
MaMH int primary key,
TenMH varchar(100)

);

create table BangDiem(
MaHS int,
MaMH int,
DiemThi int,
NgayKT datetime,
primary key(MaHs,MaMH),
foreign key (MaHS) references HocSinh(MaHS),
foreign key(MaMH) references MonHoc(MaMH)
);


create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(10)
);

alter table MonHoc add MaGV varchar(20);
ALTER table MonHoc add constraint FK_MaGV foreign key (MaGV) references GiaoVien(MaGV);