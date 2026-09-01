ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- ---------------------------------------------------------------------
-- 1. POPULANDO TB_CATEGORIA
-- ---------------------------------------------------------------------
INSERT INTO tb_categoria (nome) VALUES ('Tecnologia e Informática');
INSERT INTO tb_categoria (nome) VALUES ('Eletrodomésticos');
INSERT INTO tb_categoria (nome) VALUES ('Móveis e Decoração');
INSERT INTO tb_categoria (nome) VALUES ('Papelaria e Escritório');
INSERT INTO tb_categoria (nome) VALUES ('Esporte e Lazer');

-- ---------------------------------------------------------------------
-- 2. POPULANDO TB_CLIENTE
-- ---------------------------------------------------------------------
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Ana Silva', 'ana.silva@email.com', '12345678901', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Bruno Santos', 'bruno.santos@email.com', '23456789012', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Carlos Oliveira', 'carlos.oliveira@email.com', '34567890123', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Daniela Lima', 'daniela.lima@email.com', '45678901234', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Eduardo Pereira', 'eduardo.pereira@email.com', '56789012345', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Fernanda Souza', 'fernanda.souza@email.com', '67890123456', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Gabriel Costa', 'gabriel.costa@email.com', '78901234567', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Helena Rodrigues', 'helena.rodrigues@email.com', '89012345678', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Igor Alves', 'igor.alves@email.com', '90123456789', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Juliana Martins', 'juliana.martins@email.com', '01234567890', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Lucas Ribeiro', 'lucas.ribeiro@email.com', '11223344556', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Mariana Carvalho', 'mariana.carvalho@email.com', '22334455667', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Nicolas Gomes', 'nicolas.gomes@email.com', '33445566778', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Olivia Pinto', 'olivia.pinto@email.com', '44556677889', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Pedro Rocha', 'pedro.rocha@email.com', '55667788990', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Rafaela Barbosa', 'rafaela.barbosa@email.com', '66778899001', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Samuel Teixeira', 'samuel.teixeira@email.com', '77889900112', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Tatiana Castro', 'tatiana.castro@email.com', '88990011223', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Vinicius Melo', 'vinicius.melo@email.com', '99001122334', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Yasmin Cardoso', 'yasmin.cardoso@email.com', '00112233445', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Andreia Santos', 'andreia.santos@email.com', '12312312312', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Caio Ferreira', 'caio.ferreira@email.com', '45645645645', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Letícia Neves', 'leticia.neves@email.com', '78978978978', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Rodrigo Dias', 'rodrigo.dias@email.com', '98798798798', 'S');
INSERT INTO tb_cliente (nome, email, cpf, ativo) VALUES ('Camila Fonseca', 'camila.fonseca@email.com', '65465465465', 'S');

-- ---------------------------------------------------------------------
-- 3. POPULANDO TB_VENDEDOR
-- ---------------------------------------------------------------------
INSERT INTO tb_vendedor (nome, email, ativo) VALUES ('Marcos Pontes', 'marcos.pontes@vendas.com', 'S');
INSERT INTO tb_vendedor (nome, email, ativo) VALUES ('Patricia Ramos', 'patricia.ramos@vendas.com', 'S');
INSERT INTO tb_vendedor (nome, email, ativo) VALUES ('Roberto Carlos', 'roberto.carlos@vendas.com', 'S');
INSERT INTO tb_vendedor (nome, email, ativo) VALUES ('Sandra Alencar', 'sandra.alencar@vendas.com', 'S');
INSERT INTO tb_vendedor (nome, email, ativo) VALUES ('Thiago Silva', 'thiago.silva@vendas.com', 'S');
INSERT INTO tb_vendedor (nome, email, ativo) VALUES ('Regina Duarte', 'regina.duarte@vendas.com', 'S');

