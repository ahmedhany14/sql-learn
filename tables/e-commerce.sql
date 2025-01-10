CREATE TABLE eCommerceUsers
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name  VARCHAR
);

CREATE TABLE eCommerceProducts
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    department VARCHAR,
    price INTEGER,
    weight INTEGER
);

CREATE TABLE eCommerceOrders
(
    id         SERIAL PRIMARY KEY,
    user_id    INTEGER REFERENCES eCommerceUsers (id),
    product_id INTEGER REFERENCES eCommerceProducts (id),
    paid       BOOLEAN
);
