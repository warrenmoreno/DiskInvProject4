/********************************************************************/
/*  Date		Name		Description								*/
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  2/28/2020	Warren		Initial deployed.						*/
/*	3/05/2018	Warren		Added inserts to all tables				*/
/********************************************************************/
USE master
GO

--Remove and Create Disk Database
DROP DATABASE IF EXISTS disk_inventoryWM;
GO

CREATE DATABASE disk_inventoryWM
GO

USE disk_inventoryWM;
GO

--Create Lookup Tables
CREATE TABLE Genre(
	GenreID INT NOT NULL PRIMARY KEY IDENTITY,
	Description VARCHAR(60) NOT NULL
);

CREATE TABLE DiskType (
	DiskTypeID INT NOT NULL PRIMARY KEY IDENTITY,
	Description VARCHAR(60) NOT NULL
);

CREATE TABLE Status(
	StatusID INT NOT NULL PRIMARY KEY IDENTITY,
	Description VARCHAR(60) NOT NULL
);

CREATE TABLE ArtistType (
	ArtistTypeID INT NOT NULL PRIMARY KEY IDENTITY,
	Description VARCHAR(60) NOT NULL
);

CREATE TABLE Borrower (
	BorrowerID INT NOT NULL PRIMARY KEY IDENTITY,
	FirName VARCHAR(60) NOT NULL,
	LasName VARCHAR(60) NOT NULL,
	Phone# VARCHAR(60) NOT NULL
);

CREATE TABLE Artist (
	ArtistID INT NOT NULL PRIMARY KEY IDENTITY,
	FirName VARCHAR(60) NOT NULL,
	LasName VARCHAR(60) NULL,
	Artist_Type_ID INT NOT NULL REFERENCES ArtistType(ArtistTypeID)
);

CREATE TABLE Disk (
	DiskID INT NOT NULL PRIMARY KEY IDENTITY,
	DiskName VARCHAR(60) NOT NULL, 
	ReleaseDate DATETIME NOT NULL,
	GenreID INT NOT NULL REFERENCES Genre(GenreID),
	StatusID INT NOT NULL REFERENCES Status(StatusID),
	DiskTypeID INT NOT NULL REFERENCES DiskType(DiskTypeID),
);

CREATE TABLE DiskHasArtist (
	DiskID INT NOT NULL REFERENCES Disk(DiskID),
	ArtistId INT NOT NULL REFERENCES Artist(ArtistID)
	PRIMARY KEY (DiskID, ArtistId)
);

CREATE TABLE DiskHasBorrower (
	BorrowerID INT NOT NULL REFERENCES Borrower(BorrowerID),
	DiskID INT NOT NULL REFERENCES Disk(DiskID),
	BorrowerDate DATETIME NOT NULL,
	ReturnDate DATETIME NULL,
	PRIMARY KEY (BorrowerID, DiskID, BorrowerDate)
);


--Drop and Create Login and Password
IF SUSER_ID('diskUserWM') IS NULL
	CREATE LOGIN diskUserWM WITH PASSWORD = 'Pa$$w0rd',
	DEFAULT_DATABASE = disk_inventoryWM;

DROP USER IF EXISTs diskUserWM;

CREATE USER diskUserWM FOR LOGIN diskUserWM;

--Grant read Permission to User
ALTER ROLE db_datareader ADD MEMBER diskUserWM;

------------------------------------------------------------------------------------ 3/5/2020

USE [disk_inventoryWM]
GO
--Insert Status Values
INSERT INTO [dbo].[Status]
           ([Description])
     VALUES
           ('Available')
		   ,('On Loan')
		   ,('Damaged')
		   ,('Missing')
GO
--Insert Genre Values
INSERT INTO [dbo].[Genre]
           ([Description])
     VALUES
           ('Classic Rock')
		   ,('Country')
		   ,('Jazz')
		   ,('AltRock')
		   ,('Metal')
GO
--Insert Disk Types
INSERT INTO [dbo].[DiskType]
           ([Description])
     VALUES
           ('CD')
		   ,('Vinyl')
		   ,('8Track')
		   ,('Cassette')
		   ,('DVD')
GO
--Insert Artist Types
INSERT INTO [dbo].[ArtistType]
           ([Description])
     VALUES
           ('Solo')
		   ,('Group')
GO
--Insert Disk Rows Part C
INSERT INTO [dbo].[Disk]
           ([DiskName]
           ,[ReleaseDate]
           ,[GenreID]
           ,[StatusID]
           ,[DiskTypeID])
     VALUES
           ('Crazy Train','1/1/1995',1,1,1)
           ,('No More Tears','11/21/1995',1,1,1)
           ,('Red','11/13/2008',2,2,1)
           ,('Jagged Little Pill','1/15/1995',1,2,1)
           ,('Candy-O','10/10/1992',1,2,2)
		   ,('Hotel Califorina','11/1/1975',1,2,2)
		   ,('One of These Nights','4/1/1975',1,2,2)
		   ,('The Long Run','10/21/1979',1,2,2)
		   ,('Hints, Allegations, and Things Left Unsaid','1/21/1999',4,2,2)
		   ,('Blender','1/29/2000',4,1,1)
		   ,('Dirt','1/27/1992',4,1,2)
		   ,('Unplugged','5/23/1996',4,1,2)
		   ,('Facelift','8/22/1990',4,1,2)
		   ,('Black Gives Way to Blue','11/21/2009',4,1,2)
		   ,('Live','11/11/2009',4,1,2)
		   ,('Ten','12/1/1991',4,1,2)
		   ,('Vitalogy','3/22/1994',4,1,2)
		   ,('No Code','4/2/1996',4,1,2)
		   ,('Backspacer','5/21/2009',4,1,2)
		   ,('Home','1/19/1995',1,2,2)	   
