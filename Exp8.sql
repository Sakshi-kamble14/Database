SHOW DATABASES;
USE Bank23UCS051;
DESC Customer;
-- 1.Find the name of the branch with the smallest number of assets:
SELECT branchname FROM Branch 
WHERE assets = (SELECT MIN(assets) FROM Branch);

-- 2.Names of all branches that have assets greater than at least one branch in Brooklyn:
SELECT branchname FROM Branch 
WHERE assets > ANY (SELECT assets FROM Branch WHERE branchcity='Brooklyn');

-- 3.All customers who have both an account and a loan:
SELECT CustomerID, CustomerName 	
FROM Customer 
WHERE CustomerID IN (SELECT custname FROM Depositor) 
AND CustomerID IN (SELECT custname FROM Borrower);

-- 4.All customers who have a loan but do not have an account
SELECT CustomerID, CustomerName 
FROM Customer 
WHERE CustomerID IN (SELECT custname FROM Borrower) 
AND CustomerID NOT IN (SELECT custname FROM Depositor);

-- 5.Details of the largest loan at each branch:
SELECT branchname, MAX(amount) AS LargestLoan 
FROM Loan 
GROUP BY branchname;

-- 6.View to contain all customers of the bank:
CREATE VIEW all_customers AS 
SELECT * FROM Customer;

-- 7.Largest total account balance of any branch:
SELECT branchname, SUM(balance) AS TotalBalance 
FROM Account 
GROUP BY branchname 
ORDER BY TotalBalance DESC 
LIMIT 1;


