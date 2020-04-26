/********************************************************************/
/*  Date		Name		Description								*/
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  2/28/2020	Warren		Initial deployed.						*/
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
	LasName VARCHAR(60) NOT NULL,
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