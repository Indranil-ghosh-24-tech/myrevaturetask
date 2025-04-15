use dataindranil74;

CREATE TABLE employees1 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
 
INSERT INTO employees1 (employee_id, name, department, salary) VALUES
(1, 'Alice',   'Sales', 50000),
(2, 'Bob',     'Sales', 60000),
(3, 'Charlie', 'Sales', 45000),
(4, 'David',   'IT',    70000),
(5, 'Eva',     'IT',    80000),
(6, 'Frank',   'IT',    75000);



SELECT
    employee_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_dept
FROM employees1;


-- Running Total of Salaries (Company-wide)
-- Running Total of Salaries (Company-wide)
SELECT
    employee_id,
    name,
    salary,
    SUM(salary) OVER (ORDER BY salary) AS running_total
FROM employees1;


-- For 'employees' table (with first_name, last_name):
SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS name,
    salary,
    LAG(salary, 1, 0) OVER (ORDER BY salary) AS previous_salary,
    LEAD(salary, 1, 0) OVER (ORDER BY salary) AS next_salary
FROM employees;

-- For 'employees1' table (with name column):
SELECT
    employee_id,
    name,
    salary,
    LAG(salary, 1, 0) OVER (ORDER BY salary) AS previous_salary,
    LEAD(salary, 1, 0) OVER (ORDER BY salary) AS next_salary
FROM employees1;


-- Rank Employees by Salary Within Department (with Ties)
SELECT
    employee_id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees1;

select employee_id,name,department, salary,
dense_rank() over (partition by department order by salary desc) as rank_in_dept
from employees1;

SELECT
    employee_id,
    name,
    salary,
    NTILE(3) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees1;