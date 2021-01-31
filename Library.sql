-- Create a new database called 'Libray'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'Libray'
)
CREATE DATABASE Libray

GO
-- Create a new table called 'Customers' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.customers', 'U') IS NOT NULL
DROP TABLE SchemaName.customers
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.customers
(
    customers_id INT NOT NULL PRIMARY KEY, -- primary key column
    fullname [NVARCHAR](50) NOT NULL,
    customer_address [NVARCHAR](50) NOT NULL,
    phone INT NOT NULL
    -- specify more columns here
);
INSERT INTO customers(customers_id,fullname,customer_address,phone)
VALUES (1, 'Stephen Harris', '111 First St', 1112223333),
		(2, 'Jenny Flipperton', '222 Second Blvd', 4445556666),
		(3, 'Bonnie Spring', '333 Thourth Ave', 7778889999),
		(4, 'Jackson Timoth', '444 Fird Drive', 1011111212),
		(5, 'Leslie Carpenter', '555 Sifth Parkway', 1311411515),
		(6, 'Larry Heart', '666 Fixth Aley', 1611711818),
		(7, 'Michael Lupu', '777 Seighth Rue', 1912022121),
		(8, 'Lincoln Lissey', '888 Eeventh Calle', 2222322424),
		(9, 'Jerome Cursey', '999 Nenth Place', 2522622727),
		(10, 'Clyde Theglyde', '1000 Tinth St', 2822923030),
		(11, 'Tony Danza', '1111 Elevendieth St', 3133233434),
		(12, 'Phil Collins', '1212 Tonight Ave', 3533633737),
		(13, 'Dexter McGuffin', '1313 Pine Grove Dr', 3833934040),
		(14, 'Halley Commit', '1414 Git St', 4144244343),
		(15, 'Steve Holt', '1515 SW Goat Ave', 4444544646)
