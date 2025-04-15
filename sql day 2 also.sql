CREATE TABLE Customerstable (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);
 
CREATE TABLE Orderstable (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customerstable(CustomerID)
);
 
INSERT INTO Customerstable (CustomerID, CustomerName, ContactName, Country) 
VALUES(1, 'John Doe', 'John D.', 'USA'),
(2, 'Jane Smith', 'Jane S.', 'UK'),
(3, 'Alice Brown', 'Alice B.', 'Canada'),
(4, 'Bob Johnson', 'Bob J.', 'Australia');
 
INSERT INTO Orderstable (OrderID, OrderDate, CustomerID, Amount) 
VALUES(101, '2024-09-01', 1, 250.00),
(102, '2024-09-05', 2, 300.00),
(103, '2024-09-07', 1, 150.00),
(104, '2024-09-10', 3, 450.00);


SELECT
    Customerstable.CustomerID,
    Customerstable.CustomerName,
    Orderstable.OrderID,
    Orderstable.OrderDate,
    Orderstable.Amount
FROM
    Customerstable
INNER JOIN
    Orderstable ON Customerstable.CustomerID = Orderstable.CustomerID;
    
    
    SELECT
    Customerstable.CustomerID,
    Customerstable.CustomerName,
    Orderstable.OrderID,
    Orderstable.OrderDate,
    Orderstable.Amount
FROM
    Customerstable
LEFT JOIN
    Orderstable ON Customerstable.CustomerID = Orderstable.CustomerID;
    
    SELECT
    Customerstable.CustomerID,
    Customerstable.CustomerName,
    Orderstable.OrderID,
    Orderstable.OrderDate,
    Orderstable.Amount
FROM
    Customerstable
RIGHT JOIN
    Orderstable ON Customerstable.CustomerID = Orderstable.CustomerID;
    
    
    SELECT
    Customerstable.CustomerID,
    Customerstable.CustomerName,
    Orderstable.OrderID,
    Orderstable.OrderDate,
    Orderstable.Amount
FROM
    Customerstable
JOIN
    Orderstable ON Customerstable.CustomerID = Orderstable.CustomerID;
    
    
    SELECT
    d.id AS DrinkID,
    d.drinks,
    s.id AS SnackID,
    s.snacks
FROM
    Drink d
CROSS JOIN
    Snack s;
    
    SELECT * FROM Drink;
    
    SELECT * FROM Snack;
    
    SELECT * FROM Drink WHERE drinks = 'tea';
    
    SELECT * FROM Snack WHERE id = 1;