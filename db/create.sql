CREATE TABLE BloodGroups (
    BloodTypeID SERIAL PRIMARY KEY,
    BloodGroup VARCHAR(10) NOT NULL,
    RhesusFactor CHAR(1) NOT NULL
);

CREATE TABLE OrganType (
    OrganTypeID SERIAL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Text TEXT
);

CREATE TABLE Hospitals (
    HospitalID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    ZIPCode VARCHAR(10),
    ContactNumber VARCHAR(15)
);

CREATE TABLE Donors (
    DonorID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    BloodTypeID INT REFERENCES BloodGroups(BloodTypeID),
    DateOfDeath DATE,
    HospitalID INT REFERENCES Hospitals(HospitalID) ON DELETE CASCADE,
    Status VARCHAR(50)
);

CREATE TABLE Recipients (
    RecipientID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    BloodTypeID INT REFERENCES BloodGroups(BloodTypeID),
    OrganNeededID INT REFERENCES OrganType(OrganTypeID),
    PriorityScore NUMERIC(4,2),
    HospitalID INT REFERENCES Hospitals(HospitalID),
    Status VARCHAR(50)
);

CREATE TABLE Organs (
    OrganID SERIAL PRIMARY KEY,
    DonorID INT REFERENCES Donors(DonorID),
    OrganTypeID INT REFERENCES OrganType(OrganTypeID),
    AvailabilityStatus VARCHAR(50),
    ExtractionDate DATE
);

CREATE TABLE Matches (
    MatchID SERIAL PRIMARY KEY,
    RecipientID INT REFERENCES Recipients(RecipientID),
    OrganID INT REFERENCES Organs(OrganID),
    MatchDate DATE,
    CompatibilityScore NUMERIC(4,2)
);

CREATE TABLE Transplants (
    TransplantID SERIAL PRIMARY KEY,
    MatchID INT REFERENCES Matches(MatchID),
    HospitalID INT REFERENCES Hospitals(HospitalID),
    LeadSurgeonID INT,
    TransplantDate DATE,
    Outcome TEXT
);

CREATE TABLE OrganTransfer (
    TransferID SERIAL PRIMARY KEY,
    OrganID INT REFERENCES Organs(OrganID),
    FromHospitalID INT REFERENCES Hospitals(HospitalID),
    ToHospitalID INT REFERENCES Hospitals(HospitalID),
    PickupTime TIMESTAMP,
    DeliveryTime TIMESTAMP,
    TransportationMode VARCHAR(50),
    Preservation TEXT,
    ConditionOnArrivial TEXT
);

CREATE TABLE MedicalStaff (
    StaffID SERIAL PRIMARY KEY,
    HospitalID INT REFERENCES Hospitals(HospitalID),
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Role VARCHAR(50),
    ContactInfo VARCHAR(100)
);

CREATE TABLE OrganTests (
    OrganTestID SERIAL PRIMARY KEY,
    OrganID INT REFERENCES Organs(OrganID),
    TestName VARCHAR(100),
    Result VARCHAR(100),
    TestDate DATE,
    PerformedByID INT REFERENCES MedicalStaff(StaffID),
    Notes TEXT
);

CREATE TABLE MedicalTests (
    TestID SERIAL PRIMARY KEY,
    PersonType VARCHAR(10),
    PersonID INT,
    TestName VARCHAR(100),
    Result VARCHAR(100),
    TestDate DATE,
    DonorID INT REFERENCES Donors(DonorID),
    RecipientID INT REFERENCES Recipients(RecipientID),
    HospitalID INT REFERENCES Hospitals(HospitalID),
    Status VARCHAR(50)
);
