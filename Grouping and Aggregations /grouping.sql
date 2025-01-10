-- group all users id from comments table
SELECT user_id
from comments
group by user_id;

/*
 Notes:
 . group by is used to group rows that have the same values into summary rows.
 . you can't select a column that is not in the group by clause.
 */

-- get the number of comments for each user
SELECT user_id,
       COUNT(*) AS number_of_comments
from comments
group by user_id;

-- get the number of comments for each user and the user's name
SELECT user_id,
       COUNT(*) as number_of_comments,
       u.username
from comments as c
         join users as u on c.user_id = u.id
group by user_id, u.username;


-- having clause
/*
    having clause is used to filter the result of a group by clause.

    The deference between where and having:
        . where is used to filter rows before grouping, filter sets of rows.
        . having is used to filter rows after grouping, filter sets of groups.
 */

-- get the number of comments for each user and the user's name, but only for users who have more than or equal 20
SELECT c.user_id,
       COUNT(*) as number_of_comments,
       u.username
from comments as c
         join users as u on c.user_id = u.id
group by user_id, u.username
having COUNT(*) >= 20;


-- same query, but I need to check if the photo id is less than 5 and the user has more than or equal 15 comments

SELECT c.user_id,
       COUNT(*) as number_of_comments,
       u.username
from comments as c
         join users as u on c.user_id = u.id
where c.photo_id < 5
group by user_id, u.username
having COUNT(*) >= 15;

-- get users id on the first 2 photos and have more than 2 comments

SELECT user_id, count(*)
from comments
where photo_id < 50
group by user_id
having count(*) > 20;


