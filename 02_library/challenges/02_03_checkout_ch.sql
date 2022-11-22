-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.

SELECT Title
FROM Loans
INNER JOIN Books
on Loans.BookID = Books.BookID
WHERE ReturnedDate IS NULL
AND (Barcode = 2855934983
OR Barcode = 4043822646); -- VOID


INSERT INTO Loans (PatronID, BookID, LoanDate, DueDate)
SELECT *
FROM 
(SELECT PatronID
  FROM Patrons
  WHERE Email = 'jvaan@wisdompets.com'),
(SELECT BookID
  FROM Books
  WHERE Barcode IN (2855934983, 4043822646)),
(SELECT '2022-08-25' AS LoanDate),
(SELECT '2022-09-08' AS DueDate);


SELECT *
FROM Loans
WHERE PatronID = (
  SELECT PatronID
  FROM Patrons
  WHERE Email = 'jvaan@wisdompets.com')
AND LoanDate = '2022-08-25';

