select m.nome_medico, m.situacao, me.nome_medicamento
from medico m
inner join consulta c on m.id_medico = c.id_medico
inner join prescricao p on c.id_consulta = p.id_consulta
inner join medicamento me on p.id_medicamento = me.id_medicamento
where m.situacao = 'ativo' and me.nome_medicamento = 'mebendazol';
/* Enunciado: Selecione o nome dos produtos, a quantidade em estoque e o nome do fornecedor dos
 produtos que foram vendidos nos últimos 3 meses, ordenados pelo nome do produto em ordem alfabética.*/
/*Selecione o nome do médico ativos, nome dos pacientes que foram consultado pelo esses médico no 
prazo de 1 ano e os tipos de medicamento que foram-lhe receitados. */




/*QUESTÃO 1(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL e álgebra relacional que 
contenha junção na cláusula where com pelo menos 4 tabelas.*/
/*Selecione o nome, situação e nome do medicamento de todos os médicos ativos que prescreveram o medicamento mebendazol.*/
select m.nome_medico, m.situacao, me.nome_medicamento
from medico m, consulta c,prescricao p,medicamento me
where m.id_medico = c.id_medico and c.id_consulta = p.id_consulta and p.id_medicamento = me.id_medicamento and
m.situacao = 'ativo' and me.nome_medicamento = 'mebendazol';


/*QUESTÃO 2(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL e álgebra relacional 
que contenha junção interna e contenha pelo menos 5 tabelas. */
/*Selecione o nome do paciente, o nome da cidade e o nome do país para as consultas em que o nome do paciente 
contém o sobrenome braga e o país e more no Brasil, sem repetições.*/

select distinct p.nome_paciente, ci.nome_cidade, pa.nome_pais
from consulta c
inner join cidade ci on c.id_cidade = ci.id_cidade
inner join paciente p on ci.id_cidade = p.id_cidade
inner join pais pa on p.id_pais = pa.id_pais
inner join estado e on pa.id_pais = e.id_pais
where p.nome_paciente like '%braga%' and pa.nome_pais like 'brasil';

/*QUESTÃO 3(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL 
que contenha uma subquery, utilize o operador in ou not in.*/
/*Selecione o nome e a situação dos médicos que estão na situação "transferido", cujos nomes possuem 
exatamente 7 caracteres e que não possuem consultas agendadas após 01/01/2016.*/

select distinct nome_medico, situacao 
from medico
where situacao ='transferido' and nome_medico like '_______' and id_medico not in (
select c.id_medico
from consulta c
where data_consulta > '2016-01-01');


/*QUESTÃO 4(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL que contenha uma função de agregação, 
junção de pelo menos 2 tabelas, utiliza o operador group by e a cláusula having.*/


select m.nome_medico, count(c.id_consulta)as consulta
from medico m
inner join consulta c on m.id_medico = c.id_medico
inner join prescricao p on c.id_consulta = p.id_consulta
where m.situacao = 'ativo'
group by m.nome_medico
having count(c.id_consulta) > 2;

select *
from pais;
select p.nome_paciente, count(p.id_pais)
from paciente p
inner join pais pa on p.id_pais = pa.id_pais
group by p.nome_paciente
having count(pa.nome_pais) = 'brasil';