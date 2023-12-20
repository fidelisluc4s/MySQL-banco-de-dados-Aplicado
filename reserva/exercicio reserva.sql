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

select a.prefixo, a.fabricante, count(*) as qnt_voo
from aeronave a
inner join voo v on a.codigoaeronave = v.codigoaeronave
group by v.codigoaeronave
having count(*) > 2;

/*⦁	Recupere o valor total das reservas feitas para o 
voo de número CON-26.*/

select v.numerovoo, sum(preco)
from voo v
inner join reserva r on v.codigovoo = r.codigovoo
where numerovoo = "con-26"
group by numerovoo;

/*Recupere todos os dados dos clientes que efetuaram 
ou não alguma reserva, assim como o número da reserva.*/

select c.*, codigoreserva
from cliente c
left join reserva r on c.codigocliente = r.codigocliente;

/*Crie e exiba uma visão que recupere a média dos preços e a 
quantidade das reservas de assentos de classe econômica.*/
create view qnt_media_preco_assentos_economicos as
select a.*,avg(preco), count(*)
from reserva r
inner join assento a on r.numeroassento = a.numeroassento
where classe = "economica"
group by a.numeroassento;


/*	Crie um usuário no banco de dados e dê permissão de visualização
 apenas da visão criada no item anterior.*/ 

create user 'Piloto' identified by '123456';
grant select on reserva.qnt_media_preco_assentos_economicos to 'Piloto'@'%';

/*Crie uma trigger que reduza na tabela voo a quantidade de assentos 
livres quando uma inserção é feita na tabela reserva.*/

/*inserindo para teste*/
INSERT INTO voo (codigovoo, numerovoo, codigoaeronave, cidadeorigem,
 cidadedestino, horariosaida, horariochegada, assentosLivres) 
VALUES ('1010', 'CON-22', '1111', '2345', '1234', '04:11:00', '05:11:00', 
'100');

update voo 
set assentosLivres = assentosLivres -1
where codigovoo= '1000' and assentosLivres=-90;

delete from voo where codigovoo= '1000' and assentosLivres=90 limit 1;


DELIMITER $$
CREATE TRIGGER atualizaAssento AFTER INSERT ON reserva
FOR EACH ROW
BEGIN
	UPDATE voo SET assentosLivres = new-assentosLivres
    WHERE codigovoo = new.codigovoo;
END $$

drop trigger atualizaAssento;
