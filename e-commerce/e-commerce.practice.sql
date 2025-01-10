-- get number of paid and unpaid orders

SELECT paid, count(*)
from ecommerceorders
group by paid;


-- get first and last name of users and then whether they have paid for their order
SELECT u.first_name, u.last_name, o.paid
from ecommerceorders as o
join ecommerceusers as u on o.user_id = u.id;