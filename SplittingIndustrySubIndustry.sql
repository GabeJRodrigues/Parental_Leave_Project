SELECT * 
FROM ParentalLeave;

SELECT DISTINCT Industry 
FROM ParentalLeave;

SELECT DISTINCT
       Industry,
       SUBSTRING(Industry, 1, CHARINDEX(':',Industry)-1) AS Industry1,
       SUBSTRING(Industry, CHARINDEX(':',Industry)+2, LEN(Industry)) AS SubIndustry
FROM ParentalLeave
WHERE CHARINDEX(':', Industry) > 0;

SELECT SUBSTRING(Industry, CHARINDEX(':',Industry)+2, LEN(Industry)) AS SubIndustry
FROM ParentalLeave
WHERE CHARINDEX(':', Industry) > 0;

ALTER TABLE ParentalLeave
ADD SubIndustry nvarchar(255);

UPDATE ParentalLeave
SET SubIndustry = SUBSTRING(Industry, CHARINDEX(':',Industry)+2, LEN(Industry))
WHERE CHARINDEX(':', Industry) > 0;

SELECT DISTINCT
       Industry,
       SUBSTRING(Industry, 1, charindex(':',Industry)-1) AS Ind
FROM ParentalLeave
WHERE CHARINDEX(':', Industry) > 0;

UPDATE ParentalLeave
SET Industry = SUBSTRING(Industry, 1, charindex(':',Industry)-1)
WHERE CHARINDEX(':', Industry) > 0;