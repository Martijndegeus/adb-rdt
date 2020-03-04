CREATE DATABASE crime_us_2010;

USE crime_us_2010;

CREATE TABLE crime_us_2010.import_table
(
    DRNumber             INT,
    DateReported         VARCHAR(10),
    DateOccurred         VARCHAR(10),
    TimeOccurred         INT,
    AreaID               INT,
    AreaName             VARCHAR(50),
    ReportingDistrict    INT,
    CrimeCode            INT,
    CrimeCodeDescription VARCHAR(150),
    MOCodes              VARCHAR(150),
    VictimAge            INT,
    VictimSex            VARCHAR(1),
    VictimDescent        VARCHAR(1),
    PremiseCode          INT,
    PremiseDescription   VARCHAR(50),
    WeaponUsedCode       INT,
    WeaponDescription    VARCHAR(50),
    StatusCode           VARCHAR(15),
    StatusDescription    VARCHAR(50),
    CrimeCode1           INT,
    CrimeCode2           INT,
    CrimeCode3           INT,
    CrimeCode4           INT,
    Address              VARCHAR(150),
    CrossStreet          VARCHAR(150),
    Location             VARCHAR(150)
);
