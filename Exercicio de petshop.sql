/*Recupere os tipos de serviços e valor, para os serviços que custam mais de R$50,00.(6 linhas retornadas)*/
use petshop;
select *
from servico s, tipo_servico t
where valor > 50;

/*Recupere o nome do animal juntamente com sua raça.(1008 linhas retornadas)*/

select a.nome, r.nome
from animal a, raca r
where a.raca = r.id;

/*Recupere todas as informações dos animais que possuem alto nível de cuidados.(375 linhas retornadas)*/

select a.*, r.nivel_cuidados
from animal a, raca r
where a.raca = r.id and r.nivel_cuidados = 'alto';

/*Recupere o nome do cliente
 e o tipo de serviço 
 que ele solicitou. 
 Traga apenas os serviços que ainda não foram pagos.(469 linhas retornadas)*/

select c.nome, t.tipo
from cliente c, servico s, animal a,tipo_servico t
where c.id = a.cliente and a.id = s.animal and s.pago ='0';

select*
from cliente,servico, tipo_servico;

select * from tipo_servico;