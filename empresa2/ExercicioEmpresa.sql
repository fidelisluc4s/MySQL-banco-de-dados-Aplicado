/*Recuperar o primeiro nome, sobrenome e salário dos funcionários que trabalham no departamento 
de pesquisa e que ganham entre 30000 e 40000.*/
select pnome, unome, salario
from funcionario, departamento
where dnr = dnumero and dnome='Pesquisa' and salario between 30000 and 40000;

/*Recupere o nome dos departamentos que não possuem gerente*/
select dnome
from departamento
where cpf_gerente is null;

/*Recupere o nome, sobrenome e cpf do supervisor para todos os funcionários que tenham supervisor*/

select f.pnome, f.unome, f.cpf_supervisor 
from funcionario f
where cpf_supervisor is not null;

/*Recupere o nome e o número do departamento dos funcionários que trabalham nos departamentos 5,4 ou 1*/

select pnome, dnr
from funcionario
where dnr in (5,4,1);

/**/