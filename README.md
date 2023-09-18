# Banco-de-Dados
Junção na cláusula where 



QUESTÃO 01: Liste o nome do animal e de seus cuidadores (60 linhas retornadas).
Rascunho:
Colunas(/select): nome, nome
Condição(/where): -
Tabelas(/from): animais, empregados
Condição de junção(/where): idcuidador = idempregado

animais.nome, empregado.nome(idcuidador = idempregado(animaisempregados))

select a.nome, e.nome
from animais a, empregados e
where a.idcuidador = e.idempregado;


QUESTÃO 02: Liste os nomes de todos os clientes que também são provedores(4 linhas retornadas).
Rascunho:
Colunas(/select): nome
Condição(/where): -
Tabelas(/from): clientes, provedores
Condição de junção(/where): idcliente= idcliente

cliente.nome(clientes.idcliente = provedores.idcliente (clientesprovedores))

select c.nome
from clientes c, provedores p
where c.idcliente = p.idcliente;

QUESTÃO 03: Liste o nome e data de saída dos animais que saíram do zoológico por falecimento(2 linhas retornadas).
Colunas(/select): nome , data de saida
Condição(/where): descricao ='Falecimento'
Tabelas(/from): clientes, provedores
Condição de junção(/where): a.idAnimal = e.idAnima


cliente.nome,cliente.dataSaida, eventoanimais.descricao(a.idAnimal = e.idAnimal (clienteseventoanimais))


select a.nome, a.dataSaida, e.descricao 
from animais a, eventoanimais e
where a.idAnimal = e.idAnimal and descricao ='Falecimento';




QUESTÃO 04: Liste os nomes dos animais, a data de nascimento, o nome do seu cuidador e a descrição da medicação que tomou. (60 linhas retornadas).
Colunas(/select): nome , dataNascimento,nome,descricao
Condição(/where): descricao ='Falecimento'
Tabelas(/from): animais a, empregados e, medicacao m 
Condição de junção(/where): a.idCuidador = e.idEmpregado = m.idMedicacao

a.nome,a.dataNascimento, e.nome,mdescricao(a.idCuidador = e.idEmpregado= m.idMedicacao (animais eventoanimais X medicacao ))


select a.nome, a.dataNascimento, e.nome, m.descricao
from animais a, empregados e, medicacao m
where a.idCuidador = e.idEmpregado = m.idMedicacao;


QUESTÃO 05: Recupere os dados de todos os animais carnívoros que ainda estão no zoológico (17 linhas retornadas).
Colunas(/select): animais *, ordem
Condição(/where): ordem ='carnivora' and a.dataSaida is null'
Tabelas(/from): animais a, especies e 
Condição de junção(/where): a.idEspecie = e.idEspecie

a.*, e.ordem(a.idEspecie = e.idEspecie and ordem ='carnivora' and a.dataSaida is null(animais especies  ))

select a.*, e.ordem
from animais a, especies e
where a.idEspecie = e.idEspecie and ordem ='carnivora' and a.dataSaida is null;


QUESTÃO 06: Liste o nome e a espécie dos animais que fizeram translado                                                                   (2 linhas retornadas).
Colunas(/select): nome, nomeComum,descricao,descricao
Condição(/where): descricao = 'translado';
Tabelas(/from): animais a, especies e, tipoeventos t, eventoanimais ev
Condição de junção(/where): ev.tipoEvento = t.idTipo

a.nome, e.nomeComum, t.descricao, ev.descricao(ev.tipoEvento = t.idTipo and descricao = 'translado'(animaisespecies x tipoeventos x eventoanimais    ))

select a.nome, e.nomeComum, t.descricao, ev.descricao
from animais a, especies e, tipoeventos t, eventoanimais ev
where ev.tipoEvento = t.idTipo and descricao = 'translado';










QUESTÃO 07: Recupere o nome e estoque do produto fornecido pelas ongs, assim como o nome dos clientes que fazem parte dessas ongs (2 linhas retornadas).

Colunas(/select): nome, nome,descricao
Condição(/where): c.idCliente and descricao='ong', s.idTipoSociedade and descricao ='ong'
Tabelas(/from): clientes c, produtos p, sociedades s, provedores pr
Condição de junção(/where): c.idCliente and descricao='ong' and pr.idCliente = p.idProduto and c.tipoSociedade = s.idTipoSociedade and descricao ='ong';

c.nome, p.nome, s.descricao(clientes c, produtos p, sociedades s, provedores pr(clientes  produtos  x sociedades x provedores  ))

select c.nome, p.nome, s.descricao
from clientes c, produtos p, sociedades s, provedores pr
where c.idCliente and descricao='ong' and pr.idCliente = p.idProduto and c.tipoSociedade = s.idTipoSociedade and descricao ='ong';

