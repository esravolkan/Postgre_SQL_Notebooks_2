-- GREEN PAGE DATABASE

--LEFT JOIN

/* Soru: customer tablosundan customer_id, first_name
ve orders tablosundan orderid, quantity field larını
left join tarzında birleştirerek getiriniz*/

SELECT 
	c.customer_id, 
	c.first_name, 
	o.order_id, 
	o.quantity
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id ;

--RIGHT JOIN

/* Soru: customer tablosundan customer_id, first_name
ve orders tablosundan orderid, quantity field larını
right join tarzında birleştirerek getiriniz*/


SELECT 
	c.customer_id,
	c.first_name,
	o.order_id ,
	o.quantity 
FROM customers c 
RIGHT JOIN orders o 
ON C.customer_id  = O.customer_id 


-- FULL JOIN

/* Soru: customer tablosundan customer_id, first_name
ve orders tablosundan orderid, quantity field larını
full join tarzında birleştirerek getiriniz */

SELECT 
	c.customer_id ,
	c.first_name ,
	o.order_id ,
	o.quantity 
FROM customers c 
FULL JOIN orders o 
ON c.customer_id  = o.order_id; 

-- INNER JOIN

-- JOINS - UNION
-- Müşterilerden ve çalışanlardan tüm kişilerin adını soyadını ve ülkesini listeleyin

SELECT
	first_name,
	last_name,
	country
FROM customers c
UNION
SELECT
	first_name,
	last_name,
	emp_country
FROM employees e

/*PostgreSQL'de UNION operatörünü kullanabilmek için, birleştirmek istediğiniz sorgu sonuçlarının şu koşulları karşılaması gerekir:
1. Aynı sayıda sütun: UNION işlemini uygulayabilmeniz için her iki sorgu da aynı sayıda sütuna sahip olmalıdır.
2. Uyumlu veri türleri: Sütunların aynı veri türünde olması gerekir. 
Örneğin, bir sorgu integer türünde bir sütun döndürürken, diğer sorgu text türünde bir sütun döndürüyorsa, 
UNION işlemini uygulayamazsınız.
3. Uyumlu sıralı sütunlar: Her iki sorgunun aynı sırada aynı veri türündeki sütunları döndürmesi gerekir. 
Yani, ilk sorgunun ilk sütunu integer türünde ise, ikinci sorgunun ilk sütunu da integer türünde olmalıdır.
4. Uyumlu sıralama kuralları: UNION işlemi sonuçları, her iki sorgudan gelen verileri aynı sıralama kurallarına göre birleştirir.
 Bu, her iki sorguda da aynı ORDER BY ifadesinin kullanılması gerektiği anlamına gelir.
5. Aynı sütun adları (isteğe bağlı): Her iki sorgunun aynı sütun adlarını kullanması gerekmez, 
ancak sütun adları farklıysa, sonuç kümesinde sütun adları ilk sorgudaki adlara göre belirlenir.*/


