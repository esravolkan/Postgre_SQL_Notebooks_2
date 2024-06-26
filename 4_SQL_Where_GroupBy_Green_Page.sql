-- GREENPAGE DATABASE

SELECT * FROM customers c 
-- OR

--Almanya "veya" score u 500 den kucuk olanlari getir

SELECT *
FROM customers c 
WHERE country = 'Germany'
OR 
score < 500;

--NOT

-- Score degeri 400 den kucuk olmayanlari getir (NOT Ornegi)

SELECT *
FROM customers 
WHERE NOT 
score < 400;

--BETWEEN OPERATOR
	-- Belirtilen iki deger arasindaki kayitlari secmek icin kullanilir. Bu sinirlar da dahildir.

-- Score degeri 100 ile 500 arasinda olanlari getir.
	-- between de sinirlar dahildir
SELECT *
FROM customers
WHERE score BETWEEN 100
AND 500;

--IN OPERATOR
SELECT *
FROM customers
WHERE score IN(300, 500 ,750, 900);

-- LIKE OPERATOR 

-- n hrfi ile biten adlari getir

SELECT *
FROM customers c 
WHERE first_name
LIKE '%n';

-- 3. siradaki harfi r olan isimleri getir

SELECT *
FROM customers c 
WHERE first_name LIKE '__r%';


-- GROUP BY
	-- BIR SORGUDA ORTAYA CIKACAK VERILERI BELLI BIR SEKILDE GRUPLAMAK ICIN KULLANILIR 
SELECT * FROM customers c 

-- her bir ulke icin total customer sayilarini getir
SELECT
country , count(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY count(*) ASC

-- AGGREGATE FUNCTIONS
--COUNT

SELECT * FROM customers c 

SELECT count(*) AS total_customers 
FROM customers c 

SELECT count(customer_id) AS total_cus
FROM customers c 

-- SUM örneği
SELECT * 
FROM orders o 
-- toplam quantity ne kadardır?

SELECT sum(quantity) AS sum_quantity
FROM orders o 

