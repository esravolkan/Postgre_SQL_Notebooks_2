-- GREENPAGE DATABASE

/* ALTER TABLE  
 tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS 
 islemleri icin kullanilir.
 ALTER TABLE ifadesi tablolari yeniden isimlendirmek 
 (RENAME) icin de kullanilir */

CREATE TABLE public.persons (
id SERIAL PRIMARY KEY,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL UNIQUE
);
-- persons tablosundan email isimli field'ı ekleyelim
ALTER TABLE persons 
ADD email varchar(15) NOT NULL 

-- persons tablosuna adress isimli bir field ekleyelim
ALTER TABLE persons 
ADD adress VARCHAR(100); --ADD COLUMN şeklinde de yazıalibir


-- persons tablosundan adress isimli field'ı kaldıralım

ALTER TABLE persons 
DROP adress;

-- persons tabloda phone field ın veri tipini varchar(20) olark düzenleyiniz
ALTER TABLE persons 
ALTER COLUMN phone TYPE varchar(20);

SELECT * FROM persons p 

-- persons tablosunun adını "contact" olarak değ,iştirin
ALTER TABLE persons 
RENAME TO contacts;

SELECT * FROM contacts 

-- contact tablosundaki phone field adını contact_number olarak değiştirin
ALTER TABLE contacts 
RENAME phone TO contact_number;

-- JOIN KONUSU

SELECT
	c.customer_id,
	c.first_name,
	o.order_id,
	o.quantity
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
