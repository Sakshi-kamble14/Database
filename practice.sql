-- 1. Find the average account balance at the Perryridge branch.
show tables;
select *from account;
desc account;

select avg(balance) as balance from account where branchname='Park Street';
-- 2. Find maximum amount of any loan in the bank
select *from loan;
select max(amount) as amount from loan ;
-- 3. List Numbers of accounts with balances between 700 and 900 
select *from account;
select count(balance) as number from account where balance>=700 && balance <=1000;
-- 4. List total number of account holders in the ‘Capital Bank’ Branch  
select *from account;
select count(accnum) as account from account where branchname='Downtown';
-- 5. List total number of unique Customer city names  
select *from customer;
select count(distinct custcity) as number_of_customercity from customer ; 
-- 6. Find the number of branches that currently have loans.
select *from loan;
select *from borrower;
select count(distinct loanno) as customer from borrower;

USE Emp;
show tables;
INSERT INTO EMPLOYEE1 (Emp_no, E_name, E_address, E_ph_no, Dept_no, Dept_name, Job_id, Designation, Salary, joiningdate)
VALUES
(102, 'Bob Smith', '456 Oak St, Riverside', '8765432109', 20, 'Finance', 'FN01', 'Analyst', 55000.00, '2021-03-22'),
(103, 'Charlie Brown', '789 Pine St, Hillview', '7654321098', 30, 'IT', 'IT01', 'Developer', 60000.00, '2022-07-10'),
(104, 'Diana Prince', '321 Elm St, Metropolis', '6543210987', 20, 'Finance', 'FN02', 'Accountant', 58000.00, '2019-11-05'),
(105, 'Ethan Hunt', '159 Birch St, Gotham', '5432109876', 40, 'Operations', 'OP01', 'Supervisor', 62000.00, '2020-06-30'),
(106, 'Fiona Gallagher', '753 Cedar St, Shelbyville', '4321098765', 10, 'HR', 'HR02', 'Executive', 48000.00, '2023-01-12'),
(107, 'George Michael', '852 Willow St, Springfield', '3210987654', 30, 'IT', 'IT02', 'Tester', 50000.00, '2021-09-08'),
(108, 'Hannah Baker', '951 Chestnut St, Riverdale', '2109876543', 40, 'Operations', 'OP02', 'Coordinator', 47000.00, '2024-02-25'),
(109, 'Ian Somerhalder', '357 Aspen St, Star City', '1098765432', 50, 'Marketing', 'MK01', 'Executive', 49000.00, '2022-12-01'),
(110, 'Jane Doe', '258 Spruce St, Central City', '1987654321', 50, 'Marketing', 'MK02', 'Manager', 70000.00, '2018-08-18');

-- 1. List the E_no, E_name, Salary of all employees working for MANAGER. 
select *from employee1;
select Emp_no,E_name,Salary from employee1 where Designation='HR';
-- 2. Display all the details of the employee whose salary is more than the Sal of any IT PROFF..  
select *from employee1 where salary >any (select salary from employee1 where designation='IT');
-- 3. List the employees in the ascending order of Designations of those joined after 1981.  
select *from employee1 where joiningdate>1981 order by designation;
-- 4. List the employees along with their Experience and Daily Salary.  
SELECT E_name,(YEAR(CURDATE()) - YEAR(joiningdate)) AS Experience_Years,(Salary / 30) AS Daily_Salary FROM EMPLOYEE1;
-- 5. List the employees who are either ‘CLERK’ or ‘ANALYST’ .  
select *from employee1 where designation in('clerk' , 'analyst');
-- 6. List the employees who joined on 1-MAY-81, 3-DEC-81, 17-DEC-81,19-JAN-80 .
select *from employee1 where joiningdate in('2025-01-01','1981-12-02','1981-12-17','1980-01-19');  
-- 7. List the employees who are working for the Deptno 10 or20.  
select *from employee1 where dept_no in(10,20);
-- 8. List the Enames those are starting with ‘S’ .  
select E_name as name from employee1 where e_name like 'S%';
-- 9. Dislay the name as well as the first five characters of name(s) starting with ‘H’  
select e_name as name ,SUBSTRING(E_name, 1, 5) AS First_5_Chars from employee1 where e_name like 'H%';
-- 10. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries. 
select e_name as name from employee1 where designation not in('President','MGR') order by salary desc;

