-- ORANGE PAGE DATABASE

CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20),
city varchar(50),
age int
);

INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Abdullah Berk','abdullah@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','btl@mail.com',4000,'C#','Bursa',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayse Gul','ayse@mail.com',4000,'C#','Ankara',29);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ali Seker','ali@mail.com',4000,'C#','Ankara',29);

-- Senaryo 1: developers tablosundan ekleme sırasına göre ilk 3 kaydı getiriniz
SELECT *
FROM developers
LIMIT 3; 

-- Senaryo 2: developers tablosundan ekleme sırasına göre ilk 2 kayıttan sonraki ilk 3 kaydı getiriniz.
SELECT *
FROM developers
OFFSET 2
LIMIT 3;

-- Senaryo 3: developers tablosundan maaşı en düşük ilk 3 kaydı getiriniz.
SELECT *
FROM developers 
ORDER BY salary
LIMIT 3;

--Senaryo 4: developers tablosundan maaşı en yüksek 2. developerın tüm bilgilerini getiriniz.

SELECT *
FROM developers
ORDER BY salary DESC
OFFSET 1
LIMIT 1;

--ALIAS KONUSU

CREATE TABLE workers(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

/*  1-calisan_id sutun ismini id olarak degistirelim
	2-calisan_isim sutun ismini isim olarak degistirelim
	3-workers olan tablo ismini w olarak degistirelim */

SELECT calisan_id AS id FROM workers 

SELECT calisan_isim isim FROM workers; -- AS kullanmadan da calisir

CREATE TABLE calisanlar1(
id char(5),
isim varchar(50),
maas int,
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Donatello' ,12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10003', null, 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10004', 'Donatello', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10005', 'Michelangelo', 5000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10006', 'Leonardo', null, '2019-04-12');
INSERT INTO calisanlar1 VALUES('10007', 'Raphael', NULL , '2018-04-14');
INSERT INTO calisanlar1 VALUES('', 'April', 2000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('', 'Ms.April', 2000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10002', 'Splinter' ,12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES( null, 'Fred' ,12000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10008', 'Barnie' ,10000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10009', 'Wilma' ,11000, '2018-04-14');
INSERT INTO calisanlar1 VALUES('10010', 'Betty' ,12000, '2018-04-14');

CREATE TABLE adresler1(
adres_id char(5),
sokak varchar(30),
cadde varchar(30),
sehir varchar(20)
);

INSERT INTO adresler1 VALUES('10003','Ninja Sok', '40.Cad.','IST');
INSERT INTO adresler1 VALUES('10003','Kaya Sok', '50.Cad.','Ankara');
INSERT INTO adresler1 VALUES('10002','Taş Sok', '30.Cad.','Konya');
INSERT INTO adresler1 VALUES('10012','Taş Sok', '30.Cad.','Konya');
INSERT INTO adresler1 VALUES(NULL,'Taş Sok', '23.Cad.','Konya');
INSERT INTO adresler1 VALUES(NULL,'Taş Sok', '33.Cad.','Bursa');

SELECT * FROM calisanlar1;
SELECT * FROM adresler1;


-- Calisanlar tablosundan ismi 'Donatello' olanların tüm bilgilerini listeleyelim
SELECT *
FROM calisanlar1 
WHERE isim = 'Donatello'

--Calisanlar tablosundan maaşı 5000den fazla olanların tüm bilgilerini listeleyelim
SELECT *
FROM calisanlar1
WHERE maas > 5000

--Calisanlar tablosundan maaşı 5000den fazla olanların isim ve maaşlarını listeleyelim
SELECT isim, maas
FROM calisanlar1
WHERE maas > 5000

--adresler tablosundan sehiri 'Konya' ve
--adres_id si 10002 olan kaydın tüm verileri getirelim

SELECT *
FROM adresler1 
WHERE sehir = 'Konya'
AND  adres_id = '10002'

