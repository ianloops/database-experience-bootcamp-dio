-- Persistindo dados
use ecommerce;

desc clients;
INSERT INTO clients (FName, MInit, LName, Address, BDate) VALUES 
	('Ian', 'L', 'Cruz', 'Rua C', '1997-01-27'),
	('Rafaela', 'L', 'Santos', 'Rua D', '1997-08-21'),
	('Mateus', 'R', 'Varjão', 'Rua A', '1997-12-02'),
	('Igor', 'M', 'Cruz', 'Rua C', '1995-02-14'),
	('João', 'C', 'Neto', 'Rua J', '1969-02-14')    
    ;
SELECT * FROM clients;    
    
desc clientPF;
INSERT INTO clientPF (idClient,CPF) VALUES 
	(6,'123456789'),(7,'321654987'),(8,'987654321');

desc clientPJ;
INSERT INTO clientPJ (idClient,CNPJ, SocialName) VALUES
	(9, '123456789123456', 'comercial Rio Corda'),
	(10, '123456789654321', 'comercial Corrente');
    
desc product;
INSERT INTO product (PName, Category, Price, Evaluation) VALUES
	('Feijão', 'Comida', 5.5, 5),
	('Arroz', 'Comida', 4.7, 4.5),
	('Farinha', 'Comida', 5.3, 4.7),
	('Frango', 'Comida', 20, 3.7),
	('Açucar', 'Comida', 6, 4.4);

desc orders;
INSERT INTO orders (idClient, orderStatus, shippingValue) VALUES
	(6, 'Confirmado', 57.4),
	(6, 'Cancelado', 42.9),
	(7, 'Em Processamento', 32.9),
	(7, 'Em Processamento', 29.9),
	(8, 'Confirmado', 17.9);
    
desc seller;    
INSERT INTO seller (SellerName, Contact, CNPJ) VALUES
	('Carlos Roberto', '88888888888', '111111111111111'),
	('João Mateus', '99999999999', '222222222222222');
    
desc supplier;
INSERT INTO supplier (SocialName, Contact, CNPJ) VALUES
	('Carlos Roberto', '88888888888', '111111111111111'),
	('Jonathan', '5555555555', '333333333333333');
	