-- BLUE PAGE DATABASE
 /* Her bir personelin adını, soyadını ve ülkesinin ismini listeleyin.
  Lliste; ülke adı, personel adı ve personel soyadına göre sıralanmış olsun.*/

SELECT * FROM personel p 

SELECT * FROM ulke u 

SELECT 
	u.ad AS millet,
	p.ad AS Adi,
	p.soyad AS Soyadi
FROM personel p
INNER JOIN ulke u
ON p.ulke_id = u.ad
ORDER BY u.ad, p.ad, p.soyad;

--Bana öyle bir liste hazırlayın ki, içinde her bir ülkenin
--ID’si, ismi ve o ülkeden gelen personelin sayısı olsun.

SELECT
	u.id AS ID,
	u.ad AS ULKE,
count(p.id) AS top_calisan
FROM ulke u
INNER JOIN personel p
ON u.ad = p.ulke_id
GROUP BY u.id, u.ad;


-- INNER JOIN

/*Herbir departmanın ID’sini, adını ve o departmana ödenen toplam maaşı tek bir liste içinde görmek istiyorum*/

SELECT
	d.id ,
	d.ad ,
	sum(p.maas)
FROM personel p
INNER JOIN departman d
ON p.departman_id = d.id
GROUP BY d.id , d.ad ;

--Çocuklar, bana getirdiğiniz listeyi maaş toplamına
--göre artan şekilde sıralar mısınız ?

SELECT
	d.id AS ID ,
	d.ad AS Departman ,
	sum(p.maas) AS top_maas
FROM personel p
INNER JOIN departman d
ON p.departman_id = d.id
GROUP BY d.id , d.ad
ORDER BY sum(p.maas)

--Personele ödenen maaşları ülke bazında toplayıp listeleminizi istiyorum. Çıktılar ülke ismine göre sıralanmış olsun

SELECT
	sum(p.maas),
	u.ad
FROM ulke u
INNER JOIN personel p
ON u.ad = p.ulke_id
GROUP BY u.ad
ORDER BY u.ad;

/*Aylık maaşı 2.000 den fazla olan kişilerin maaşlarının toplamını ülke bazında görmek istiyorum.
Çıktı listesinde ülkenin ID si, adı ve maaş toplamı yer alsın.*/

SELECT
	u.ad AS millet,
	u.id AS ID,
sum(p.maas)
FROM ulke u
INNER JOIN personel p
ON u.ad = p.ulke_id
WHERE maas > 2000
GROUP BY u.ad, u.id;

-- Departmanlara ödenecek toplam maaşları departman ID si
--ve ad bazında listelemenizi istiyorum. Ancak, bu listede
--sadece, toplam ödenecek maaş tutarı 10.000 in üzerinde
-- olan departmanlar yer alsın.

SELECT
	d.id AS ID,
	d.ad AS Departman,
sum(p.maas) AS top_maas
FROM personel p
INNER JOIN departman d
ON d.id = p.departman_id
GROUP BY d.id, d.ad
HAVING sum(p.maas)> 10000;

-- UNION 
-- Şirketimizde çalışan bütün personelin ve bütün müşterilerimizin ad, soyad, E-Posta ve doğum günü
-- bilgilerini tek bir liste içinde görmek istiyorum.

SELECT 
	ad,
	soyad,
	dogum,
	email
FROM personel p 
UNION 
SELECT
	ad,
	soyad,
	dogum,
	email
FROM musteri m 




