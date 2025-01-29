/*
 Views:
    it is like a virtual table that is created by a query by joining one or more tables.
    It is used to simplify complex queries.
    Like CTE, it is not stored in the database, but we can use it at any time.
 */
-- Problem: I need to know the number of tags for each user in the social media database

CREATE VIEW tags AS
(
SELECT id, created_at, user_id, post_id, 'photo_tags' as type
FROM photo_tags
UNION ALL
SELECT id, created_at, user_id, post_id, 'caption_tags' as type
FROM caption_tags
    );

SELECT count(*)
from tags;

select users.username, count(*)
from users
         join tags on users.id = tags.user_id
group by users.username
order by count(*) desc;


-- 10 most recent posts
CREATE VIEW recent_posts AS
(
select *
from posts
order by created_at desc
limit 10 );

select *
from recent_posts;

-- challenge 1: show users who created the most recent posts
select u.username, u.email
from users as u
         join recent_posts on u.id = recent_posts.user_id;

-- challenge 2: show number of likes for the most recent posts
select rp.id, count(*) as number_of_likes
from recent_posts as rp
         join likes on rp.id = likes.post_id
group by rp.id
order by number_of_likes desc;

-- challenge 2: show user who tagged in the recent posts
select tags.user_id, count(*) as number_of_tags
from recent_posts as rp
         join tags on rp.id = tags.post_id
group by tags.user_id
order by number_of_tags desc;

-- challenge 3: show all hashtags in the recent posts
select hp.hashtag_id, count(*) as number_of_hashtags
from hashtags_posts as hp
         join recent_posts as rp on hp.post_id = rp.id
group by hp.hashtag_id;



-- drop and recreate the view
CREATE OR REPLACE VIEW recent_posts AS
(
select *
from posts
order by created_at desc
limit 20 );

select * from recent_posts;

DROP VIEW recent_posts;