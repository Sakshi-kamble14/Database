SHOW DATABASES;
USE Bank23UCS051;
SHOW TABLES;

-- 1. List loan data, ordered by decreasing amounts, then increasing loan numbers
SELECT loanno, branchname, amount
FROM Loan
ORDER BY amount DESC, loanno ASC;

-- 2. Retrieve all bank branch details, ordered by branch city, with each city’s branches listed in reverse order of holdings (assets)
SELECT branchname, branchcity, assets
FROM Branch
ORDER BY branchcity ASC, assets DESC;

-- 3. Find the average account balance at each branch
SELECT branchname, AVG(balance) AS avg_balance
FROM Account
GROUP BY branchname;

-- 4. Find the number of customers citywise
SELECT custcity, COUNT(custname) AS num_customers
FROM Customer
GROUP BY custcity;

-- 5. Find the number of branches of the bank
SELECT COUNT(branchname) AS total_branches
FROM Branch;

-- 6. Find the average account balance of branches where average balance > 1200
SELECT branchname, AVG(balance) AS avg_balance
FROM Account
GROUP BY branchname
HAVING AVG(balance) > 1200;

-- 7. Find all cities with more than two customers living in the city
SELECT custcity, COUNT(custname) AS num_customers
FROM Customer
GROUP BY custcity
HAVING COUNT(custname) > 2;
