-- ALTER TABLE KONUSU

CREATE TABLE haber (
   id SERIAL PRIMARY KEY,
   tarih DATE,
   baslik CHAR(50),
   metin TEXT,
   goruntu INTEGER
);

/* Team Lead: Database’e eklediğiniz haber tablosu için teşekkür ederim. 
Ama o tabloda ozet isimli field eklemeyi unutmuşsunuz. Onu da ekleyelim*/

ALTER TABLE haber 
ADD ozet char (200);

/*Ozet alanı için teşekkürler. Lakin bu alan için 100 karakter yeterli değil. 
Bu alanın uzunluğunu 250 karakter yapalım.*/

ALTER TABLE haber 
ALTER ozet TYPE char (250);

-- eger ozet field i silmek istersek
ALTER TABLE haber
DROP COLUMN ozet;

--INNER JOIN KONUSU

/*Bana her bir personelin ID’sini, adını ve soyadını; 
bunun yanı sıra çalıştığı departmanın ID’sini ve adını bir arada listeleyip getirin.*/

SELECT 
p.id,
p.ad,
p.soyad,
p.departman_id,
d.ad
FROM personel p 
INNER JOIN departman d 
ON p.departman_id = d.id;




