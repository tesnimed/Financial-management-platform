CREATE DATABASE [Financial_Management_Platform];
GO

USE [Financial_Management_Platform];
GO

-- 1. User
CREATE TABLE [User] (
    User_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Password NVARCHAR(100) NOT NULL
);

-- 2. Role
CREATE TABLE Role (
    Role_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL
);

-- 3. User_Role
CREATE TABLE User_Role (
    User_id INT,
    Role_id INT,
    PRIMARY KEY (User_id, Role_id),
    FOREIGN KEY (User_id) REFERENCES [User](User_id),
    FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
);

-- 4. Company
CREATE TABLE Company (
    Company_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Industry NVARCHAR(100),
    Country NVARCHAR(100)
);

-- 5. Company_Address
CREATE TABLE Company_Address (
    Address_id INT PRIMARY KEY IDENTITY(1,1),
    Company_id INT,
    Address NVARCHAR(200),
    FOREIGN KEY (Company_id) REFERENCES Company(Company_id)
);

-- 6. Company_Email
CREATE TABLE Company_Email (
    Email_id INT PRIMARY KEY IDENTITY(1,1),
    Company_id INT,
    Email NVARCHAR(100),
    FOREIGN KEY (Company_id) REFERENCES Company(Company_id)
);

-- 7. Company_Phone
CREATE TABLE Company_Phone (
    Phone_id INT PRIMARY KEY IDENTITY(1,1),
    Company_id INT,
    Phone_number NVARCHAR(20),
    FOREIGN KEY (Company_id) REFERENCES Company(Company_id)
);

-- 8. User_Company
CREATE TABLE User_Company (
    User_id INT,
    Company_id INT,
    PRIMARY KEY (User_id, Company_id),
    FOREIGN KEY (User_id) REFERENCES [User](User_id),
    FOREIGN KEY (Company_id) REFERENCES Company(Company_id)
);

-- 9. User_Address
CREATE TABLE User_Address (
    Address_id INT PRIMARY KEY IDENTITY(1,1),
    User_id INT,
    Town NVARCHAR(100),
    State NVARCHAR(100),
    Locality NVARCHAR(100),
    Type NVARCHAR(50),
    FOREIGN KEY (User_id) REFERENCES [User](User_id)
);

-- 10. Account
CREATE TABLE Account (
    Account_id INT PRIMARY KEY IDENTITY(1,1),
    User_id INT,
    Type_id INT,
    Currency NVARCHAR(10),
    Created_at DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) CHECK (Status IN ('Active', 'Inactive')),
    FOREIGN KEY (User_id) REFERENCES [User](User_id),
    FOREIGN KEY (Type_id) REFERENCES Account_Type(Type_id)
);

-- 11. Account_Balance
CREATE TABLE Account_Balance (
    Balance_id INT PRIMARY KEY IDENTITY(1,1),
    Account_id INT,
    Balance DECIMAL(18,2),
    Updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (Account_id) REFERENCES Account(Account_id)
);

-- 12. Account_Type
CREATE TABLE Account_Type (
    Type_id INT PRIMARY KEY IDENTITY(1,1),
    Type_name NVARCHAR(50)
);

-- 13. Budget
CREATE TABLE Budget (
    Budget_id INT PRIMARY KEY IDENTITY(1,1),
    User_id INT,
    Amount_id INT,
    Month INT CHECK (Month BETWEEN 1 AND 12),
    Year INT,
    Status NVARCHAR(50),
    FOREIGN KEY (User_id) REFERENCES [User](User_id),
    FOREIGN KEY (Amount_id) REFERENCES Budget_Amount(Amount_id)
);

-- 14. Budget_Amount
CREATE TABLE Budget_Amount (
    Amount_id INT PRIMARY KEY IDENTITY(1,1),
    Value DECIMAL(18,2)
);

-- 15. Transaction
CREATE TABLE [Transaction] (
    Transaction_id INT PRIMARY KEY IDENTITY(1,1),
    Account_id INT,
    Category_id INT,
    Type_id INT,
    Status NVARCHAR(50),
    Description NVARCHAR(200),
    Payment_method NVARCHAR(50),
    FOREIGN KEY (Account_id) REFERENCES Account(Account_id),
    FOREIGN KEY (Category_id) REFERENCES Category(Category_id),
    FOREIGN KEY (Type_id) REFERENCES Transaction_Type(Type_id)
);

