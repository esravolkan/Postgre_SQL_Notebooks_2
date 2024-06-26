-- GREEN PAGE DATABASE

--AVARAGE FUNC
SELECT * 
FROM customers c 

-- Butun customerlarin ortalama skorunu bul
SELECT avg(score) AS avg_score
FROM customers c;

-- Eger NULL hucreye belli bir deger verip ortalama katmak istersek;

SELECT avg(COALESCE(score,0)) AS avg_score1
FROM customers c;


-- MIN MAX FUNC
-- En yuksek score degeri nedir?
SELECT max (score) AS max_score
FROM customers c 

-- En dusuk score degeri nedir?

SELECT min (score) AS min_score
FROM customers c 

/*
TRIM(Sütun parametresi) string ifadenin başındaki ve sonundaki boşluk karakterlerini siler

LTRIM sadece soldan boşluk siler

RTRIM sadece sağdan boşluk siler

REPLACE(sütun,'değişecek ifade','yeni ifade') belirtilen ifadeyi o sütunda bulursa, belirlediğiniz yeni ifade ile değiştirir
bir değişiklik yaptığı için UPDATE ile kullanılır

CONCAT(sütunadı, 'string') iki veya daha fazla dizeyi birleştirme işlemi için kullanılır

SUBSTRING(sütun adı,başlangıç index,bitiş index) o sütunda belirtilen index aralığındaki string değerini verir
istediğimiz bir sütunda stringlerin istediğimiz kısımlarını değiştirebiliriz. Tek index ilede çalışır belirtilen kısımdan 
en sona kadar alır

UPPER (sütun adı) o sütundaki strng değerleri büyük harfle getirir 

LOWER (sütun adı) o sütundaki strn değerleri küçük harfle getirir 

INITCAP(sütun adı) o sütundaki her bir satırdaki stringlerin baş harfini büyük harf yapar

LENGTH(sütun adı) belirtilen sütundaki her satır içinde bulunan stringlerin uzunluklarını alır 

REVERSE(sütun adı) sütunu ters çevirir

LEFT() / RIGHT() (Başlangıç ve Son Karakterler): Bir dizinin başlangıç veya sonundaki belirli karakterleri alır.

LEFT(sütun, 3) ilk 3 karakteri alır RIGHT olsa son 3 karakteri alırdı

FETCH NEXT n ROW ONLY: sadece sıradaki ilk n satırı getirir

LIMIT n : sadece sıradaki ilk n satırı getirir

OFFSET n : n satırı atlayıp sonrakileri getirir
*/ 


-- STRING FUNCTIONS

	--CONCAT
		--Isim ve soyisimi araya tire koyarak birlestir

SELECT concat(first_name, ' ', last_name) AS cust_name_surname
FROM customers

	-- UPPER - LOWER
		--First name i buyuk harflerler, last name i kucuk harflere donusturelim

SELECT 
upper(first_name) AS upper_first_name,
lower(last_name) AS lower_last_name
FROM customers;


	--LENGTH
SELECT last_name,
length(last_name) AS len_lastname
FROM customers c 

	--TRIM
		--TRIM ÖNCESİ VE SONRASINDAKİ UZUNLUKLARLA BİRLİKTE GÖSTEREN KARŞILAŞTIRMA

SELECT last_name,
length(last_name) AS len_lastname,   -- Trim öncesi uzunluklar
TRIM(last_name) AS clean_lastname,  -- Trim işlemi
LENGTH(TRIM(last_name))AS clean_len_lastname --Trim sonrası uzunluklar
FROM customers c 



	--SUBSTRING
-- Kelimenin  belli bir bölümünü almak için

SELECT 
last_name,
substring(last_name,2,3) 
FROM customers c 

	-- GROUPBY and HAVING

SELECT * FROM customers

SELECT 
count (*) AS total_customers,
country
FROM customers 
GROUP BY country 

-- her bir ulke icin ek yuksek score getir

SELECT 
	max(score) AS max_score, 
	country
FROM customers 
GROUP BY country;

	--HAVING
		-- Having Group by sonuclarini filtreler
-- Soru Her ulke icin toplam musteri sayisini bulup sadece 1 den fazla olanlari getir

SELECT 
	country,
	count(*) AS total_customer 
FROM customers
GROUP BY country 
HAVING count(*) >1 ; 
