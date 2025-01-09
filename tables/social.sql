/*
    we will create a table called users with two columns: id and username.
    id is a SERIAL column, which means that it will be automatically incremented for each new row that is inserted.
 */
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

/*
    here we will create a table called photos with three columns: id, img_url, and user_id.
    user_id is a FOREIGN KEY column that references the id column in the users table.
    this is a common way to create a one-to-many relationship between two tables.
    forieng key is a column that references the primary key of another table.
    forieng key appears in the many side of the relationship.

    - on delete restrict: this is the default behavior. it prevents the deletion of a row from the parent table if there are corresponding rows in the child table.
    - on delete no action: this is similar to on delete restrict, but it is explicitly stated.
    - on delete cascade: this allows the deletion of a row from the parent table and automatically deletes the corresponding rows from the child table.
    - on delete set null: this sets the foreign key column in the child table to null when the corresponding row in the parent table is deleted.
    - on delete set default: this sets the foreign key column in the child table to its default value when the corresponding row in the parent table is deleted.
*/
*/
CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

/*
    we will create a table called comments with three columns: id, contents, user_id, and photo_id.
    user_id is a FOREIGN KEY column that references the id column in the users table.
    photo_id is a FOREIGN KEY column that references the id column in the photos table.
    this is a common way to create a many-to-many relationship between two tables.
*/

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    contents VARCHAR(240),
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    photo_id INTEGER REFERENCES photos(id) ON DELETE CASCADE
);