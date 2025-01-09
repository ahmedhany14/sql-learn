/*
    forieng key Constraints around insert, update, and delete operations
 */
/*
    insert a photo with a user_id that does not exist in the users table, you will get an error.
 */
INSERT INTO
    photos (img_url, user_id)
VALUES
    ('img13.jpg', 100)
/*
    insert null value in the user_id column, you won't get an error.
*/

INSERT INTO
    photos (url, user_id)
VALUES
    ('img14.jpg', NULL)


INSERT INTO
    users (username)
VALUES
    ('null user')
