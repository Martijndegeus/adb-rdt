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

SELECT DRNumber, ROUND((LENGTH(i1.MOCodes) - LENGTH(REPLACE(i1.MOCodes, ' ', ''))) / LENGTH(' ')) + 1 AS count
FROM import_table i1 JOIN import_table i2
WHERE MOCodes <> '';

# SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(MOCodes, ' ', 1), ' ', -1) AS MoCode FROM import_table WHERE DRNumber = 151520686;