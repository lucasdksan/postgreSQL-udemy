create or replace function get_valor_pedido(idpdd integer) returns varchar(30) language plpgsq
$$
begin
    return (select pdd.valor from pedido pdd where pdd.idpedido = idpdd);
end;
$$

-- 

create or replace function get_maior_pedido() returns integer language plpgsql as 
$$
begin
    return (select idpdd from pedido where valor = (select max(valor) from pedido));
end;
$$

