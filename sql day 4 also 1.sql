use dataindranil74;

DELIMITER //

CREATE FUNCTION CalculateRectangleArea(length FLOAT, width FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN length * width;
END //

DELIMITER ;

SELECT CalculateRectangleArea(5, 2.3) AS Area;



DELIMITER //

CREATE FUNCTION CalculateRectangleAreaNonDeterministic(length FLOAT, width FLOAT)
RETURNS FLOAT
-- Removed the DETERMINISTIC keyword
BEGIN
    -- This function still calculates the area, but without the
    -- DETERMINISTIC property, MySQL might not be able to optimize
    -- it as aggressively or cache results as effectively.
    RETURN length * width;
END //

DELIMITER ;

SELECT CalculateRectangleAreaNonDeterministic(5.5, 2.3) AS Area;



SELECT
    employee_id,
    salary,
    CASE
        WHEN salary > 100000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_grade
FROM employees1;


SELECT * FROM orders
WHERE
status = CASE
    WHEN customer_type = 'VIP' THEN 'Priority'
    ELSE 'Standard'
END;



use dataindranil;

CREATE TABLE products1 (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL
    -- Add other relevant columns as needed
);

-- Insert some sample data to test the UPDATE statement
INSERT INTO products1 (product_name, category, price) VALUES
('Laptop', 'Electronics', 1000.00),
('Smartphone', 'Electronics', 800.00),
('T-Shirt', 'Clothing', 25.00),
('Jeans', 'Clothing', 50.00),
('Book', 'Books', 20.00),
('Headphones', 'Electronics', 150.00);

-- The UPDATE statement from the previous response:
UPDATE products1
SET price =
CASE
    WHEN category = 'Electronics' THEN price * 0.9
    WHEN category = 'Clothing' THEN price * 0.8
    ELSE price
END;

-- Select all products to see the updated prices
SELECT * FROM products1;


use dataindranil;

CREATE TABLE people (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT UNSIGNED NOT NULL
    -- Add other relevant columns like address, occupation, etc.
);

-- Insert some sample data
INSERT INTO people (name, age) VALUES
('Alice', 15),
('Bob', 25),
('Charlie', 65),
('David', 30),
('Eve', 17),
('Frank', 70),
('Grace', 45);

-- The SELECT query from the previous response:
SELECT
    name,
    age,
    CASE
        WHEN age < 18 THEN 'Minor'
        WHEN age BETWEEN 18 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group
FROM people;

use dataindranil74;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    marks INT UNSIGNED NOT NULL,
    grade CHAR(1)
    -- Add other relevant columns like class, section, etc.
);

-- Insert some sample student data with marks
INSERT INTO students (name, marks) VALUES
('John Doe', 85),
('Jane Smith', 92),
('Peter Jones', 78),
('Mary Brown', 65),
('David Wilson', 55),
('Susan Garcia', 98),
('Michael Lee', 70);

-- The UPDATE statement from the previous response:
UPDATE students
SET grade =
CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    WHEN marks >= 60 THEN 'C'
    ELSE 'D'
END;

-- Select all students to see the assigned grades
SELECT * FROM students;

UPDATE students
SET grade =
CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    WHEN marks >= 60 THEN 'C'
    ELSE 'D'
END;



SELECT * FROM employees WHERE department = 'Sales';


use dataindranil74;
CREATE TABLE users1(
    id INT,
    profile JSON
);

INSERT INTO users1 VALUES (1, '{"name": "Alice", "skills": ["SQL", "Python"]}');
INSERT INTO users1 VALUES (1, '{"name": "Alice", "skills": ["JAVA", "Python"]}');
INSERT INTO users1 VALUES (1, '{"name": "Alice", "skills": ["C", "Python"]}');



SELECT JSON_EXTRACT(profile, '$.skills[0]') FROM users1;






CREATE TABLE employeesNew (

    id INT PRIMARY KEY,

    name VARCHAR(100),

    manager_id INT

);
 
INSERT INTO employeesNew (id, name, manager_id) VALUES

(1, 'Alice (CEO)', NULL),

(2, 'Bob (CTO)', 1),

(3, 'Charlie (CFO)', 1),

(4, 'David (Dev Manager)', 2),

(5, 'Eve (Developer)', 4),

(6, 'Frank (Intern)', 5);




WITH RECURSIVE employee_hierarchy AS (
    SELECT
        id,
        name,
        manager_id,
        1 AS level,
        CAST(name AS CHAR(1000)) AS path
    FROM employeesNew
    WHERE manager_id IS NULL -- Root (e.g., CEO)
    UNION ALL
    SELECT
        e.id,
        e.name,
        e.manager_id,
        eh.level + 1,
        CONCAT(eh.path, ' → ', e.name)
    FROM employeesNew e
    JOIN employee_hierarchy eh ON e.manager_id = eh.id
)
SELECT * FROM employee_hierarchy;