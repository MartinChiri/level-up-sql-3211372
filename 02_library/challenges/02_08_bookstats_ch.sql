-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

SELECT Published, COUNT(Distinct Title) AS TitleCount,
GROUP_CONCAT(DISTINCT Title)
FROM Books
GROUP BY Published
ORDER BY TitleCount DESC;

-- Report 2: Show the five books that have been
-- checked out the most.
SELECT Title, COUNT(Loans.LoanID) AS LoanCount
FROM Books 
INNER JOIN Loans ON Books.BookID = Loans.BookID
GROUP BY Books.Title
ORDER BY CountBooks DESC
LIMIT 5;
