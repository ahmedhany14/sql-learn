/*
 union is used to combine the result-set of two or more SELECT statements.

 there are 2 types of union:
  . UNION ALL: returns all rows from the result of the first query and all rows from the result of the second query.
 .  UNION DISTINCT: returns only distinct rows from the result of the first query and the result of the second query.
 */

-- get top 4 products price and top 4 products with ratio price / weight
(SELECT id, name, price, weight
 from ecommerceproducts
 order by price desc
 limit 4)
union all
(SELECT id, name, price, weight
 from ecommerceproducts
 order by price / weight desc
 limit 4);


(SELECT id, name, price, weight
 from ecommerceproducts
 order by price desc
 limit 4)
union
distinct
(SELECT id, name, price, weight
 from ecommerceproducts
 order by price / weight desc
 limit 4);


/*
 intersection is used to combine the result-set of two or more SELECT statements but returns only rows that are present in all result-sets.
 */


(SELECT id, name, price, weight
 from ecommerceproducts
 order by price desc
 limit 4)
INTERSECT
(SELECT id, name, price, weight
 from ecommerceproducts
 order by price / weight desc
 limit 4);


/*
    except is used to combine the result-set of two SELECT statements.
    but returns only rows that are present in the first result-set and not in the second result-set.
 */

(SELECT id, name, price, weight
 from ecommerceproducts
 order by price desc
 limit 4)
except
(SELECT id, name, price, weight
 from ecommerceproducts
 order by price / weight desc
 limit 4);
