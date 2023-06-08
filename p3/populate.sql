-- Inserção de dados na tabela customer
INSERT INTO customer (cust_no, name, email, phone, address)
VALUES
    (1, 'João Silva', 'joao@example.com', '123456789', 'Rua A, 123'),
    (2, 'Maria Santos', 'maria@example.com', '987654321', 'Avenida B, 456'),
    (3, 'Pedro Almeida', 'pedro@example.com', '555555555', 'Rua C, 789');


-- Inserção de dados na tabela orders
INSERT INTO orders (order_no, cust_no, date)
SELECT
    ROW_NUMBER() OVER (ORDER BY d::date) AS order_no,
    1 AS cust_no,
    d::date AS date
FROM
    generate_series('2022-01-01'::date, '2022-12-31'::date, '1 day') AS d;

-- Inserção de dados na tabela pay
INSERT INTO pay (order_no, cust_no)
VALUES
    (1, 1),
    (2, 1),
    (3, 2);

-- Inserção de dados na tabela employee
INSERT INTO employee (ssn, TIN, bdate, name)
VALUES
    ('111111111', '1234567890', '01/01/1990', 'Fulano de Tal'),
    ('222222222', '0987654321', '05/05/1995', 'Beltrano Silva'),
    ('333333333', '9876543210', '10/10/1985', 'Ciclano Souza');

-- Inserção de dados na tabela process
INSERT INTO process (ssn, order_no)
SELECT
    e.ssn,
    o.order_no
FROM
    employee e
CROSS JOIN
    orders o
WHERE
    (e.ssn = '111111111' OR e.ssn = '222222222')
    AND o.date >= '2022-01-01'::date
    AND o.date <= '2022-12-31'::date;

-- Inserção de dados na tabela department
INSERT INTO department (name)
VALUES
    ('Financeiro'),
    ('Recursos Humanos'),
    ('Vendas');

-- Inserção de dados na tabela workplace
INSERT INTO workplace (address, lat, long)
VALUES
    ('Rua D, 987', 10.123456, -20.654321),
    ('Avenida E, 654', 30.987654, -40.123456);

-- Inserção de dados na tabela office
INSERT INTO office (address)
VALUES
    ('Rua D, 987');

-- Inserção de dados na tabela warehouse
INSERT INTO warehouse (address)
VALUES
    ('Avenida E, 654');

-- Inserção de dados na tabela works
INSERT INTO works (ssn, name, address)
VALUES
    ('111111111', 'Financeiro', 'Rua D, 987'),
    ('222222222', 'Vendas', 'Avenida E, 654');

-- Inserção de dados na tabela product
INSERT INTO product (SKU, name, description, price, ean)
VALUES
    ('SKU001', 'Produto 1', 'Descrição do Produto 1', 10.99, 1234567890123),
    ('SKU002', 'Produto 2', 'Descrição do Produto 2', 20.99, 9876543210987),
    ('SKU003', 'Produto 3', 'Descrição do Produto 3', 15.99, 5555555555555);

-- Inserção de dados na tabela contains
INSERT INTO contains (order_no, SKU, qty)
VALUES
    (1, 'SKU001', 2),
    (4, 'SKU002', 1),
    (2, 'SKU001', 3),
    (3, 'SKU003', 1);

-- Inserção de dados na tabela supplier
INSERT INTO supplier (TIN, name, address, SKU, date)
VALUES
    ('1234567890', 'Fornecedor A', 'Rua F, 123', 'SKU001', '01/01/2022'),
    ('0987654321', 'Fornecedor B', 'Avenida G, 456', 'SKU002', '02/02/2022');

-- Inserção de dados na tabela delivery
INSERT INTO delivery (address, TIN)
VALUES
    ('Avenida E, 654', '1234567890'),
    ('Avenida E, 654', '0987654321');