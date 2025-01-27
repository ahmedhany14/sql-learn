-- create index on users (name);

SELECT *
FROM users
where username = 'Neva36'; -- it takes 1200 ms

CREATE INDEX name_index ON users (username);

EXPLAIN ANALYZE
SELECT *
FROM users
where username = 'Neva36'; -- it takes .033 ms

DROP INDEX name_index; -- to drop the index

SHOW data_directory;

select p.oid, p.datname from pg_database as p;

select * from pg_indexes where tablename = 'users';

select *from pg_class where relname = 'comments';

--select * from bt_page_items('name_index', 1);