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