/*⦁	Recupere o nome e cpf do cliente que 
reservaram voos para no dia 22-05-2014*/
select c.nomecliente, c.cpf
from cliente c
inner join reserva r 
on c.codigocliente = r.codigocliente
where datareserva = '2014-05-22';

/*Recupere todos os dados das aeronaves 
que fizeram mais de 2 voos.*/

select a.*, count(numerovoo)
from aeronave a
inner join voo v on a.codigoaeronave = v.codigoaeronave
group by a.codigoaeronave
having count(numerovoo) > 2;



/*Recupere todos os dados do cliente que efetuou a 
reserva de maior preço*/

select c.*, max(r.preco)as maior_preco
from cliente c
inner join reserva r 
on c.codigocliente = r.codigocliente
group by r.codigocliente
order by maior_preco desc;

/*⦁	Recupere a média de preço dos voos que 
saem de Juiz de Fora.*/	

select avg(preco)
from cidade c 
inner join voo v on c.codigocidade = v.cidadeorigem
inner join reserva r on v.codigovoo = r.codigovoo
where nomecidade = 'juiz de fora';

/*⦁	Recupere os dados da aeronave que possui a menor 
capacidade.*/

select *
from aeronave
where capacidade = (select min(capacidade) from aeronave);

/*⦁	Recupere os dados de todos os clientes que reservaram 
voos de primeira classe.*/

select *
from cliente c
inner join reserva r on c.codigocliente = r.codigocliente
inner join assento a on r.numeroassento = a.numeroassento
where classe = 'primeira classe';

/*Recupere os dados dos assentos que não foram reservados. 
Use NOT IN.*/


select assento.*
from assento 
where numeroassento not in (select numeroassento from reserva);


/*⦁	Recupere o horário de saída dos voos com destino 
ao Rio de Janeiro.*/

select v.horariosaida, c.nomecidade
from voo v
inner join cidade c on v.cidadedestino = c.codigocidade
where nomecidade = 'rio de janeiro';

/*⦁	Recupere o prefixo, o fabricante e a quantidade de voos 
feitos por cada aeronave.*/

select *
from aeronave 
