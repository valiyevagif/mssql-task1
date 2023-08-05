CREATE TABLE Markas(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
)

CREATE TABLE Models(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
	MarkaId INT NOT NULL,
	Constraint FK_Models_MarkaId FOREIGN Key(MarkaId) REFERENCES Markas(Id)
)

CREATE TABLE Categories(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
)

CREATE TABLE Colors(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
)

CREATE TABLE FuelType(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,
)

CREATE TABLE Gears(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,	
)

CREATE TABLE Transmissions(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,	
)

CREATE TABLE Markets(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,	
)

CREATE TABLE Equipments(
	Id INT Identity(1,1) PRIMARY KEY,
	[Name] Varchar(200) NOT NULL,	
)

CREATE TABLE Advertisements(
	Id INT Identity(1,1) PRIMARY KEY,
	Mileage DECIMAL(18,1) NOT NULL,
	MileageUnit TINYINT NOT NULL,
	Price INT NOT NULL,
	Currency TINYINT NOT NULL,
	IsCrashed BIT NOT NULL,
	IsPainted BIT NOT NULL,
	ForSpareParts BIT NOT NULL,
	SeatsCount TINYINT,
	HasLoan BIT NOT NULL,
	HasBarter BIT NOT NULL,
	Vin VARCHAR(100) NOT NULL,
	[Description] VARCHAR (200) NOT NULL,
	[Year] INT NOT NULL,
	EngineVolume INT NOT NULL,
	EnginePower INT NOT NULL,
	ModelId INT NOT NULL,
	CategoryId INT NOT NULL,
	ColorId INT NOT NULL,
	FuelTypeId INT NOT NULL,
	GearId INT NOT NULL,
	TransmissionId INT NOT NULL,
	Constraint FK_Advertisement_ModelId FOREIGN KEY (ModelId) REFERENCES Models(Id),
	Constraint FK_Advertisement_FuelTypeId FOREIGN KEY (FuelTypeId) REFERENCES FuelTypes(Id),
	Constraint FK_Advertisement_TransmissionId FOREIGN KEY (TransmissionId) REFERENCES Transmissions(Id),
	Constraint FK_Advertisement_GearId FOREIGN KEY (GearId) REFERENCES Gears(Id),
	Constraint FK_Advertisement_ColorId FOREIGN KEY (ColorId) REFERENCES Colors(Id),
	Constraint FK_Advertisement_CategoryId FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	Constraint CK_Adversitement_Price Check (Price>0),
	Constraint CK_Adversitement_Year Check ([Year]>1970 and [Year] <= year(getdate())),
)

create table AdvertisementEquipments (
	AdvertisementId INT NOT NULL,
	EquipmentId INT NOT NULL,
	Constraint PK_AdvertisementEquipments PRIMARY KEY (AdvertisementId, EquipmentId)
)

CREATE TABLE Images ( 
	Id INT PRIMARY KEY Identity(1,1),
	[Name] VARCHAR(200) NOT NULL,
	ViewPoint TINYINT,
	AdvertisementId INT NOT NULL,
	Constraint FK_Images_AdvertisementId FOREIGN KEY (AdvertisementId) REFERENCES Advertisements(Id),
)

ALTER TABLE AdvertisementEquipments
	ADD Constraint FK_AdvertisementEquipments FOREIGN KEY (AdvertisementId) REFERENCES Advertisements(Id),
	Constraint FK_AdvertisementEquipment FOREIGN KEY (EquipmentId) REFERENCES Equipments(Id)