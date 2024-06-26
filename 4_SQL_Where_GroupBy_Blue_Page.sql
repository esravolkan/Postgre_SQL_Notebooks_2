-- BLUEPAGE DATABASE

-- Team Lead Soruyor: Adı Mehmet veya Dilek olan ve maaş 1400 TL'nin üzerinde olan çalışanların listesini istiyorum.

SELECT *
FROM personel p 
WHERE ad = 'Mehmet' OR ad = 'Dilek'

SELECT *
FROM personel p 
WHERE (ad = 'Mehmet' OR ad = 'Dilek')
AND maas > '1400';

/* Maaş 1000 TL ile 2000 TL arasında olan bütün çalışanların id, ad, soyad ve maaş bilgilerini istiyorum. 
 * Liste maaş tutarına göre sıralanmış olsun */

SELECT id, ad , soyad , maas
FROM personel
WHERE maas BETWEEN 1000 AND 2000
ORDER BY maas ASC;

/* 1978 yılında doğmuş bütün çalışanların ad, soyad ve doğum günü bilgilerini istiyorum.*/

SELECT ad, soyad, dogum
FROM personel
WHERE dogum
BETWEEN '1978-01-01' AND '1978-12-31';

/* Çocuklar !! ortalıkta 21 Aralık 2012 tarihinde Marduk gezegeninin gelip
dünyaya çarpacağına dair bazı söylentiler dolaşıyor. Bu konuda kendi
çapımda bir analiz yapmak istiyorum. Bu yüzden bana her bir çalışanın
ID'sini, adını, soyadını ve Marduk geldiğinde kaç gündür yaşıyor
olacağını içeren bir liste hazırlar mısınız?*/

SELECT * FROM personel p 

SELECT id, ad, soyad, ('2012-12-21' - dogum) AS gun_farki
FROM personel 

-- İsmi Mehmet, Dilek veya Cengiz olan bütün çalışanları listeleyin. Liste ad ve soyada göre sıralanmış olsun.

SELECT *
FROM personel
WHERE ad IN ('Mehmet', 'Dilek', 'Cengiz')
ORDER BY ad, soyad;

--soaydi "oglu" ile bitenleri getir

SELECT *
FROM personel p
WHERE soyad LIKE '%oğlu';

/*Bana bütün şirket çalışanlarının ad, soyad ve maaş bilgilerinin tam listesi lazım. 
 Bu listeyi öyle hale getirin ki; ada göre ters, soyada göre ters ve maaşa göre düz bir şekilde sıralanmış olsun.*/

SELECT *
FROM personel
ORDER BY ad DESc

SELECT ad, soyad, maas
FROM personel
ORDER BY ad DESC, soyad DESC, maas ASC


-- Count örnegi
-- şirkette çalışan kişi sayısı

SELECT count(*)AS toplam  --count(id) olarak da yazabilirdik
FROM personel p 

-- SUM örneği
-- Toplam maaş ödemesi ne kadar olacak

SELECT SUM(maas) AS toplam_maas
FROM personel p 

-- İsmi Mehmet Olan elemanlar toplam kaç TL maaş alıyor?

SELECT SUM(maas) AS toplam_mehmet_maas
FROM personel p 
WHERE ad = 'Mehmet'

SELECT *
FROM personel p

-- Muhasebe departmanında bu ay toplam TL maaş ödemesi yapılacak?
--bu soruyu 2 aşamada çözeceğiz.
--ilk olrak muhasebenin departman id sini bulalım

SELECT id
FROM departman d 
WHERE ad = 'Muhasebe';

-- ikinci aşamada departman id ye göre hesap yapacağız

SELECT sum(maas) AS toplam_muh_maas 
FROM personel p 
WHERE departman_id = 1