show databases;
use bank23ucs051;
select *from loan;
select *from branch;
-- 1. List loan data, ordered by decreasing amounts, then increasing loan numbers
select *from loan order by amount desc,loanno asc;

-- 2. Retrieve all bank branch details, ordered by branch city, with each city’s branches listed in reverse order of holdings (assets)
select *from branch order by branchcity,assets desc;

-- 3. Find the average account balance at each branch
select branchname,avg(balance) as balance from account group by branchname;

-- 4. Find the number of customers citywise
select *from customer;
select custcity,count(custname) as number_of_customer from customer group by custcity;

-- 5. Find the number of branches of the bank
select count(branchname) as number_of_branch from branch;

-- 6. Find the average account balance of branches where average balance > 1200
select branchname, avg(balance) as average from account group by branchname having avg(balance)>1200 ;

-- 7. Find all cities with more than two customers living in the city
select custcity, count(custname) from customer group by custcity having count(custname)>2;

-- 1. Display total salary spent for each job category.  
use emp;
show tables;
select *from employee1;
select designation,sum(salary) as salary from employee1 group by designation;
-- 2. Display lowest paid employee details under each manager.  
select e_name,designation,min(salary) as lowest_salary from employee1 group by designation,e_name;
-- 3. Display number of employees working in each department and their department name.
select dept_no ,dept_name,count(emp_no) as number_of_employee from employee1 group by dept_no,dept_name;  
-- 4. Display the details of employees sorting the salary in increasing order.  
select *from employee1 order by salary ;
-- 5. Show the record of employee earning salary greater than 16000 in each department.
select *from employee1 where salary >60000 order by dept_no;

show databases;
use bank23ucs051;
-- 1. Find the names and loan numbers of all customers who have a loan at the Perryridge branch. 
select custname,loan.loanno from loan inner join borrower on loan.loanno=borrower.loanno where branchname='perryridge'; 
-- 2. Display the list in alphabetic order all customers who have a loan at the Perryridge branch. 
select custname from loan natural join borrower where branchname='downtown';
-- 3. Find names of all branches with customer who have account in the bank and live in city whose name start with S. 
select account.branchname from branch inner join account on branch.branchname=account.branchname inner join depositor on account.accnum=depositor.accnum inner
join customer on customer.custname=depositor.custname where customer.custcity like 'd%';
-- 4. For all customers who have a loan from the bank, find their names, loan numbers, and loan amount 
select borrower.custname ,loan.loanno,loan.amount from loan natural join borrower; 
-- 5. Find the list of all customers in alphabetic order who have a loan at the Parkstreet branch 
select borrower.custname from borrower natural join loan where loan.branchname='park street' order by borrower.custname;
-- 6. For all customers who have a loan from the bank, find their names, loan numbers, and loan amount. 
select borrower.custname,loan.loanno,loan.amount from loan inner join borrower on loan.loanno=borrower.loanno;
-- 7. Find the customer names, loan numbers, and loan amounts, for all loans at the Perryridge branch.
select borrower.custname,loan.loanno,loan.amount from loan inner join borrower on loan.loanno=borrower.loanno where loan.branchname='perryridge';
-- 8. For all customers who have a loan from the bank, find their names and loan numbers with 
-- the attribute loan_number replaced by loan_id. 
select borrower.custname,loan.loanno as loan_id,loan.amount from loan inner join borrower on loan.loanno=borrower.loanno;
-- 9. Find the name, account number, and balance of all customers who have an account. 
select custname ,account.accnum,account.balance from account natural join depositor;
-- 10. Find the name, loan number, and amount of all customers who have an loan from 
-- Perryridge branch 
select custname ,loan.loanno,loan.amount from loan natural join borrower where branchname='downtown';
-- 11. Find the name, account number, and balance of all customers who have an account with a 
-- balance of $4000 or less. 
select custname ,account.accnum,account.balance from account natural join depositor where balance<=4000;
-- 12. List all accounts of Brooklyn(Downtown) branch 
select *from account;
select *from account where branchname='Downtown';

