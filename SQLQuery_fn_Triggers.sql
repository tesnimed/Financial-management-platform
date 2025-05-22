-- 1. Trigger trg_Insert_Account

CREATE TRIGGER trg_Insert_Account
ON Account
AFTER INSERT
AS
BEGIN
    DECLARE @Account_id INT
    SELECT @Account_id = Account_id FROM inserted
    UPDATE Account
    SET Created_at = GETDATE()
    WHERE Account_id = @Account_id;
END;

-- 2. Trigger trg_Prevent_Delete_Transaction

CREATE TRIGGER trg_Prevent_Delete_Transaction
ON [Transaction]
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @Transaction_id INT
    SELECT @Transaction_id = Transaction_id FROM deleted

    IF EXISTS (SELECT * FROM [Transaction_Amount] WHERE Transaction_id = @Transaction_id)
    BEGIN
        PRINT 'Cannot delete transaction. There are associated amounts.'
    END
    ELSE
    BEGIN
        DELETE FROM [Transaction] WHERE Transaction_id = @Transaction_id
    END
END;


-- 3. Trigger trg_Prevent_Delete_Budget

CREATE TRIGGER trg_Prevent_Delete_Budget
ON Budget
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @Budget_id INT
    SELECT @Budget_id = Budget_id FROM deleted

    IF EXISTS (SELECT * FROM User_Budget WHERE Budget_id = @Budget_id)
    BEGIN
        PRINT 'Cannot delete budget. It is associated with a user.'
    END
    ELSE
    BEGIN
        DELETE FROM Budget WHERE Budget_id = @Budget_id
    END
END;







