-- selecting all distinct industry names from the ParentalLeave table and seeing that there are N/As present
SELECT DISTINCT Industry
FROM ParentalLeave;

-- selecting companies' names from the ParentalLeave table where Industry is equal to 'N/A' to check which companies need an industry
SELECT Company
FROM ParentalLeave
WHERE Industry = 'N/A';

-- selecting all records from the ParentalLeave table where Company is equal to 'Rokt'
SELECT *
FROM ParentalLeave
WHERE Company = 'Rokt';

-- begins a transaction and updates the Industry field to 'Technology' for all records in the ParentalLeave table where Company is equal to 'Rokt'
BEGIN TRAN
UPDATE ParentalLeave
SET Industry = 'Technology'
WHERE Company = 'Rokt';

-- a rollback and a commit operation to undo or finalize the update operation, respectively
-- ROLLBACK
-- COMMIT TRAN
