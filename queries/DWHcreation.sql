-- creating the date dimention
CREATE TABLE MyDimDate(
	dateID INT NOT NULL PRIMARY KEY,
	date DATE,
	year INT,
	quarter INT,
	quarterName VARCHAR(2),
	month INT,
	monthName VARCHAR(10),
	day INT,
	weekday INT,
	weekdayName VARCHAR(10)
);


-- creating the waste dimention
CREATE TABLE MyDimWaste(
	wasteID INT NOT NULL PRIMARY KEY, 
	wasteType VARCHAR(10)
);


-- creating the zone dimention
CREATE TABLE MyDimZone(
	zoneID INT NOT NULL PRIMARY KEY,
	collectionZone VARCHAR(10),
	City VARCHAR(15)
);


-- creating the truck dimention
CREATE TABLE MyDimTruck(
	truckID INT NOT NULL PRIMARY KEY, 
	truckType VARCHAR(15)
);


-- creating the trip fact table
CREATE TABLE MyFactTrip(
	tripNum_SK INT NOT NULL PRIMARY KEY,
	dateID INT,
	wasteID INT,
	zoneID INT,
	truckID INT,
	wastecollintns FLOAT,
	FOREIGN KEY (dateID) REFERENCES MyDimDATE(dateID),
	FOREIGN KEY (wasteID) REFERENCES MyDimWaste(wasteID),
	FOREIGN KEY (zoneID) REFERENCES MyDimZone(zoneID),
	FOREIGN KEY (truckID) REFERENCES MyDimTruck(truckID)
);
