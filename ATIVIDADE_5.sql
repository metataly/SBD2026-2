INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal) 
VALUES (9999, 1, SYSDATE, 'ABERTA', 'LOJA');

UPDATE tb_venda 
SET status = 'PENDENTE' 
WHERE id_venda = 1;

INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) 
VALUES (1, 'SKU-TEMP-01', 'Produto Teste Negativo', -15.00);

ALTER TABLE tb_venda_item 
ADD CONSTRAINT ck_tb_item_desconto_max 
CHECK (desconto_item <= (preco_unit * 0.50));

ALTER TABLE tb_cliente 
ADD CONSTRAINT uq_tb_cliente_telefone UNIQUE (telefone);

DELETE FROM tb_venda WHERE id_venda = 1;

SELECT * FROM tb_venda_item WHERE id_venda = 1;

UPDATE tb_vendedor 
SET ativo = 'N' 
WHERE id_vendedor = 1;
