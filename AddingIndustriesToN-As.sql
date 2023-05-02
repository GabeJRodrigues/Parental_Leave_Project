SELECT DISTINCT Industry
FROM ParentalLeave;

SELECT *
FROM ParentalLeave
WHERE Industry = 'N/A';

SELECT *
FROM ParentalLeave
WHERE Company = 'Rokt';

BEGIN TRAN
UPDATE ParentalLeave
SET Industry = 'Technology'
WHERE Company = 'Rokt';

-- ROLLBACK
-- COMMIT TRAN