-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (
    (SELECT CustomerID
      FROM Customers
      WHERE FirstName = 'Loretta'
      AND Address LIKE '6939 Elka%'),
    '2022-09-20 14:00:00'
);

INSERT INTO OrdersDishes (OrderID, DishID)
SELECT o.OrderID, d.DishID
FROM 
    (SELECT OrderID
      FROM Orders
      WHERE CustomerID = (
        SELECT CustomerID
        FROM Customers
        WHERE FirstName = 'Loretta'
        AND Address LIKE '6939 Elka%')
      AND OrderDate = '2022-09-20 14:00:00') AS o
CROSS JOIN
    (SELECT DishID
      FROM Dishes
      WHERE Name IN ('House Salad', 'Mini Cheeseburgers',
        'Tropical Blue Smoothie')
    ) AS d

Select o.OrderID, SUM(Price) as Total
FROM Orders AS o
INNER JOIN OrdersDishes AS od
ON o.OrderID = od.OrderID
INNER JOIN Dishes AS d
ON od.DishID = d.DishID
WHERE o.OrderID = (
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = (
      SELECT CustomerID
      FROM Customers
      WHERE FirstName = 'Loretta'
      AND Address LIKE '6939 Elka%')
    AND OrderDate = '2022-09-20 14:00:00')
GROUP BY o.OrderID;
