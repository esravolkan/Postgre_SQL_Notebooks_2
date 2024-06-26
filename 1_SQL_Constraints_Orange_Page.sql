-- ORANGE PAGE DATABASES / STUDENTS PERSON CALISANLAR OGRENCILER

-- Databaase Olusturma
CREATE DATABASE test

-- Tablo Olusturma
CREATE TABLE 
ogrenciler(
ogrenci_no char(7),
isim varchar (20),
soyisim varchar(30),
not_ort REAL, -- ondalikli sayilari belirtmek icin REAL kullanilir.
kayit_tarihi date
);

INSERT INTO ogrenciler VALUES ('1234567', 'Tom', 'Cruise', 85.5,'2024-05-25')
INSERT INTO ogrenciler VALUES('2345678', 'Ali', 'Can', 90.2, now());

SELECT *
FROM ogrenciler

-- SQL de tablo oluşturmanın 2 yolu vardır. Birincisi sıfırdan oluşturmaktır
-- diğeri de var olan tablodan belli "field"ları kopyalarak yapmaktır

-- Var olan tablodan yeni tablo create etmek
CREATE TABLE ogrenci_notlari
AS 
SELECT isim, soyisim, not_ort
FROM ogrenciler 

SELECT *
FROM ogrenci_notlari

-- Tablonun bazi fieldlarina data eklemek
INSERT INTO ogrenciler (isim,soyisim)
VALUES
('Brad', 'Pitt')

SELECT *
FROM ogrenciler o 
-------------------------------------------------
/*
 * coklu
 * yorum
 * satiri icin /*.........*/ arasinda yazabiliriz
 */

-- Table Silme

DROP TABLE ogrenci_notlari 

SELECT * FROM ogrenci_notlari


/* [PK]==> 1)Null deger alamaz 2)Unique dir 3) baska bir tablo ile iliskilendirmek icin kullanilacak Demektir

bir tabloda sadece 1 tane olmalidir; unique
Primary key; Parent
Foreing Key: Child (Primary key kullanilirak olustuurlur)
not null olmali
TC, email vs

*/

--CONSTRAINTS/ KISITLAMALAR/BELİRLEYİCİLER
-- UNIQUE AND NOT NULL

CREATE TABLE ogrenciler2 (
ogrenci_no char(7) UNIQUE ,
isim varchar (20) NOT NULL ,
soyisim varchar (30) NOT NULL,
not_orrt REAL,
kayit_tarihi date
); 

INSERT INTO ogrenciler2 VALUES ('1234567', 'Ali', 'Yilmaz', 80, now())

SELECT * FROM ogrenciler2

INSERT INTO ogrenciler2 VALUES ('1234567', 'Veli', 'Yilmaz', 90, now())
 -- Ogrenci no kisiminda duplicate olmamasi gerektigiyle ilgili kisitlama getirmissin. Burada duplicate oldu o yuzden error veriyor.

-- Primary key atamasi icin 1.yol
CREATE TABLE ogrenciler3 (
ogrenci_no char(7) PRIMARY KEY ,
isim varchar (20) NOT NULL ,
soyisim varchar (30) NOT NULL,
not_orrt REAL,
kayit_tarihi date
); 

SELECT * FROM ogrenciler3

-- Primary key atamasi icin 2.yol
CREATE TABLE ogrenciler4 (
ogrenci_no char(7),
isim varchar (20) NOT NULL ,
soyisim varchar (30) NOT NULL,
not_orrt REAL,
kayit_tarihi date,
CONSTRAINT ogr_no_pk PRIMARY KEY (ogrenci_no)
);

SELECT * FROM ogrenciler4

INSERT INTO ogrenciler4 VALUES ('1234567', 'Ali', 'Yilmaz', 80, now())
INSERT INTO ogrenciler4 VALUES ('1234567', 'Veli', 'Yilmaz', 80, now()) -- PRIMARY KEY oldugu icin error vercek.
--duplicate yapilmaz

INSERT INTO ogrenciler4 (isim, soyisim) VALUES ('Veli', 'Han')
-- Ogrenci no null olamaz o sebeple hata aldik

---------------------------------------------------------------------------------------------
/*Foreign Key:Tablolar arasında ilişki oluşturmak içindir.
Değer olarak "null" kabul eder
Tekrarlanan verileri kabul eder
Bir tablo birden çok "Foreign Key" alanına sahip olabilir.*/

CREATE TABLE sirketler(
sirket_id INTEGER,
sirket varchar(50)PRIMARY KEY,
personel_sayisi INTEGER
)

SELECT * FROM sirketler 

CREATE TABLE personel(
id INTEGER,
isim VARCHAR(50),
sehir VARCHAR(50),
maas REAL,
sirket VARCHAR(50),
FOREIGN key(sirket) REFERENCES sirketler(sirket)
)

SELECT * FROM personel
-- CONSTRAINT per_fk FOREIGN KEY(sirket) REFERENCES sirketler(sirket));  bu yazım şeklinde custom foreign key bağlantı ismi verilmiş olur

-- CHECK CONSTRAINTS
-- Age ve Salary için veri giriş şartı oluşturalım.
-- Salary 5000 den büyük olmalı, age 0 dan küçük olmamalı

CREATE TABLE person (
id integer,
name varchar(50),
salary REAL CHECK(salary> 5000), -- 5000 den fazla giris olmali
age integer CHECK (age >= 0) -- negatif deger olmayacak
); 

SELECT * FROM person 

INSERT INTO person VALUES (11, 'Ali Can', 6000, 35);

INSERT INTO person VALUES(12,'Veli Can', 5500,-3) --HATA Age ile alakalı hata verir

INSERT INTO person VALUES(13,'Ali Can',4000,45); --HATA: person_salary_check


