DELIMITER $$
CREATE TRIGGER atualizaEstoque AFTER INSERT ON itensvenda
FOR EACH ROW
BEGIN
	UPDATE produtos SET estoque = estoque-new.quantidade
    WHERE new.produto = referencia;
END $$

DELIMITER $$
CREATE TRIGGER devolveEstoque BEFORE DELETE ON itensvenda
FOR EACH ROW
BEGIN
	UPDATE produtos set estoque = estoque+old.quantidade
    where old.produto = referencia;
END
$$

insert into itensvenda values(7,'004',3),(5,'005',1),(6,'006',5);

delete from itensvenda where venda=4;