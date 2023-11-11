/*1*/
create view visao1 as 
select i.nome, i.sobrenome, i.idinstrutor
from instrutor i
inner join turma t on i.idinstrutor = t.instrutor_idinstrutor
order by i.nome asc;

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
from atividade a
inner join turma t on t.atividade_idatividade = a.idatividade
group by a.idatividade
order by a.nome asc;


/*4*/
create view visao4 as
select *
from aluno 
where aluno.numMatricula not in (select distinct aluno_matricula from matricula);

/*OU*/

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

/*6*/

create view visao6 as 
select a.*
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Pilates';

/*7*/
create view visao7 as
select a.*, count(*) as qta_atividade
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
group by a.numMatricula; 


/*8*/
create view visao8 as
select avg(a.altura)
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Volei';
