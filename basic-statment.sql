CREATE TABLE cities (
    name VARCHAR(70),
    country VARCHAR(70),
    population INTEGER
    area INTEGER
)

SELECT * FROM cities

INSERT INTO cities (name, country, population, area) 
    VALUES 
    ('Paris', 'fra', 2240000, 105)
    ('cairo', 'egy', 2000000, 606)
    ('tokyo', 'jap', 13929286, 2187)
    ('mexico city', 'mexico', 8851080, 1485)
    ('new york', 'usa', 8175133, 1214)
    ('mumbai', 'ind', 12442373, 603)
    ('sao paulo', 'bra', 11316149, 1521)
    ('delhi', 'ind', 11034555, 573)
    ('shanghai', 'chi', 24256800, 6340)
    ('los angeles', 'usa', 3971883, 1302)
    ('beijing', 'chi', 21516000, 16410)
    ('moscow', 'rus', 11979529, 2511)
    ('istanbul', 'tur', 15029231, 5343)
    ('dhaka', 'bang', 10356500, 306)
    ('karachi', 'pak', 14910352, 591)
    ('buenos aires', 'arge', 2890151, 203)
    ('kolkata', 'ind', 14374000, 185)
    ('lagos', 'nig', 21000000, 1171)
    ('rio de janeiro', 'bra', 12280702, 1580)
    ('osaka', 'jap', 11294000, 223)


SELECT name, population / area as 'density' from cities 


SELECT name || ', '  || population FROM cities

SELECT concat(name, ' ', upper(country)) FROM cities


SELECT name, area FROM cities WHERE  area >= 1000

SELECT name, area FROM cities WHERE  area BETWEEN 1000 and 4000


SELECT name, population FROM cities WHERE country in ('egy', 'usa', ' bra')

UPDATE cities set name "rio dejenaro" WHERE country = 'bra'

select name from cities WHERE country = 'bra'

UPDATE cities
SET
  name = 'alex'
WHERE
  country = 'egy';


DELETE FROM cities WHERE name = 'alex';

SELECT * FROM cities
