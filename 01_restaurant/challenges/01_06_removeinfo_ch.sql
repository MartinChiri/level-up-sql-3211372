-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

DELETE FROM Reservations
WHERE Date >= '2022-07-24' 
AND CustomerID = (
    SELECT CustomerID
    FROM Customers
    WHERE FirstName = 'Norby');
-- OR

UPDATE Reservations
SET Date = NULL
WHERE Date >=  '2022-07-24'
AND  CustomerID = (
    SELECT CustomerID
    FROM Customers
    WHERE FirstName = 'Norby');

  SELECT * FROM Reservations WHERE Date >= '2022-07-24';
