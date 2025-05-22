-- CHECK Constraints
-- 1. Validate data in the Account table to determine account status
ALTER TABLE Account
ADD CONSTRAINT CK_Account_Status CHECK (Status IN ('Active', 'Inactive'));

-- 2. Ensure the month in the Budget table is between 1 and 12
ALTER TABLE Budget
ADD CONSTRAINT CK_Budget_Month CHECK (Month BETWEEN 1 AND 12);

-- 3. Validate email format in the User table
ALTER TABLE [User]
ADD CONSTRAINT CK_User_Email CHECK (Email LIKE '%@%.%');

-- 4. Ensure numeric fields in the Transaction_Amount table have valid values
ALTER TABLE Transaction_Amount
ADD CONSTRAINT CK_Transaction_Amount CHECK (Amount >= 0);

-- DEFAULT Constraints
-- 1. Set a default value for the creation date in the Account table
ALTER TABLE Account
ADD CONSTRAINT DF_Account_CreatedAt DEFAULT GETDATE() FOR Created_at;

-- 2. Set a default value for the "date" field in the Transaction_Date table
ALTER TABLE Transaction_Date
ADD CONSTRAINT DF_Transaction_Date DEFAULT GETDATE() FOR Transaction_date;

-- UNIQUE Constraints
-- 1. Ensure the email in the User table is unique
ALTER TABLE [User]
ADD CONSTRAINT UQ_User_Email UNIQUE (Email);

-- 2. Ensure the company name in the Company table is unique
ALTER TABLE Company
ADD CONSTRAINT UQ_Company_Name UNIQUE (Name);

-- 3. Ensure the phone number in the Company_Phone table is unique
ALTER TABLE Company_Phone
ADD CONSTRAINT UQ_Company_Phone UNIQUE (Phone_number);

-- FOREIGN KEY Constraints
-- 1. Add foreign key constraint between User and Role in the User_Role table
ALTER TABLE User_Role
ADD CONSTRAINT FK_UserRole_User FOREIGN KEY (User_id) REFERENCES [User](User_id);

ALTER TABLE User_Role
ADD CONSTRAINT FK_UserRole_Role FOREIGN KEY (Role_id) REFERENCES Role(Role_id);

-- 2. Add foreign key constraint between Account and Account_Type in the Account table
ALTER TABLE Account
ADD CONSTRAINT FK_Account_AccountType FOREIGN KEY (Type_id) REFERENCES Account_Type(Type_id);

-- 3. Add foreign key constraint between Company_Address and Company in the Company_Address table
ALTER TABLE Company_Address
ADD CONSTRAINT FK_CompanyAddress_Company FOREIGN KEY (Company_id) REFERENCES Company(Company_id);

-- 4. Add foreign key constraint between Transaction and Account in the Transaction table
ALTER TABLE [Transaction]
ADD CONSTRAINT FK_Transaction_Account FOREIGN KEY (Account_id) REFERENCES Account(Account_id);

-- 5. Add foreign key constraint between Transaction and Category in the Transaction table
ALTER TABLE [Transaction]
ADD CONSTRAINT FK_Transaction_Category FOREIGN KEY (Category_id) REFERENCES Category(Category_id);

-- 6. Add foreign key constraint between Transaction and Transaction_Type in the Transaction table
ALTER TABLE [Transaction]
ADD CONSTRAINT FK_Transaction_Type FOREIGN KEY (Type_id) REFERENCES Transaction_Type(Type_id);

-- NOT NULL Constraints
-- 1. Ensure the company name in the Company table is not null
ALTER TABLE Company
ALTER COLUMN Name NVARCHAR(100) NOT NULL;

-- 3. Ensure the email in the User table is not null
ALTER TABLE [User]
ALTER COLUMN Email NVARCHAR(100) NOT NULL;

-- 4. Ensure the value in the Budget_Amount table is not null
ALTER TABLE Budget_Amount
ALTER COLUMN Value DECIMAL(18,2) NOT NULL;

-- 5. Ensure the dates in the Transaction_Date table are not null
ALTER TABLE Transaction_Date
ALTER COLUMN Transaction_date DATE NOT NULL;
