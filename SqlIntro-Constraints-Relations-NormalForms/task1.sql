
-- TASK 1: Market Database

CREATE DATABASE MARKET;
GO

USE MARKET;
GO

CREATE TABLE Products (
    Id INT,
    Name NVARCHAR(20),
    Price INT
);

ALTER TABLE Products ADD Brand NVARCHAR(20);

INSERT INTO Products VALUES
(1, 'Dress', 80, 'Zara'),
(2, 'Dress', 90, 'Bershka'),
(3, 'T-shirt', 300, 'Gucci'),
(4, 'Shoes', 77, 'Zara'),
(5, 'Trousers', 66, 'Mango'),
(6, 'Socks', 10, 'Lewis'),
(7, 'Boats', 200, 'Lcwaikiki'),
(8, 'Coat', 150, 'Stradivarius'),
(9, 'Jacket', 60, 'Zara'),
(10, 'Scarf', 45, 'Zara');

DELETE FROM Products WHERE Brand = 'Zara' AND Name = 'Dress';

UPDATE Products SET Price = 89 WHERE Brand = 'Zara';

SELECT * FROM Products WHERE Price < (SELECT AVG(Price) FROM Products);
SELECT * FROM Products WHERE Price > 10;
SELECT CONCAT(Name, ' - ', Brand) AS ProductInfo FROM Products WHERE LEN(Brand) > 5;
