<<<<<<< HEAD
/*QUESTÃO 01: Crie e exiba uma visão que recupere os nomes e sobrenome dos instrutores e o 
código das turmas que eles ministram. Ordene pelo nome do instrutor.(1008 linhas retornadas) */
create view instrutorr
as select i.nome, i.sobrenome, i.idinstrutor
=======
/*1*/
create view visao1 as 
select i.nome, i.sobrenome, i.idinstrutor
>>>>>>> 1c9859e72fd95d770065c9da307395e43949c215
from instrutor i
inner join turma t on i.idinstrutor = t.instrutor_idinstrutor
order by i.nome asc;

<<<<<<< HEAD

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
=======
/*2*/
create view visao2 as 
select i.*, count(*) as qdade_turmas
from instrutor i
inner join turma t on i.idinstrutor = t.instrutor_idinstrutor
group by i.idinstrutor
having count(*) > 2;

/*3*/
create view visao3 as
select a.nome, count(*)
>>>>>>> 1c9859e72fd95d770065c9da307395e43949c215
from atividade a
inner join turma t on t.atividade_idatividade = a.idatividade
group by a.idatividade
order by a.nome asc;


<<<<<<< HEAD
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
=======
/*4*/
create view visao4 as
select *
from aluno 
where aluno.numMatricula not in (select distinct aluno_matricula from matricula);

/*OU*/

>>>>>>> 1c9859e72fd95d770065c9da307395e43949c215
select a.*
from aluno a 
left join matricula m on a.numMatricula = m.aluno_matricula
where m.aluno_matricula is null;


/*5*/
create view visao5 as
select a.*, m.turma_idturma
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
order by a.nome;

<<<<<<< HEAD
/*Crie e exiba uma visão que recupere os dados dos alunos que praticam Pilates. (81 linhas retornadas)
*/
create view questao6 as select a.*
=======
/*6*/

create view visao6 as 
select a.*
>>>>>>> 1c9859e72fd95d770065c9da307395e43949c215
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Pilates';

<<<<<<< HEAD
/*Crie e exiba uma visão que recupere a quantidade de atividades que cada aluno pratica. (16730 linhas retornadas)
*/
select a.*, count(ati.idatividade)
=======
/*7*/
create view visao7 as
select a.*, count(*) as qta_atividade
>>>>>>> 1c9859e72fd95d770065c9da307395e43949c215
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
group by a.numMatricula; 


<<<<<<< HEAD
/*Crie e exiba uma visão que recupere a altura média dos alunos que praticam vôlei. (1 linha retornada)*/

select  a.*, ati.nome, avg(a.altura)
=======
/*8*/
create view visao8 as
select avg(a.altura)
>>>>>>> 1c9859e72fd95d770065c9da307395e43949c215
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Volei';
