
-- create new table product
CREATE TABLE PRODUCTS(PRODUCTID INT, PRODUCTNAME VARCHAR(20), PRICE INT);

-- query to insert values in the table
INSERT INTO PRODUCTS VALUES(3, 'BIKE', 200000), (4, 'BIKE21', 400000);

use dataindranil;

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS VALUES(1, 'BIKE', 200000), (2, 'BIKE21', 400000);

-- QUERY TO FIND OUT THE MINIMUM VALUE FROM THE SPECIFIED COLUMN
SELECT MIN(PRICE) FROM PRODUCTS;

-- QUERY TO FIND OUT THE MINIMUM VALUE FROM THE SPECIFIED COLUMN
SELECT MIN(Price)
FROM Products;

-- QUERY TO FIND OUT THE MAXIMUM VALUE FROM THE SPECIFIED COLUMN
SELECT MAX(Price)
FROM Products;

SELECT MIN(Price) AS SmallestPrice, PRODUCTID
FROM Products
GROUP BY PRODUCTID;

SELECT AVG(Price) AS SmallestPrice, PRODUCTID
FROM Products
GROUP BY PRODUCTID;


-- QUERY TO RETURN THE TOTAL NUMBER OF VALUES IN THAT COLUMN
-- AS (alias) IS USED TO GIVE THE TEMPORARY NAME FOR THE OUTPUT

-- QUERY TO RETURN THE TOTAL NUMBER OF VALUES IN THAT COLUMN
-- AS (alias) IS USED TO GIVE THE TEMPORARY NAME FOR THE OUTPUT
SELECT COUNT(*) AS NUMBEROFCOLUMNS
FROM PRODUCTS;


-- QUERY TO FIND OUT THE COUNT OF PRODUCT WHOSE PRICE > 200000
SELECT COUNT(ProductID)
FROM Products
WHERE Price > 200000;


-- QUERY TO REMOVE THE DUPLICATE PRICE COUNT
SELECT COUNT(DISTINCT Price)
FROM Products;


-- SUM FUNCTION TO GET THE TOTAL
SELECT SUM(Price)
FROM PRODUCTS;



