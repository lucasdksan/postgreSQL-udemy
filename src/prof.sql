CREATE TABLE IF NOT EXISTS profession (
    idprofession SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL unique
);

insert into profession (name) values ('Engenheiro');