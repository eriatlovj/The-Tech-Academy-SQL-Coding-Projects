CREATE DATABASE db_library

USE db_library

/* LIBRARY CREATED */

CREATE TABLE tbl_library_branch (
	BranchID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	BranchName VARCHAR(20) NOT NULL,
	Address VARCHAR(50) NOT NULL
)
SELECT * FROM tbl_library_branch;

CREATE TABLE tbl_publisher (
	PublisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Phone VARCHAR(15) NOT NULL
)
SELECT * FROM tbl_publisher;

CREATE TABLE tbl_books(
	BooksID INT PRIMARY KEY IDENTITY(100,1) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(30) FOREIGN KEY REFERENCES tbl_publisher(PublisherName)
)
SELECT * FROM tbl_books;

CREATE TABLE tbl_book_authors(
	BooksID INT FOREIGN KEY REFERENCES tbl_books(BooksID),
	AuthorName VARCHAR(60) NOT NULL
)
SELECT * FROM tbl_book_authors;

CREATE TABLE tbl_book_copies(
	BooksID INT FOREIGN KEY REFERENCES tbl_books(BooksID),
	BranchID INT FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	Number_Of_Copies INT NULL
)
SELECT * FROM tbl_book_copies;

CREATE TABLE tbl_borrower(
	CardNo INT PRIMARY KEY NOT NULL,
	Name VARCHAR(20) NOT NULL,
	Address VARCHAR(40) NOT NULL,
	Phone VARCHAR(15) NOT NULL
)
SELECT * FROM tbl_borrower;

CREATE TABLE tbl_book_loans (
	BooksID INT FOREIGN KEY REFERENCES tbl_books(BooksID),
	BranchID INT FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	CardNo INT FOREIGN KEY REFERENCES tbl_borrower(CardNo) NULL,
	DateOut DATE NULL,
	DateDue DATE NULL
)
SELECT * FROM tbl_book_loans;

/* LIBRARY TABLES DATA INSERTED */

INSERT INTO tbl_library_branch (BranchName, Address)
VALUES

	('Sharpstown', '12345 Sharpstown St., Palm Springs, CA'), 
	('Central', '54321 Central Ave., Glendale, CA'), 
	('Nogales', '9630 Nogales St., Walnut, CA'),
	('Montebello', '2580 Beverly Blvd., Montebello, CA')
;
SELECT * FROM tbl_library_branch;

INSERT INTO tbl_publisher (PublisherName, Address, Phone)
VALUES
	('Faber and Faber', '54321 N Broadway St., Los Angeles, CA', '213-555-0987'),
	('Viking Press', '3256 N Central St., Houston, TX', '512-323-6869'),
	('New American Library', '864 Miss St., Springfield, IL', '630-200-7080'),
	('Counterpoint', '1700 Fourth Street, Berkeley, CA', '866-400-5351')
;
SELECT * FROM tbl_publisher;

INSERT INTO tbl_books (Title, PublisherName)
VALUES
	
	('A Pale View of the Hills', 'Faber and Faber'),
	('Moshi Moshi', 'Counterpoint'),
	('The Devotion of Suspect X', 'Viking Press'),
	('Apparitions: Ghosts of Old Edo', 'Faber and Faber'),
	('The Housekeeper and the Professor', 'Counterpoint'),
	('Out', 'New American Library'),
	('Desire', 'Viking Press'),
	('The Eighth Day', 'Faber and Faber'),
	('I am a Cat', 'Counterpoint'),
	('Strange Weather in Tokyo', 'Viking Press'),
	('The Lost Tribe', 'New American Library'),
	('Coin Locker Babies', 'Counterpoint'),
	('Asleep', 'Faber and Faber'),
	('The Long Walk', 'Viking Press'), 
	('It', 'New American Library'), 
	('The Thief', 'Faber and Faber'),
	('Almost Transparent Blue', 'Counterpoint'),
	('Death in Midsummer and Other Stories', 'New American Library'),
	('The Diving Pool', 'Viking Press'),
	('The Waiting Years', 'Faber and Faber')
