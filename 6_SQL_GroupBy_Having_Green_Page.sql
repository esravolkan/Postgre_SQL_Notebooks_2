--GREEN PAGE DATABASE

--INSERT ORNEGI

SELECT * FROM customers c 

INSERT INTO customers VALUES (6, 'Anna', 'Nixon', 'UK', NULL);

-- UPDATE

-- SORU Customer_id si 6 olan kisinin Country degerini Germany yap

UPDATE customers 
SET country = 'Germany'
WHERE customer_id  = 6

SELECT * FROM customers c 

-- SORU Max Lang in country degerini USA yapip score degerini 100 olarak guncelleyin

UPDATE customers  
SET 
	country = 'USA',
	score = 100
WHERE customer_id  = 7;



--DELETE ile TRUNCATE ve DROP sorgusu arasındaki fark nedir?
--DELETE komutu veritabanındaki tablodan bir veya daha fazla mevcut kaydı siler.
--DROP Komutu tablonun tamamını veritabanından çıkarır.
--TRUNCATE Komutu mevcut tablodaki tüm satırları siler ve  sütunları adlarıyla bırakır.

/*örn: bir oyuncak kutusu var. 
DELETE = satır siler . Kutudaki kırmızı arabaları siler. 
TRUNCATE = Tablonun içindeki bilgileri siler.Kutudaki tüm oyuncakları çöpe atar. Kutu boş kalır.  
DROP = tabloyu komple siler. Direkt oyuncak kutusunu çöpe atar. */\


-- SORU Yeni eklenen Anna ve Max i sil

DELETE
FROM customers 
WHERE customer_id IN(6,7)

SELECT * FROM customers c 

-- SORU Tablodaki tum customerslari silinizi

TRUNCATE TABLE customers 

INSERT INTO customers (customer_id, first_name, last_name, country, score) VALUES
(1,'Maria', 'Cramer', 'Germany',350),
(2,'John','Steel','USA', 900),
(3,'Georg','Pipps', 'UK', 750),
(4,'Martin','Müller','Germany', 500),
(5,'Peter','Franken','USA', NULL);

