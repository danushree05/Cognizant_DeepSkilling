-- CREATE TABLE Customers (
--   CustomerID NUMBER PRIMARY KEY,
--   Name VARCHAR2(100),
--   DOB DATE,
--   Balance NUMBER,
--   LastModified DATE
-- );
--
-- CREATE TABLE Loans (
--   LoanID NUMBER PRIMARY KEY,
--   CustomerID NUMBER,
--   LoanAmount NUMBER,
--   InterestRate NUMBER,
--   StartDate DATE,
--   EndDate DATE,
--   FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
-- );
--

-- INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (1, 'John Doe', TO_DATE('1950-05-15', 'YYYY-MM-DD'), 1000, SYSDATE);
-- INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (2, 'Jane Smith', TO_DATE('1985-07-22', 'YYYY-MM-DD'), 300, SYSDATE);
-- INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified) VALUES (3, 'Bob Brown', TO_DATE('1990-01-10', 'YYYY-MM-DD'), 2500, SYSDATE);
--
-- INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 60));
-- INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (2, 2, 3000, 6, SYSDATE, ADD_MONTHS(SYSDATE, 36));
-- INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate) VALUES (3, 3, 7000, 7, SYSDATE, ADD_MONTHS(SYSDATE, 72));
--

-- COMMIT;


-- Scenario 1: We want to reduce interest rate by 1 if customer is older than 60 years
SET SERVEROUTPUT ON;
BEGIN
  FOR cust IN (
    SELECT c.CustomerID, c.DOB, l.LoanID, l.InterestRate
    FROM Customers c
    JOIN Loans l ON c.CustomerID = l.CustomerID
  ) LOOP
    -- Calculate age by dividing months between today and DOB by 12
    IF MONTHS_BETWEEN(SYSDATE, cust.DOB)/12 > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE LoanID = cust.LoanID;

      DBMS_OUTPUT.PUT_LINE('Interest discount given to Customer ID: ' || cust.CustomerID);
    END IF;
  END LOOP;
  COMMIT;
END;
/

-- Scenario 2: Add bonus money of 200 if balance is less than 500
BEGIN
  FOR cust IN (
    SELECT CustomerID, Balance FROM Customers
  ) LOOP
    IF cust.Balance < 500 THEN
      UPDATE Customers
      SET Balance = Balance + 200,
          LastModified = SYSDATE
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Bonus 200 added for Customer ID: ' || cust.CustomerID);
    ELSE
      DBMS_OUTPUT.PUT_LINE('No bonus for Customer ID: ' || cust.CustomerID || ', current balance: ' || cust.Balance);
    END IF;
  END LOOP;
  COMMIT;
END;
/

-- Scenario 3: Deduct 100 as penalty if balance is more than 2000
BEGIN
  FOR cust IN (
    SELECT CustomerID, Balance FROM Customers
  ) LOOP
    IF cust.Balance > 2000 THEN
      UPDATE Customers
      SET Balance = Balance - 100,
          LastModified = SYSDATE
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Penalty of 100 applied to Customer ID: ' || cust.CustomerID);
    ELSE
      DBMS_OUTPUT.PUT_LINE('No penalty for Customer ID: ' || cust.CustomerID || ', balance: ' || cust.Balance);
    END IF;
  END LOOP;
  COMMIT;
END;
/
