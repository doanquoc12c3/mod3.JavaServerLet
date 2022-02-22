create database demo;
use demo;

create table Products(
id int auto_increment primary key,
productCode int,
productName varchar(50),
productPrice int,
productAmount int,
productDescription varchar(100),
productStatus int default 1
);

insert into Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
values(1234,"smart phone", 10000, 2, 'luxury', 0),
(2234,"smart phone2", 100002, 2, 'luxury', 0),
(3234,"smart phone3", 100003, 2, 'luxury', 0),
(4234,"smart phone4", 100004, 2, 'luxury', 0),
(5234,"smart phone5", 100005, 2, 'luxury', 0),
(6234,"smart phone6", 100006, 2, 'luxury', 0),
(7234,"smart phone7", 100007, 2, 'luxury', 0),
(8234,"smart phone8", 100008, 2, 'luxury', 0),
(9234,"smart phone9", 100009, 2, 'luxury', 0),
(10234,"smart phone10", 1000010, 2, 'luxury', 0);


create unique index idxPdct on Products(productCode);

create unique index idxNamePrice on Products(productName, productCode);

explain select productName from Products;

create view producInfo as
select productCode, productName, productPrice, productStatus from Products;

update producInfo
set productName = "Quoc Nhua"
where productPrice = 1000010;

drop view producInfo;

DELIMITER //

create procedure productInfor()
begin 
	select * from Products;
end //

DELIMITER ;

DELIMITER //

create procedure InsertProductInfor()
begin 
	insert into Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
		values(1234,"smart phone", 10000, 2, 'luxury', 0);
end //

DELIMITER ;

-- procedure sua thong tin bang

DELIMITER //
DROP PROCEDURE IF EXISTS `productInfor`//

CREATE PROCEDURE updateInforWithID()

BEGIN
	update Products
    set 
SELECT * FROM customers where customerNumber = 175;

END //












