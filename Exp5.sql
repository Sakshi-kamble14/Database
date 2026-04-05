SHOW DATABASES;
USE Bank23UCS051;
SHOW TABLES;
SELECT *FROM Account;

-- 1.Find the average account balance at the Perryridge branch
SELECT AVG(balance) AS avg_balance FROM Account WHERE branchname = 'Park Street';

-- 2.Find maximum amount of any loan in the bank
SELECT *FROM Loan;
SELECT MAX(amount) AS max_loan_amount FROM Loan;

-- 3.List number of accounts with balances between 700 and 900
SELECT COUNT(accnum) AS num_accounts FROM Account WHERE balance BETWEEN 700 AND 900;

-- 4.List total number of account holders in the ‘Downtown’ Branch
SELECT COUNT(DISTINCT custname) AS total_account_holders
FROM Depositor D
JOIN Account A ON D.accnum = A.accnum
WHERE A.branchname = 'Downtown';

-- 5.List total number of unique customer city names
SELECT COUNT(DISTINCT custcity) AS Customer_City FROM Customer;

-- 6.Find the number of branches that currently have loans
SELECT COUNT(DISTINCT branchname) AS Branch FROM Loan;





