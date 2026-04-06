SHOW DATABASES;
USE Emp;
SHOW TABLES;

-- 1. Display total salary spent for each job category (Designation)
SELECT Designation, SUM(Salary) AS Total_Salary
FROM EMPLOYEE1
GROUP BY Designation;

-- 2. Display lowest paid employee details under each department (assuming manager = Dept_no)
SELECT Dept_no, Dept_name, E_name, MIN(Salary) AS Lowest_Salary
FROM EMPLOYEE1
GROUP BY Dept_no, Dept_name, E_name;

-- 3. Display number of employees working in each department and their department name
SELECT Dept_no, Dept_name, COUNT(Emp_no) AS Total_Employees
FROM EMPLOYEE1
GROUP BY Dept_no, Dept_name;

-- 4. Display the details of employees sorting the salary in increasing order
SELECT Emp_no, E_name, Designation, Salary, Dept_name
FROM EMPLOYEE1
ORDER BY Salary ASC;

-- 5. Show the record of employees earning salary greater than 16000 in each department
SELECT Dept_no, Dept_name, E_name, Salary
FROM EMPLOYEE1
WHERE Salary > 16000
ORDER BY Dept_no;
