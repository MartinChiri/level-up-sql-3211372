-- Prepare a report of the library patrons
-- who have checked out the fewest books.
SELECT FirstName, LastName, Email, 
  COUNT(Loans.BookID) AS Quantity
FROM Patrons
INNER JOIN Loans ON Patrons.PatronID = Loans.PatronID
GROUP BY Patrons.PatronID
ORDER BY Quantity
LIMIT 15;