-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

  SELECT FirstName, LastName, Email, COUNT(OrderID) AS OrderCount
  FROM Customers AS c
  INNER JOIN Orders AS o
  ON c.CustomerID = o.CustomerID
  GROUP BY c.CustomerID
  ORDER BY OrderCount DESC
  LIMIT 6;