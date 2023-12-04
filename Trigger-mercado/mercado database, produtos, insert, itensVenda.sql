CREATE DATABASE mercado;
USE mercado;
CREATE TABLE produtos(
	referencia VARCHAR(3) PRIMARY KEY,
	descricao  VARCHAR(50),
	estoque	   INT NOT NULL DEFAULT 0
);

INSERT INTO produtos VALUES
('004','Feijão',10),
('005','Arroz',5),
('006','Fubá',15);

CREATE TABLE itensVenda(
	venda int primary key,
    produto varchar(3),
    quantidade int,
    constraint fk_produto_venda foreign key(produto) references produtos(referencia) on delete cascade on update cascade
);
