use dataindranil74;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE VIEW sales_employees AS
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE department = 'Sales';

SELECT * FROM sales_employees;


use dataindranil74;
desc sales_employees;

-- this is to update the exisiting view
CREATE OR REPLACE VIEW sales_employees AS
SELECT employee_id, first_name, last_name, salary, hire_date
FROM employees
WHERE department = 'Sales';

-- drop the view
DROP VIEW sales_employees;

-- You can now use INSERT, UPDATE, or DELETE statements on the sales_employees_view,
-- and the changes will reflect in the employees table:

UPDATE sales_employees
SET salary = salary * 1.10
WHERE employee_id = 1;



INSERT INTO employees (first_name, last_name, department, salary, hire_date) VALUES
('John', 'Doe', 'Sales', 50000.00, '2022-08-15'),
('Jane', 'Smith', 'Marketing', 60000.00, '2023-01-20'),
('Peter', 'Jones', 'Sales', 55000.00, '2023-05-10'),
('Mary', 'Brown', 'IT', 70000.00, '2021-11-01'),
('David', 'Wilson', 'Sales', 48000.00, '2024-02-28'),
('Susan', 'Garcia', 'Marketing', 62000.00, '2022-09-01'),
('Michael', 'Lee', 'Finance', 75000.00, '2020-07-05');

