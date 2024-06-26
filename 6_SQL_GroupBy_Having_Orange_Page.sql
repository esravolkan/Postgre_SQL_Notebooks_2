CREATE TABLE manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;
/*senaryo 1: manav tablosundaki tüm isimleri ve her bir isim için, toplam ürün miktarını görüntüleyiniz.*/

SELECT isim,
	sum(urun_miktar) AS toplam_urun
FROM manav
GROUP BY isim;

/*Senaryo 2: manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.
Toplam ürün miktarına göre azalan olarak sıralayınız.*/

SELECT isim,
sum (urun_miktar) AS toplam_urun_kg
FROM manav m 
GROUP BY isim 
ORDER BY sum(urun_miktar) DESC; 

/*Senaryo 3: Her bir ismin aldığı, her bir ürünün toplam miktarını, isme göre sıralı görüntüleyiniz.*/

SELECT isim, urun_adi,
	sum(urun_miktar) AS toplam_urun
	FROM manav m 
	GROUP BY isim, urun_adi 
	ORDER BY isim;

/*Senaryo 4: ürün adina göre, her bir ürünü alan toplam kişi sayısını gösteriniz.*/

SELECT urun_adi, 
	count (DISTINCT isim)kisi_sayisi
FROM manav m 
GROUP BY urun_adi;

/*Senaryo 5: Isme göre, alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz*/
SELECT 
isim,
sum (urun_miktar) AS total_urun,
count(urun_adi) AS total_urun_cesit
FROM manav m 
GROUP BY isim;


--Personel tablosuna veri girisi yapiyoruz
CREATE TABLE personel (
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(678901245, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel;

-- Senaryo 1 Her bir sirektin min maas bilgilerini, bu bilgi eger 4000 den fazla ise getir

SELECT 
	sirket,
	min(maas) AS minimum_maas
FROM personel 
GROUP BY sirket
HAVING min(maas)>4000; 

/*Senaryo 2: Maaşı 4000 den fazla olan çalışanlarin sirketlerini bulduktan sonra, 
 * bu sinirin ustunde olan MIN maas bilgisini her sirket icin görüntüleyiniz.*/

SELECT 
sirket,
min(maas) > 4000 AS min_maas 
FROM personel
WHERE maas > 4000
GROUP BY sirket;

-- Eger bir sehirde calisan sayisi 1 den coksa sehir ismini ve personel sayisini getir

SELECT * FROM personel p 

SELECT 
sehir,
count(id) AS personel_sayi
FROM personel p 
GROUP BY sehir 
HAVING count(id) >1;

-- UPDATE / SET ORNEKLER

CREATE TABLE calisanlar4 (
id INT UNIQUE, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas INT, 
isyeri VARCHAR(20)
);

INSERT INTO calisanlar4 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar4 VALUES(345678901, null, 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar4 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar4 VALUES(678901234, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(789012345, 'Fatma Yasa', null, 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(890123456, null, 'Bursa', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(901234567, 'Ali Han', null, 2500, 'Vakko');

SELECT * FROM calisanlar4;

-- SORU
-- Senaryo 1: Calisanlar4 adli bir tablo olsuturun id si 123456789 olan calisanin is yeri ismini trendtol olarak guncelleyin

UPDATE calisanlar4
SET isyeri = 'Trendyol'
WHERE id = 123456789;

-- Senaryo 2: id’si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve sehrini 'Bursa' olarak güncelleyiniz.

UPDATE calisanlar4
SET 
	isim = 'Veli Yildirim',
	sehir =  'Bursa'
WHERE id = 567890123 

--Senaryo 3: markalar tablosundaki marka_id değeri 102’ye eşit veya büyük olanların marka_id’sini 2 ile çarparak değiştirin

UPDATE markalar  
SET marka_id  = marka_id  * 2
WHERE marka_id >= 102;

SELECT * FROM markalar m 

--Senaryo 4: markalar tablosundaki tüm markaların calisan_sayisi değerlerini marka_id ile toplayarak güncelleyiniz.

UPDATE markalar 
SET calisan_sayisi = calisan_sayisi + marka_id;