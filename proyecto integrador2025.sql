-- Analisis Exploratorios de Datos:
SELECT * FROM datos_mundiales.city;

-- Verificando cuanto registros tiene la tabla city = 4079
SELECT *
FROM datos_mundiales.city;

-- Verificando cuanto registros tiene la tabla country = 239
SELECT * FROM datos_mundiales.country;

SELECT *
FROM datos_mundiales.country;

-- Verificando cuanto registros tiene la tabla countrylanguage = 984
SELECT * FROM datos_mundiales.countrylanguage;
SELECT *
FROM datos_mundiales.countrylanguage;


-- Antes de limpiar realizaremos copia de las tablas de manera de respaldar la informacion original
CREATE TABLE city_resp1 AS SELECT * FROM datos_mundiales.city;
CREATE TABLE country_resp2 AS SELECT * FROM datos_mundiales.country;
CREATE TABLE countrylanguage_resp3 AS SELECT * FROM datos_mundiales.countrylanguage;

-- Verificando valores nulos en la tabla city
SELECT *
FROM datos_mundiales.city
WHERE Name IS NULL;
SELECT *
FROM datos_mundiales.city
WHERE CountryCode IS NULL;
SELECT *
FROM datos_mundiales.city
WHERE District IS NULL;

-- Verificando valores duplicados en la tabla city
SELECT Name, COUNT(*) AS duplicado
FROM datos_mundiales.city
GROUP BY Name
HAVING COUNT(*) > 1;

-- sin embargo podemos visualizar con una muestra que las ciudades son de diferentes paises
SELECT Name, CountryCode
FROM datos_mundiales.city
WHERE Name LIKE 'Alexandria';

-- se detecto un error en el campo Name y procedemos a corregir
UPDATE datos_mundiales.city
 SET Name ='San Cristóbal de la Laguna' 
 WHERE Name = '[San Cristóbal de] la Laguna';

UPDATE datos_mundiales.city
 SET Name ='S-hertogenbosch' 
 WHERE Name = '´s-Hertogenbosch';
 
-- Verificando valores faltantes en el campo District que son 4 y erroneos que son 18 en la tabla city
SELECT District, COUNT(*) AS duplicado
FROM datos_mundiales.city
WHERE District= '–' OR District=''
GROUP BY District
HAVING COUNT(*) > 1;

-- reemplazamos estos valores para corregir
UPDATE datos_mundiales.city
 SET District='N/A' 
 WHERE District= '–' OR District='';
 
-- Verificando cuanto registros tiene la tabla country
SELECT * FROM datos_mundiales.country;

SELECT *
FROM datos_mundiales.country;

-- Verificando valores nulos en la tabla country
-- podemos visualizar que en la estructura de la tabla por Default/Expression trae el valor NULL
SELECT *
FROM datos_mundiales.country
WHERE IndepYear IS NULL;
SELECT *
FROM datos_mundiales.country
WHERE LifeExpectancy IS NULL;
SELECT *
FROM datos_mundiales.country
WHERE GNPOld IS NULL;
SELECT *
FROM datos_mundiales.country
WHERE HeadOfState IS NULL;
SELECT *
FROM datos_mundiales.country
WHERE Capital IS NULL;

-- Verificando valores duplicados en la tabla country
SELECT Name, COUNT(*) AS duplicado
FROM datos_mundiales.country
GROUP BY Name
HAVING COUNT(*) > 1;

-- Verificando valores con error en el campo LocalName en la tabla country
SELECT LocalName, COUNT(*) AS duplicado
FROM datos_mundiales.country
WHERE LocalName= '–' or LocalName= '¸esko' or LocalName= '´Uman' 
GROUP BY LocalName;

SELECT HeadOfState, COUNT(*) AS duplicado
FROM datos_mundiales.country
WHERE HeadOfState= '' 
GROUP BY HeadOfState;

SELECT Name, COUNT(*) -- comprobamos que Elizabeth II es jefe de estado en varios paises
FROM country
WHERE HeadOfState = 'Elisabeth II'
GROUP BY Name

-- reemplazamos estos valores para corregir
UPDATE datos_mundiales.country
 SET LocalName= 'N/A'
 WHERE LocalName = '–';

 UPDATE datos_mundiales.country
 SET LocalName= 'Česko'
 WHERE LocalName = '¸esko';

UPDATE datos_mundiales.country
 SET LocalName= 'Oman'
 WHERE LocalName = '´Uman';

UPDATE datos_mundiales.country
 SET  HeadOfState = 'N/A'
 WHERE HeadOfState= '';

SELECT * FROM datos_mundiales.countrylanguage;

-- Verificando cuanto registros tiene la tabla countrylanguage = 984
SELECT *
FROM datos_mundiales.countrylanguage;

-- Verificando valores nulos en la tabla countrylanguage
SELECT *
FROM datos_mundiales.countrylanguage
WHERE Language IS NULL;
SELECT *
FROM datos_mundiales.countrylanguage
WHERE IsOfficial IS NULL;
SELECT *
FROM datos_mundiales.countrylanguage
WHERE Percentage IS NULL;

-- Verificando valores duplicados en la tabla countrylanguage
-- la llave primaria nunca tendra duplicado, mientras que los demas campo se pueden repetir 

-- Verificando valores con error en el campo Language en la tabla countrylanguage
SELECT Language, COUNT(*) AS duplicado
FROM datos_mundiales.countrylanguage
WHERE Language= '[South]Mande' 
GROUP BY Language;

-- reemplazamos estos valores para corregir
UPDATE datos_mundiales.countrylanguage
 SET Language = 'South Mande'
 WHERE Language = '[South]Mande';



