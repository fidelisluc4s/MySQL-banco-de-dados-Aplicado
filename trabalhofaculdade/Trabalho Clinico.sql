/*1)Selecione o nome, situação e nome do medicamento de todos os médicos ativos que prescreveram o medicamento mebendazol.*/
select m.nome_medico, m.situacao, me.nome_medicamento
from medico m, consulta c,prescricao p,medicamento me
where m.id_medico = c.id_medico 
and c.id_consulta = p.id_consulta 
and p.id_medicamento = me.id_medicamento 
and m.situacao = 'ativo' 
and me.nome_medicamento = 'mebendazol';


/*QUESTÃO 2(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL e álgebra relacional 
que contenha junção interna e contenha pelo menos 5 tabelas. */
/*2)Selecione o nome do médico, o nome do medicamento, a situação e o nome do paciente para todas as prescrições de medicamentos 
com o nome "Haloperidol" que os medico esteja ativos e que foram prescritas por médicos cujos nomes contêm o sobrenome "braga"*/

select m.nome_medico, me.nome_medicamento, m.situacao,pa.nome_paciente
from consulta c
inner join medico m on c.id_medico = m.id_medico
inner join prescricao p on  c.id_consulta = p.id_consulta
inner join medicamento me on  p.id_medicamento = me.id_medicamento
inner join paciente pa on c.id_paciente = pa.id_paciente
where m.nome_medico like '%braga%' and me.nome_medicamento = 'Haloperidol' and situacao = 'ativo';

/*QUESTÃO 3(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL 
que contenha uma subquery, utilize o operador in ou not in.*/

/*3)Selecione o nome e a situação dos médicos que estão na situação "transferido", cujos nomes possuem 
exatamente 7 caracteres e que não possuem consultas agendadas após 01/01/2016.*/

select nome_medico, situacao 
from medico
where situacao ='transferido' and nome_medico like '_______' and id_medico not in (select c.id_medico from consulta c
where data_consulta > '2016-01-01');

/*QUESTÃO 4(0,5 PONTO): Escreva o enunciado e a resolução de uma consulta em SQL que contenha uma função de agregação, 
junção de pelo menos 2 tabelas, utiliza o operador group by e a cláusula having.*/

/*4) Selecione o nome dos médicos ativos e a quantidade de consultas realizadas por cada um deles. 
Apenas os médicos que tenham realizado mais de uma consulta devem ser incluídos no resultado.*/

select m.nome_medico, count(c.id_consulta)as consulta
from medico m
inner join consulta c on m.id_medico = c.id_medico
where m.situacao = 'ativo'
group by m.nome_medico
having count(c.id_consulta) > 1;

