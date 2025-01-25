CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    username   VARCHAR(40) NOT NULL,
    bio        VARCHAR(1024)            DEFAULT '',
    avatar     VARCHAR(256),
    phone      VARCHAR(50),
    email      VARCHAR(40),
    password   VARCHAR(50),
    status     VARCHAR(50),
    CHECK ( coalesce(phone, email) IS NOT NULL )
);

CREATE TABLE posts
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    url        VARCHAR(256) NOT NULL,
    caption    VARCHAR(1024),
    lng        REAL
        CHECK ((lng IS NULL) OR (lng >= -180 AND lng <= 180)),
    lat        REAL
        CHECK ((lat IS NULL) OR (lat >= -90 AND lat <= 90)),
    user_id    INTEGER      NOT NULL REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE comments
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    contents   VARCHAR(1024) NOT NULL,
    user_id    INTEGER       NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    post_id    INTEGER       NOT NULL REFERENCES posts (id) ON DELETE CASCADE
);

CREATE TABLE likes
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    post_id    INTEGER REFERENCES posts (id) ON DELETE CASCADE,
    comment_id INTEGER REFERENCES comments (id) ON DELETE CASCADE,
    CHECK (
        (post_id IS NOT NULL AND comment_id IS NULL) OR
        (post_id IS NULL AND comment_id IS NOT NULL)
        ),
    UNIQUE (user_id, post_id, comment_id)
);

CREATE TABLE photo_tags
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    post_id    INTEGER NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
    user_id    INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    x          INTEGER NOT NULL,
    y          INTEGER NOT NULL,
    UNIQUE (post_id, user_id)
);

CREATE TABLE caption_tags
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    user_id    INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
    UNIQUE (post_id, user_id)
);

CREATE TABLE hashtags
(
    id         SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    title      VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE hashtags_posts
(
    id         SERIAL PRIMARY KEY,
    hashtag_id INTEGER NOT NULL REFERENCES hashtags (id) ON DELETE CASCADE,
    post_id    INTEGER NOT NULL REFERENCES posts (id) ON DELETE CASCADE,
    UNIQUE (post_id, hashtag_id)
);


CREATE TABLE followers
(
    id          SERIAL PRIMARY KEY,
    created_at  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    leader_id   INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    follower_id INTEGER NOT NULL REFERENCES users (id) ON DELETE CASCADE,
    UNIQUE (leader_id, follower_id)
); 