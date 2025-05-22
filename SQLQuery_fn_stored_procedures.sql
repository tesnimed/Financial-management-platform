-- 1. Stored Procedure Add_User
CREATE PROCEDURE Add_User
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Password NVARCHAR(255)
AS
BEGIN
    INSERT INTO [User] (Name, Email, Password)
    VALUES (@Name, @Email, @Password);
END;

EXEC Add_User
@Name='ahmet',@Email='aha@gmai.com',@Password='123456';



-- 2. Stored Procedure Update_User for ID
CREATE PROCEDURE Update_User
    @User_id INT,-*
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Password NVARCHAR(255)
AS
BEGIN
    UPDATE [User]
    SET Name = @Name, Email = @Email, Password = @Password
    WHERE User_id = @User_id;
END;

EXEC Update_User
@User_id=1,
@Name='ahmew',@Email='au@gmai.com',@Password='123444';




-- 3. Stored Procedure Delete_User for ID
CREATE PROCEDURE Delete_User
    @User_id INT
AS
BEGIN
    DELETE FROM [User]
    WHERE User_id = @User_id;
END;

EXEC Delete_User
@User_id=1



-- 4. Stored Procedure Add_Account
CREATE PROCEDURE Add_Account
    @User_id INT,
    @Type_id INT,
    @Currency NVARCHAR(10),
    @Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO Account (User_id, Type_id, Currency, Status, Created_at)
    VALUES (@User_id, @Type_id, @Currency, @Status, GETDATE());
END;
EXEC Add_Account
    @User_id = 2,
    @Type_id = 1,
    @Currency = N'USD',
    @Status = N'Active';


-- 5. Stored Procedure Update_Account_Status
CREATE PROCEDURE Update_Account_Status
    @Account_id INT,
    @Status NVARCHAR(50)
AS
BEGIN
    UPDATE Account
    SET Status = @Status
    WHERE Account_id = @Account_id;
END;
EXEC Update_Account_Status
    @Account_id = 6,
    @Status = N'Inactive';

-- 6. Stored Procedure Add_Transaction
CREATE PROCEDURE Add_Transaction
    @Account_id INT,
    @Category_id INT,
    @Type_id INT,
    @Status NVARCHAR(50),
    @Description NVARCHAR(255),
    @Payment_method NVARCHAR(50)
AS
BEGIN
    INSERT INTO [Transaction] (Account_id, Category_id, Type_id, Status, Description, Payment_method)
    VALUES (@Account_id, @Category_id, @Type_id, @Status, @Description, @Payment_method);
END;
EXEC  Add_Transaction
@Account_id=6,
@Category_id=1,
@Type_id=1,
@Status='active',
@Description='ahmett',
@Payment_method='aa';


-- 7. Stored Procedure Update_Transaction
CREATE PROCEDURE Update_Transaction
    @Transaction_id INT,
    @Status NVARCHAR(50),
    @Description NVARCHAR(255),
    @Payment_method NVARCHAR(50)
AS
BEGIN
    UPDATE [Transaction]
    SET Status = @Status, Description = @Description, Payment_method = @Payment_method
    WHERE Transaction_id = @Transaction_id;
END;
EXEC Update_Transaction
    @Transaction_id=4,
    @Status='Inactive',
    @Description='asassaaa',
    @Payment_method='dsdsd'

-- 8. Stored Procedure Delete_Transaction
CREATE PROCEDURE Delete_Transaction
    @Transaction_id INT
AS
BEGIN
    DELETE FROM [Transaction]
    WHERE Transaction_id = @Transaction_id;
END;
EXEC Delete_Transaction
@Transaction_id=4;

-- 9. Stored Procedure Add_Budget
CREATE PROCEDURE Add_Budget
    @User_id INT,
    @Amount_id INT,
    @Month INT,
    @Year INT,
    @Status NVARCHAR(50)
AS
BEGIN
    INSERT INTO Budget (User_id, Amount_id, Month, Year, Status)
    VALUES (@User_id, @Amount_id, @Month, @Year, @Status);
END;
EXEC Add_Budget
    @User_id =2,
    @Amount_id =3,
    @Month= 2,
    @Year =2022,
    @Status ='active'

-- 10. Stored Procedure Update_Budget
CREATE PROCEDURE Update_Budget
    @Budget_id INT,
    @Amount_id INT,
    @Month INT,
    @Year INT,
    @Status NVARCHAR(50)
AS
BEGIN
    UPDATE Budget
    SET Amount_id = @Amount_id, Month = @Month, Year = @Year, Status = @Status
    WHERE Budget_id = @Budget_id;
END;
EXEC Update_Budget
    @Budget_id =2,
    @Amount_id =3,
    @Month= 2,
    @Year =2022,
    @Status ='Inactive'


-- 11. Stored Procedure Add_Report
CREATE PROCEDURE Add_Report
    @User_id INT,
    @Date_id INT,
    @Format NVARCHAR(50),
    @Type_id INT
AS
BEGIN
    INSERT INTO Report (User_id, Date_id, Format, Type_id)
    VALUES (@User_id, @Date_id, @Format, @Type_id);
END;
EXEC Add_Report
    @User_id =2,
    @Date_id =1,
    @Format='KJK',
    @Type_id=1 

-- 12. Stored Procedure Update_Report
CREATE PROCEDURE Update_Report
    @Report_id INT,
    @Format NVARCHAR(50),
    @Type_id INT
AS
BEGIN
    UPDATE Report
    SET Format = @Format, Type_id = @Type_id
    WHERE Report_id = @Report_id;
END;
EXEC Update_Report
    @Report_id =3,
    @Format='KJ[',
    @Type_id=1 


-- 13. Stored Procedure Add_Report_Summary
CREATE PROCEDURE Add_Report_Summary
    @Report_id INT,
    @Summary NVARCHAR(255)
AS
BEGIN
    INSERT INTO Report_Summary (Report_id, Summary)
    VALUES (@Report_id, @Summary);
END;
EXEC Add_Report_Summary
    @Report_id =3,
    @Summary ='FDF'

-- 14. Stored Procedure Update_Report_Summary
CREATE PROCEDURE Update_Report_Summary
    @Summary_id INT,
    @Summary NVARCHAR(255)
AS
BEGIN
    UPDATE Report_Summary
    SET Summary = @Summary
    WHERE Summary_id = @Summary_id;
END;
EXEC Update_Report_Summary
    @Summary_id =1,
    @Summary ='FGDFG'

-- 15. Stored Procedure Add_Category
CREATE PROCEDURE Add_Category
    @Category_name NVARCHAR(100),
    @Type_id INT
AS
BEGIN
    INSERT INTO Category ([Name], Type_id)
    VALUES (@Category_name, @Type_id);
END;
EXEC Add_Category
    @Category_name ='TYRGD',
    @Type_id =2

-- 16. Stored Procedure Update_Category
CREATE PROCEDURE Update_Category
    @Category_id INT,
    @Category_name NVARCHAR(100),
    @Type_id INT
AS
BEGIN
    UPDATE Category
    SET [Name] = @Category_name, Type_id = @Type_id
    WHERE Category_id = @Category_id;
END;
EXEC Update_Category
    @Category_id =1,
    @Category_name ='YTYYYY',
    @Type_id =2
