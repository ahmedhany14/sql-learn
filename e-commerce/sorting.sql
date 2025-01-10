-- sort products by the price in ascending order
SELECT *
from ecommerceproducts
order by price ASC;

-- pair sort
SELECT *
from ecommerceproducts
order by price ASC, weight DESC;
