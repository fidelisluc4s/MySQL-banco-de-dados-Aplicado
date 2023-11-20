/*QUESTÃO 01: Crie e exiba uma visão que recupere os nomes e sobrenome dos instrutores e o 
código das turmas que eles ministram. Ordene pelo nome do instrutor.(1008 linhas retornadas) */
create view instrutorr
as select i.nome, i.sobrenome, i.idinstrutor
from instrutor i
inner join turma t on i.idinstrutor = t.instrutor_idinstrutor
order by i.nome asc;


    SELECT 
        i.i.idinstrutor ,
        i.nome,
        COUNT(t.id) AS qtd_turmas
    FROM
        instrutor i
            JOIN
        aulas a ON i.id = a.id_instrutor
            JOIN
        turmas t ON a.id_turma = t.id
    GROUP BY i.id
    HAVING qtd_turmas > 2;

/*Crie e exiba uma visão que recupere os dados dos instrutores que dão aula para mais de 2 turmas. (47 linhas retornadas)
*/
select i.idinstrutor, i.nome, count(i.idinstrutor)
from instrutor i
left join turma t on i.idinstrutor = t.instrutor_idinstrutor
group by i.idinstrutor
having i.idinstrutor > 2;

/*Crie e exiba uma visão que recupere os nomes das atividades com a quantidade de turmas 
que a praticam. Ordene pelo nome da atividade. (40 linhas retornadas)
*/
create view questao3
as select distinct a.nome
from atividade a
inner join turma t on t.atividade_idatividade = a.idatividade;

/*Crie e exiba uma visão que recupere os dados dos alunos não matriculados. (14247 linhas retornadas)
*/
create view questao4
as select distinct aluno.*
from aluno 
where aluno.numMatricula not in (select distinct aluno_matricula from matricula);

/*Crie e exiba uma visão que recupere os dados dos alunos e os códigos das turmas que eles participam. 
Ordene pelo nome do aluno. (2656 linhas retornadas)
*/
create view questao5 as
select a.*
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma;

/*Crie e exiba uma visão que recupere os dados dos alunos que praticam Pilates. (81 linhas retornadas)
*/
create view questao6 as select a.*
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Pilates';

/*Crie e exiba uma visão que recupere a quantidade de atividades que cada aluno pratica. (16730 linhas retornadas)
*/
select a.*, count(ati.idatividade)
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
group by a.numMatricula
having count(ati.idatividade) > 1; 


/*Crie e exiba uma visão que recupere a altura média dos alunos que praticam vôlei. (1 linha retornada)*/

select  a.*, ati.nome, avg(a.altura)
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Volei'
group by a.numMatricula;