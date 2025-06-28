-- Exercise 3: Stored Procedures

-- Scenario 1:Process Monthly Interest for all savings accounts

CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  AccountType VARCHAR2(20),
  Balance NUMBER
);

-- i have inserted values
INSERT INTO Accounts VALUES (1, 101, 'Savings', 1000);
INSERT INTO Accounts VALUES (2, 102, 'Savings', 2000);
INSERT INTO Accounts VALUES (3, 103, 'Current', 3000);
COMMIT;

-- I Created the procedure for processing monthly interest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Scenario 1: Process Monthly Interest');
  FOR acc IN (
    SELECT AccountID, Balance FROM Accounts
    WHERE AccountType = 'Savings'
  ) LOOP
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountID = acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('Interest applied to Account ID: ' || acc.AccountID);
  END LOOP;
END;
/

-- I Executed the procedure
SET SERVEROUTPUT ON;
BEGIN
  ProcessMonthlyInterest;
END;
/

-- Scenario 2: Update Employee Bonus by department

-- i Created Employees table
CREATE TABLE Employees (
  EmployeeID NUMBER PRIMARY KEY,
  Name VARCHAR2(100),
  Department VARCHAR2(50),
  Salary NUMBER
);

INSERT INTO Employees VALUES (1, 'Alice', 'HR', 50000);
INSERT INTO Employees VALUES (2, 'Bob', 'IT', 60000);
INSERT INTO Employees VALUES (3, 'Charlie', 'IT', 55000);
COMMIT;

-- Creating the procedure to update employee bonus
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  deptName IN VARCHAR2,
  bonusPercent IN NUMBER
) AS
BEGIN
  DBMS_OUTPUT.PUT_LINE('Scenario 2: Update Employee Bonus');
  FOR emp IN (
    SELECT EmployeeID, Salary FROM Employees
    WHERE Department = deptName
  ) LOOP
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE EmployeeID = emp.EmployeeID;

    DBMS_OUTPUT.PUT_LINE('Bonus applied to Employee ID: ' || emp.EmployeeID);
  END LOOP;
END;
/


BEGIN
  UpdateEmployeeBonus('IT', 10);
END;
/

-- Scenario 3: Transfer funds between accounts

CREATE OR REPLACE PROCEDURE TransferFunds (
  fromAccID IN NUMBER,
  toAccID IN NUMBER,
  amount IN NUMBER
) AS
  fromBalance NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Scenario 3: Transfer Funds');

  SELECT Balance INTO fromBalance FROM Accounts WHERE AccountID = fromAccID;

  IF fromBalance >= amount THEN
    UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = fromAccID;
    UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = toAccID;

    DBMS_OUTPUT.PUT_LINE('Transferred '||amount ||' from Account '||fromAccID||' to Account '||toAccID);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient funds in Account '||fromAccID);
  END IF;
END;
/

-- Execute fund transfer
BEGIN
  TransferFunds(2, 3, 500);
END;
/
