
-- GREEN PAGES 
-- ORDER BY Konusu
-- Customer tablosunu score değerlerine göre küçükten büyüğe sıralayarak getir

SELECT * FROM customers
ORDER BY score ASC   -- ASC, DEFAULT olarak ORDER BY tarafından getirilir

-- PostgreSQL , NULL hücreyi en sona götürür, MySQL de ise tam tersi şekilde getirir
-- Eğer NULL değerler en üstte gelsin isterseniz:
SELECT * FROM customers
ORDER BY score ASC NULLS FIRST 

-- Customer tablosunu score değerlerine göre büyükten küçüğe sıralayarak getir

SELECT * FROM customers
ORDER BY score DESC 

-- NULL değerler en altta görünmesini isterseniz;
SELECT * FROM customers
ORDER BY score DESC NULLS LAST

--Countrye göre alfabetik olarak ve score a göre büyükten küçüğe sırala
SELECT *
FROM customers c 
ORDER BY country ASC,
score DESC;
-- önce country ye göre suraladık, sonra ülkeleri kendi içerisinde score a göre tekrar sıraladık

-- Alttaki kullanım çok tavsiye edilmez ama kullanılailbir
-- Field adı yerine sıralamadaki numarasını yazaiblirsiniz..
SELECT * FROM customers
ORDER BY 4 ASC, 5 DESC 

-- PstgreSQL de büyükten küçüğe sıralamada NULL hücteyi öncelikli getirir


-- LIMIT COMMAND
-Secilen rakam kadar snuc dondurur
SELECT * 
FROM customers c
LIMIT 2;