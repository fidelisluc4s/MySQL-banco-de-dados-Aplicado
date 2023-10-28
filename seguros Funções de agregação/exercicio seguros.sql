/*1) Recupere os dados dos carros que não participaram de nenhum acidente.*/
select c.*
from carro c 
left join participou p on c.placa = p.placa
group by c.placa
having count(p.numero_ocorrencia) = 0;


/*2) Recupere os dados do(s) carro(s) que teve(tiveram) o maior valor de dano, juntamente com o valor do dano.*/
select c.*, max(valor_dano) as maior_dano
from carro c
inner join participou p on c.placa = p.placa
group by p.placa;


/*3) Recupere os dados do(s) carro(s) que teve(tiveram) o menor valor de dano, juntamente com o valor do dano.*/
select c.*, min(valor_dano) as menor_dano
from carro c
inner join participou p on c.placa = p.placa
group by p.placa
order by min(valor_dano) asc
limit 1;

/*4) Recupere as informações do(s) carro(s) que participou(aram) do maior número de ocorrências.*/
select c.*, count(a.numero_ocorrencia) as maior_num_ocorrencia
from carro c 
inner join participou p on c.placa = p.placa
inner join acidente a on p.numero_ocorrencia = a.numero_ocorrencia
group by c.placa; 

/*5) Recupere a soma, a média, o valor mínimo e o valor máximo do valor do dano ocasionado por cada veículo.*/
select c.*, sum(p.valor_dano) as soma_valor_dano, avg((p.valor_dano))as media_valor_dano, 
min(p.valor_dano)as minimo_valor_dano, max(p.valor_dano) as maximo_valor_dano
from carro c
inner join participou p on c.placa = p.placa
inner join acidente a on p.numero_ocorrencia = a.numero_ocorrencia
group by c.placa
order by c.ano asc;


/*6) Recupere todos as informações do acidente mais antigo.*/
select *
from acidente 
where data = (select min(data) from acidente)
limit 1;

/*7) Recuperar os dados do carro mais antigo que se envolveu em algum acidente.*/
select c.*
from carro c
inner join participou p on c.placa = p.placa
inner join acidente a on p.numero_ocorrencia = a.numero_ocorrencia
where data = (select min(data) from acidente);




