-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.
INSERT INTO CustomerDishes (CustomerID, DishID)
VALUES (
    (SELECT CustomerID
      FROM Customers
      WHERE FirstName = 'Cleo' AND LastName = 'Goldwater'),
    (SELECT DishID
      FROM Dishes
      WHERE Name = 'Quinoa Salmon Salad')    
);
