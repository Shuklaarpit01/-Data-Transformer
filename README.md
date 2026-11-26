# 🚀 PR. 2 – DATA TRANSFORMER

![Typing Animation](https://readme-typing-svg.demolab.com?font=Fira+Code&size=25&pause=1000&color=36BCF7&center=true&vCenter=true&width=650&lines=Welcome+to+Data+Transformer;Transform+Data+with+MySQL;Joins+%7C+Subqueries+%7C+Window+Functions)

<p align="center">
  <img src="https://img.shields.io/badge/Project-Data%20Transformer-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Database-MySQL-orange?style=for-the-badge&logo=mysql" />
  <img src="https://img.shields.io/badge/Language-SQL-lightgrey?style=for-the-badge" />
</p>

---

## 📌 Project Overview

**Data Transformer** is a SQL-based database management and data transformation project developed using MySQL.

This project focuses on creating databases, managing tables, retrieving information, joining multiple tables, performing calculations, transforming data, and analyzing records using advanced SQL queries.

It demonstrates practical knowledge of SQL concepts through three main tables: Customers, Orders, and Employees.

## 🎯 Project Objectives

- Create and manage a relational database.
- Store customer, order, and employee information.
- Retrieve related data using different JOIN operations.
- Perform calculations using aggregate functions.
- Extract and format date values.
- Transform text using string functions.
- Analyze data using subqueries and window functions.
- Calculate discounts and categorize employee salaries.

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| MySQL | Database Management |
| SQL | Data Manipulation |
| MySQL Workbench | Query Execution |
| GitHub | Project Documentation |

## 🗄️ Database Structure

**Database Name:** `DataTransformer`

The project contains three main tables:

### 1. Customers Table

Stores customer information.

| Column | Description |
|---|---|
| CustomerID | Unique customer ID (Primary Key) |
| FirstName | Customer's first name |
| LastName | Customer's last name |
| Email | Customer email |
| RegistrationDate | Registration date |

### 2. Orders Table

Stores customer order details.

| Column | Description |
|---|---|
| OrderID | Unique order ID (Primary Key) |
| CustomerID | Customer reference (Foreign Key) |
| OrderDate | Date of order |
| TotalAmount | Total order amount |

### 3. Employees Table

Stores employee information.

| Column | Description |
|---|---|
| EmployeeID | Unique employee ID (Primary Key) |
| FirstName | Employee's first name |
| LastName | Employee's last name |
| Department | Employee department |
| HireDate | Joining date |
| Salary | Employee salary |

## ⚡ Key Features

### 1. Database & Table Creation
- Create database.
- Create Customers, Orders, and Employees tables.
- Define Primary Keys and Foreign Keys.
- Insert sample records.

### 2. JOIN Operations
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN Simulation using UNION.

### 3. Subqueries
- Find customers whose orders are above average.
- Find employees earning above average salary.

### 4. Date Functions
- YEAR()
- MONTH()
- DATEDIFF()
- DATE_FORMAT()
- CURDATE()

### 5. String Functions
- CONCAT()
- REPLACE()
- UPPER()
- LOWER()
- TRIM()

### 6. Window Functions
- Running Total using SUM() OVER().
- Ranking orders using RANK() OVER().

### 7. Conditional Operations
- Calculate discounts using CASE.
- Calculate final order amounts.
- Categorize employee salaries into High, Medium, and Low.

## 📂 Project Structure

```text
PR. 2 Data Transformer/
│
├── DataTransformer.sql
│
└── README.md
```

## ▶️ How to Run the Project

1. Open MySQL Workbench.
2. Open a new SQL query tab.
3. Copy the SQL project code.
4. Paste the code into the query editor.
5. Execute the complete SQL script.
6. Refresh the Schemas panel.
7. Select the `DataTransformer` database.
8. Run individual SELECT queries to view the results.

## 📊 Expected Output

The project generates results such as:

- Customer details with their orders.
- Customers with orders above average.
- Employees earning above average salary.
- Extracted year and month from order dates.
- Formatted dates.
- Employee full names.
- Running total of order amounts.
- Ranked orders.
- Discount amounts and final prices.
- Employee salary categories.

## 💡 Learning Outcomes

After completing this project, I learned:

- Database creation and management.
- Working with relational tables.
- Understanding Primary and Foreign Keys.
- Applying different JOIN operations.
- Using subqueries and aggregate functions.
- Performing date and string transformations.
- Working with SQL window functions.
- Applying conditional logic using CASE statements.

## 👨‍💻 Conclusion

The **PR. 2 – Data Transformer** project helped me understand how SQL can be used to organize, retrieve, analyze, and transform structured data.

It provided practical experience with MySQL queries, relational database operations, and advanced SQL techniques.

---

<p align="center">

### ✨ THANK YOU FOR VISITING! ✨

**PR. 2 – DATA TRANSFORMER**

*Learn • Transform • Analyze • Grow*

</p>
