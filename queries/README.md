#  Bank Analytics Project

A portfolio project demonstrating SQL skills and relational database design using a banking system model.

---

##  ER Diagram

![ER Diagram](queries/docs/er_diagram.png)

##  Project Goal

This project showcases the ability to:
- Design a normalized database schema with relationships and constraints
- Write complex SQL queries (`JOIN`, `GROUP BY`, subqueries, aggregate functions)
- Work with test data and perform analytical reporting
- Structure and publish a project on GitHub for portfolio purposes

---

##  Database Schema

The schema consists of 6 tables:

- `clients` – bank clients
- `branches` – bank branches
- `accounts` – client accounts
- `transactions` – account transactions
- `loans` – loans issued to clients
- `loan_payments` – repayment schedule for loans

**Relationships:**
- `accounts.client_id` → `clients.client_id`
- `accounts.branch_id` → `branches.branch_id`
- `transactions.account_id` → `accounts.account_id`
- `loans.client_id` → `clients.client_id`
- `loans.branch_id` → `branches.branch_id`
- `loan_payments.loan_id` → `loans.loan_id`

---

##  How to Run Locally

1. Install PostgreSQL (port 5432, user `postgres`).
2. Create a new database:
   ```sql
   CREATE DATABASE bank_db;

   4. Run the scripts in the following order:
   - `init-db/01-schema.sql` – creates all tables
   - `init-db/02-seed.sql` – populates tables with sample data
   - `init-db/03-indexes.sql` – creates indexes for performance