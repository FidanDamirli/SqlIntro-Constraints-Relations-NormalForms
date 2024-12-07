--TASK 1
CREATE DATABASE MARKET;

USE MARKET;

CREATE TABLE Products (
    Id INT,
    [Name] NVARCHAR(20),
    Price INT,
    Brand NVARCHAR(20)
);



USE MASTER;
DROP DATABASE MARKET;

INSERT INTO Products (Id, [Name], Price, Brand) VALUES
(1, 'Dress', 80, 'Zara'),
(2, 'Dress', 90, 'Bershka'),
(3, 'T-shirt', 300, 'Gucci'),
(4, 'Shoes', 77, 'Zara'),
(5, 'Trousers', 66, 'Mango'),
(6, 'Socks', 10, 'Lewis'),
(7, 'Boots', 200, 'Lcwaikiki'),
(8, 'Coat', 150, 'Stradivarius'),
(9, 'Jacket', 60, 'Zara'),
(10, 'Scarf', 45, 'Zara');


DELETE FROM Products WHERE Brand = 'Zara' AND [Name] = 'Dress';


UPDATE Products SET Price = 89 WHERE Brand = 'Zara';


SELECT * FROM Products WHERE Price < (SELECT AVG(Price) FROM Products);


SELECT * FROM Products WHERE Price > 10;

SELECT CONCAT([Name], ' - ', Brand) AS NameAndBrand
FROM Products
WHERE LEN(Brand) > 5;



--TASK 2
CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Fullname NVARCHAR(255) NOT NULL,
    Age INT NOT NULL CHECK (Age > 0),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary >= 300 AND Salary <= 2000)
);


INSERT INTO Employee (Fullname, Age, Email, Salary)
VALUES
    ('Fidan', 21, 'fidan@gmail.com', 1200.50),
    ('Firuze', 21, 'firuze@gmail.com', 1500.70),
    ('Veli', 21, 'veli@gmail.com', 900.60);


SELECT * FROM Employee;


UPDATE Employee
SET Salary = 1300.50
WHERE Email = 'fidan@gmail.com';


DELETE FROM Employee
WHERE Email = 'firuze@gmail.com';


--TASK 3


CREATE TABLE Posts
(
    ID int PRIMARY KEY IDENTITY,
    NumberOfPosts int
);


INSERT INTO Posts(NumberOfPosts) VALUES
(20),
(55),
(77);


CREATE TABLE Users
(
    ID int PRIMARY KEY IDENTITY,
    Username varchar(255),
    Email varchar(255),
    PostsId int FOREIGN KEY REFERENCES Posts(ID)
);


INSERT INTO Users(Username, Email, PostsId)
VALUES
('Fidan', 'fidan@gmail.com', 1),
('Ali', 'ali@gmail.com', 2),
('Firuza', 'firuza@gmail.com', 3);


CREATE TABLE UserProfiles
(
    ID int PRIMARY KEY IDENTITY,
    Birthday date,
    Gender varchar(10),
    UserId int FOREIGN KEY REFERENCES Users(ID)
);


INSERT INTO UserProfiles (Birthday, Gender, UserId)
VALUES
('2003-10-04', 'Female', 1),
('2000-10-11', 'Male', 2),
('2002-12-01', 'Female', 3);


CREATE TABLE Students
(
    ID int PRIMARY KEY IDENTITY,
    [Name] varchar(255),
    Surname varchar(255)
);


INSERT INTO Students([Name], Surname)
VALUES
('Fidan', 'Damirli'),
('Ali', 'Qarayev'),
('Firuza', 'Aslanova');


CREATE TABLE Clubs
(
    ID int PRIMARY KEY IDENTITY,
    ClubName varchar(255),
    ClubType varchar(255)
);


INSERT INTO Clubs(ClubName, ClubType)
VALUES
('Chess Club', 'Sports'),
('Science Club', 'Education'),
('Drama Club', 'Arts');

-- Creating StudentClubs table
CREATE TABLE StudentClubs
(
    ID int PRIMARY KEY IDENTITY,
    ClubId int FOREIGN KEY REFERENCES Clubs(ID),
    StudentId int FOREIGN KEY REFERENCES Students(ID)
);


INSERT INTO StudentClubs (ClubId, StudentId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2);

