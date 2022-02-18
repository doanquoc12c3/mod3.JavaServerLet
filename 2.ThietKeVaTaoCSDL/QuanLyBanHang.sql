create database `QuanLyBanHang`;

use `QuanLyBanHang`;

create table Customer(
cID int not null primary key,
cName varchar(50),
cAge int
);

create table OrderBill(
oID int not null primary key,
cID int,
foreign key(cID) references Customer(cID),
oDate datetime,
oTotaPrice int,
foreign key(oID) references OrderDetail(oID)
);

create table OrderDetail(
oID int not null,
pID int not null,
primary key(oID, pID),
odQTY int
);

create table Product( 
pID int not null primary key,
pName varchar(100),
pPrice int,
foreign key(pID) references OrderDetail(pID)
);