-- Клиенты
INSERT INTO clients (first_name, last_name, birth_date, email, phone)
VALUES 
('Иван', 'Петров', '1985-03-12', 'ivan.petrov@mail.ru', '+7-900-111-22-33'),
('Мария', 'Сидорова', '1990-07-25', 'maria.s@yandex.ru', '+7-901-222-33-44'),
('Алексей', 'Смирнов', '1978-11-02', 'alex.smirnov@bk.ru', '+7-902-333-44-55'),
('Елена', 'Кузнецова', '1995-01-18', 'helen.k@list.ru', '+7-903-444-55-66'),
('Дмитрий', 'Васильев', '1982-09-30', 'dmitry.v@mail.ru', '+7-904-555-66-77');

-- Отделения
INSERT INTO branches (name, address, city)
VALUES 
('Центральный офис', 'ул. Ленина, д. 1', 'Москва'),
('Филиал на Красной', 'пр. Красный, д. 10', 'Москва'),
('Филиал в Северном', 'ул. Северная, д. 25', 'Санкт-Петербург');

-- Счета
INSERT INTO accounts (client_id, branch_id, account_type, currency, balance, opening_date, status)
VALUES
(1, 1, 'current', 'USD', 1500.00, '2023-01-10', 'active'),
(1, 2, 'savings', 'USD', 5000.00, '2023-02-15', 'active'),
(2, 1, 'current', 'USD', 200.00, '2023-03-01', 'active'),
(3, 3, 'current', 'USD', 1200.00, '2023-04-05', 'active'),
(3, 3, 'credit', 'USD', -300.00, '2023-05-01', 'active'),
(4, 2, 'savings', 'USD', 8000.00, '2023-06-10', 'active'),
(5, 1, 'current', 'USD', 300.00, '2023-07-20', 'active');

-- Транзакции
INSERT INTO transactions (account_id, transaction_date, amount, transaction_type, description, counterparty_account_id)
VALUES
(1, '2023-01-15 10:00:00', 500.00, 'deposit', 'Пополнение наличными', NULL),
(1, '2023-01-20 14:30:00', -200.00, 'withdrawal', 'Снятие в банкомате', NULL),
(2, '2023-02-20 09:15:00', 1000.00, 'deposit', 'Перевод с другого счета', NULL),
(3, '2023-03-05 11:45:00', 50.00, 'deposit', 'Зарплата', NULL),
(4, '2023-04-10 16:20:00', 300.00, 'deposit', 'Пополнение', NULL),
(4, '2023-04-12 12:00:00', -100.00, 'withdrawal', 'Оплата в магазине', NULL),
(5, '2023-05-02 08:00:00', 500.00, 'deposit', 'Перевод от клиента', NULL),
(6, '2023-06-15 13:30:00', 2000.00, 'deposit', 'Вклад', NULL),
(7, '2023-07-25 17:00:00', 100.00, 'deposit', 'Пополнение', NULL);

-- Кредиты
INSERT INTO loans (client_id, branch_id, amount, interest_rate, term_months, start_date, status)
VALUES
(1, 1, 10000.00, 5.5, 24, '2023-01-15', 'active'),
(3, 3, 5000.00, 6.0, 12, '2023-04-01', 'active'),
(5, 1, 3000.00, 4.5, 18, '2023-07-01', 'active');

-- Платежи по кредитам
INSERT INTO loan_payments (loan_id, due_date, amount_due, amount_paid, payment_date, status)
VALUES
(1, '2023-02-15', 450.00, 450.00, '2023-02-14', 'paid'),
(1, '2023-03-15', 450.00, 450.00, '2023-03-14', 'paid'),
(1, '2023-04-15', 450.00, 0.00, NULL, 'pending'),
(2, '2023-05-01', 430.00, 430.00, '2023-04-30', 'paid'),
(2, '2023-06-01', 430.00, 0.00, NULL, 'pending'),
(3, '2023-08-01', 180.00, 180.00, '2023-08-01', 'paid');