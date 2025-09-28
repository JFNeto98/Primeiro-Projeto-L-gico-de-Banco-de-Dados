USE ecommerce;

-- Clientes
INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
VALUES
('João', 'A', 'Silva', '12345678901', 'Rua das Flores, 123'),
('Maria', 'B', 'Oliveira', '98765432100', 'Av. Paulista, 456'),
('Pedro', 'C', 'Souza', '45678912377', 'Praça Central, 789');

-- Produtos
INSERT INTO product (Pname, classification_kids, category, feedback, size)
VALUES
('Notebook', FALSE, 'Eletrônico', 4.5, '15pol'),
('Camiseta', FALSE, 'Vestimenta', 4.0, 'M'),
('Boneca', TRUE, 'Brinquedos', 4.8, 'Único'),
('Mesa', FALSE, 'Móveis', 3.9, '2x1m');

-- Fornecedores
INSERT INTO supplier (SocialName, CNPJ, Contact)
VALUES
('Tech Distribuidora', '12345678000195', '11999999999'),
('Moda LTDA', '98765432000155', '11988888888');

-- Vendedores
INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, Location, Contact)
VALUES
('Loja Online A', 'Loja A', '11111111000111', NULL, 'São Paulo', '11911111111'),
('Vendedor Autônomo B', 'Vendedor B', NULL, '222222222', 'Rio de Janeiro', '21922222222');

-- Estoques
INSERT INTO productStorage (StorageLocation, Quantity)
VALUES
('Centro de Distribuição SP', 100),
('Centro de Distribuição RJ', 50);

-- Relação Produto ↔ Fornecedor
INSERT INTO ProductSupplier (idPsSupplier, idPsProduct, Quantity)
VALUES
(1, 1, 30), -- Fornecedor 1 fornece Notebook
(1, 4, 10), -- Fornecedor 1 fornece Mesa
(2, 2, 40), -- Fornecedor 2 fornece Camiseta
(2, 3, 20); -- Fornecedor 2 fornece Boneca

-- Relação Produto ↔ Vendedor
INSERT INTO productSeller (idPseller, idPproduct, ProdQuantity)
VALUES
(1, 1, 5),   -- Loja A vende Notebook
(1, 2, 10),  -- Loja A vende Camiseta
(2, 3, 15);  -- Vendedor B vende Boneca

-- Relação Produto ↔ Estoque
INSERT INTO storeagelocation (idLproduct, idLstorage, location)
VALUES
(1, 1, 'SP - Prateleira 1'),
(2, 1, 'SP - Prateleira 2'),
(3, 2, 'RJ - Prateleira 1');

-- Pagamentos
INSERT INTO payments (idClient, typePayment, limitAvailable)
VALUES
(1, 'Cartão', 2000),
(2, 'Boleto', 500),
(3, 'Cartão', 1500);

-- Pedidos
INSERT INTO orders (idOrderClient, OrderStatus, OrderDescription, sendValue, paymentCash, idPayment)
VALUES
(1, 'Confirmado', 'Compra de Notebook', 20, FALSE, 1),
(2, 'Em Processamento', 'Compra de Camiseta e Boneca', 15, TRUE, 2),
(3, 'Cancelado', 'Compra de Mesa', 25, FALSE, 3);

-- Relação Produto ↔ Pedido
INSERT INTO productOrder (idPOproduct, idPOorder, PoQuantity, poStatus)
VALUES
(1, 1, 1, 'Disponivel'), -- João comprou 1 Notebook
(2, 2, 2, 'Disponivel'), -- Maria comprou 2 Camisetas
(3, 2, 1, 'Disponivel'), -- Maria comprou 1 Boneca
(4, 3, 1, 'Sem Estoque'); -- Pedro tentou comprar Mesa (sem estoque)