create database lab;
use lab;
-- ===========================
-- 1. Create Tables
-- ===========================

-- Sailors Table
CREATE TABLE Sailors (
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    rating INT,
    age INT
);

-- Boats Table
CREATE TABLE Boats (
    bid INT PRIMARY KEY,
    bname VARCHAR(50),
    color VARCHAR(20)
);

-- Reserves Table
CREATE TABLE Reserves (
    sid INT,
    bid INT,
    day DATE,
    PRIMARY KEY(sid, bid, day),
    FOREIGN KEY(sid) REFERENCES Sailors(sid),
    FOREIGN KEY(bid) REFERENCES Boats(bid)
);

-- ===========================
-- 2. Insert Sample Data
-- ===========================

-- Sailors
INSERT INTO Sailors VALUES
(1, 'Alice', 5, 24),
(2, 'Bob', 7, 30),
(3, 'Charlie', 5, 22),
(4, 'David', 8, 35),
(5, 'Eve', 7, 28);

-- Boats
INSERT INTO Boats VALUES
(101, 'Boaty', 'red'),
(102, 'Wave', 'blue'),
(103, 'SeaStar', 'green'),
(104, 'Splash', 'red');

-- Reserves
INSERT INTO Reserves VALUES
(1, 101, '2025-10-01'),
(2, 101, '2025-10-02'),
(2, 102, '2025-10-02'),
(3, 104, '2025-10-03'),
(4, 103, '2025-10-04'),
(5, 101, '2025-10-05'),
(5, 103, '2025-10-05');
-- 1. Find all information of sailors who have reserved boat number 101.
select *from sailors natural join reserves where reserves.bid=101;
-- 2. Find the name of boat reserved by Bob.
select distinct sailors.sname,boats.bname from sailors natural join reserves natural join boats where sailors.sname='bob';
-- 3. Find the names of sailors who have reserved a red boat, and list in the order of age.
select sailors.sname,color,age from sailors natural join reserves natural join boats where boats.color='red' order by age;
-- 4. Find the names of sailors who have reserved at least one boat.
SELECT DISTINCT S.sname
FROM Sailors AS S
INNER JOIN Reserves AS R ON S.sid = R.sid;

-- 5. Find the ids and names of sailors who have reserved two different boats on the same day.
SELECT DISTINCT S.sid, S.sname
FROM Sailors AS S
INNER JOIN Reserves AS R1 ON S.sid = R1.sid
INNER JOIN Reserves AS R2 ON S.sid = R2.sid
WHERE R1.day = R2.day
  AND R1.bid <> R2.bid;

-- 6. Find the ids of sailors who have reserved a red boat or a green boat.
SELECT DISTINCT S.sid
FROM Sailors AS S
INNER JOIN Reserves AS R ON S.sid = R.sid
INNER JOIN Boats AS B ON R.bid = B.bid
WHERE B.color IN ('red', 'green');

-- 7. Find the name and the age of the youngest sailor.
SELECT S.sname, S.age
FROM Sailors AS S
WHERE S.age = (SELECT MIN(age) FROM Sailors);

-- 8. Count the number of different sailor names.
SELECT COUNT(DISTINCT S.sname) AS total_unique_sailors
FROM Sailors AS S;

-- 9. Find the average age of sailors for each rating level.
SELECT S.rating, AVG(S.age) AS avg_age
FROM Sailors AS S
GROUP BY S.rating;

