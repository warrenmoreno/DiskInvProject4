/********************************************************************/
/*  Date		Name		Description								*/
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  2/28/2020	Warren		Initial deployed.						*/
/*	3/05/2020	Warren		Added inserts to all tables				*/ 
/*  3/12/2020	Warren		Added Reports for Project 4				*/
/*  4/08/2020	Warren		Added Stored Prodecures for Project 5	*/
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
           ,('Cher', 'Null', 1)				--Changed Willie Nelson to Cher 03/12/2020
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


-------------------------------------------------------------------------------- 03/13/2020 Project 4 starts here

--3. Show the disks in your database and any associated Individual artists only.

SELECT DiskName as 'Disk Name', Convert(VARCHAR(10), ReleaseDate, 101) AS 'Release Date', 
	FirName AS 'Artist First Name', LasName AS 'Artist Last Name'
	--SUBSTRING(FirName, 1, CHARINDEX (LasName, ''))
FROM Disk
	JOIN DiskHasArtist ON Disk.DiskID = DiskHasArtist.DiskID
	JOIN Artist ON DiskHasArtist.ArtistId = Artist.ArtistID
WHERE Artist_Type_ID = 1
ORDER BY LasName, FirName, DiskName;
GO

-- 4. Create a view called View_Individual_Artist that shows the artists’ names and not group names. 
	--Include the artist id in the view definition but do not display the id in your output.

CREATE VIEW View_Individual_Artist AS
	SELECT ArtistID, FirName, LasName
	From Artist
	WHERE Artist_Type_ID = 1;
GO
SELECT FirName AS 'First Name', LasName AS 'Last Name'
FROM View_Individual_Artist
ORDER BY LasName, FirName DESC;

-- 5. Show the disks in your database and any associated Group artists only. 
	--Use the View_Individual_Artist view.

SELECT DiskName as 'Disk Name', Convert(VARCHAR(10), ReleaseDate, 101) AS 'Release Date', 
	FirName AS 'Group Name'
FROM Disk
	JOIN DiskHasArtist On Disk.DiskID = DiskHasArtist.DiskID
	JOIN Artist ON DiskHasArtist.ArtistID = Artist.ArtistID
WHERE Artist.ArtistID NOT IN (SELECT ArtistID FROM View_Individual_Artist)
ORDER BY FirName;


-- 6. Show which disks have been borrowed and who borrowed them.

SELECT FirName AS 'First', LasName AS 'Last', DiskName AS 'Disk Name', 
	Convert(VARCHAR(10), BorrowerDate, 126) AS 'Borrowed Date', Convert(VARCHAR(10), ReturnDate, 126) AS 'Return Date'
FROM Borrower b
	JOIN DiskHasBorrower dhb ON b.BorrowerID = dhb.BorrowerID
	JOIN Disk d ON dhb.DiskID = d.DiskID
ORDER BY DiskName, LasName, FirName, BorrowerDate, ReturnDate;


-- 7. Show the number of times each disk has been borrowed.

SELECT d.DiskID, DiskName, COUNT(*) As 'Times Borrowed'
FROM Disk d
	JOIN DiskHasBorrower dhb ON d.DiskID = dhb.DiskID
GROUP BY d.DiskID, DiskName 
--HAVING COUNT(*) > 1
ORDER BY d.DiskID;


-- 8. Show the disks outstanding or on-loan and who has each disk.

SELECT DiskName AS 'Disk Name', Convert(VARCHAR(10), BorrowerDate, 126) AS 'Borrowed', 
	ReturnDate AS 'Returned', LasName AS 'Last Name'
FROM Disk d
	JOIN DiskHasBorrower dhb ON d.DiskId = dhb.DiskID
	JOIN Borrower b ON dhb.BorrowerID = b.BorrowerID
WHERE ReturnDate IS NULL
ORDER BY DiskName;

-------------------------------------------------------------------------------- 04/08/2020 Project 5 starts here
 
USE disk_inventoryWM
GO
--Project 5 Stored Procedures
--2. Create Insert, Update, and Delete stored procedures for the artist table. 
	--Update procedure accepts input parameters for all columns. 
	--Insert accepts all columns as input parameters except for identity fields. 
	--Delete accepts a primary key value for delete.

	
DROP PROCEDURE IF EXISTS sp_ins_Artist;
GO
CREATE PROCEDURE sp_ins_Artist
	@FirName VARCHAR(60), @LasName VARCHAR(60) = NULL, @Artist_Type_ID INT
AS
	BEGIN TRY
		INSERT INTO [dbo].[Artist]
				   ([FirName]
				   ,[LasName]
				   ,[Artist_Type_ID])
		 VALUES
				   (@FirName
				   ,@LasName 
				   ,@Artist_Type_ID);
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_ins_Artist TO diskUserWM;
EXEC sp_ins_Artist 'Cher', NULL, 1;
EXEC sp_ins_Artist 'Jared', 'Leto', 11;
GO

DROP PROCEDURE IF EXISTS sp_upd_Artist;
GO
CREATE PROCEDURE sp_upd_Artist
		@ArtistID int, @FirName VARCHAR(60), @LasName VARCHAR(60) = NULL, @Artist_Type_ID INT
AS
	BEGIN TRY
		UPDATE [dbo].[artist]
			SET [FirName] = @FirNAme
				,[LasName] = @LasName
				,[Artist_Type_ID] = @Artist_Type_ID

		WHERE ArtistID = @ArtistID;
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH

GO

