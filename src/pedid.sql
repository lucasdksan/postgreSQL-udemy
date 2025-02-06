create table pedido (
    idpedido integer not null,
    idclient integer not null,
    idtransoportadora integer,
    idvendedor integer not null,
    datapedido date not null,
    valor float not null
);