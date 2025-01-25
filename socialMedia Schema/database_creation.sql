CREATE TABLE users
(
    id           SERIAL PRIMARY KEY,
    created_at   TIMESTAMP                                               DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP                                               DEFAULT CURRENT_TIMESTAMP,
    username     VARCHAR(40)  NOT NULL UNIQUE,
    email        VARCHAR(40)  NOT NULL UNIQUE
        CONSTRAINT email_check CHECK (email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    bio          VARCHAR(256) NOT NULL                                   DEFAULT '',
    phone_number VARCHAR(15),
    password     VARCHAR(40)  NOT NULL,

    status       VARCHAR(10)
        CONSTRAINT status_check CHECK (status IN ('active', 'inactive')) DEFAULT 'active'
);


CREATE TABLE posts
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    url        VARCHAR(125) NOT NULL,
    caption    VARCHAR(1024),
    lng        REAL
        CONSTRAINT lng_check CHECK ((lng IS NULL) OR (lng >= -180 AND lng <= 180)),
    lat        REAL
        CONSTRAINT lat_check CHECK ((lat IS NULL) OR (lat >= -90 AND lat <= 90)),
    user_id    INTEGER      NOT NULL REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE comments
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    content    VARCHAR(1024) NOT NULL,
    user_id    INTEGER       NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    post_id    INTEGER       NOT NULL REFERENCES posts (id) ON DELETE CASCADE
);

CREATE TABLE likes
(
    id         SERIAL PRIMARY KEY,
    user_id    INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    post_id    INTEGER REFERENCES posts (id) ON DELETE CASCADE,
    comment_id INTEGER REFERENCES comments (id) ON DELETE CASCADE,
    CHECK (
        (post_id IS NOT NULL AND comment_id IS NULL) OR
        (post_id IS NULL AND comment_id IS NOT NULL)
        ),
    UNIQUE (user_id, post_id, comment_id)
);

CREATE TABLE photo_tage
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    x          REAL    NOT NULL,
    y          REAL    NOT NULL,
    post_id    INTEGER NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
    user_id    INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    UNIQUE (x, y, post_id, user_id)
);

CREATE TABLE caption_tags
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_id    INTEGER NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
    user_id    INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    UNIQUE (post_id, user_id)
);

CREATE TABLE hashtags
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title      VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE hashtag_post
(
    id         SERIAL PRIMARY KEY,
    post_id    INTEGER NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
    hashtag_id INTEGER NOT NULL REFERENCES hashtags (id) ON DELETE CASCADE,
    UNIQUE (post_id, hashtag_id)
);

CREATE TABLE followers
(
    id          SERIAL PRIMARY KEY,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id     INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    follower_id INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    CHECK ( user_id != follower_id ),
    UNIQUE (user_id, follower_id)
)