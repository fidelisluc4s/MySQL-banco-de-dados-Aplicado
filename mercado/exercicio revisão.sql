/*01: Traga todas as informações dos produtos que não foram vendidos. 
Utilize junção externa. */

create view visao1 as select *
from produto
left join venda on ID_PRODUTO = NR_VENDA
where nr_venda is null;

/*Traga todas as informações dos clientes que não efetuaram
 nenhuma compra. Utilize junção externa.
*/
create view visao2 as select *
from cliente c
left join venda v on c.ID_CLIENTE = v.ID_CLIENTE
where nr_venda is null;

/*Traga as informações do produto que possui maior quantidade
 em estoque.*/
 create view visao3 as select *
 from produto
 where estoque = (select max(estoque) from produto);
 
 /*Traga todas as informações, juntamente com preço do produto 
 que possui o menor valor*/
 
 select *
 from produto
 where PRECO_UNITARIO = (select min(preco_unitario) from produto);
 
 /*Recupere o número da venda e a quantidade de produtos que 
 foram vendidos por venda. Traga apenas as vendas que tiveram 
 mais de 5 produtos vendidos. Ordene da maior para menor 
 quantidade de produtos vendidos.*/ 
 select pv.nr_venda, sum(QUANTIDADE) as qnt_vendido
 from produto_vendido pv
 inner join venda v on pv.NR_VENDA = v.NR_VENDA
 group by v.NR_VENDA
 having qnt_vendido >5
 order by qnt_vendido desc;
 
 /*Traga o número da venda juntamente com a quantidade vendida.
Por exemplo: a venda 1000 vendeu 16 unidades
*/
select v.* , sum(quantidade)
from produto_vendido pv
inner join venda v on pv.nr_venda = v.nr_venda
group by v.nr_venda;

select *
from produto_vendido;

/*: Recupere as informações dos clientes e a quantidade
 de compras que eles efetuaram. Caso o cliente não tenha
 efetuado nenhuma compra, o valor 0 deverá ser mostrado na
 frente das informações do cliente.
*/
select c.*, count(v.id_cliente)
from cliente c
left join venda v on c.id_cliente = v.id_cliente
group by id_cliente;
 