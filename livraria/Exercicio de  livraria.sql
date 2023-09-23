/*Recupere o nome e o ano de nascimento dos autores que ainda estão vivos.(10 linhas retornadas)*/
use livraria;

select a.nomeautor, a.anonascimento
from autor a
where anofalecimento is null;


/*Questão 2: Recupere todos os dados das editoras situadas no Rio de Janeiro e que foram fundadas a mais de 30 anos.(1 linha retornada)*/

select *
from editora 
where e.cidade = 'rio de janeiro' and anofundacao < date_sub(curdate(), interval 30 year);

/*select *, year(curdate()) - anofundacao
from editora
where year(curdate())-anofundacao > 30 and cidade = 'rio de janeiro'*/


/*Questão 3: Recupere todos os dados das editoras que publicaram livros que possuem o nome Sistema de Banco de Dados.(2 linhas retornadas)*/

select e.*, l.nomelivro
from editora e, livro l
where e.nomeeditora = l.nomeeditora and l.nomelivro = 'sistema de banco de dados';


/*Questão 4: Recupere o nome dos autores e o nome do livro que eles publicaram.(10 linhas retornadas)*/

select a.nomeautor, l.nomelivro
from autor a, livro l, autoria au
where a.numautor = au.numautor and au.numlivro = l.numlivro;

/*Questão 5: O nome do cliente e o nome do livro que ele comprou.(19 linhas retornadas)*/

select c.nomecli, l.nomelivro 
from cliente c, livro l, vendas v
where c.numcli = v.numcli and v.numlivro = l.numlivro;
