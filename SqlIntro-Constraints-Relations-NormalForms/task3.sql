
-- TASK 3: Relations

CREATE TABLE Posts (
    ID INT PRIMARY KEY IDENTITY,
    NumberOfPosts INT
);

INSERT INTO Posts(NumberOfPosts) VALUES (20), (55), (77);

CREATE TABLE Users (
    ID INT PRIMARY KEY IDENTITY,
    Username NVARCHAR(100),
    Email NVARCHAR(100),
    PostsId INT,
    FOREIGN KEY (PostsId) REFERENCES Posts(ID)
);

INSERT INTO Users (Username, Email, PostsId) VALUES
('Fidan', 'fidan@gmail.com', 1),
('Ali', 'ali@gmail.com', 2),
('Firuza', 'firuza@gmail.com', 3);

CREATE TABLE UserProfiles (
    ID INT PRIMARY KEY IDENTITY,
    Birthday DATE,
    Gender VARCHAR(10),
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(ID)
);

INSERT INTO UserProfiles (Birthday, Gender, UserId) VALUES
('2003-10-04', 'Female', 1),
('2000-10-11', 'Male', 2),
('2002-12-01', 'Female', 3);

CREATE TABLE Students (
    ID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),
    Surname NVARCHAR(100)
);

INSERT INTO Students (Name, Surname) VALUES
('Fidan', 'Damirli'),
('Ali', 'Qarayev'),
('Firuza', 'Aslanova');

CREATE TABLE Clubs (
    ID INT PRIMARY KEY IDENTITY,
    ClubName NVARCHAR(100),
    ClubType NVARCHAR(50)
);

INSERT INTO Clubs (ClubName, ClubType) VALUES
('Chess Club', 'Sports'),
('Science Club', 'Education'),
('Drama Club', 'Arts');

CREATE TABLE StudentClubs (
    ID INT PRIMARY KEY IDENTITY,
    ClubId INT,
    StudentId INT,
    FOREIGN KEY (ClubId) REFERENCES Clubs(ID),
    FOREIGN KEY (StudentId) REFERENCES Students(ID)
);

INSERT INTO StudentClubs (ClubId, StudentId) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2);
