-- 1. single value subquery

SELECT name, department, price, (SELECT max(price) from ecommerceproducts) as max_price
from ecommerceproducts
where price > 950;


-- avg orders for all users
SELECT CAST(avg(orders_count) AS float4)
from (select user_id, CAST(count(*) AS float) as orders_count
      from ecommerceorders
      group by user_id) as orders;

-- list all order ids where their price / weight > 5

SELECT id
from ecommerceorders
where product_id in (select id
                     from ecommerceproducts
                     where price / weight > 50);

-- list all products that not at the same dep and price less than 100
select department
from ecommerceproducts
where price < 100;


-- all departments will not equal to the result of the previous query
SELECT name, department
from ecommerceproducts
where department NOT in (select department
                         from ecommerceproducts
                         where price < 100);

-- list all products that more expensive than all products in the Industrial department

SELECT name, department, price
from ecommerceproducts
where price > ALL (select price
                   from ecommerceproducts
                   where department = 'Industrial');


-- show name dep, price of the most product in the dep
SELECT name, department, price
from ecommerceproducts as p1
where price = (select max(price)
               from ecommerceproducts as p2
               where p2.department = p1.department);

-- list the number of orders for each product

select name,
       (select count(*)
        from ecommerceorders as o
        where o.product_id = p1.id)
from ecommerceproducts as p1;

-- get products where it's price greater than the most expensive toy product
SELECT name, department, price
from ecommerceproducts
where price > (select max(price)
               from ecommerceproducts
               where department = 'Toys')
order by price;