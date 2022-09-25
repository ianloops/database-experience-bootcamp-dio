use ecommerce;

desc orders;
desc clients;
-- Quais Clientes Fizeram mais de um pedido
SELECT count(*) as NoOrders, concat(FName, ' ', Minit, ' ', LName) as FullName FROM orders as o JOIN clients as c USING(idClient)
	GROUP BY idClient
    HAVING NoOrders>1;
    
-- Quais Vendedores também são Fornecedores
SELECT * FROM seller as se INNER JOIN supplier as su USING (CNPJ);

-- Promoção, alimentos com 10% de desconto
SELECT PName, Category, round(price*0.90,2) as Promocao FROM product;

-- Produtos em ordem de melhor avaliação
SELECT PName, Category, Price, Evaluation from product
	ORDER BY evaluation DESC;