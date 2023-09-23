/*1) Recupere o parentesco dos dependentes. Elimine as linhas duplicadas.*/

select distinct parentesco
from dependente d;

/*2) Recupere o nível de graduação dos cargos. Elimine as linhas duplicadas.*/

select distinct nivel_graduacao
from cargo;

/*3) Recupere os nomes e o sexo de todos os empregados lotados no departamento 306 cujos nomes contêm a letra “a” ordenados alfabeticamente.*/

select e.nome, e.sexo, d.codigo_dep, d.nome_dep
from empregado e, departamento d
where e.nome like 'a%' and d.codigo_dep = 306 and e.codigo_dep = d.codigo_dep;

/*4) Recupere a data de nascimento e o nome de todos os empregados do sexo feminino ordenados por data de nascimento descendentemente.*/

select e.nome, e.data_nasc, e.sexo
from empregado e
where e.sexo = 'f'
order by e.data_nasc;

/*5) Recupere o nome dos empregados não que tem dependente. Use NOT IN.*/

select nome
from empregado
where codigo_empregado not in (select codigo_empregado from dependente);

/*6) Recupere todas as informações do(s) empregado(s) que não trabalham no Rio de Janeiro. Use NOT IN.*/

select *
from empregado e 
where e.codigo_dep not in (select codigo_dep from departamento where  cidade = 'rio de janeiro') ;

/*7) Recupere o nome dos cargos que estão ocupados por algum empregado. Use IN.*/

select c.nome_cargo
from cargo c
where c.codigo_cargo not in(select codigo_cargo from empregado where codigo_cargo is not null);
