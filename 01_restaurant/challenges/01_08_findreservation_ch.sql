-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT *
FROM Reservations
WHERE Date BETWEEN '2022-06-14' AND '2022-06-15'
AND CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE FirstName LIKE 'St%n' 
    OR LastName LIKE 'St%n'
);