GO
-- Create a new table called 'library_branch' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.library_branch', 'U') IS NOT NULL
DROP TABLE SchemaName.library_branch
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.library_branch
(
    branch_id INT NOT NULL PRIMARY KEY, -- primary key column
    branch_name [NVARCHAR](50) NOT NULL,
    branch_city [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
INSERT INTO library_branch(branch_id,branch_name,branch_city)
VALUES  (1, 'WSB Poznan', 'Poznan'),
		(2, 'WSB Warsaw', 'Warsaw'),
		(3, 'WSB Bydgoszcz', 'Bydgoszcz'),
		(4, 'WSB Gdansk', 'Gdansk'),
		(5, 'WSB Chorzow', 'Chorzow')
GO
-- Create a new table called 'Rentals' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.rentals', 'U') IS NOT NULL
DROP TABLE SchemaName.rentals
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.rentals
(
    branch_id INT NOT NULL PRIMARY KEY, -- primary key column
    books_id [NVARCHAR](50) NOT NULL,-- candidate key column
    customers_id [NVARCHAR](50) NOT NULL,-- candidate key column
    dateOfrental TIMESTAMP,
    dateOfreturn TIMESTAMP
    -- specify more columns here
);
INSERT INTO rentals(books_id,branch_id,customers_id,dateOfrental,dateOfreturn)
VALUES (19, 2, 1, '2015-12-10', '2016-03-10'),
		(19, 2, 1, '2015-12-10', '2016-03-10'),
		(10, 1, 1, '2016-05-22', '2016-08-22'),
		(9, 1, 1, '2016-05-22', '2016-08-22'),
		(5, 1, 1, '2016-05-22', '2016-08-22'),
		(14, 2, 3, '2016-02-19', '2016-05-19'),
		(1, 1, 3, '2016-03-24', '2016-06-24'),
		(2, 1, 3, '2016-03-24', '2016-06-24'),
		(3, 1, 3, '2016-03-24', '2016-06-24'),
		(4, 1, 3, '2016-03-24', '2016-06-24'), --10 loans--
		(5, 1, 4, '2012-01-13', '2012-04-13'),
		(6, 1, 5, '2010-10-31', '2011-01-31'),
		(7, 1, 6, '2011-11-11', '2012-02-11'),
		(8, 1, 7, '2013-04-04', '2013-07-04'),
		(9, 1, 8, '2014-06-21', '2014-09-21'),
		(10, 1, 9, '2009-12-07', '2010-03-07'),
		(11, 2, 10, '2012-12-12', '2013-03-12'),
		(12, 2, 10, '2012-12-12', '2013-03-12'),
		(13, 2, 10, '2012-12-12', '2013-03-12'),
		(14, 2, 11, '2014-08-16', '2014-11-16'), --20 loans--
		(15, 2, 12, '2014-09-22', '2014-12-22'),
		(16, 2, 12, '2014-09-22', '2014-12-22'),
		(17, 2, 13, '2015-11-29', '2016-02-29'),
		(18, 2, 14, '2007-12-13', '2008-03-13'),
		(18, 2, 14, '1992-07-19', '1992-10-19'),
		(20, 2, 1, '2009-01-11', '2009-04-11'),
		(1, 1, 4, '2016-02-22', '2016-05-22'),
		(2, 1, 5, '2013-11-12', '2014-02-12'),
		(3, 1, 5, '2013-11-12', '2014-02-12'),
		(4, 1, 5, '2013-11-12', '2014-02-12'), --30 loans--
		(5, 1, 9, '2013-10-15', '2014-01-15'),
		(6, 1, 10, '2012-05-25', '2012-08-25'),
		(7, 1, 11, '2012-06-20', '2012-09-20'),
		(8, 1, 12, '2005-09-17', '2005-12-17'),
		(9, 1, 2, '2015-11-06', '2016-02-06'),
		(10, 1, 2, '2015-11-06', '2016-02-06'),
		(11, 2, 3, '2014-06-01', '2014-09-01'),
		(1, 1, 13, '2016-05-25', '2016-08-25'),
		(12, 2, 13, '2016-05-25', '2016-08-25'),
		(13, 2, 13, '2016-05-25', '2016-08-25'), --40 loans--
		(14, 2, 3, '2016-05-25', '2016-08-25'),
		(15, 2, 14, '1995-12-02', '1996-03-02'),
		(16, 2, 14, '1994-11-17', '1995-02-17'),
		(17, 2, 6, '2003-04-10', '2003-07-10'),
		(18, 2, 7, '2010-02-13', '2010-05-13'),
		(19, 2, 8, '2014-01-01', '2014-04-01'),
		(20, 2, 8, '2014-01-01', '2014-04-01'),
		(9, 1, 3, '2016-02-07', '2016-05-07'),
		(10, 1, 3, '2016-02-07', '2016-05-07'),
		(19, 2, 3, '2016-03-04', '2016-06-04'), --50 loans--
		(19, 3, 1, '2016-06-04', '2016-09-04'),
		(19, 4, 1, '2016-05-30', '2016-08-30'),
		(19, 5, 1, '2016-05-24', '2016-08-04')
GO
-- Create a new table called 'Books' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.books', 'U') IS NOT NULL
DROP TABLE SchemaName.books
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.books
(
    books_id INT NOT NULL PRIMARY KEY, -- primary key column
    authors_id INT NOT NULL , -- candidate key column
    publisher_id INT NOT NULL, -- candidate key column
    category_id INT NOT NULL, -- candidate key column
    title [NVARCHAR](50) NOT NULL,
    year INTEGER NOT NULL,
    price INTEGER NOT NULL,
    age_restriction INT NOT NULL
    -- specify more columns here
);
INSERT INTO books(books_id,title,publisher_id,authors_id,year,price,age_restriction)
VALUES (1, 'The Lost tribe', 1,1,1985,40,18),
		(2, 'Binky Bonks Cablooey Booey Adventure', 2,2,1985,40,18),
		(3, 'Binky Bonk Goes To HollyRude', 2,3,1985,40,18),
		(4, 'Binky Bonk Gets A New Toy', 2,4,1985,40,18),
		(5, 'Bob Clancys Light Scatter 7',3,5,1985,40,18),
		(6, 'Dangerous Depths', 3,6,1985,40,18),
		(7, 'Bewildered', 4,7,1985,40,18),
		(8, 'A Stones Throw From Death', 5,8,1985,40,18),
		(9, 'How To Build A Database', 6,9,1985,40,18),
		(10, 'How To Keep Students On Track',6,10,1985,40,18),
		(11, 'SoapBox Derby For Goofballs', 7,11,1985,40,18),
		(12, 'The Lost Tribe 2: Avoiding Right Excluding Join', 1,12,1985,40,18),
		(13, 'The Lost Tribe 3: Accepting Full Outer Join', 1,13,1985,40,18),
		(14, 'Cooking With Lasers', 8,14,1985,40,18),
		(15, 'Workplace Etiquette', 9,15,1985,40,18),
		(16, 'Incubation', 10,16,1985,40,18),
		(17, 'Muhblazopan', 11,17,1985,40,18),
		(18, 'Girls Chase Boys Chase Girls', 12,18,1985,40,18),
		(19, 'Fifty Shades Of Black Magic', 13,19,1985,40,18),
		(20, 'Books For Dumb-Dumbs', 7,20,1985,40,18)
GO
-- Create a new table called 'publisher' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.publisher', 'U') IS NOT NULL
DROP TABLE SchemaName.publisher
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.publisher
(
    publisher_id INT NOT NULL PRIMARY KEY, -- primary key column
    publisher_name [NVARCHAR](50) NOT NULL
    -- specify more columns here
);
INSERT INTO publisher(publisher_id,publisher_name)
VALUES  (1,'Extreme Books'),
		(2,'Kids Read Too'),
		(3,'Adults Read As Well'),
		(4,'LightHouse Books'),
		(5,'Gutenberg Books'),
		(6,'The Tech Academy'),
		(7,'How To Do It Books'),
		(8,'Bon Apetit'),
		(9,'Strong Books'),
		(10,'Star Gate Books'),
		(11,'Pharmasuiticals'),
		(12,'Hashtag Books'),
		(13,'Fantasy The Gathering')
GO
-- Create a new table called 'copies' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.copies', 'U') IS NOT NULL
DROP TABLE SchemaName.copies
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.copies
(
    books_id INT NOT NULL , -- candidate key column
    branch_id INT NOT NULL, -- candidate key column
    available INT NOT NULL
    -- specify more columns here
);
INSERT INTO copies(books_id,available)
VALUES  (1, 1, 2),
		(2, 1, 2),
		(3, 1, 2),
		(4, 1, 2),
		(5, 1, 2),
		(6, 1, 2),
		(7, 1, 2),
		(8, 1, 2),
		(9, 1, 2),
		(10, 1, 2),
		(11, 1, 0),
		(12, 1, 0),
		(13, 1, 0),
		(14, 1, 0),
		(15, 1, 0),
		(16, 1, 0),
		(17, 1, 0),
		(18, 1, 0),
		(19, 1, 0),
		(20, 1, 0),
		(1, 2, 0),
		(2, 2, 0),
		(3, 2, 0),
		(4, 2, 0),
		(5, 2, 0),
		(6, 2, 0),
		(7, 2, 0),
		(8, 2, 0),
		(9, 2, 0),
		(10, 2, 0),
		(11, 2, 2),
		(12, 2, 2),
		(13, 2, 2),
		(14, 2, 2),
		(15, 2, 2),
		(16, 2, 2),
		(17, 2, 2),
		(18, 2, 3),
		(19, 2, 4),
		(20, 2, 5), 
		(1, 3, 2),
		(2, 3, 2),
		(3, 3, 2),
		(4, 3, 2),
		(5, 3, 2),
		(6, 3, 2),
		(7, 3, 2),
		(8, 3, 2),
		(9, 3, 2),
		(10, 3, 2),
		(11, 3, 2),
		(12, 3, 2),
		(13, 3, 2),
		(14, 3, 2),
		(15, 3, 2),
		(16, 3, 2),
		(17, 3, 2),
		(18, 3, 3),
		(19, 3, 4),
		(20, 3, 5),
		(1, 4, 1),
		(2, 4, 1),
		(3, 4, 1),
		(4, 4, 2),
		(5, 4, 1),
		(6, 4, 2),
		(7, 4, 1),
		(8, 4, 2),
		(9, 4, 1),
		(10, 4, 2),
		(11, 4, 1),
		(12, 4, 2),
		(13, 4, 1),
		(14, 4, 2),
		(15, 4, 3),
		(16, 4, 2),
		(17, 4, 1),
		(18, 4, 3),
		(19, 4, 4),
		(20, 4, 5),
		(1, 5, 1),
		(2, 5, 1),
		(3, 5, 1),
		(4, 5, 2),
		(5, 5, 1),
		(6, 5, 2),
		(7, 5, 1),
		(8, 5, 2),
		(9, 5, 1),
		(10, 5, 2),
		(11, 5, 1),
		(12, 5, 2),
		(13, 5, 1),
		(14, 5, 2),
		(15, 5, 3),
		(16, 5, 2),
		(17, 5, 1),
		(18, 5, 3),
		(19, 5, 4),
		(20, 5, 5)
GO
-- Create a new table called 'authors' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.authors', 'U') IS NOT NULL
DROP TABLE SchemaName.authors
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.authors
(
    authors_id INT NOT NULL PRIMARY KEY, -- primary key column
    books_id INT NOT NULL , -- candidate key column
    firstname [NVARCHAR](50) NOT NULL,
    lastname [NVARCHAR](50) NOT NULL,
    -- specify more columns here
);
GO
INSERT INTO authors(authors_id, books_id,firstname,lastname)
VALUES  (1,1, 'Bill',' Dougan'),
		(2,2, 'Sarah',' Epstein'),
		(3, 3,'Sarah',' Epstein'),
		(4, 4,'Sarah',' Epstein'),
		(5, 5,'Bob',' Clancy'),
		(6, 6,'Bob',' Clancy'),
		(7, 7,'Anna',' Marinara'),
		(8, 8,'Johannes',' Beethoven'),
		(9, 9,'Derik',' Pross'),
		(10,10,'Derik',' Pross'),
		(11,11, 'Kevin',' Robinson'),
		(12,12, 'Bill',' Dougan'),
		(13,13, 'Bill',' Dougan'),
		(14,14, 'Ellon',' Ramsy'),
		(15,15, 'Jerry',' MaCguire'),
		(16,16, 'Kurt',' Wrussel'),
		(17,17, 'Tyler',' Dirden'),
		(18, 18,'Jaykay','Elohel'),
		(19, 19,'Stephen',' King'),
		(20,20, 'Sean',' Cannery')
GO
-- Create a new table called 'category' in schema 'SchemaName'
-- Drop the table if it already exists
IF OBJECT_ID('SchemaName.category', 'U') IS NOT NULL
DROP TABLE SchemaName.category
GO
-- Create the table in the specified schema
CREATE TABLE SchemaName.category
(
    category_id INT NOT NULL PRIMARY KEY, -- primary key column
    book_category [NVARCHAR](50) NOT NULL -- candidate key
    -- specify more columns here
);
GO
INSERT INTO category (category_id, book_category)
VALUES(1,'classics'),
      (2,'comic'),
      (3,'action'),
      (4,'fantasy'),
      (5,'fiction'),
      (6,'horror'),
      (7,'romance'),
      (8,'sci_fi'),
      (9,'thtillers')
GO



------------------------------------------Amswers------------------------------------------
--1
SELECT title
FROM books  
JOIN authors on books.authors_id = authors.authors_id
GROUP BY Authors.name,surname,Authors.authorId
ORDER BY COUNT DESC
;
------------------------------------------Amswers------------------------------------------
--2
SELECT firstname, lastname
FROM authors a 
JOIN books b ON authors_id = a.authors_id;
------------------------------------------Amswers------------------------------------------
--3
SELECT title
FROM books b 
JOIN rentals r ON books_id = b.books_id
WHERE dateOfreturn = NULL;
------------------------------------------Amswers------------------------------------------
--4
SELECT title
FROM books b 
JOIN rentals r ON books_id = b.books_id
WHERE dateOfrental > INTERVAL 28 DAYS;
------------------------------------------Amswers------------------------------------------
--5
SELECT book_category
FROM category c
INNER JOIN category c ON books_id = c.category_id
INNER JOIN books b ON rentals_id = b.books_id 
