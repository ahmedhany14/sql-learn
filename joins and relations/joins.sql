-- Challenge: 1
/*
    For each comment show the content and the name of the user who posted it.
*/

SELECT com.contents,
       usr.username
FROM comments AS com
         JOIN users AS usr ON com.user_id = usr.id;

-- Challenge: 2
/*
    For each comment show the content and the photo it belongs to.
*/

SELECT com.contents,
       pho.url
FROM comments AS com
         JOIN photos AS pho
              ON com.photo_id = pho.id;

/*
 There are 4 types of joins in SQL:
    1. INNER JOIN: returns rows when there is at least one match in both tables.
    2. LEFT JOIN: returns the matched rows from the left table, and the remaining rows from the left table and NULL on the right side.
    3. RIGHT JOIN: returns the matched rows from the right table, and the remaining rows from the right table and NULL on the left side.
    4. FULL JOIN: returns the matched rows when there is a match in one of the tables, and the remaining rows from both tables, with NULL on both sides when there is no match.
 */

SELECT p.url,
       u.username
FROM photos AS p
         JOIN users AS u ON p.user_id = u.id;

/*
 Here if there is a photo that has no user, it will not be shown in the result.
 to show all photos, we can use LEFT JOIN instead of JOIN.
 */

SELECT p.url,
       u.username
from photos as p
         left join users as u on u.id = p.user_id;

SELECT p.url,
       u.username
from photos as p
         right join users as u on u.id = p.user_id;

SELECT p.url,
       u.username
from photos as p
         full join users as u on u.id = p.user_id;

-- Challenge: 3
-- Filtering the result of a join by adding a WHERE clause
-- get the user of id 5 and all the photos he uploaded

SELECT p.url,
       u.username
from photos as p
         join users as u on u.id = p.user_id
where u.id = 5;

-- Challenge: 4
-- get users that have commented on their own photos

SELECT c.contents,
       p.url
FROM comments as c
         join photos as p on c.photo_id = p.id
where c.user_id = p.user_id;

-- Challenge: 5
-- same as above but with the user's name
SELECT
    c.contents,
    p.url,
    u.username
FROM comments as c
         join photos as p on c.photo_id = p.id
         join users as u on u.id = c.user_id and u.id = p.user_id
/*
 Note Rayka:
    when you have a multi-table join, start with the table that has most foreign keys, and then the table with less foreign keys and so on.
    in this case, the comments table has two foreign keys, so we started with it.
 */