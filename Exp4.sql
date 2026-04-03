
INSERT INTO Branch (branchname, branchcity, assets) VALUES
('Perryridge', 'Palo Alto', 3400),
('Downtown', 'Brooklyn', 5000),
('Mianpur', 'Hyderabad', 2700),
('Cantonment', 'Delhi', 4500),
('Park Street', 'Mumbai', 3200);

INSERT INTO Customer (custname, custstreet, custcity ) VALUES
('Vivek', 'Main Street', 'Ichalkarnji'),
('Ravi', '2nd Avenue', 'Mumbai'),
('Anjali', 'Park Lane', 'Pune'),
('Sunita', 'Lake View', 'Delhi'),
('Kiran', 'MG Road', 'Bangalore');

INSERT INTO Account (accnum, branchname, balance) VALUES
(101, 'Perryridge', 800),
(102, 'Downtown', 1200),
(103, 'Park Street', 700),
(104, 'Perryridge', 950),
(215, 'Downtown', 4000);

INSERT INTO Loan (loanno, branchname, amount) VALUES
(201, 'Park Street', 15000),
(202, 'Downtown', 5000),
(203, 'Perryridge', 2000),
(204, 'Mianpur', 3000),
(205, 'Perryridge', 1000);

INSERT INTO Depositor (accnum, custname) VALUES
(101, 'Vivek'),
(102, 'Ravi'),
(103, 'Anjali'),
(104, 'Sunita'),
(215, 'Kiran');

INSERT INTO Borrower (loanno, custname) VALUES
(201, 'Vivek'),
(202, 'Ravi'),
(203, 'Anjali'),
(204, 'Sunita'),
(205, 'Kiran');

-- 1. Insert account A-978245 at Park Street with balance 12000
INSERT INTO Account (accnum, branchname, balance) VALUES (978245, 'Park Street', 12000);

-- 2. Insert customer Vivek at Main Street, Ichalkarnji (already inserted above)
-- (If duplicate occurs, you can skip this or use INSERT IGNORE)

-- ========================================
-- 4. Change assets of Perryridge branch to 3400
UPDATE Branch SET assets = 3400 WHERE branchname = 'Perryridge';

-- 5. Add 2% interest to all bank account balances with balance <= 500
UPDATE Account SET balance = balance * 0.02 WHERE balance <= 500;

-- 6. Transfer accounts and loans of Perryridge branch to Downtown branch
UPDATE Account SET branchname = 'Downtown' WHERE branchname = 'Perryridge';

UPDATE Loan SET branchname = 'Downtown' WHERE branchname = 'Perryridge';

-- 7. Transfer Rs. 100 from account 101 to account 215
UPDATE Account SET balance = balance - 100 WHERE accnum = 101;

UPDATE Account SET balance = balance + 100 WHERE accnum = 215;

-- 8. Delete the branch Perryridge
DELETE FROM Branch WHERE branchname = 'Perryridge';

-- 9. Remove all customers who live in 'Downtown'
DELETE FROM Customer WHERE custcity = 'Downtown';

-- 10. Remove all accounts
DELETE FROM Account;

-- ========================================
-- Queries:

-- 11. List all branch names and their assets
SELECT branchname, assets FROM Branch;

-- 12. List all loans with amount greater than 1000
SELECT * FROM Loan WHERE amount > 1000;

-- 13. Find bank accounts with balance under 700
SELECT * FROM Account WHERE balance < 700;

-- 14. List all accounts of Perryridge branch with balance less than 1000
SELECT * FROM Account WHERE branchname = 'Perryridge' AND balance < 1000;

-- 15. Find names of all branches in the loan relation
SELECT branchname FROM Loan;
SELECT DISTINCT branchname FROM Loan;

-- 16. Find loan numbers for loans at Park Street with loan amount > 10000
SELECT loanno FROM Loan WHERE branchname = 'Park Street' AND amount > 10000;

-- 17. Find loan numbers with loan amounts between 10000 and 50000
SELECT loanno FROM Loan WHERE amount BETWEEN 10000 AND 50000;

-- 18. Find names of all customers
SELECT custname FROM Customer;

-- 19. Find names of all branches in loan relation (distinct)
SELECT DISTINCT branchname FROM Loan;

-- 20. Display entire Branch table
SELECT * FROM Branch;

-- 21. Find account numbers where balance > 700
SELECT accnum FROM Account WHERE balance > 700;

-- 22. Find account number and balance for accounts from Brighton with balance > 800
SELECT accnum, balance FROM Account WHERE branchname = 'Brighton' AND balance > 800;

-- 23. Display branch name and assets in thousands, rename column
SELECT branchname, assets / 1000 AS "assets in thousands" FROM Branch; 

-- 24. Find names of branches with assets between 1 million and 4 million
SELECT branchname FROM Branch WHERE assets BETWEEN 1000000 AND 4000000;

-- 25. Find names of customers whose street address includes 'Main'
SELECT custname FROM Customer WHERE custstreet LIKE '%Main%';

-- 26. List accounts where Bank_Branch begins with 'C' and has 'a' as second character
SELECT * FROM Account WHERE branchname LIKE 'Ca%';

-- 27. List accounts where Bank_Branch has 'a' as second character and at least 3 characters long
SELECT * FROM Account WHERE branchname LIKE '_a%' AND LENGTH(branchname) >= 3;

-- 28. Find loan numbers in Loan relation with NULL amount
SELECT loanno FROM Loan WHERE amount IS NULL;


