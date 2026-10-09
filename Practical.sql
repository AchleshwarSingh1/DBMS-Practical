CREATE database Hospital;
USE Hospital;

CREATE TABLE Department(
department_id INT PRIMARY KEY,
department_name VARCHAR(50) NOT NULL UNIQUE,
location VARCHAR(50) DEFAULT 'Main Hospital'
);

CREATE TABLE Staff(
staff_id INT PRIMARY KEY,
staff_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
designation VARCHAR(50) NOT NULL,
salary DECIMAL(10,2) NOT NULL CHECK (salary>0),
department_id INT NOT NULL,
FOREIGN KEY (department_id)
REFERENCES Department (department_id)
);

INSERT INTO Department 
VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neorology', 'Block B'),
(3, 'Emergency', 'Block C'),
(4, 'Pediatrics', 'Block D');

INSERT INTO Staff
VALUES
(101, 'Amit Sharma', 'amit@gmail.com', 'Doctor', 45000, 1),
(102, 'Priya Singh', 'priya@gmail.com', 'Nurse', 30000, 2),
(103, 'Rahul Verma', 'rahul@gmail.com', 'Technician', 28000, 3),
(104, 'Ajit Sharma', 'ajit@gmail.com', 'Doctor', 50000, 4),
(105, 'Shubham Verma', 'shubham@gamil.com', 'Doctor', 55000, 3),
(106, 'Vrindaa Rana', 'vrindaa@gmail.com', 'Doctor', 55000, 4);

SELECT *
FROM Staff
Where salary BETWEEN 25000 AND 50000;

SELECT *
FROM Staff
WHERE staff_name Like 'A%';

SELECT *
FROM Staff
WHERE department_id IN (1,3);

SELECT DISTINCT designation
FROM Staff;

SELECT department_id, COUNT(*) AS Total_staff
FROM Staff
GROUP BY department_id;

SELECT MAX(salary) AS Maximum_salary,
MIN(salary) AS Minimum_salary
FROM Staff;

UPDATE Staff
SET salary = 40000
WHERE staff_id = 102;

SELECT staff_id AS Employee_id,
staff_name AS Employee_name,
designation AS Job_title,
salary AS Monthaly_salary,
department_id AS Department_id
FROM Staff;
