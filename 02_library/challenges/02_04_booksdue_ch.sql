-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.
SELECT DueDate, Title, FirstName, Email
FROM Loans AS l
INNER JOIN Books AS b
ON l.BookID = b.BookID
INNER JOIN Patrons as p
ON p.PatronID = l.PatronID
WHERE DueDate = '2022-07-13'
AND ReturnedDate IS NULL;