-- Courtney Bowe
-- 11/09/2022

-- Running this script will DELETE the existing database and all data it contains.
-- Use with caution.

-- Delete database if it already exists
DROP DATABASE IF EXISTS CourtneyBoweHotelDB;

-- Create new database
CREATE DATABASE CourtneyBoweHotelDB;

-- Use the new database
USE CourtneyBoweHotelDB;

-- Create Guest table
CREATE TABLE Guest (
    GuestId INT AUTO_INCREMENT,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    Zip CHAR(5) NOT NULL,
    PhoneNum CHAR(10) NOT NULL,
    CONSTRAINT pk_Guest
        PRIMARY KEY (GuestId)
);

-- Create RoomType table
CREATE TABLE RoomType (
    TypeId INT AUTO_INCREMENT,
    TypeName VARCHAR(10) NOT NULL,
    CONSTRAINT pk_RoomType
        PRIMARY KEY (TypeId)
);

-- Create PriceGroup table
CREATE TABLE PriceGroup (
    PriceGroupId INT AUTO_INCREMENT,
    PriceGroupName VARCHAR(25) NOT NULL,
    BasePrice DOUBLE NOT NULL,
    AddlGuestPrice DOUBLE,
    CONSTRAINT pk_PriceGroup
        PRIMARY KEY (PriceGroupId)
);

-- Create AmenitiesGroup table
CREATE TABLE AmenitiesGroup (
    AmenitiesGroupId INT AUTO_INCREMENT,
    Microwave INT NOT NULL,
    Refrigerator INT NOT NULL,
    Jacuzzi INT NOT NULL,
    Oven INT NOT NULL,
    CONSTRAINT pk_AmenitiesGroup
        PRIMARY KEY (AmenitiesGroupId)
);

-- Create Room table
CREATE TABLE Room (
    RoomId INT AUTO_INCREMENT,
    RoomNum INT NOT NULL,
    RoomType INT NOT NULL,
    PriceGroup INT NOT NULL,
    AmenitiesType INT NOT NULL,
    RoomFloor INT NOT NULL,
    AdaAccessible INT NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL,
    CONSTRAINT pk_Room
        PRIMARY KEY (RoomId),
    CONSTRAINT fk_Room_RoomType
        FOREIGN KEY (RoomType)
        REFERENCES RoomType(TypeId),
    CONSTRAINT fk_Room_PriceGroup
        FOREIGN KEY (PriceGroup)
        REFERENCES PriceGroup(PriceGroupId),
    CONSTRAINT fk_Room_AmenitiesType
        FOREIGN KEY (AmenitiesType)
        REFERENCES AmenitiesGroup(AmenitiesGroupId)
);

-- Create Reservation table
CREATE TABLE Reservation (
    ReservationId INT AUTO_INCREMENT,
    RoomId INT NOT NULL,
    GuestId INT NOT NULL,
    AdultGuestNum INT NOT NULL,
    ChildGuestNum INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalRoomCost DECIMAL NOT NULL,
    CONSTRAINT pk_Reservation
        PRIMARY KEY (ReservationId),
    CONSTRAINT fk_Reservation_Room
        FOREIGN KEY (RoomId)
        REFERENCES Room(RoomId),
    CONSTRAINT fk_Reservation_Guest
        FOREIGN KEY (GuestId)
        REFERENCES Guest(GuestId)
);