GRANT EXECUTE ON sp_upd_Artist TO diskUserWM;
EXEC sp_upd_Artist 22, 'Cher', 'Updated', 2;
EXEC sp_upd_Artist 22, 'Jared', 'Leto', 11;
GO

DROP PROCEDURE IF EXISTS sp_del_Artist;
GO

CREATE PROCEDURE sp_del_Artist
		@ArtistID int
AS
	BEGIN TRY
		DELETE FROM [dbo].[Artist]
			WHERE ArtistID = @ArtistID
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH

GO

GRANT EXECUTE ON sp_del_Artist TO diskUserWM;
EXEC sp_del_Artist 22;
EXEC sp_del_Artist 1;
GO

--3. Create Insert, Update, and Delete stored procedures for the borrower table. 
	--Update procedure accepts input parameters for all columns. 
	--Insert accepts all columns as input parameters except for identity fields. 
	--Delete accepts a primary key value for delete.

DROP PROCEDURE IF EXISTS sp_ins_Borrower;
GO
CREATE PROCEDURE sp_ins_Borrower
	@FirName VARCHAR(60), @LasName VARCHAR(60), @Phone# VARCHAR(50)
AS
	BEGIN TRY
		INSERT INTO [dbo].[Borrower]
				   ([FirName]
				   ,[LasName]
				   ,[Phone#])
			 VALUES
				   (@FirName
				   ,@LasName
				   ,@Phone#)
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_ins_Borrower TO diskUserWM;
EXEC sp_ins_Borrower 'Eeyore', 'Donkey', '2082221234';
EXEC sp_ins_Borrower 'Eeyore', NULL, '2082221234';
GO

DROP PROCEDURE IF EXISTS sp_upd_Borrower;
GO
CREATE PROCEDURE sp_upd_Borrower
	@BorrowerID INT, @FirName VARCHAR(60), @LasName VARCHAR(60), @Phone# VARCHAR(50)
AS
	BEGIN TRY
		UPDATE [dbo].[Borrower]
		   SET [FirName] = @FirName
			  ,[LasName] = @LasName
			  ,[Phone#] = @Phone#
		 WHERE BorrowerID = @BorrowerID;
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_upd_Borrower TO diskUserWM;
EXEC sp_upd_Borrower 21, 'EeyoreXXX', 'DonkeyYYY', '208-222-1234';
EXEC sp_upd_Borrower 21, 'EeyoreXXX', NULL, '2082221234';
GO

DROP PROCEDURE IF EXISTS sp_del_Borrower;
GO
CREATE PROCEDURE sp_del_Borrower
	@BorrowerID INT
AS
	BEGIN TRY
		DELETE FROM [dbo].[Borrower]
			  WHERE BorrowerID = @BorrowerID;
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_upd_Borrower TO diskUserWM;
EXEC sp_del_Borrower 21;
EXEC sp_del_Borrower 2;
GO

--4. Create Insert, Update, and Delete stored procedures for the disk table. 
	--Update procedure accepts input parameters for all columns. 
	--Insert accepts all columns as input parameters except for identity fields. 
	--Delete accepts a primary key value for delete.

DROP PROCEDURE IF EXISTS sp_ins_Disk;
GO
CREATE PROCEDURE sp_ins_Disk
	@DiskName VARCHAR(60), @ReleaseDate DATETIME, @GenreID INT, @StatusID INt, @DiskTypeID INT
AS
	BEGIN TRY
		INSERT INTO [dbo].[Disk]
				   ([DiskName]
				   ,[ReleaseDate]
				   ,[GenreID]
				   ,[StatusID]
				   ,[DiskTypeID])
			 VALUES
				   (@DiskName
				   ,@ReleaseDate
				   ,@GenreID
				   ,@StatusID
				   ,@DiskTypeID)
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_ins_Disk TO diskUserWM;
EXEC sp_ins_Disk 'Lighting Bolt', '2/2/2013', 4,1,1 ;
EXEC sp_ins_Disk 'Eeyore', '2/2/2011',NULL,1,1;
GO

DROP PROCEDURE IF EXISTS sp_upd_Disk;
GO
CREATE PROCEDURE sp_upd_Disk
	@DiskID INT, @DiskName VARCHAR(60), @ReleaseDate DATETIME, @GenreID INT, @StatusID INt, @DiskTypeID INT
AS
	BEGIN TRY
		UPDATE [dbo].[Disk]
		   SET [DiskName] = @DiskName
			  ,[ReleaseDate] = @ReleaseDate
			  ,[GenreID] = @GenreID
			  ,[StatusID] = @StatusID
			  ,[DiskTypeID] = @DiskTypeID
		 WHERE DiskID = @DiskID
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_upd_Disk TO diskUserWM;
EXEC sp_upd_Disk 21, 'Lighting Bolt Updated', '2/2/2013', 3,2,2 ;
EXEC sp_upd_Disk 21, 'Eeyore', '2/2/2011',NULL,1,1;
GO

DROP PROCEDURE IF EXISTS sp_del_Disk;
GO
CREATE PROCEDURE sp_del_Disk
	@DiskID INT
AS
	BEGIN TRY
		DELETE FROM [dbo].[Disk]
			  WHERE DiskID = @DiskID
	END TRY
	BEGIN CATCH
		PRINT 'An error occured.';
		PRINT 'Message: ' + CONVERT(VARCHAR(200), ERROR_MESSAGE());
	END CATCH
GO
GRANT EXECUTE ON sp_del_Disk TO diskUserWM;
EXEC sp_del_Disk 21;
EXEC sp_del_Disk 4;
GO

