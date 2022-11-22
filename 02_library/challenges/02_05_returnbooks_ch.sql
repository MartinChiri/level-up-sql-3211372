-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

UPDATE Loans
SET ReturnedDate = '2022-07-05'
WHERE LoanID IN (
    SELECT LoanID
    FROM Books
    INNER JOIN Loans ON Books.BookID = Loans.BookID
    WHERE Books.Barcode IN (6435968624, 5677520613, 8730298424)
    AND ReturnedDate IS NULL
);

SELECT LoanID, ReturnedDate
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
WHERE Books.Barcode IN (6435968624, 5677520613, 8730298424)
AND ReturnedDate = '2022-07-05';