-- 16. Transaction_Amount
CREATE TABLE Transaction_Amount (
    Amount_id INT PRIMARY KEY IDENTITY(1,1),
    Transaction_id INT,
    Amount DECIMAL(18,2),
    FOREIGN KEY (Transaction_id) REFERENCES [Transaction](Transaction_id)
);

-- 17. Transaction_Date
CREATE TABLE Transaction_Date (
    Date_id INT PRIMARY KEY IDENTITY(1,1),
    Transaction_id INT,
    Transaction_date DATE,
    FOREIGN KEY (Transaction_id) REFERENCES [Transaction](Transaction_id)
);

-- 18. Transaction_Type
CREATE TABLE Transaction_Type (
    Type_id INT PRIMARY KEY IDENTITY(1,1),
    Type_name NVARCHAR(50)
);

-- 19. Category
CREATE TABLE Category (
    Category_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Type_id INT,
    FOREIGN KEY (Type_id) REFERENCES Category_Type(Type_id)
);

-- 20. Category_Type
CREATE TABLE Category_Type (
    Type_id INT PRIMARY KEY IDENTITY(1,1),
    Type_name NVARCHAR(50)
);

-- 21. Report
CREATE TABLE Report (
    Report_id INT PRIMARY KEY IDENTITY(1,1),
    User_id INT,
    Date_id INT,
    Format NVARCHAR(50),
    Type_id INT,
    FOREIGN KEY (User_id) REFERENCES [User](User_id),
    FOREIGN KEY (Date_id) REFERENCES Transaction_Date(Date_id),
    FOREIGN KEY (Type_id) REFERENCES Report_Type(Type_id)
);

-- 22. Report_Summary
CREATE TABLE Report_Summary (
    Summary_id INT PRIMARY KEY IDENTITY(1,1),
    Report_id INT,
    Summary NVARCHAR(MAX),
    FOREIGN KEY (Report_id) REFERENCES Report(Report_id)
);

-- 23. Report_Stats
CREATE TABLE Report_Stats (
    Stats_id INT PRIMARY KEY IDENTITY(1,1),
    Report_id INT,
    Stats NVARCHAR(MAX),
    FOREIGN KEY (Report_id) REFERENCES Report(Report_id)
);

-- 24. Report_Type
CREATE TABLE Report_Type (
    Type_id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50)
);

-- 25. Address_Type
CREATE TABLE Address_Type (
    Type_id INT PRIMARY KEY IDENTITY(1,1),
    Description NVARCHAR(100)
);

-- 26. Payment_Method
CREATE TABLE Payment_Method (
    Payment_id INT PRIMARY KEY IDENTITY(1,1),
    Method_name NVARCHAR(50)
);

-- 27. Currency
CREATE TABLE Currency (
    Currency_id INT PRIMARY KEY IDENTITY(1,1),
    Currency_code NVARCHAR(10),
    Currency_name NVARCHAR(50)
);

-- 28. Status
CREATE TABLE Status (
    Status_id INT PRIMARY KEY IDENTITY(1,1),
    Status_name NVARCHAR(50)
);

-- 29. Transaction_Category
CREATE TABLE Transaction_Category (
    Category_id INT PRIMARY KEY IDENTITY(1,1),
    Category_name NVARCHAR(50),
    Type_id INT,
    FOREIGN KEY (Type_id) REFERENCES Category_Type(Type_id)
);

-- 30. Budget_Status
CREATE TABLE Budget_Status (
    Status_id INT PRIMARY KEY IDENTITY(1,1),
    Status_name NVARCHAR(50)
);

-- 31. Company_Industry
CREATE TABLE Company_Industry (
    Industry_id INT PRIMARY KEY IDENTITY(1,1),
    Industry_name NVARCHAR(100)
);

-- 32. User_Email
CREATE TABLE User_Email (
    Email_id INT PRIMARY KEY IDENTITY(1,1),
    User_id INT,
    Email NVARCHAR(100),
    FOREIGN KEY (User_id) REFERENCES [User](User_id)
);

-- 33. User_Phone
CREATE TABLE User_Phone (
    Phone_id INT PRIMARY KEY IDENTITY(1,1),
    User_id INT,
    Phone_number NVARCHAR(20),
    FOREIGN KEY (User_id) REFERENCES [User](User_id)
);

-- 34. Account_Status
CREATE TABLE Account_Status (
    Status_id INT PRIMARY KEY IDENTITY(1,1),
    Status_name NVARCHAR(50)
);

-- 35. Transaction_Status
CREATE TABLE Transaction_Status (
    Status_id INT PRIMARY KEY IDENTITY(1,1),
    Status_name NVARCHAR(50)
);
