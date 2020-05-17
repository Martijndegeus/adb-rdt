USE crime_us_2010;
GO

DROP TABLE IF EXISTS crimeTypes;
CREATE TABLE crimeTypes
(
    CrimeCode            INT,
    CrimeCodeDescription VARCHAR(100)
        CONSTRAINT crimeType_PK PRIMARY KEY (CrimeCode)
);

DROP TABLE IF EXISTS premises;
CREATE TABLE premises
(
    PremiseCode        INT,
    PremiseDescription VARCHAR(100)
        CONSTRAINT premises_PK PRIMARY KEY (PremiseCode)
);

DROP TABLE IF EXISTS areas;
CREATE TABLE areas
(
    AreaId   INT,
    AreaName VARCHAR(100)
        CONSTRAINT areas_PK PRIMARY KEY (AreaId)
);

DROP TABLE IF EXISTS weapons;
CREATE TABLE weapons
(
    WeaponCode        INT,
    WeaponDescription VARCHAR(150)
        CONSTRAINT weapons_PK PRIMARY KEY (WeaponCode)
);

DROP TABLE IF EXISTS statuses;
CREATE TABLE statuses
(
    StatusCode        VARCHAR(3),
    StatusDescription VARCHAR(100)
        CONSTRAINT statuses_PK PRIMARY KEY (StatusCode)
);

DROP TABLE IF EXISTS crimes;
CREATE TABLE crimes
(
    DRNumber          INT,
    DateReported      VARCHAR(10),
    DateOccurred      VARCHAR(10),
    TimeOccurred      INT,
    AreaID            INT,
    ReportingDistrict INT,
    CrimeCode         INT,
    MOCodes           VARCHAR(150),
    VictimAge         INT,
    VictimSex         VARCHAR(1),
    VictimDescent     VARCHAR(1),
    PremiseCode       INT NULL,
    WeaponUsedCode    INT NULL,
    StatusCode        VARCHAR(3),
    CrimeCode1        INT,
    CrimeCode2        INT,
    CrimeCode3        INT,
    CrimeCode4        INT,
    Address           VARCHAR(150),
    CrossStreet       VARCHAR(150),
    Location          VARCHAR(150)
        CONSTRAINT crimes_PK PRIMARY KEY (DRNumber)
);

ALTER TABLE crimes
    ADD CONSTRAINT FK_CrimeType_Crime
        FOREIGN KEY (CrimeCode) REFERENCES crimeTypes (CrimeCode)
            ON UPDATE CASCADE
            ON DELETE CASCADE;

ALTER TABLE crimes
    ADD CONSTRAINT FK_Premises_Crime
        FOREIGN KEY (PremiseCode) REFERENCES premises (PremiseCode)
            ON UPDATE CASCADE
            ON DELETE CASCADE;

ALTER TABLE crimes
    ADD CONSTRAINT FK_Area_Crime
        FOREIGN KEY (AreaId) REFERENCES areas (AreaId)
            ON UPDATE CASCADE
            ON DELETE CASCADE;

ALTER TABLE crimes
    ADD CONSTRAINT FK_Weapon_Crime
        FOREIGN KEY (WeaponUsedCode) REFERENCES weapons (WeaponCode)
            ON UPDATE CASCADE
            ON DELETE CASCADE;

ALTER TABLE crimes
    ADD CONSTRAINT FK_Status_Crime
        FOREIGN KEY (StatusCode) REFERENCES statuses (StatusCode)
            ON UPDATE CASCADE
            ON DELETE CASCADE;