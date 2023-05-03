-- selects distinct values from the Industry column and splits the values into two parts using a colon (:) as a separator. 
-- The first part is extracted as Industry1, and the second part is extracted as SubIndustry. 
-- This is done using the SUBSTRING and CHARINDEX functions.
-- this is done to check if the names for Industry and SubIndustry are being split correctly.
SELECT DISTINCT
       Industry,
       SUBSTRING(Industry, 1, CHARINDEX(':',Industry)-1) AS Industry1,
       SUBSTRING(Industry, CHARINDEX(':',Industry)+2, LEN(Industry)) AS SubIndustry
FROM ParentalLeave
WHERE CHARINDEX(':', Industry) > 0;

-- this one is similar to the previous query, but it only selects the SubIndustry column
-- to check if the SubIndustry column will be created correctly
SELECT SUBSTRING(Industry, CHARINDEX(':',Industry)+2, LEN(Industry)) AS SubIndustry
FROM ParentalLeave
WHERE CHARINDEX(':', Industry) > 0;

-- adds a new column, SubIndustry, to the ParentalLeave table
ALTER TABLE ParentalLeave
ADD SubIndustry nvarchar(255);

-- begins a transaction and sets the strings for the SubIndustry column of the ParentalLeave table by extracting the second part of the Industry column using
-- the SUBSTRING and CHARINDEX functions. 
BEGIN TRAN
UPDATE ParentalLeave
SET SubIndustry = SUBSTRING(Industry, CHARINDEX(':',Industry)+2, LEN(Industry))
WHERE CHARINDEX(':', Industry) > 0;

-- a rollback and a commit operation to undo or finalize the update operation, respectively
-- ROLLBACK
-- COMMIT TRAN

-- this query is similar to the third one, but it only selects the Industry column and extracts the first part of the values using SUBSTRING and CHARINDEX
-- to check if the Industry column will be updated correctly
SELECT DISTINCT
       Industry,
       SUBSTRING(Industry, 1, charindex(':',Industry)-1) AS Ind
FROM ParentalLeave
WHERE CHARINDEX(':', Industry) > 0;

-- begins a transaction and updates the Industry column of the ParentalLeave table by extracting the first part of the Industry column using
-- the SUBSTRING and CHARINDEX functions.
BEGIN TRAN
UPDATE ParentalLeave
SET Industry = SUBSTRING(Industry, 1, charindex(':',Industry)-1)
WHERE CHARINDEX(':', Industry) > 0;
