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

ALTER TABLE ParentalLeave
ADD PaidMaternityGroup NVARCHAR(255);

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

SELECT [Paid Maternity Leave], PaidMaternityGroup
FROM ParentalLeave
ORDER BY [Paid Maternity Leave];