-- ---------------------------------------------------------------------
-- 4. POPULANDO TB_PRODUTO
-- ---------------------------------------------------------------------
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (1, 'PROD-NOTE-01', 'Notebook Gamer Core i7 16GB', 4500.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (1, 'PROD-MOU-02', 'Mouse Sem Fio Ergonômico', 120.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (1, 'PROD-KEY-03', 'Teclado Mecânico RGB', 250.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (1, 'PROD-MON-04', 'Monitor UltraWide 29 polegadas', 1100.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (2, 'PROD-GEL-05', 'Geladeira Frost Free 400L', 3200.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (2, 'PROD-MIC-06', 'Micro-ondas Digital 30L', 650.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (2, 'PROD-AIR-07', 'Fritadeira Elétrica Airfryer', 450.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (2, 'PROD-LIQ-08', 'Liquidificador 1200W', 180.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (3, 'PROD-CAD-09', 'Cadeira de Escritório Presidente', 850.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (3, 'PROD-MES-10', 'Mesa de Escritório em L', 450.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (3, 'PROD-SOF-11', 'Sofá Retrátil 3 Lugares', 1900.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (3, 'PROD-EST-12', 'Estante para Livros Multiuso', 350.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (4, 'PROD-AGE-13', 'Agenda Executiva 2026', 45.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (4, 'PROD-CAN-14', 'Kit Canetas Coloridas Gel (12 un)', 35.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (4, 'PROD-RES-15', 'Resma de Papel A4 500 fls', 28.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (4, 'PROD-ORG-16', 'Organizador de Mesa Acrílico', 60.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (5, 'PROD-BIK-17', 'Bicicleta Aro 29 Alumínio 21M', 1500.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (5, 'PROD-TAP-18', 'Tapete de Yoga Antiderrapante', 80.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (5, 'PROD-GAR-19', 'Garrafa Térmica Esportiva 750ml', 95.00);
INSERT INTO tb_produto (id_categoria, sku, nome, preco_unit) VALUES (5, 'PROD-BOC-20', 'Bola de Futebol Oficial', 120.00);

-- ---------------------------------------------------------------------
-- 5. POPULANDO TB_VENDA E TB_VENDA_ITEM
-- ---------------------------------------------------------------------

-- Venda 1
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (21, 2, TO_DATE('2026-05-17', 'YYYY-MM-DD'), 'FECHADA', 'SITE', 1476.50);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (1, 13, 3, 45.00, 0);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (1, 9, 1, 850.00, 15);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (1, 18, 2, 80.00, 0);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (1, 8, 3, 180.00, 15);

-- Venda 2
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (7, 6, TO_DATE('2026-05-08', 'YYYY-MM-DD'), 'ABERTA', 'TELEFONE', 12099.00);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (2, 5, 3, 3200.00, 15);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (2, 9, 3, 850.00, 10);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (2, 20, 3, 120.00, 10);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (2, 8, 2, 180.00, 0);

-- Venda 3
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (5, 5, TO_DATE('2026-05-07', 'YYYY-MM-DD'), 'FECHADA', 'APP', 8640.00);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (3, 5, 3, 3200.00, 10);

-- Venda 4
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (20, 1, TO_DATE('2026-04-09', 'YYYY-MM-DD'), 'CANCELADA', 'TELEFONE', 11425.50);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (4, 17, 3, 1500.00, 0);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (4, 9, 3, 850.00, 5);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (4, 18, 3, 80.00, 5);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (4, 1, 1, 4500.00, 5);

-- Venda 5
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (14, 2, TO_DATE('2026-04-27', 'YYYY-MM-DD'), 'ABERTA', 'APP', 3150.00);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (5, 17, 1, 1500.00, 15);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (5, 6, 3, 650.00, 10);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (5, 20, 1, 120.00, 0);

-- Venda 6
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (18, 5, TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'FECHADA', 'LOJA', 2090.00);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (6, 4, 2, 1100.00, 5);

-- Venda 7
INSERT INTO tb_venda (id_cliente, id_vendedor, dt_venda, status, canal, valor_liquido) 
VALUES (8, 1, TO_DATE('2026-03-03', 'YYYY-MM-DD'), 'FECHADA', 'APP', 3747.75);

INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (7, 3, 3, 250.00, 30);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (7, 18, 1, 80.00, 10);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (7, 5, 1, 3200.00, 10);
INSERT INTO tb_venda_item (id_venda, id_produto, quantidade, valor_unit, percentual_desconto) VALUES (7, 19, 3, 95.00, 5);

COMMIT;
