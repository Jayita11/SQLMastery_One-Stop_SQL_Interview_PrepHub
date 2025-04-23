CREATE TABLE monthly_sales (
month DATE,
product_id INTEGER,
amount_sold INTEGER
);

INSERT INTO monthly_sales (month, product_id, amount_sold) VALUES
('2021-01-01', 1, 100),
('2021-01-01', 2, 300),
('2021-02-01', 1, 150),
('2021-02-01', 1, 50),
('2021-02-01', 2, 250),
('2021-03-01', 1, 120),
('2021-03-01', 4, 250),
('2021-04-01', 2, -30),
('2021-04-01', 3, 200),
('2021-05-01', 3, 175),
('2021-06-01', 1, 0),
('2021-06-01', 2, 100);