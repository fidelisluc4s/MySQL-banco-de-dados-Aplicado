/*1) Recupere os dados dos carros que não participaram de nenhum acidente.*/
select c.*
from carro c 
left join participou p on c.placa = p.placa
group by c.placa
having count(p.numero_ocorrencia) = 0;

select c.*
from carro c left join participou p 
on c.placa = p.placa
where p.placa is null;


/*2) Recupere os dados do(s) carro(s) que teve(tiveram) o maior valor de dano, juntamente com o valor do dano.*/
select c.*, valor_dano
from carro c 
inner join participou p on c.placa = p.placa
where valor_dano = (select max(valor_dano) from participou);


/*3) Recupere os dados do(s) carro(s) que teve(tiveram) o menor valor de dano, juntamente com o valor do dano.*/
select c.*, valor_dano
from carro c 
inner join participou p on c.placa = p.placa
where valor_dano = (select min(valor_dano) 
from participou);

/*4) Recupere as informações do(s) carro(s) que participou(aram) do maior número de ocorrências.*/
select c.*, count(a.numero_ocorrencia) as maior_num_ocorrencia
from carro c 
inner join participou p on c.placa = p.placa
inner join acidente a on p.numero_ocorrencia = a.numero_ocorrencia
group by c.placa; 

select c.*, count(numero_ocorrencia)
from carro c inner join participou p 
on c.placa = p.placa
group by c.placa
having count(numero_ocorrencia)=
(select count(numero_ocorrencia) as qdade
from carro c inner join participou p 
on c.placa = p.placa
group by c.placa order by qdade desc limit 1);

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
select *
from carro
where ano = (select min(ano) from carro c 
inner join participou p on c.placa = p.placa);

/*8)Recuperar as informações do carro juntamente o valor total de danos que ele teve*/
select c.*, sum(valor_dano) as valor_total
from carro c inner join participou p 
on c.placa = p.placa
group by c.placa;




