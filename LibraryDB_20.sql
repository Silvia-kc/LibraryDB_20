CREATE DATABASE [LibraryDB_20]
 
CREATE TABLE [Readers](
[ReaderId] INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(100)
);
 
CREATE TABLE [Libraries](
[LibraryId] INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(100)
);
 
CREATE TABLE [Books](
[BookId] INT PRIMARY KEY IDENTITY(1,1),
[Title] NVARCHAR(100),
[LibraryId] INT FOREIGN KEY REFERENCES [Libraries]([LibraryId]) ON DELETE SET DEFAULT
);
 
CREATE TABLE Loans(
[LoansId] INT PRIMARY KEY IDENTITY(1,1),
[ReaderId] INT FOREIGN KEY REFERENCES [Readers]([ReaderId]) ON DELETE CASCADE,
[BookId] INT FOREIGN KEY REFERENCES [Books]([BookId]) ON DELETE SET NULL,
[LoanDate] DATE
);
 
INSERT INTO Readers (Name)
VALUES
(N'Петър Петров'),
(N'Мария Иванова'),
(N'Георги Димитров'),
(N'Елена Стоянова');
 
INSERT INTO Libraries (Name)
VALUES
(N'Централна библиотека'),
(N'Градска библиотека'),
(N'Университетска библиотека');
 
INSERT INTO Books (Title, LibraryId)
VALUES
(N'1984', 1),
(N'Престъпление и наказание', 2),
(N'Хари Потър', 3),
(N'Граф Монте Кристо', 1);
 
INSERT INTO Loans (ReaderId, BookId, LoanDate)
VALUES
(1, 1, '2023-05-10'),
(2, 2, '2023-06-15'),
(3, 3, '2023-07-20'),
(4, 4, '2023-08-25');

DELETE FROM Readers WHERE ReaderId = 1

DELETE FROM Books WHERE Title = N'Престъпление и наказание'

INSERT INTO Books (Title, LibraryId)
SELECT N'Война и мир', LibraryId FROM Libraries WHERE Name = N'Университетска библиотека'

DELETE FROM Libraries WHERE LibraryId = 3