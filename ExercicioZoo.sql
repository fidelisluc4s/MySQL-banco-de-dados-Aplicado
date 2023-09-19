/*Liste o nome do animal e de seus cuidadores.*/
use zoo;

select *
from animais, empregados;

select a.nome,  e.nome 
from animais a, empregados e
where a.idCuidador= e.idEmpregado;


/*Liste os nomes de todos os clientes que também são provedores(4 linhas retornadas).*/

select c.nome
from clientes c, provedores p
where c.idCliente = p.idCliente;

/*Liste o nome e data de saída dos animais que saíram do zoológico por falecimento(2 linhas retornadas).*/

select a.nome, a.dataSaida, e.descricao 
from animais a, eventoanimais e
where a.idAnimal = e.idAnimal and descricao ='Falecimento';

select *
from eventoanimais;
/*Liste os nomes dos animais, a data de nascimento, o nome do seu cuidador e a descrição da medicação que tomou. (60 linhas retornadas).*/

select a.nome, a.dataNascimento, e.nome, m.descricao
from animais a, empregados e, medicacao m
where a.idCuidador = e.idEmpregado = m.idMedicacao;

/*Recupere os dados de todos os animais carnívoros que ainda estão no zoológico (17 linhas retornadas).*/

select a.*, e.ordem
from animais a, especies e
where a.idEspecie = e.idEspecie and ordem ='carnivora' and a.dataSaida is null;

select *
from eventoanimais;

/*Liste o nome e a
 espécie dos animais
 que fizeram translado (2 linhas retornadas).*/

select a.nome, e.nomeComum
from animais a, especies e, eventoanimais ev, tipoeventos t
where t.descricao='Translado' and a.idEspecie = e.idEspecie 
and a.idAnimal = ev.idAnimal and ev.tipoevento = t.idTipo;

/*Recupere o nome
 e estoque do produto fornecido pelas ongs,
 assim como o nome dos clientes
 que fazem parte dessas ongs (2 linhas retornadas).*/

select c.nome, p.nome, s.descricao
from clientes c, produtos p, sociedades s, provedores pr
where c.idCliente and descricao='ong' and  pr.idCliente = p.idProduto and c.tipoSociedade = s.idTipoSociedade and descricao ='ong';

select * from produtos;