-- 10. Find the average age of sailors for each rating level that has at least two sailors.
SELECT S.rating, AVG(S.age) AS avg_age
FROM Sailors AS S
GROUP BY S.rating
HAVING COUNT(S.sid) >= 2;

show databases;
use bank23ucs051;
/* 1. Find the name of the branch with the smallest number of assets. */
SELECT branchname
FROM branch
WHERE assets = (SELECT MIN(assets) FROM branch);

/* 2. Find branches that have assets greater than at least one branch located in Brooklyn. */
select branchname from branch where assets > any(select assets from branch where branchcity='Brooklyn');

/* 3. Find customers who have both an account and a loan at the bank. */
select custname from depositor where custname in(select custname from borrower);

/* 4. Find customers who have a loan but no account. */
select custname from borrower where custname not in (select custname from depositor);

/* 5. Find details of the largest loan at each branch. */
SELECT branchname, loanno, amount
FROM loan L
WHERE amount = (
  SELECT MAX(amount)
  FROM loan
  WHERE branchname = L.branchname
);

/* 6. Find customers who have both an account and a loan at the bank. */
SELECT DISTINCT custname
FROM depositor
WHERE custname IN (SELECT custname FROM borrower);

/* 7. Find customers with an account but not a loan. */
SELECT DISTINCT custname
FROM depositor
WHERE custname NOT IN (SELECT custname FROM borrower);

/* 8. Find branches with assets greater than at least one branch in Brooklyn. */
SELECT branchname
FROM branch
WHERE assets > ANY (SELECT assets FROM branch WHERE branchcity = 'Brooklyn');

/* 9. Find branches with assets greater than all branches in Brooklyn. */
SELECT branchname
FROM branch
WHERE assets > ALL (SELECT assets FROM branch WHERE branchcity = 'Brooklyn');

/* 10. Create a view called all_customer containing all bank customers. */
CREATE VIEW all_customer AS
SELECT custname FROM depositor
UNION
SELECT custname FROM borrower;

/* 11. Find the largest total account balance of any branch. */
SELECT branchname, SUM(balance) AS total_balance
FROM account
GROUP BY branchname
HAVING SUM(balance) = (
  SELECT MAX(total)
  FROM (
    SELECT SUM(balance) AS total
    FROM account
    GROUP BY branchname
  ) AS branch_totals
);
drop view all_customer;


show databases;
use lab;
show tables;
-- 1. Find all information of sailors who have reserved boat number 101.  
select *from sailors where sid in (select sid from reserves where bid=101);
-- 2. Find the name of boat reserved by Bob.  
select *from reserves;
select *from sailors;
select *from boats;
select bname,color from boats where bid in (select bid from reserves where sid in (select sid from sailors where sname ='bob'));
-- 3. Find the names of sailors who have reserved a red boat, and list in the order of age.  
select sname,age from sailors where sid in (select sid from reserves where bid in (select bid from boats where color ='red')) order by age;
-- 4. Find the names of sailors who have reserved at least one boat.  
select sname from sailors where sid in (select distinct sid from reserves);
-- 5. Find the ids and names of sailors who have reserved two different boats on the same day.  
SELECT sid, sname FROM Sailors 
WHERE sid IN (SELECT sid FROM Reserves GROUP BY sid, day HAVING COUNT(DISTINCT bid) >= 2);
-- 7. Find the ids of sailors who have reserved a red boat or a green boat.  
select sid as id_of_sailor,sname as name from sailors where sid in (select sid from reserves where bid in(select bid from boats where color in('red','green')));
-- 8. Find the name and the age of the youngest sailor.  
select *from sailors;
select sname as name ,age from sailors where age=(select min(age) from sailors);
-- 9. Count the number of different sailor names.  
select count(distinct sname) as number_of_sailors from sailors;
-- 10. Find the average age of sailors for each rating level. 
select rating,avg(age) as age from sailors group by rating; 
-- 11. Find the average age of sailors for each rating level that has at least two sailors.
SELECT rating, AVG(age) AS AvgAge FROM Sailors 
GROUP BY rating 
HAVING COUNT(*) >= 2;

