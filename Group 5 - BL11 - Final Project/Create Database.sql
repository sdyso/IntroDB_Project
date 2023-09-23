-- NAMA ANGGOTA : 
-- 2540134810 - Jonathan Christian
-- 2501960940 - Howie Ciuputra
-- 2540128152 - Louis Ignatius

CREATE DATABASE JFAutomobile
GO
USE JFAutomobile


CREATE TABLE [Staff] (
	StaffID CHAR(6) PRIMARY KEY CHECK (StaffID LIKE 'SF-[0-9][0-9][0-9]'),
	StaffName VARCHAR(50) NOT NULL,
	StaffEmail VARCHAR(50) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL,
	StaffAddress VARCHAR(50) NOT NULL,
	StaffPhone CHAR(20) NOT NULL,
	CONSTRAINT StaffCheck CHECK(StaffEmail like '%@%')
);

CREATE TABLE [Customer] (
	CustomerID CHAR(6) PRIMARY KEY CHECK (CustomerID LIKE 'CS-[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerEmail VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerPhone CHAR(20) NOT NULL,
	CONSTRAINT CustomerLength CHECK(LEN(CustomerName) BETWEEN 5 and 50),
	CONSTRAINT CustomerGen CHECK(CustomerGender in ('Male' , 'Female'))
);


CREATE TABLE [CarBrand] (
	BrandID CHAR(6) PRIMARY KEY CHECK (BrandID LIKE 'CB-[0-9][0-9][0-9]'),
	BrandName VARCHAR(50) NOT NULL,
	OriginCountry VARCHAR(50) NOT NULL,
	CONSTRAINT CarCountry CHECK(OriginCountry in ('Japan' , 'German' , 'United States'))
);


CREATE TABLE [CarRental] (
	CarID CHAR(6) PRIMARY KEY CHECK (CarID LIKE 'CR-[0-9][0-9][0-9]'),
	BrandID CHAR(6) FOREIGN KEY REFERENCES CarBrand(BrandID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarName VARCHAR(50) NOT NULL,
	CarPrice FLOAT NOT NULL,
	SeatCapacity INT NOT NULL,
	EngineCapacity INT NOT NULL,
	AvailabilityStatus INT NOT NULL,
	CONSTRAINT CarLength CHECK(LEN(CarName) > 0),
	CONSTRAINT CarCheck CHECK(CarPrice > 2000 or CarPrice < 4000),
	CONSTRAINT CarSeat CHECK(SeatCapacity > 1 or SeatCapacity < 6),
	CONSTRAINT CarEngince CHECK(EngineCapacity > 1000 or EngineCapacity < 3000),
	CONSTRAINT CarAvailability CHECK(AvailabilityStatus in (0, 1))
);


CREATE TABLE [Mechanic] (
	MechanicID CHAR(6) PRIMARY KEY CHECK (MechanicID LIKE 'MC-[0-9][0-9][0-9]'),
	MechanicName VARCHAR(50) NOT NULL,
	MechanicEmail VARCHAR(50) NOT NULL,
	MechanicGender VARCHAR(10) NOT NULL,
	MechanicAddress VARCHAR(50) NOT NULL,
	MechanicPhone CHAR(20) NOT NULL,
	CONSTRAINT MechanicStreet CHECK(MechanicAddress like '%street')
);

CREATE TABLE CarService (
	CarServiceID CHAR(6) PRIMARY KEY CHECK(CarServiceID LIKE 'SV-[0-9][0-9][0-9]'),
	CarServices VARCHAR(50) NOT NULL,
	ServicePrice INT NOT NULL,
	CONSTRAINT CarServices CHECK(ServicePrice between 100000 and 1000000)
);

CREATE TABLE [ServiceTransaction] (
	ServiceID CHAR(6) PRIMARY KEY CHECK (ServiceID LIKE 'TS-[0-9][0-9][0-9]'),
	StaffID CHAR(6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	MechanicID CHAR(6) FOREIGN KEY REFERENCES Mechanic(MechanicID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarServiceID CHAR(6) FOREIGN KEY REFERENCES CarService(CarServiceID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarID CHAR(6) CHECK (CarID LIKE 'CR-[0-9][0-9][0-9]'),
	TransactionDate DATE NOT NULL,
	CONSTRAINT ServiceDate CHECK(TransactionDate > GETDATE())
);

CREATE TABLE ServiceTransactionDetail(
	ServiceID CHAR(6) FOREIGN KEY REFERENCES ServiceTransaction(ServiceID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarID CHAR(6) FOREIGN KEY REFERENCES CarRental(CarID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CONSTRAINT Composite PRIMARY KEY(CarID, ServiceID)
)

CREATE TABLE RentalTransaction (
	TransactionID CHAR(6) PRIMARY KEY CHECK (TransactionID LIKE 'TR-[0-9][0-9][0-9]'),
	StaffID CHAR(6) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(6) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarID CHAR(6) CHECK (CarID LIKE 'CR-[0-9][0-9][0-9]'),
	StartDate DATE NOT NULL,
	ReturnDate DATE NOT NULL,
	DistanceTraveled INT,
	CONSTRAINT CarDistance CHECK(DistanceTraveled > NULL or DistanceTraveled > 0),
	CONSTRAINT CarReturn CHECK(ReturnDate > GETDATE())
);

CREATE TABLE RentalTransactionDetail(
	TransactionID CHAR(6) FOREIGN KEY REFERENCES RentalTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CarID CHAR(6) FOREIGN KEY REFERENCES CarRental(CarID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CONSTRAINT Composite2 PRIMARY KEY(CarID, TransactionID)
)
