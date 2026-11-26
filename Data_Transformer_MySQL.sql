DROP DATABASE IF EXISTS DataTransformer;
CREATE DATABASE DataTransformer;
USE DataTransformer;

-- 2. CREATE CUSTOMERS TABLE
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Robert', 'Brown', 'robert.brown@email.com', '2023-05-10'),
(4, 'Emily', 'Davis', 'emily.davis@email.com', '2024-01-20');

-- 3. CREATE ORDERS TABLE
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-08-10', 650.00),
(104, 3, '2024-01-15', 1200.00),
(105, 2, '2024-03-20', 450.25);

-- 4. CREATE EMPLOYEES TABLE
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'David', 'Wilson', 'IT', '2019-06-10', 70000.00),
(4, 'Priya', 'Sharma', 'Sales', '2022-08-05', 45000.00),
(5, 'Amit', 'Patel', 'IT', '2023-02-12', 60000.00);

-- 5. INNER JOIN: Orders with customer details
SELECT o.OrderID, c.CustomerID, c.FirstName, c.LastName, c.Email,
       o.OrderDate, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 6. LEFT JOIN: All customers and their orders
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 7. RIGHT JOIN: All orders and their customers
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 8. FULL OUTER JOIN simulation (MySQL uses UNION)
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 9. Customers with orders above the average order amount
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);

-- 10. Employees earning above average salary
SELECT EmployeeID, FirstName, LastName, Department, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 11. Extract year and month from OrderDate
SELECT OrderID, OrderDate,
       YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- 12. Difference in days between order date and current date
SELECT OrderID, OrderDate,
       DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;

-- 13. Format OrderDate
SELECT OrderID, OrderDate,
       DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;

-- 14. Concatenate employee first and last name
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

-- 15. Replace John with Jonathan
SELECT CustomerID, REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;

-- 16. Uppercase first name and lowercase last name
SELECT EmployeeID, UPPER(FirstName) AS UpperFirstName,
       LOWER(LastName) AS LowerLastName
FROM Employees;

-- 17. Trim spaces from Email
SELECT CustomerID, TRIM(Email) AS CleanEmail
FROM Customers;

-- 18. Running total of order amounts
SELECT OrderID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (
           ORDER BY OrderDate, OrderID
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RunningTotal
FROM Orders;

-- 19. Rank orders by TotalAmount
SELECT OrderID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

-- 20. Discount calculation using CASE
SELECT OrderID, TotalAmount,
       CASE
           WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
           WHEN TotalAmount > 500 THEN TotalAmount * 0.05
           ELSE 0
       END AS DiscountAmount,
       TotalAmount -
       CASE
           WHEN TotalAmount > 1000 THEN TotalAmount * 0.10
           WHEN TotalAmount > 500 THEN TotalAmount * 0.05
           ELSE 0
       END AS FinalAmount
FROM Orders;

-- 21. Categorize employee salaries
SELECT EmployeeID, FirstName, LastName, Salary,
       CASE
           WHEN Salary >= 65000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;

-- 22. View all tables
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Employees;
