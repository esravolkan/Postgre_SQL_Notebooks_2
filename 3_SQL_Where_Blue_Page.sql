-- BLUE PAGE DATABASE

/* Team LEAD Soruyor: Çocuklar; elemanların adını, soyadını ve maaşını listelediğiniz ekranda 
küçük bir değişiklik istiyorum. Ad sütunununbaşlığı 'A', 
soyad sütununun başlığı ise 'S' olsun. Maaş sütununun başlığı 
yine 'MAAŞ' olarak kalabilir. 
*/

SELECT  
	ad AS a,
	soyad AS S,
	maas AS maas
FROM personel p

-- Team Lead: Ismi mehmet olan butun sirket calisnalarini getir

SELECT *
FROM personel
WHERE ad = 'Mehmet'

-- Team Lead: 1 Kasim 1978 tarihinde dogmus olan butun calisanlarin ad, soayd, dogum tarihini goster

SELECT ad, soyad,dogum
FROM personel
WHERE dogum = '1978-11-01'

-- Team Lead: Mehmet Ozman adli calisanin butun ozluk bilgilerini getir

SELECT *
FROM personel 
WHERE ad = 'Mehmet'
AND soyad = 'Ozman'



