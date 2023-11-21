/*1*/
select v.*
from vendedor v
left join pedido p on v.cod_vendedor = p.cod_vendedor
where p.cod_vendedor is null;

/*2*/

select c.*, count(c.cod_cliente) as qnt_pedidos
from cliente c
inner join pedido p on c.cod_cliente = p.cod_cliente
group by c.cod_cliente;



/*3*/
select p.Num_pedido, c.Nome_cliente, sum(valor_item)
from cliente c
inner join pedido p on c.cod_cliente = p.cod_cliente
inner join item_pedido ip on p.num_pedido = ip.num_pedido
group by p.num_pedido;

/*4*/
select descricao, sum(quantidade)
from produto p
inner join item_pedido ip on p.cod_produto = ip.cod_produto
group by p.cod_produto
having sum(quantidade) > 100;

/*5*/
select *
from produto 
where valor_unitario = (select max(Valor_unitario) from produto);


/*6*/
create view visao6 as
select c.*, p.Num_pedido
from cliente c 
left join pedido p on c.cod_cliente = p.cod_cliente;



