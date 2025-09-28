USE ecommerce;

-- SELECT
SELECT *
FROM clients;

-- WHERE
SELECT Pname, Category, feedback
FROM product
WHERE Category = 'Eletrônico';


-- calculo
SELECT Pname, (feedback * 1.5) AS feedback_normalizado
FROM product;

-- ORDER BY
SELECT SocialName, AbstName, Location
FROM seller
ORDER BY Location DESC;


-- Having
SELECT idPproduct, SUM(ProdQuantity) AS Total_em_estoque
FROM productSeller
GROUP BY idPproduct
HAVING SUM(ProdQuantity) > 10;

-- LEFT join
SELECT c.idCliente, c.Address, o.OrderStatus 
FROM clients c
left join orders o 
ON c.idCliente = o.idOrderClient