;
SELECT * FROM tbl_books;

INSERT INTO tbl_book_authors (BooksID, AuthorName)
VALUES

	(100, 'Kazuo Ishiguro'),
	(101, 'Moshi Moshi'),
	(102, 'Keigo Higashino'),
	(103, 'Miyuki Miyabe'),
	(104, 'Yoko Ogawa'),
	(105, 'Natsuo Kirino'),
	(106, 'Natsuo Kirino'),
	(107, 'Mitsuyo Kakuta'),
	(108, 'Soseki Natsume'),
	(109, 'Hiromi Kawakami'),
	(110, 'Ryu Murakami'),
	(111, 'Yukio Mishima'),
	(112, 'Yoko Ogawa'),
	(113, 'Stephen King'),
	(114, 'Stephen King'),
	(115, 'Haruki Murakami'),
	(116, 'Jun’ichir? Tanizaki'),
	(117, 'Yasunari Kawabata'),
	(118, 'Murasaki Shikibu'),
	(119, 'Fumiko Enchi')
;
SELECT * FROM tbl_book_authors;

INSERT INTO tbl_book_copies (BooksID, BranchID, Number_Of_Copies)
VALUES
	--AT LEAST 10 BOOKS TO EACH BRANCH
	--2 COPIES OF THE 10 BOOKS TO EACH BRANCH
	--BRANCHES NUMBERED: 1 SHARPSTOWN, 2 CENTRAL, 3 NOGALES, 4 MONTEBELLO
	(100, 1, 5),
	(100, 2, 5),
	(100, 3, 5),
	(100, 4, 5), --FIRST BOOK
	(101, 1, 5),
	(101, 2, 5),
	(101, 3, 5),
	(101, 4, 5), --SECOND BOOK
	(102, 1, 5),
	(102, 2, 5),
	(102, 3, 5),
	(102, 4, 5), --THIRD BOOK
	(103, 1, 5),
	(103, 2, 5),
	(103, 3, 5),
	(103, 4, 5), --FOURTH BOOK
	(104, 1, 5),
	(104, 2, 5),
	(104, 3, 5),
	(104, 4, 5), --FIFTH BOOK
	(105, 1, 5),
	(105, 2, 5),
	(105, 3, 5),
	(105, 4, 5), --SIXTH BOOK
	(106, 1, 5),
	(106, 2, 5),
	(106, 3, 5),
	(106, 4, 5), --SEVENTH BOOK
	(110, 1, 5),
	(110, 2, 5),
	(110, 3, 5),
	(110, 4, 5), --EIGHTH BOOK
	(111, 1, 5),
	(111, 2, 5),
	(111, 3, 5),
	(111, 4, 5), --NINTH BOOK
	(113, 1, 5),
	(113, 2, 5),
	(113, 3, 5),
	(113, 4, 5), --TENTH BOOK
	(114, 1, 5),
	(114, 2, 5),
	(114, 3, 5),
	(114, 4, 5), --ELEVENTH BOOK
	(115, 1, 5),
	(115, 2, 5),
	(115, 3, 5),
	(115, 4, 5) --TWELVTH BOOK
;
SELECT * FROM tbl_book_copies;

INSERT INTO tbl_borrower (CardNo, Name, Address, Phone)
VALUES
	
	(1008, 'Amy Winehouse', '2665 Cedric Pl., Rowland Heights, CA', '626-200-1231'),
	(1000, 'Jimi Hendrix', '4409 Toland Pl., Los Angeles, CA', '323-626-1231'),
	(1001, 'Jim Morrison', '624 N Sunset Ave., Azusa, CA', '626-321-2345'),
	(1002, 'Kurt Cobain', '1120 Amberwood Pl., San Bernardino, CA', '909-212-3456'),
	(1003, 'Janis Joplin', '23162 Meadcliff Pl., Diamond Bar, CA', '909-789-4567'),
	(1004, 'Robert Smith', '12345 Jubilee St., Diamond Bar, CA', '213-987-6543'),
	(1005, 'Simon Gallup', '14522 Miss St., Lombard, IL', '630-898-6969'),
	(1006, 'Corey Duffel', '29921 Lake Shore Dr., Chicago, IL', '630-321-4567'),
	(1007, 'Maria Butina', '789 E Green St., Costa Mesa, CA', '714-998-0808')
