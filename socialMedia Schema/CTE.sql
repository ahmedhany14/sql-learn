select u.username
from users as u
         join (select user_id, created_at
               from photo_tags
               union all
               select user_id, created_at
               from caption_tags) as pt on u.id = pt.user_id
where pt.created_at < '2010-01-07';

-- we can replace the subquery with a CTE

WITH tags AS (select user_id, created_at
              from photo_tags
              union all
              select user_id, created_at
              from caption_tags)
select u.id, u.username
from users as u
         join tags as pt on u.id = pt.user_id
where pt.created_at < '2010-01-07';


with recursive fib(n) as (select 10 as n
                          union all
                          select n - 1
                          from fib
                          where n > 1)
select *
from fib;


