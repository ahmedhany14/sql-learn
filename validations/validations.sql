-- table without validation and how it effects on the database

CREATE TABLE withoutValidation
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    department VARCHAR(40),
    price INTEGER,
    weight INTEGER
);

-- insert normal values
insert into withoutValidation (name, department, price, weight)
values ('product1', 'dep1', 100, 10),
       ('product2', 'dep2', 200, 20),
       ('product3', 'dep3', 300, 30),
       ('product4', 'dep4', 400, 40),
       ('product5', 'dep5', 500, 50);

select * from withoutValidation;

-- insert null values

insert into withoutValidation (name, department, price, weight)
values ('product6', 'dep6', 600, NULL);

-- there is no error, and the row is inserted successfully
select * from withoutValidation;

-- to avoid this, we can add a check constraint to the weight column and add a not null constraint to the name column
-- delete the last row
delete from withoutValidation where weight is null;

ALTER TABLE withoutValidation ALTER COLUMN name SET NOT NULL;
ALTER TABLE withoutValidation ALTER COLUMN weight SET NOT NULL;
ALTER TABLE withoutValidation ALTER COLUMN price SET NOT NULL;
ALTER TABLE withoutValidation ALTER COLUMN name SET NOT NULL;
ALTER TABLE withoutValidation ALTER COLUMN department SET NOT NULL;

-- set default values for the price and weight columns
ALTER TABLE withoutValidation ALTER COLUMN price SET DEFAULT 0;
ALTER TABLE withoutValidation ALTER COLUMN weight SET DEFAULT 0;
ALTER TABLE withoutValidation ALTER COLUMN department SET DEFAULT 'no department';


-- set name as a unique column
ALTER TABLE withoutValidation ADD UNIQUE (name);

-- insert a row with the same name
insert into withoutValidation (name, department, price, weight)
values ('product1', 'dep1', 100, 10);


-- add a check constraint to the price and weight columns
ALTER TABLE withoutvalidation ADD CHECK ( price > 0);
ALTER TABLE withoutvalidation ADD CHECK ( weight > 0);