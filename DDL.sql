USE crime_us_2010;

DROP TABLE IF EXISTS crimeTypes;
CREATE TABLE crimeTypes
(
    CrimeCode            INT,
    CrimeCodeDescription VARCHAR(100)
);

DROP TABLE IF EXISTS premises;
CREATE TABLE premises
(
    PremiseCode        INT,
    PremiseDescription VARCHAR(100)
);

DROP TABLE IF EXISTS areas;
CREATE TABLE areas
(
    AreaId   INT,
    AreaName VARCHAR(100)
);

DROP TABLE IF EXISTS weapons;
CREATE TABLE weapons
(
    WeaponCode        INT,
    WeaponDescription VARCHAR(150)
);

DROP TABLE IF EXISTS statuses;
CREATE TABLE statuses
(
    StatusCode        VARCHAR(3),
    StatusDescription VARCHAR(100)
);

CREATE TABLE crimes
(
    DRNumber             INT,
    DateReported         VARCHAR(10),
    DateOccurred         VARCHAR(10),
    TimeOccurred         INT,
    AreaID               INT,
    ReportingDistrict    INT,
    CrimeCode            INT,
    MOCodes              VARCHAR(150),
    VictimAge            INT,
    VictimSex            VARCHAR(1),
    VictimDescent        VARCHAR(1),
    PremiseCode          INT,
    WeaponUsedCode       INT,
    StatusCode           VARCHAR(15),
    CrimeCode1           INT,
    CrimeCode2           INT,
    CrimeCode3           INT,
    CrimeCode4           INT,
    Address              VARCHAR(150),
    CrossStreet          VARCHAR(150),
    Location             VARCHAR(150)
);

ALTER TABLE crimeTypes
ADD CONSTRAINT FK_CrimeType_Crime
FOREIGN KEY (CrimeCode) REFERENCES crimes(CrimeCode)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE premises
ADD CONSTRAINT FK_Premises_Crime
FOREIGN KEY (PremiseCode) REFERENCES crimes(PremiseCode)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE areas
ADD CONSTRAINT FK_Area_Crime
FOREIGN KEY (AreaId) REFERENCES crimes(AreaId)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE weapons
ADD CONSTRAINT FK_Weapon_Crime
FOREIGN KEY (WeaponCode) REFERENCES crimes(WeaponUsedCode)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE statuses
ADD CONSTRAINT FK_Status_Crime
FOREIGN KEY (StatusCode) REFERENCES crimes(StatusCode)
ON UPDATE CASCADE
ON DELETE CASCADE;
