create table if not exists supplier (
    id integer not null,
    name VARCHAR(50) unique not null,
    constraint pk_frn_idSupplier PRIMARY key (id)
);

create table if not exists seller (
    id integer not null,
    name VARCHAR(50) unique not null,
    constraint pk_frn_idSeller PRIMARY key (id)
);

create table if not exists carrier (
    id SERIAL PRIMARY key,
    municipality VARCHAR(100) not null,
    name VARCHAR(50) not null unique,
    publicPlace VARCHAR(50),
    number VARCHAR(10)
);

create table if not exists product (
    id integer not null,
    idSupplier integer not null,
    name VARCHAR(50) unique not null,
    price numeric(10,2) not null,
    constraint pk_prd_id PRIMARY key (id),
    CONSTRAINT fk_prd_idSupplier FOREIGN KEY (idSupplier) REFERENCES supplier (idSupplier)
);