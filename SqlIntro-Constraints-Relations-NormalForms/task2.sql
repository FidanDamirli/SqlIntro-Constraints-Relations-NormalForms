
-- TASK 2: Employee Table

CREATE TABLE Employee (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Fullname NVARCHAR(255) NOT NULL,
    Age INT NOT NULL CHECK(Age > 0),
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Salary DECIMAL(10, 2) NOT NULL CHECK(Salary >= 300 AND Salary <= 2000)
);

INSERT INTO Employee (Fullname, Age, Email, Salary) VALUES
('Fidan', 21, 'fidan@gmail.com', 1200.50),
('Firuze', 21, 'firuze@gmail.com', 1500.70),
('Veli', 21, 'veli@gmail.com', 900.60);

UPDATE Employee SET Salary = 1300.50 WHERE Email = 'fidan@gmail.com';
DELETE FROM Employee WHERE Email = 'firuze@gmail.com';
