CREATE table if not exists nationality(
    idnationality SERIAL PRIMARY KEY,
    name VARCHAR(30) not null unique
);

insert into nationality (name) values ('Brasileira');