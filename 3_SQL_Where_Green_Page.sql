-- GREEN PAGE DATABASE

--WHERE COMMAND
	--Filters rows based specified conditions

-- Sadece German olanlari goster
SELECT *
FROM customers c 
WHERE country = 'Germany';

-- Score degeri 500 den buyuk olanlari goster
SELECT *
FROM customers
WHERE score > 500;

-- German olmayanlari getir
SELECT *
FROM customers c 
WHERE country <> 'Germany'

-- AND OPERATORU
	-- Task: Puani 400 den az olan ve German olnalari getir

SELECT *
FROM customers
WHERE country  = 'Germany' AND score < 400



