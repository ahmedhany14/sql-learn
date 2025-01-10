-- Aggregate functions
/*
 aggregate functions are functions that take a collection of values and return a single value.
 types:
    . COUNT(): returns the number of rows that match the query.
    . MAX(): returns the maximum value of a column.
    . MIN(): returns the minimum value of a column.
    . SUM(): returns the sum of a column.
    . AVG(): returns the average value of a column.
    . GROUP_CONCAT(): returns a string with concatenated non-NULL values.
  */

-- get max id from users table
SELECT MAX(id)
from comments;


SELECT *
from photos;
-- we have a null values in the user_id row

-- get number of row in photos table
SELECT COUNT(*)
from photos; -- 21

SELECT COUNT(user_id)
from photos;
-- 20

/*
 Here is an explanation of the difference between COUNT(*) and COUNT(column_name):
    . COUNT(*) returns the number of rows in a table, including rows that contain NULL values.
    . COUNT(column_name) returns the number of non-NULL values in a column.
 */

-- get number of comments for each photo
SELECT photo_id, count(*)
from comments
group by photo_id;


