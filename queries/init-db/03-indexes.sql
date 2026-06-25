-- Индексы для ускорения запросов

-- Индексы на внешние ключи (JOIN)
CREATE INDEX idx_accounts_client_id ON accounts(client_id);
CREATE INDEX idx_accounts_branch_id ON accounts(branch_id);
CREATE INDEX idx_transactions_account_id ON transactions(account_id);
CREATE INDEX idx_loans_client_id ON loans(client_id);
CREATE INDEX idx_loans_branch_id ON loans(branch_id);
CREATE INDEX idx_loan_payments_loan_id ON loan_payments(loan_id);

-- Индексы на даты для фильтрации
CREATE INDEX idx_transactions_transaction_date ON transactions(transaction_date);
CREATE INDEX idx_loans_start_date ON loans(start_date);
CREATE INDEX idx_loan_payments_due_date ON loan_payments(due_date);

-- Индексы на статусы (часто используются в WHERE)
CREATE INDEX idx_accounts_status ON accounts(status);
CREATE INDEX idx_loans_status ON loans(status);
CREATE INDEX idx_loan_payments_status ON loan_payments(status);