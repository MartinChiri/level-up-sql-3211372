-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT COUNT(BookID) - 
(SELECT COUNT(*)
  FROM Loans
  WHERE BookID IN (
    SELECT BookID
    FROM Books
    WHERE Title = 'Dracula')
  AND ReturnedDate IS NULL) AS AvailableCopies
FROM Books
WHERE Title = 'Dracula';
