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