show databases;
use bank23ucs051;
-- 1. Write a procedure which accept the account number of a customer and retrieve the balance. 
DELIMITER $$

CREATE PROCEDURE getaccountbalance(IN acc_no INT)
BEGIN
    SELECT balance 
    FROM account 
    WHERE accnum = acc_no;
END$$

DELIMITER ;
call getaccountbalance(101);
-- 2. Write a procedure which accept the deptno and print minimum salary of employee working in that department. 
show databases;
use emp;
show tables;
select *from employee1;
DELIMITER $$

CREATE PROCEDURE minsalary(IN deptnumber INT)
BEGIN
    SELECT MIN(salary) AS minimum_salary 
    FROM employee1
    WHERE dept_no = deptnumber;
END $$

DELIMITER ;

call minsalary(50);
-- 3.Retrieve Account Balance
-- Write a procedure that accepts an account number and displays the account balance.
select *from account;
select *from customer;
select *from depositor;
delimiter $$
create procedure getdetails(in accnumber int)
begin
	select balance from account where account.accnum= accnumber;
end $$
delimiter ;
call getdetails(101);
-- 4.Customer Details by Account
-- Create a procedure that takes an account number and returns the customer’s name, address, and phone number.
select *from customer;
delimiter $$
create procedure customerdetails(in accnumber int)
begin 
select customer.custname,customer.custstreet,customer.custcity from customer inner join depositor on depositor.custname=customer.custname
natural join account where account.accnum=accnumber;
end $$
delimiter ;
call customerdetails(102);
drop procedure customerdetails;
-- 5.Minimum Balance in Branch
-- Write a procedure that accepts a branch code and returns the minimum balance among all accounts in that branch.

-- 6.Accounts of a Customer
-- Write a procedure to list all account numbers and balances for a given customer ID.

-- 7.Total Customers in Branch
-- Write a procedure to count how many customers are in a given branch.

-- . Write a function which accept a deptno and check whether it is present in dept Table or not. If it is present print number of employees working in that department.
 
 
 -- trigger 
 DELIMITER $$

CREATE TRIGGER before_account_delete
BEFORE DELETE ON account
FOR EACH ROW
BEGIN
    INSERT INTO deleted_accounts (accnum, branchname, balance, deleted_on)
    VALUES (OLD.accnum, OLD.branchname, OLD.balance, NOW());
END$$

DELIMITER ;
CREATE TABLE deleted_accounts (
    accnum INT,
    branchname VARCHAR(20),
    balance FLOAT,
    deleted_on DATETIME
);
CREATE TABLE balance_changes (
    accnum INT,
    old_balance FLOAT,
    new_balance FLOAT,
    changed_on DATETIME
);


DELETE FROM account WHERE accnum = 102;

SELECT * FROM deleted_accounts;
SELECT * FROM account;
DELIMITER $$

CREATE TRIGGER after_balance_update
AFTER UPDATE ON account
FOR EACH ROW
BEGIN
    INSERT INTO balance_changes (accnum, old_balance, new_balance, changed_on)
    VALUES (NEW.accnum, OLD.balance, NEW.balance, NOW());
END$$

DELIMITER ;
UPDATE account SET balance = balance + 1000 WHERE accnum = 103;

SELECT * FROM balance_changes;
select *from account;

DELIMITER $$

CREATE PROCEDURE showAccounts()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE acc INT;
    DECLARE br VARCHAR(20);
    DECLARE bal FLOAT;

    -- Define the cursor
    DECLARE cur CURSOR FOR
        SELECT accnum, branchname, balance FROM account;

    -- When no more rows are found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO acc, br, bal;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        SELECT acc AS Account_No, br AS Branch_Name, bal AS Balance;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
CALL showAccounts();
