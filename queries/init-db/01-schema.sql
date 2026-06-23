-- Таблица клиентов
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Таблица отделений
CREATE TABLE branches (
    branch_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    city VARCHAR(50)
);

-- Таблица счетов
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(client_id),
    branch_id INTEGER REFERENCES branches(branch_id),
    account_type VARCHAR(20) CHECK (account_type IN ('current', 'savings', 'credit')),
    currency VARCHAR(3) DEFAULT 'USD',
    balance DECIMAL(15,2) DEFAULT 0.00,
    opening_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(10) DEFAULT 'active' CHECK (status IN ('active', 'closed'))
);

-- Таблица транзакций
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INTEGER REFERENCES accounts(account_id),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(15,2) NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),
    description TEXT,
    counterparty_account_id INTEGER
);

-- Таблица кредитов
CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(client_id),
    branch_id INTEGER REFERENCES branches(branch_id),
    amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    term_months INTEGER NOT NULL,
    start_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(10) DEFAULT 'active' CHECK (status IN ('active', 'paid', 'default'))
);

-- Таблица платежей по кредитам
CREATE TABLE loan_payments (
    payment_id SERIAL PRIMARY KEY,
    loan_id INTEGER REFERENCES loans(loan_id),
    due_date DATE NOT NULL,
    amount_due DECIMAL(15,2) NOT NULL,
    amount_paid DECIMAL(15,2) DEFAULT 0.00,
    payment_date DATE,
    status VARCHAR(10) DEFAULT 'pending' CHECK (status IN ('pending', 'paid', 'overdue'))
);