/*1)Recupere os tipos de serviços e valor, para os serviços que custam mais de R$50,00.(6 linhas retornadas)*/
use petshop;

select *
from servico s, tipo_servico t
where valor > 50;

/*2)Recupere o nome do animal juntamente com sua raça.(1008 linhas retornadas)*/

select a.nome, r.nome
from animal a, raca r
where a.raca = r.id;

/*3)Recupere todas as informações dos animais que possuem alto nível de cuidados.(375 linhas retornadas)*/

select a.*, r.nivel_cuidados
from animal a, raca r
where a.raca = r.id and r.nivel_cuidados = 'alto';

/*4) Recupere o nome do cliente e o tipo de serviço  que ele solicitou. Traga apenas os serviços que ainda não foram pagos.(469 linhas retornadas)*/

select c.nome, s.tipo_servico
from cliente c, servico s
where c.id = animal.cliente = a.id = s.animal = s.tipo_servico = tipo.id = tipo.pago is null;

select * from servico;

/*5) Recupere as informações das clientes, o nome e a raça dos animais que elas possuem e o tipo de serviço que foi realizado. Elimine os valores repetidos. (948 linhas retornadas)*/
select distinct c.*, a.nome,a.raca,s.tipo_servico
from cliente c, animal a, servico s
where c.id = a.cliente and a.id = s.animal;
