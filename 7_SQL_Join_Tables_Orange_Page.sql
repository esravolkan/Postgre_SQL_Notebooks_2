-- ORANGE PAGE DATABASE

SELECT * FROM person p 

DROP TABLE person 
-- DROP Table ifade tum tabloyu siler.

--ALTER TABLE KONUSU
/*Senaryo 1: calisanlar4 tablosuna yas (int) seklinde yeni sutun ekleyiniz.*/

ALTER TABLE calisanlar4
ADD COLUMN yas int ;

/* Senaryo 2: calisanlar4 tablosuna remote (boolean) seklinde yeni sutun ekleyiniz. 
 varsayılan olarak remote değeri TRUE olsun*/

ALTER TABLE calisanlar4 
ADD remote boolean DEFAULT TRUE;

/*Senaryo 3: calisanlar4 tablosunda yas sutununu siliniz */

ALTER TABLE calisanlar4
DROP yas;

/* Senaryo 4: calisanlar4 tablosundaki maas sutununun data tipini
real olarak güncelleyiniz.*/

ALTER TABLE calisanlar4
ALTER COLUMN maas
TYPE  real;


-- Senaryo 9: calisanlar4tablosunda isim sütununa
--NOT NULL constrainti ekleyiniz
 ALTER TABLE calisanlar4 
 ALTER COLUMN isim SET NOTNULL  -- NOT: NOT NULL eklenen field'ın mevcut halinin de bu kritere
								--uygun olması gerekir. Aksi halde hata alırız








 