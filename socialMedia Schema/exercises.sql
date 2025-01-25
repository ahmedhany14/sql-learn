-- 1. select top 3 users ids

select *
from users
order by id desc
limit 3;

-- use join to get the posts of user with id = 200, specify the caption

select u.username, p.caption
from posts as p
         join users as u on u.id = p.user_id
where u.id = 200;

-- get the number of likes that user created either on posts or comments
select u.username, count(*)
from likes as l
         join users as u on u.id = l.user_id
group by u.username;


SHOW data_directory;

select p.oid, p.datname
from pg_database as p;
