-- Criação do banco de dados para o cenário de e-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;


-- criar tabela cliente
CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    FName VARCHAR(10),
    MInit VARCHAR(3),
    LName VARCHAR(10),
    Address VARCHAR(45),
    BDate date
	);
-- criar tabela pessoa física
CREATE TABLE clientPF(
	idClientPF INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    CPF CHAR(11) UNIQUE,
	constraint fk_pf_clients FOREIGN KEY (idClient) references clients(idClient)
    );
-- criar tabela pessoa jurídica
CREATE TABLE clientPJ(
	idClientPJ INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) UNIQUE,
	constraint fk_pj_clients FOREIGN KEY (idClient) references clients(idClient)
    );
-- criar tabela produto
CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    PName VARCHAR(45),
    Category ENUM('Eletronicos', 'Brinquedos', 'Comida', 'Roupa', 'Livro') NOT NULL,
    ProductDesc VARCHAR(45),
    Price FLOAT,
    Evaluation FLOAT DEFAULT 0
	);
-- criar tabela entrega
CREATE TABLE delivery(
	idDelivery INT AUTO_INCREMENT PRIMARY KEY,
    deliveryStatus ENUM('Aguardando Envio', 'Enviado', 'Entregue') default 'Aguardando Envio',
    trackingCode CHAR(13)
    );
-- criar tabela pedido
CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    idDelivery INT,
    orderStatus ENUM('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription VARCHAR(45),
    shippingValue FLOAT DEFAULT 0,
    constraint fk_orders_clients FOREIGN KEY (idClient) references clients(idClient),
    constraint fk_orders_delivery FOREIGN KEY (idDelivery) references delivery(idDelivery)
	);
-- criar tabela pagamento
-- finalizar no desafio: terminar de implementar a tabela e criar conexão com as tabelas necessárias
-- além disso, refletir essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas a pagamento
CREATE TABLE payments(
	idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Cartão de Crédito', 'Boleto'),
    limitAvailable FLOAT,
    constraint fk_payments_clients FOREIGN KEY (idClient) references clients(idClient)
    );
-- criar tabela vendedor
CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SellerName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    Contact CHAR(11) NOT NULL,
    Location VARCHAR(255),
    CONSTRAINT unique_CNPJ_seller unique (CNPJ),
    CONSTRAINT unique_CPF_seller unique (CPF)
	);
-- criar tabela pessoa física
CREATE TABLE sellerPF(
	idSellerPF INT AUTO_INCREMENT PRIMARY KEY,
    idSeller INT,
    CPF CHAR(11) UNIQUE,
	constraint fk_pf_seller FOREIGN KEY (idSeller) references seller(idSeller)
    );
-- criar tabela pessoa jurídica
CREATE TABLE sellerPJ(
	idSellerPJ INT AUTO_INCREMENT PRIMARY KEY,
    idSeller INT,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) UNIQUE,
	constraint fk_pj_seller FOREIGN KEY (idSeller) references seller(idSeller)
    );
-- criar tabela fornecedor
CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier unique (CNPJ)
	);
-- criar tabela estoque
CREATE TABLE productStorage(
	idProductStorage INT AUTO_INCREMENT PRIMARY KEY,
    StorageLocation VARCHAR(255)
    );
-- criar tabela produto-vendedor
CREATE TABLE productSeller(
	idPSeller INT,
    idProduct INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idPSeller, idProduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
	);
-- criar tabela produto-fornecedor
CREATE TABLE productSupplier(
	idSupplier INT,
    idProduct INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (idSupplier, idProduct),
    constraint fk_product_supplier foreign key (idSupplier) references supplier(idSupplier),
    constraint fk_product_product_supplier foreign key (idProduct) references product(idProduct)
	);
-- criar tabela produto-estoque
CREATE TABLE productOnStorage(
	idProductStorage INT,
    idProduct INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (idProductStorage, idProduct),
    constraint fk_product_storage foreign key (idProductStorage) references productStorage(idProductStorage),
    constraint fk_product_product_storage foreign key (idProduct) references product(idProduct)
	);
-- criar tabela produto-pedido
CREATE TABLE productOrder(
	idOrder INT,
    idProduct INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (idOrder, idProduct),
    constraint fk_product_order foreign key (idOrder) references orders(idOrder),
    constraint fk_product_product_order foreign key (idProduct) references product(idProduct)
	);
-- criar tabela cartão
CREATE TABLE creditCard(
	idCreditCard INT AUTO_INCREMENT PRIMARY KEY,
    idPayment INT,
    CardNo CHAR(16) NOT NULL,
    DueDate DATE,
    CardName VARCHAR(45),
	constraint fk_creditCard_payment foreign key (idPayment) references payments(idPayment)
    );
