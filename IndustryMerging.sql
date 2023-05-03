-- selects the unique industries in the ParentalLeave table, 
-- counts the number of occurrences of each industry, and sorts the result by the number of occurrences in descending order
-- to check how many companies there are per industry
SELECT Industry, COUNT(Industry) AS n 
FROM ParentalLeave 
GROUP BY Industry 
ORDER BY n DESC;

-- selects the industries 'Printing' and 'Business Services', counts the number of occurrences of each industry in the ParentalLeave table, 
-- and sorts the result by the number of occurrences in descending order
-- to check how many companies there will be after merging Business Services and Printing into one industry
SELECT Industry, COUNT(Industry) AS n 
FROM ParentalLeave 
WHERE Industry IN ('Printing', 'Business Services') 
GROUP BY Industry 
ORDER BY n DESC;

-- updates the industries in the ParentalLeave table. It sets the industry to 'Business Services' for all rows where the industry is 'Printing'. 
-- The query is wrapped in a transaction, but the COMMIT statement is commented out and the ROLLBACK statement is available in case it is needed
BEGIN TRAN;
UPDATE ParentalLeave 
SET Industry = 'Business Services' 
WHERE Industry IN ('Printing');
--ROLLBACK
--COMMIT TRAN