;
SELECT * FROM tbl_borrower;

INSERT INTO tbl_book_loans (BooksID, BranchID, CardNo, DateOut, DateDue)
VALUES
	
	(100, 1, 1007, '2019-11-02', '2019-12-01'),
	(101, 1, 1007, '2019-11-02', '2019-12-01'),
	(102, 1, 1007, '2019-11-02', '2019-12-01'),
	(103, 1, 1007, '2019-11-02', '2019-12-01'),
	(104, 1, 1007, '2019-11-02', '2019-12-01'),
	(105, 1, 1007, '2019-11-02', '2019-12-01'), 
	(106, 1, 1007, '2019-11-02', '2019-12-01'),
	(107, 1, 1007, '2019-11-02', '2019-12-01'), --8 BOOKS BORROWED Maria Butina

	(101, 2, 1000, '2019-11-10', '2019-12-09'),
	(102, 2, 1000, '2019-11-10', '2019-12-09'),
	(103, 2, 1000, '2019-11-10', '2019-12-09'),
	(108, 2, 1000, '2019-11-10', '2019-12-09'),
	(109, 2, 1000, '2019-11-10', '2019-12-09'),
	(110, 2, 1000, '2019-11-10', '2019-12-09'),
	(111, 2, 1000, '2019-11-10', '2019-12-09'), 
	(112, 2, 1000, '2019-11-10', '2019-12-09'), --8 BOOKS BORROWED Jimi Hendrix

	(101, 3, 1004, '2019-11-16', '2019-12-15'),
	(104, 3, 1004, '2019-11-16', '2019-12-15'),
	(105, 3, 1004, '2019-11-16', '2019-12-15'),
	(106, 3, 1004, '2019-11-16', '2019-12-15'),
	(107, 3, 1004, '2019-11-16', '2019-12-15'),
	(109, 3, 1004, '2019-11-16', '2019-12-15'), 
	(113, 3, 1004, '2019-11-16', '2019-12-15'),
	(116, 3, 1004, '2019-11-16', '2019-12-15'),--8 BOOKS BORROWED Robert Smith

	(101, 4, 1001, '2019-06-20', '2019-07-19'),
	(105, 4, 1001, '2019-06-20', '2019-07-19'),
	(106, 4, 1001, '2019-06-20', '2019-07-19'),
	(109, 4, 1001, '2019-06-20', '2019-07-19'),
	(115, 4, 1001, '2019-06-20', '2019-07-19'),
	(116, 4, 1001, '2019-06-20', '2019-07-19'),
	(117, 4, 1001, '2019-06-20', '2019-07-19'),
	(118, 4, 1001, '2019-06-20', '2019-07-19'), --8 BOOKS BORROWED Kurt Cobain

	(111, 1, 1005, '2019-07-21', '2019-08-08'),
	(113, 1, 1005, '2019-07-21', '2019-08-08'),
	(114, 1, 1005, '2019-07-21', '2019-08-08'),
	(115, 1, 1005, '2019-07-21', '2019-08-08'),
	(116, 1, 1005, '2019-07-21', '2019-08-08'),
	(117, 1, 1005, '2019-07-21', '2019-08-08'),
	(118, 1, 1005, '2019-07-21', '2019-08-08'),
	(119, 1, 1005, '2019-07-21', '2019-08-08'), --8 BOOKS BORROWED Simon Gallup

	(102, 1, 1002, '2019-10-21', '2019-11-20') --1 BOOKS BORROWED Corey Duffel
;
SELECT * FROM tbl_book_loans;


GO

/* PROCEDURES CREATED*/

