use dataindranil;

CREATE TABLE product1 (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT UNSIGNED DEFAULT 0,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO product1 (product_name, description, price, stock_quantity, category)
VALUES ('Laptop', 'High-performance laptop for professionals', 1299.99, 50, 'Electronics');


delete from product1;
select * from product1;

start transaction;
insert into product1 values(9,'Hondai',50000);


savepoint point1;
insert into product1 values(10,'Hondaii',5000);


insert into product1 values(11,'Hondaa',600000);

rollback to point;
insert into product1 values(12,'Hondaaa',60000);


commit;


DELIMITER //

CREATE PROCEDURE GetUserDetails2(IN userID INT)
BEGIN
    SELECT product1, CUSTOMERNAME, COUNTRY
    FROM CUSTOMERS
    WHERE CUSTOMERID = product1;
END //

DELIMITER ;

CALL GetUserDetails2(5);


CREATE TABLE Users20 (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastLogin TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE,
    Role VARCHAR(50) DEFAULT 'user',
    -- Add any other relevant columns like phone number, address, etc.
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DELIMITER //

CREATE PROCEDURE GetUserName3(IN userID INT, OUT userName VARCHAR(100))
BEGIN
    SELECT UserName INTO userName
    FROM Users
    WHERE UserID = ID;
END
DELIMITER ;

SET @user_name = '';
CALL GetUserName(1, @user_name);

SELECT @username;
