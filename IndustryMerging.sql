SELECT Industry, COUNT(Industry) AS n 
FROM ParentalLeave 
GROUP BY Industry 
ORDER BY n DESC;

SELECT Industry, COUNT(Industry) AS n 
FROM ParentalLeave 
WHERE Industry IN ('Printing', 'Business Services') 
GROUP BY Industry 
ORDER BY n DESC;

BEGIN TRAN;
UPDATE ParentalLeave 
SET Industry = 'Business Services' 
WHERE Industry IN ('Printing');
--ROLLBACK
--COMMIT TRAN

SELECT * 
FROM ParentalLeave 
WHERE Industry = 'Philanthropy' 
ORDER BY Industry DESC;

SELECT Company, Industry 
FROM ParentalLeave 
WHERE Industry = 'Hospitality & Travel' 
ORDER BY Industry DESC;

SELECT * 
FROM ParentalLeave 
WHERE [unpaid maternity Leave] IS NULL 
ORDER BY Industry DESC;