/*
 offset and limit
 .offset() is used to skip the first n rows in a table
 .limit() is used to limit the number of rows returned from the query
 */

select id, first_name, last_name
from ecommerceusers
order by id
offset 5 -- skip the first 5 rows
    limit 5; -- return only 5 rows