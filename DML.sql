USE crime_us_2010;

TRUNCATE TABLE crimes;
INSERT INTO crimes(CrimeCode, CrimeCodeDescription)
SELECT CrimeCode, CrimeCodeDescription
FROM import_table
GROUP BY CrimeCode, CrimeCodeDescription
ORDER BY CrimeCode;