--PROCEDURE 1
CREATE PROCEDURE dbo.uspselectLostTribeFromSharpstown 
AS
SELECT tbl_book_copies.Number_Of_Copies, tbl_books.Title, tbl_library_branch.BranchName
FROM tbl_books
JOIN tbl_book_copies ON tbl_book_copies.BooksID = tbl_books.BooksID
JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
WHERE tbl_books.Title = 'The Lost Tribe'
AND tbl_library_branch.BranchName = 'Sharpstown'
GO

EXEC [dbo].[uspselectLostTribeFromSharpstown];
GO

--PROCEDURE 2
CREATE PROCEDURE dbo.uspselectLostTribeFromAllBranches @branchName NVARCHAR(20) = NULL
AS
SELECT tbl_book_copies.Number_Of_Copies, tbl_books.Title, tbl_library_branch.BranchName
FROM tbl_books
JOIN tbl_book_copies ON tbl_book_copies.BooksID = tbl_books.BooksID
JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
WHERE tbl_books.Title = 'The Lost Tribe'
GO

EXEC [dbo].[uspselectLostTribeFromAllBranches];
GO

--PROCEDURE 3
CREATE PROCEDURE dbo.uspselectBorrowersNoBooks
AS
SELECT tbl_borrower.Name
FROM tbl_borrower
FULL OUTER JOIN tbl_book_loans ON tbl_book_loans.CardNo = tbl_borrower.CardNo
WHERE tbl_book_loans.CardNo IS NULL
GO

EXEC [dbo].[uspselectBorrowersNoBooks];
GO

--PROCEDURE 4
CREATE PROCEDURE dbo.uspSelectBorrowerDataSharpstown
AS
SELECT library_branch.BranchName, book_loans.DateDue, books.Title, borrower.Name, borrower.Address
FROM library_branch
JOIN book_loans ON book_loans.BranchID = library_branch.BranchID
JOIN books ON books.BooksID = book_loans.BooksID
JOIN borrower ON borrower.CardNo = book_loans.CardNo
WHERE book_loans.DateDue = '2019/12/15'
AND library_branch.BranchName = 'Sharpstown'
GO

EXEC [dbo].[uspSelectBorrowerDataSharpstown];
GO

--PROCEDURE 5
CREATE PROCEDURE dbo.uspSelectLoanedBooks
AS
SELECT COUNT(*) AS 'Books Loaned', tbl_library_branch.BranchName
FROM tbl_library_branch
JOIN tbl_book_loans ON tbl_book_loans.BranchID = tbl_library_branch.BranchID
WHERE tbl_book_loans.DateDue = (DateDue)
GROUP BY tbl_library_branch.BranchName
GO

EXEC [dbo].[uspSelectLoanedBooks];
GO

--PROCEDURE 6
CREATE PROCEDURE dbo.uspSelectBorrowersBeyond5
AS
SELECT COUNT(tbl_book_loans.BooksID) AS 'BooksLoaned', tbl_borrower.Name, tbl_borrower.Address
FROM tbl_borrower
JOIN tbl_book_loans ON tbl_book_loans.CardNo = tbl_borrower.CardNo
GROUP BY tbl_borrower.Name, tbl_borrower.Address
HAVING COUNT(*)>5
GO

EXEC [dbo].[uspSelectBorrowersBeyond5];
GO

--PROCEDURE 7
CREATE PROCEDURE dbo.uspStephenKingCentral
AS
SELECT tbl_books.Title, tbl_book_authors.AuthorName, tbl_book_copies.Number_Of_Copies, tbl_library_branch.BranchName
FROM tbl_books
JOIN tbl_book_copies ON tbl_book_copies.BooksID = tbl_books.BooksID
JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
JOIN tbl_book_authors ON tbl_book_authors.BooksID = tbl_books.BooksID
WHERE tbl_book_authors.AuthorName = 'Stephen King'
AND tbl_library_branch.BranchName = 'Central'
GO

EXEC [dbo].[uspStephenKingCentral];
GO
