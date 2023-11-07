/*1*/
create view instrutorr
as select i.nome, i.sobrenome, i.idinstrutor
from instrutor i
inner join turma t on i.idinstrutor = t.instrutor_idinstrutor
order by i.nome asc;

/*2*/
select i.nome, count(t.atividade_idatividade)
from instrutor i
left join turma t on i.idinstrutor = t.instrutor_idinstrutor
group by i.nome
having count(t.atividade_idatividade) > 3;

/*3*/
create view questao3
as select distinct a.nome
from atividade a
inner join turma t on t.atividade_idatividade = a.idatividade;

/*4*/
create view questao4
as select distinct aluno.*
from aluno 
where aluno.numMatricula not in (select distinct aluno_matricula from matricula);

/*5*/
create view questao5 as
select a.*
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma;

/*6*/
create view questao6 as select a.*
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Pilates';

/*7*/
select a.*, count(ati.idatividade)
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
group by a.numMatricula
having count(ati.idatividade) > 1; 


/*8*/

select  a.*, ati.nome, avg(a.altura)
from aluno a
inner join matricula m on a.numMatricula = m.aluno_matricula
inner join turma t on m.turma_idturma = t.idturma
inner join atividade ati on t.atividade_idatividade = ati.idatividade
where ati.nome = 'Volei'
group by a.numMatricula;