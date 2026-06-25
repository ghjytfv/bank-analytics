-- window function
SELECT 
    c.client_id,
    c.first_name || ' ' || c.last_name AS full_name,
    SUM(a.balance) AS total_balance,
    RANK() OVER (ORDER BY SUM(a.balance) DESC) AS rank_by_balance,
    DENSE_RANK() OVER (ORDER BY SUM(a.balance) DESC) AS dense_rank
FROM clients c
JOIN accounts a ON c.client_id = a.client_id
GROUP BY c.client_id
ORDER BY total_balance DESC;