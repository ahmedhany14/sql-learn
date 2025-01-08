/*
 we will create a table called users with two columns: id and username.
 id is a SERIAL column, which means that it will be automatically incremented for each new row that is inserted.
 */
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(256)
)

INSERT INTO
    users (username)
VALUES
    ('ahmed'),
    ('mohamed'),
    ('ali'),
    ('omar'),
    ('nour'),
    ('nada'),
    ('sara'),
    ('noura')

SELECT
    *
FROM
    users

/*
    here we will create a table called photos with three columns: id, img_url, and user_id.
    user_id is a FOREIGN KEY column that references the id column in the users table.
    this is a common way to create a one-to-many relationship between two tables.
    forieng key is a column that references the primary key of another table.
    forieng key appears in the many side of the relationship.
    */

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    img_url VARCHAR(256),
    user_id INTEGER REFERENCES users(id)
);

INSERT INTO
    photos (img_url, user_id)
VALUES
    ('img1.jpg', 1),
    ('img2.jpg', 2),
    ('img3.jpg', 3),
    ('img4.jpg', 4),
    ('img5.jpg', 5),
    ('img6.jpg', 6),
    ('img7.jpg', 7),
    ('img8.jpg', 8),
    ('img9.jpg', 1),
    ('img10.jpg', 2),
    ('img11.jpg', 1),
    ('img12.jpg', 4)
SELECT
    *
FROM
    photos

/* basic select statement to get photos with user_id = 1*/

SELECT
    *
FROM
    photos
WHERE
    user_id = 1

-- basic join statement to get photos with user_id = 1
SELECT
    ph.id,
    ph.img_url,
    u.username
FROM
    photos ph
    JOIN users u on ph.user_id = u.id
WHERE
    u.id = 1


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
    photos (img_url, user_id)
    VALUES
    ('img14.jpg', NULL)

SELECT * FROM photos


/*
when you try to delete a row from the users table that has a corresponding row in the photos table, you will get an error.
*/
DELETE FROM users WHERE id = 1

/*
there are two ways to handle this situation:
- on delete restrict: this is the default behavior. it prevents the deletion of a row from the parent table if there are corresponding rows in the child table.
- on delete no action: this is similar to on delete restrict, but it is explicitly stated.
- on delete cascade: this allows the deletion of a row from the parent table and automatically deletes the corresponding rows from the child table.
- on delete set null: this sets the foreign key column in the child table to null when the corresponding row in the parent table is deleted.
- on delete set default: this sets the foreign key column in the child table to its default value when the corresponding row in the parent table is deleted.
*/

DROP TABLE photos, users



CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(256)
)

INSERT INTO
    users (username)
VALUES
    ('ahmed'),
    ('mohamed'),
    ('ali'),
    ('omar'),
    ('nour'),
    ('nada'),
    ('sara'),
    ('noura')


CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    img_url VARCHAR(256),
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE 
);

INSERT INTO
    photos (img_url, user_id)
VALUES
    ('img1.jpg', 1),
    ('img2.jpg', 2),
    ('img3.jpg', 3),
    ('img4.jpg', 4),
    ('img5.jpg', 5),
    ('img6.jpg', 6),
    ('img7.jpg', 7),
    ('img8.jpg', 8),
    ('img9.jpg', 1),
    ('img10.jpg', 2),
    ('img11.jpg', 1),
    ('img12.jpg', 4)

SELECT * FROM photos


DELETE FROM users WHERE id = 1


SELECT * FROM photos