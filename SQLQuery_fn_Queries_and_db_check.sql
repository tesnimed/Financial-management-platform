-- 1. Query to check users with their accounts
SELECT u.User_id, u.Name, a.Account_id, a.Status
FROM [User] u
JOIN Account a ON u.User_id = a.User_id
WHERE a.Status = 'Active';

-- 2. Query to check users' transactions with account details
SELECT u.User_id, u.Name, t.Transaction_id, t.Description, t.Status
FROM [User] u
JOIN [Transaction] t ON u.User_id = t.Transaction_id
WHERE t.Status = 'Completed';

-- 3. Query to check user reports based on date
SELECT r.Report_id, r.Format, r.Type_id, u.Name, t.Transaction_date
FROM Report r
JOIN [User] u ON r.User_id = u.User_id
JOIN Transaction_Date t ON r.Date_id = t.Date_id
WHERE t.Transaction_date BETWEEN '2025-01-01' AND '2025-12-31';

-- 4. Query to check accounts with user budgets
SELECT u.Name, a.Account_id, b.Amount_id, ba.Value
FROM [User] u
JOIN Account a ON u.User_id = a.User_id
JOIN Budget b ON u.User_id = b.User_id
JOIN Budget_Amount ba ON b.Amount_id = ba.Amount_id
WHERE b.Status = 'Active' AND a.Status = 'Active';

-- 5. Query to check transactions based on type and category
SELECT t.Transaction_id, t.Description, c.Category_name, tt.Type_name
FROM [Transaction] t
JOIN Transaction_Category c ON t.Category_id = c.Category_id
JOIN Transaction_Type tt ON t.Type_id = tt.Type_id
WHERE c.Category_name = 'Investment' AND tt.Type_name = 'Debit';

-- 6. Query to check account details with used currency
SELECT a.Account_id, a.Currency, c.Currency_name
FROM Account a
JOIN Currency c ON a.Currency = c.Currency_code
WHERE c.Currency_name = 'USD';

-- 7. Query to check companies with their email addresses
SELECT co.Name, e.Email
FROM Company co
JOIN Company_Email e ON co.Company_id = e.Company_id
WHERE e.Email LIKE '%@gmail.com';

-- 8. Query to check reports with their summaries
SELECT r.Report_id, r.Format, rs.Summary
FROM Report r
JOIN Report_Summary rs ON r.Report_id = rs.Report_id
WHERE r.Type_id = 1 AND rs.Summary IS NOT NULL;

-- 9. Query to check transactions based on payment method and category
SELECT t.Transaction_id, t.Status, p.Method_name, c.Category_name
FROM [Transaction] t
JOIN Payment_Method p ON t.Payment_method = p.Payment_id
JOIN Transaction_Category c ON t.Category_id = c.Category_id
WHERE p.Method_name = 'Credit Card' AND c.Category_name = 'Expenses';

-- 10. Query to check users with their phone numbers
SELECT u.Name, ph.Phone_number
FROM [User] u
JOIN User_Phone ph ON u.User_id = ph.User_id
WHERE ph.Phone_number LIKE '05%';
