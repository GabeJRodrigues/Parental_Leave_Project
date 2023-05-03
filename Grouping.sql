-- selects the Paid Maternity Leave column from the ParentalLeave table 
-- and applies a CASE statement to group the values into categories based on the number of weeks of leave
-- in order to see what the new column will look like and to check if it shows accurate data
SELECT [Paid Maternity Leave],
    CASE 
        WHEN ParentalLeave.[Paid Maternity Leave] > 0 AND ParentalLeave.[Paid Maternity Leave] <= 5 THEN '1-5'
        WHEN ParentalLeave.[Paid Maternity Leave] > 5 AND ParentalLeave.[Paid Maternity Leave] <= 10 THEN '6-10'
        WHEN ParentalLeave.[Paid Maternity Leave] > 10 AND ParentalLeave.[Paid Maternity Leave] <= 15 THEN '11-15'
        WHEN ParentalLeave.[Paid Maternity Leave] > 15 AND ParentalLeave.[Paid Maternity Leave] <= 20 THEN '16-20'
        WHEN ParentalLeave.[Paid Maternity Leave] > 20 THEN '>20'
    END AS PaidMaternityGroup	
FROM ParentalLeave
ORDER BY [Paid Maternity Leave];

-- adds the new column for the groupings, PaidMaternityGroup, to the ParentalLeave table
ALTER TABLE ParentalLeave
ADD PaidMaternityGroup NVARCHAR(255);

-- starts a transaction and sets the values in the PaidMaternityGroup column based on the values in the Paid Maternity Leave column, 
-- using the same CASE statement as in the first query.
BEGIN TRAN;
UPDATE ParentalLeave
SET PaidMaternityGroup = 
	CASE 
        WHEN ParentalLeave.[Paid Maternity Leave] > 0 AND ParentalLeave.[Paid Maternity Leave] <= 5 THEN '1-5'
        WHEN ParentalLeave.[Paid Maternity Leave] > 5 AND ParentalLeave.[Paid Maternity Leave] <= 10 THEN '6-10'
        WHEN ParentalLeave.[Paid Maternity Leave] > 10 AND ParentalLeave.[Paid Maternity Leave] <= 15 THEN '11-15'
        WHEN ParentalLeave.[Paid Maternity Leave] > 15 AND ParentalLeave.[Paid Maternity Leave] <= 20 THEN '16-20'
        WHEN ParentalLeave.[Paid Maternity Leave] > 20 THEN '>20'
    END;

--COMMIT TRAN;

-- selects the Paid Maternity Leave and PaidMaternityGroup columns from the ParentalLeave table and sorts the result by Paid Maternity Leave
-- in order to check if the data present in the new column is accurate
SELECT [Paid Maternity Leave], PaidMaternityGroup
FROM ParentalLeave
ORDER BY [Paid Maternity Leave];
