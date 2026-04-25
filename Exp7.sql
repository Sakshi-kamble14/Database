SHOW DATABASES;
USE Bank23UCS051;
-- 1. Names and loan numbers of all customers who have a loan at Perryridge branch
SELECT C.custname, B.loanno
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno
WHERE L.branchname = 'Perryridge';

-- 2. Alphabetic order of customers who have a loan at Perryridge branch
SELECT C.custname
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno
WHERE L.branchname = 'Perryridge'
ORDER BY C.custname ASC;

-- 3. Names of branches with customers who have account in the bank and live in city starting with 'S'
SELECT DISTINCT A.branchname
FROM Account A
JOIN Depositor D ON A.accnum = D.accnum
JOIN Customer C ON D.custname = C.custname
WHERE C.custcity LIKE 'S%';

-- 4. Customers with loan info: name, loan number, amount
SELECT C.custname, L.loanno, L.amount
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno;

-- 5. Customers in alphabetic order who have a loan at Parkstreet branch
SELECT C.custname
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno
WHERE L.branchname = 'Parkstreet'
ORDER BY C.custname;

-- 6. Customers with loan info (name, loan number, amount) — same as query 4
SELECT C.custname, L.loanno, L.amount
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno;

-- 7. Customer names, loan numbers, loan amounts for loans at Perryridge branch
SELECT C.custname, L.loanno, L.amount
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno
WHERE L.branchname = 'Perryridge';

-- 8. Customers and loan numbers with loan_number renamed as loan_id
SELECT C.custname, L.loanno AS loan_id
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno;

-- 9. Name, account number, balance of all customers who have an account
SELECT C.custname, A.accnum, A.balance
FROM Customer C
JOIN Depositor D ON C.custname = D.custname
JOIN Account A ON D.accnum = A.accnum;

-- 10. Name, loan number, amount for loans at Perryridge
SELECT C.custname, L.loanno, L.amount
FROM Customer C
JOIN Borrower B ON C.custname = B.custname
JOIN Loan L ON B.loanno = L.loanno
WHERE L.branchname = 'Perryridge';

-- 11. Name, account number, balance of customers with account balance <= 400
SELECT C.custname, A.accnum, A.balance
FROM Customer C
JOIN Depositor D ON C.custname = D.custname
JOIN Account A ON D.accnum = A.accnum
WHERE A.balance <= 400;

-- 12. List all accounts of Brooklyn branch
SELECT * FROM Account
WHERE branchname = 'Brooklyn';
