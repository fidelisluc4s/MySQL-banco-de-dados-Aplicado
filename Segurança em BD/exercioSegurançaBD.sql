/*Considere que você é um administrador de banco de dados e possui o controle das seguintes bases de dados:
Hospital
Sistema Bancário
Locadora
Livraria
*/


/*Crie o usuário administrador e admin e conceda a eles todas as permissões, como o usuário root. 
Incluindo a permissão de GRANT. Faça login com o usuário administrador e realize as seguintes operações.*/


select * from mysql.user;

create user 'Lucas B. Fidelis' identified by '123456789';

grant all on *.* to 'Lucas B. Fidelis' with grant option;

show grants for 'Lucas B. Fidelis';

/*Uma nova recepcionista foi contratada no hospital, sendo assim, crie o usuário recepcionista e conceda 
a ela permissões de visualizar, incluir, atualizar os registros das tabelas paciente, médico e doença e diagnóstico.*/

create user 'Usuario_recepcionista' identified by '123456789';

/*Um funcionário foi promovido para o cargo de gerente do banco, sendo assim, conceda a ele todas as permissões do 
banco de dados sistema bancário.*/

grant all on *.* to 'Lucas B. Fidelis' with grant option;

/*Um novo aluno entrou no sistema livraria e deseja consultar os livros disponíveis para compra. Conceda ao usuário 
aluno permissões para acessar a tabela estoque, livros e vendas.*/

create user 'aluno' identified by '123456789';


grant select on livraria.livro to 'aluno'@'%';
grant select on livraria.vendas to 'aluno'@'%';

/*Crie o usuário  locatário e conceda a ele permissão para acessar as colunas titulo, sinopse e duração da tabela 
filme do banco de dados locadora.*/

create user 'cliente' identified by '123456789';

grant select (titulo, duracao) on locadora.filme to 'cliente'@'%';







/*Mostrando tabela e coluna de usuarios com permiçç~es*/
select * from mysql.user;
/*Criando usuario no host*/
create user 'Lucas B. Fidelis' identified by '123456789';

/*criar no localhost*/
create user LucasBFidelis@localhost identified by '123456789';

/*Ver permissões do usuarios*/
show grants for 'Lucas B. Fidelis';

/*Dando privilegio de select das colunas CPF e DATANASC*/
grant select(cpf,datanasc) on hospital.paciente to 'Lucas B. Fidelis';

/*Dando todos os privilegio para o novo_usuário. Obs novo usuário com privilégios de root*/
grant all on *.* to 'Lucas B. Fidelis' with grant option;

/*Retirando os privilégios do usuario root*/
revoke all privileges on *.* from root@localhost;

/*Dando novamento todos os privilégios para o root*/
grant all privileges on *.* to root@localhost with grant option;

/*Retirando todos os privilégios do Lucas*/
revoke all privileges on *.* from 'Lucas B. Fidelis';

/*Eliminando usuario no localhost*/
drop user 'LucasBFidelis'@'localhost'; 

/*Atualizar os privilégios que estão em memória.*/
flush privileges;