GO
UPDATE DISK
SET ReleaseDate = '11/11/2011'
WHERE DiskID = 20;
GO
-- Insert Borrower rows Part D
INSERT INTO [dbo].[Borrower]
           ([FirName],[LasName],[Phone#])
     VALUES
           ('Mickey','Mouse','111-111-1234')
		   ,('Minnie','Mouse','111-222-1234')
		   ,('Daisy','Duck','333-111-1234')
		   ,('Daffy','Duck','444-111-1234')
		   ,('Donald','Duck','555-111-1234')
		   ,('Huey','Duck','666-111-1234')
		   ,('Dewey','Duck','777-111-1234')
		   ,('Louie','Duck','888-111-1234')
		   ,('Elmer','Fudd','999-111-1234')
		   ,('Buzz','Lightyear','122-111-1234')
		   ,('Sheriff','Woody','133-111-1234')
		   ,('Little Bo','Peep','144-111-1234')
		   ,('Slinky','Dog','155-111-1234')
		   ,('Mr. Potato','Head','166-111-1234')
		   ,('Mr.','Spell','177-111-1234')
		   ,('Race','Car','188-111-1234')
		   ,('T','Rex','199-111-1234')
		   ,('Mrs. Potato','Head','211-111-1234')
		   ,('Sargent','Soldier','311-111-1234')
		   ,('Jessie','Cowgirl','411-111-1234')
GO
-- Insert the last Borrower
DELETE Borrower
WHERE BorrowerID = 20;
-- Insert Artist Rows Part E
INSERT INTO [dbo].[Artist]
           ([FirName],[LasName],[Artist_Type_ID])
     VALUES
           ('Ozzy', 'Osbourne', 1)
           ,('Willie', 'Nelson', 1)
		   ,('Taylor', 'Swift', 1)
		   ,('Alanis', 'Morisette', 1)
		   ,('Chris', 'Daughty', 1)
		   ,('The Cars', NULL, 2)
		   ,('Black Sabath', NULL, 2)
		   ,('The Eagles', NULL, 2)
		   ,('Patsy', 'Cline', 1)
		   ,('Pearl Jam', NULL, 2)
		   ,('Shinedown', NULL, 2)
		   ,('Collective Soul', NULL, 2)
		   ,('Five Finger Death Punch', NULL, 2)
		   ,('Disturbed', NULL, 2)
		   ,('Stone Temple Piolts', NULL, 2)
		   ,('Breaking Benjamin', NULL, 2)
		   ,('Seether', NULL, 2)
		   ,('Audioslave', NULL, 2)
		   ,('Temple of the Dog', NULL, 2)
		   ,('Alice in Chains', NULL, 2)
GO
--Insert Disk Has Borrower Part F
INSERT INTO [dbo].[DiskHasBorrower]
           ([BorrowerID],[DiskID],[BorrowerDate],[ReturnDate])
     VALUES
           (2,4, '1-2-2019', '2-20-2019')
		   ,(3,5, '11-12-2019', '12-21-2019')
		   ,(3,6, '1-22-2019', '2-22-2019')
		   ,(2,7, '7-22-2019', '8-20-2019')
		   ,(5,2, '10-2-2019', '12-20-2019')
		   ,(5,7, '4-2-2019', '5-20-2019')
		   ,(5,7, '8-22-2019', '9-20-2019')
		   ,(5,8, '11-2-2019', '2-20-2019')
		   ,(11,14, '7-26-2019', NULL)
		   ,(12,15, '8-25-2019', '9-26-2019')
		   ,(13,15, '10-24-2019', '11-26-2019')
		   ,(14,11, '1-2-2019', '12-2-2019')
		   ,(15,11, '11-22-2018', '2-20-2018')
		   ,(15,12, '12-12-2018', NULL)
		   ,(8,8, '3-21-2019', '2-20-2019')
		   ,(9,4, '4-2-2019', '7-20-2019')
		   ,(10,9, '5-25-2019', '6-22-2019')
		   ,(4,3, '6-2-2019', '7-29-2019')
		   ,(7,4, '1-22-2019', '7-22-2019')
		   ,(2,14, '5-12-2019', '6-2-2019') 
GO
--Insert Disk Has Artist Part G
INSERT INTO [dbo].[DiskHasArtist]
           ([DiskID],[ArtistId])
     VALUES
           (1,1)
		   ,(2,1)
		   ,(3,3)
		   ,(4,4)
		   ,(5,6)
		   ,(6,8)
		   ,(7,8)
		   ,(8,8)
		   ,(8,6)
		   ,(8,7)
		   ,(9,12)
		   ,(10,12)
		   ,(11,18)
		   ,(12,16)
		   ,(13,15)
		   ,(14,15)
		   ,(15,12)
		   ,(15,15)
		   ,(16,16)
		   ,(17,17)

GO
--h. List the Disks on Loan that have not been Returned
SELECT BorrowerID as Borrower_ID, DiskID as Disk_ID, BorrowerDate as Borrower_date, ReturnDate as 
Return_date
FROM DiskHasBorrower
WHERE ReturnDate IS NULL;