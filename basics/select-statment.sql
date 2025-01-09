SELECT * FROM cities

SELECT name, population / area as 'density' from cities 

SELECT name || ', '  || population FROM cities

SELECT concat(name, ' ', upper(country)) FROM cities

SELECT name, area FROM cities WHERE  area >= 1000

SELECT name, area FROM cities WHERE  area BETWEEN 1000 and 4000

SELECT name, population FROM cities WHERE country in ('egy', 'usa', ' bra')


