use dataindranil;

CREATE TABLE employees3 (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id INT, -- Foreign key referencing a jobs table (if you have one)
    salary DECIMAL(10, 2),
    department_id INT, -- Foreign key referencing a departments table (if you have one)
    manager_id INT, -- Self-referencing foreign key to the employee table
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

SELECT * FROM employees3
ORDER BY salary;

SELECT * FROM employees3
ORDER BY salary DESC;

SELECT * FROM employees3
ORDER BY department ASC, salary DESC;

INSERT INTO employees3 (first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id, manager_id)
VALUES ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2024-01-15', 101, 60000.00, 20, NULL);
