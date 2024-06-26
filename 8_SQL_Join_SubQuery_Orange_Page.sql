-- ORANGE PAGE DATABASE

-- IS NULL/ NOT NULL KONUSU


--SSN degeri 234567890 olan kayıtın SSN degerini 456767890 olarak update ediniz.
--Tüm null değerleri "Isim daha sonra eklenecek" olarak değiştirin
--Tüm null adres değerlerini "Adres daha sonra eklenecek" olarak değiştirin
--Ad değeri olmayan kayıtlar nasıl silinir?
--Tüm kayıtlar nasıl silinir?
--NULL olan tum kayıt yada adresleri siliniz


CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');

 SELECT * FROM people;


--SSN degeri 234567890 olan kayıtın SSN degerini 456767890 olarak update ediniz.
UPDATE people
SET ssn= 456767890
WHERE ssn= 234567890;

--Tüm null değerleri "Isim daha sonra eklenecek" olarak değiştirin
UPDATE people
SET name1= 'Isim daha sonra eklenecek'
WHERE name1 IS NULL;

--Tüm null adres değerlerini "Adres daha sonra eklenecek" olarak değiştirin
UPDATE people
SET address ='To Be Inserted'
WHERE address IS NULL;

--Ad değeri olmayan kayıtlar nasıl silinir?
DELETE FROM people
WHERE name='Isim daha sonra eklenecek';

--Tüm kayıtlar nasıl silinir?
DROP TABLE people;

-- NULL olan tum kayıt yada adresleri siliniz
DELETE FROM people
WHERE name IS NULL OR address IS NULL; 








