SELECT
    *
FROM
    users


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
