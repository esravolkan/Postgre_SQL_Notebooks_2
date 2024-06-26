-- BLUE PAGE DATABASE

--SUM FUNC
-- Team Lead> Her bir departmana toplam kac TL maas odeyecegiz?

-- GroupBy ile
SELECT departman_id, 
SUM(maas) AS toplam_maas 
FROM personel 
GROUP BY departman_id;

-- OrderBy ile:
SELECT  departman_id, 
sum(maas) AS  dept_top_maas 
FROM  personel 
group BY  departman_id 
order BY  departman_id ASC 

-- AVG FUNC
-- Team Lead: Her bir departmana ortalama kac TL maas odeyecegiz?
SELECT departman_id, 
AVG(maas) AS ort_departm_maas 
FROM personel p 
GROUP BY departman_id;

--ROUND
--virgülden sonra 0 hane
SELECT departman_id, 
ROUND(AVG(maas)) AS ort_departm_maas 
FROM personel p 
GROUP BY departman_id;

--virgülden sonra 2 hane
SELECT departman_id, 
ROUND(AVG(maas),2) AS ort_departm_maas 
FROM personel p 
GROUP BY departman_id;

-- Min Max Ornegi
-- Sirketimizde en yuksek maasi alan kimdir

SELECT max(maas) AS max_maas
FROM personel p 

-- Sirketimizde en yuksek maasi alan kimdir
SELECT min(maas) AS max_maas
FROM personel p 

-- Sirketimizde odenen en yuksek maas ile en dusuk maas arasindaki fark nedir?

SELECT
(max(maas) - min(maas)) 
AS maas_farki
FROM personel p 
 

-- GROUP BY 
-- Her bir departmanda kac kisi calisiyor?
SELECT 
departman_id,
count(*) AS toplam
FROM personel
GROUP BY  departman_id
ORDER BY departman_id;

-- Calisanlardan herbir ulkeden kac kisi bulunuyor?

SELECT 
	ulke_id ,
	count(*) AS kisi_sayisi 
FROM personel 
GROUP BY ulke_id 
ORDER BY count(*) 
