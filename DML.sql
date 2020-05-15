USE crime_us_2010;

TRUNCATE TABLE crimeTypes;
INSERT INTO crimeTypes(CrimeCode, CrimeCodeDescription)
SELECT CrimeCode, CrimeCodeDescription
FROM import_table
GROUP BY CrimeCode, CrimeCodeDescription
ORDER BY CrimeCode;

TRUNCATE TABLE premises;
INSERT INTO premises(PremiseCode, PremiseDescription)
SELECT PremiseCode, PremiseDescription
FROM import_table
GROUP BY PremiseCode, PremiseDescription
ORDER BY PremiseCode;

TRUNCATE TABLE areas;
INSERT INTO areas(AreaId, AreaName)
SELECT AreaID, AreaName
FROM import_table
WHERE AreaID IS NOT NULL
GROUP BY AreaID, AreaName
ORDER BY AreaID;

TRUNCATE weapons;
INSERT INTO weapons(WeaponCode, WeaponDescription)
SELECT WeaponUsedCode, WeaponDescription
FROM import_table
WHERE WeaponDescription IS NOT NULL
GROUP BY WeaponUsedCode, WeaponDescription
ORDER BY WeaponUsedCode;

TRUNCATE statuses;
INSERT INTO statuses(StatusCode, StatusDescription)
SELECT StatusCode, StatusDescription
FROM import_table
WHERE StatusCode IS NOT NULL
GROUP BY StatusCode, StatusDescription
ORDER BY StatusCode;

TRUNCATE crimes;
INSERT INTO crimes(DRNumber, DateReported, DateOccured, TimeOccured, AreaID, ReportingDestrict, CrimeCode, MOCodes, VictimAge, VictimSex, VictimDescent, Premiscode, WeaponUsedCode, StatusCode, CrimeCode1, CrimeCode2, CrimeCode3, CrimeCode4, Address, CrossStreet, Location)
SELECT DRNumber, DateReported, DateOccured, TimeOccured, AreaID, ReportingDestrict, CrimeCode, MOCodes, VictimAge, VictimSex, VictimDescent, Premiscode, WeaponUsedCode, StatusCode, CrimeCode1, CrimeCode2, CrimeCode3, CrimeCode4, Address, CrossStreet, Location
FROM import_table
WHERE DRNUmber > 0;
