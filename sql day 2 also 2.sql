use dataindranil;

CREATE TABLE Drink (
    id INT PRIMARY KEY,
    drinks VARCHAR(50)
);


CREATE TABLE Snack (
    id INT PRIMARY KEY,
    snacks VARCHAR(50)
);

INSERT INTO Snack (id, snacks) VALUES
(1, '-'),
(2, '-');

INSERT INTO Drink (id, drinks) VALUES
(1, 'tea'),
(2, 'coffe');

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