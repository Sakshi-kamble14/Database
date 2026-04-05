SHOW DATABASES;
USE Emp;
SHOW TABLES;

CREATE TABLE EMPLOYEE1 (Emp_no INT PRIMARY KEY, E_name VARCHAR(30),E_address VARCHAR(50),E_ph_no VARCHAR(10),
    Dept_no INT,Dept_name VARCHAR(20),Job_id VARCHAR(10),Designation VARCHAR(20),Salary FLOAT,joiningdate DATE);


-- 1.List the E_no, E_name, Salary of all employees working for MANAGER
SELECT Emp_no, E_name, Salary FROM EMPLOYEE1 WHERE Designation = 'MANAGER';

-- 2️. Display details of employees whose salary is more than the salary of any IT PROFF
SELECT * FROM EMPLOYEE1 WHERE Salary > ANY (SELECT Salary FROM EMPLOYEE1 WHERE Designation = 'IT PROFF');


-- 3.List employees in ascending order of Designations who joined after 1981
SELECT * FROM EMPLOYEE1 WHERE YEAR(joiningdate) > 1981 ORDER BY Designation ASC;

-- 4️. List employees along with their Experience and Daily Salary
SELECT E_name,(YEAR(CURDATE()) - YEAR(joiningdate)) AS Experience_Years,(Salary / 30) AS Daily_Salary
FROM EMPLOYEE1;

-- 5. List employees who are either ‘CLERK’ or ‘ANALYST’
SELECT * FROM EMPLOYEE1 WHERE Designation IN ('CLERK', 'ANALYST');

-- 6. List employees who joined on 1-MAY-81, 3-DEC-81, 17-DEC-81, 19-JAN-80
SELECT * FROM EMPLOYEE1 WHERE joiningdate IN ('1981-05-01', '1981-12-03', '1981-12-17', '1980-01-19');

-- 7. List employees working for Deptno 10 or 20
SELECT * FROM EMPLOYEE1 WHERE Dept_no IN (10, 20);

-- 8. List employee names starting with ‘S’
SELECT * FROM EMPLOYEE1 WHERE E_name LIKE 'S%';

-- 9.Display name and first five characters of names starting with ‘H’
SELECT E_name, SUBSTRING(E_name, 1, 5) AS First_5_Chars
FROM EMPLOYEE1
WHERE E_name LIKE 'H%';

-- 10.List all employees except ‘PRESIDENT’ & ‘MGR’ in ascending order of Salary
SELECT * FROM EMPLOYEE1
WHERE Designation NOT IN ('PRESIDENT', 'MGR')
ORDER BY Salary ASC;

