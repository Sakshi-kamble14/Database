-- Step 1: Create and use the database
CREATE DATABASE Bank23UCS051;
USE Bank23UCS051;

-- Step 2: Create Branch table
CREATE TABLE Branch (
    branchname VARCHAR(20) PRIMARY KEY,
    branchcity VARCHAR(20) NOT NULL,
    assets FLOAT NOT NULL,
    CONSTRAINT CheckAssets CHECK (assets > 0)
);
DESC Branch;

-- Step 3: Create Customer table
CREATE TABLE Customer (
    custname VARCHAR(20) PRIMARY KEY,
    custstreet VARCHAR(50),
    custcity VARCHAR(20) NOT NULL
);
DESC Customer;

-- Step 4: Create Account table
CREATE TABLE Account (
    accnum INT PRIMARY KEY,
    branchname VARCHAR(20),
    balance FLOAT,
    CONSTRAINT CheckBalance CHECK (balance > 500),
    FOREIGN KEY (branchname) REFERENCES Branch(branchname)
);
DESC Account;

-- Step 5: Create Loan table
CREATE TABLE Loan (
    loanno INT PRIMARY KEY,
    branchname VARCHAR(20),
    amount FLOAT,
    CONSTRAINT CheckAmount CHECK (amount > 0),
    FOREIGN KEY (branchname) REFERENCES Branch(branchname)
);
DESC Loan;

-- Step 6: Create Depositor table (relation between Customer and Account)
CREATE TABLE Depositor (
    accnum INT,
    custname VARCHAR(20),
    FOREIGN KEY (accnum) REFERENCES Account(accnum),
    FOREIGN KEY (custname) REFERENCES Customer(custname)
);
DESC Depositor;

-- Step 7: Create Borrower table (relation between Customer and Loan)
CREATE TABLE Borrower (
    loanno INT,
    custname VARCHAR(20),
    FOREIGN KEY (loanno) REFERENCES Loan(loanno),
    FOREIGN KEY (custname) REFERENCES Customer(custname),
    PRIMARY KEY (loanno, custname)
);
DESC Borrower;

-- Step 8: Add constraints and modify Customer table

-- 1. Make custstreet NOT NULL
ALTER TABLE Customer MODIFY custstreet VARCHAR(50) NOT NULL;

-- 2. Add phoneNo column (initially with larger size)
ALTER TABLE Customer ADD phoneNo VARCHAR(15);

-- 3. Add custage column
ALTER TABLE Customer ADD custage INT;

-- 4. Add constraint: custage > 18
ALTER TABLE Customer ADD CONSTRAINT CheckAge CHECK (custage > 18);

-- 5. Modify phoneNo to VARCHAR(10)
ALTER TABLE Customer MODIFY phoneNo VARCHAR(10);

-- 6. Drop phoneNo column
ALTER TABLE Customer DROP COLUMN phoneNo;

-- 7. Drop constraint on custage
ALTER TABLE Customer DROP CHECK CheckAge;

-- Final check: View Customer structure
DESC Customer;

