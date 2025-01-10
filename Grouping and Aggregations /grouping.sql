-- group all users id from comments table
SELECT user_id
from comments
group by user_id;

/*
 Notes:
 . group by is used to group rows that have the same values into summary rows.
 . you can't select a column that is not in the group by clause.
 */