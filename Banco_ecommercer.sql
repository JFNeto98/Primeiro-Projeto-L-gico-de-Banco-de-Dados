-- Criação do banco de dados para cenário de ecommerce
CREATE database ecommerce;
USE ecommerce;

-- Criar tabela cliente
CREATE TABLE clients(
					idCliente INT auto_increment primary KEY,
                    Fname VARCHAR(10),
                    Minit CHAR(3),
                    Lname VARCHAR(20),
                    CPF CHAR(11) NOT NULL,
                    Address VARCHAR(30),
                    constraint unique_cpf_client unique (CPF)
);

-- Corrigindo o Varchar 
alter table clients change Address Address VARCHAR(255);
alter table clients auto_increment=1;
desc clients;

desc clients;
-- Criar tabela produto

CREATE TABLE product(
					idProduct INT auto_increment primary KEY,
                    Pname VARCHAR(10) not null,
                    classification_kids BOOL DEFAULT FALSE,
                    category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'),
                    feedback FLOAT DEFAULT 0,
                    size VARCHAR(10)
);
alter table product auto_increment=1;
-- Criar tabela de pagamentos

CREATE TABLE payments(
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois Cartões'),
    limitAvailable FLOAT,
    FOREIGN KEY (idClient) REFERENCES clients(idCliente)
);



-- Criar tabela pedido

CREATE TABLE orders(
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    OrderStatus ENUM('Cancelado', 'Confirmado', 'Em Processamento') DEFAULT 'Em Processamento',
    OrderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    idPayment INT,
    FOREIGN KEY (idPayment) REFERENCES payments(idPayment),
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idCliente)
);

alter table orders auto_increment=1;


-- Criar tabela de estoque
CREATE TABLE productStorage(
					idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
                    StorageLocation VARCHAR(255),
                    Quantity INT DEFAULT 0
					);
alter table productStorage auto_increment=1;

-- Criar tabela de fornecedor

CREATE TABLE supplier(
					idSupplier INT AUTO_INCREMENT PRIMARY KEY,
                    SocialName VARCHAR(255) NOT NULL,
                    CNPJ CHAR(15) NOT NULL,
					Contact CHAR(11) NOT NULL,
                    CONSTRAINT unique_supplier UNIQUE (CNPJ)
					);
alter table supplier auto_increment=1;
DESC supplier;
-- Criar tabela de vendendor


CREATE TABLE seller(
					idSeller INT AUTO_INCREMENT  PRIMARY KEY,
                    SocialName VARCHAR(255) NOT NULL,
                    AbstName VARCHAR(255),
                    CNPJ CHAR(15),
                    CPF CHAR(9),
                    Location VARCHAR(255),
					Contact CHAR(11) not null,
                    CONSTRAINT unique_CNPJ_seller UNIQUE (CNPJ),
                    CONSTRAINT unique_CPF_seller UNIQUE (CPF)
					);
alter table seller auto_increment=1;

-- Criando relação M:N - Tabela produto/vendedor
create table productSeller(
							idPseller INT,
                            idPproduct INT,
                            ProdQuantity INT DEFAULT 1,
                            PRIMARY KEY (idPseller, idPproduct),
                            CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
                            CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
							);
                            
DESC productSeller;

-- M:N Produto/Pedido
create table productOrder(
							idPOproduct INT,
                            idPOorder INT,
                            PoQuantity INT DEFAULT 1,
                            poStatus ENUM('Disponivel',  'Sem Estoque') DEFAULT 'Disponivel',
                            PRIMARY KEY (idPOproduct, idPOorder),
                            CONSTRAINT fk_productOrder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
                            CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
							);


-- M:N Estoque/Produto
create table storeagelocation(
								idLproduct INT,
								idLstorage INT,
								location VARCHAR(255) NOT NULL,
								PRIMARY KEY (idLproduct, idLstorage),
								CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
								CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
								);                    
				
create table ProductSupplier(
							idPsSupplier INT,
							idPsProduct INT,
							Quantity INT NOT NULL,
							PRIMARY KEY (idPsSupplier, idPsProduct),
							CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
							CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
							);     

SHOW tables;
