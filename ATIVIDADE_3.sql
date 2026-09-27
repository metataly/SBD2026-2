-- ============================================================
-- ATIVIDADE 3 - SQL AVANÇADO E ANÁLISE COMERCIAL
-- SISTEMA DE VENDAS E ANÁLISE COMERCIAL
-- ============================================================

SELECT
    ven.nome AS vendedor,
    SUM(v.valor_liquido) AS total_vendido
FROM tb_vendedor ven
JOIN tb_venda v
    ON ven.id_vendedor = v.id_vendedor
WHERE v.status = 'FECHADA'
GROUP BY ven.nome
ORDER BY total_vendido DESC;

SELECT
    c.nome AS cliente,
    v.dt_venda,
    v.valor_liquido,
    v.status
FROM tb_cliente c
JOIN tb_venda v
    ON c.id_cliente = v.id_cliente
ORDER BY c.nome, v.dt_venda;

SELECT
    c.nome AS cliente,
    SUM(v.valor_liquido) AS faturamento_total
FROM tb_cliente c
JOIN tb_venda v
    ON c.id_cliente = v.id_cliente
WHERE v.status = 'FECHADA'
GROUP BY c.nome
ORDER BY faturamento_total DESC
FETCH FIRST 1 ROWS ONLY;

SELECT
    id_venda,
    dt_venda,
    valor_liquido
FROM tb_venda
WHERE status = 'FECHADA'
AND valor_liquido > (
    SELECT AVG(valor_liquido)
    FROM tb_venda
    WHERE status = 'FECHADA'
);


SELECT
    p.nome
FROM tb_produto p
WHERE p.ativo = 'S'
AND NOT EXISTS (
    SELECT 1
    FROM tb_venda_item i
    WHERE i.id_produto = p.id_produto
);


SELECT
    c.nome,
    SUM(v.valor_liquido) AS faturamento,
    CASE
        WHEN SUM(v.valor_liquido) > 10000 THEN 'Ouro'
        WHEN SUM(v.valor_liquido) >= 2000 THEN 'Prata'
        ELSE 'Bronze'
    END AS categoria_cliente
FROM tb_cliente c
JOIN tb_venda v
    ON c.id_cliente = v.id_cliente
WHERE v.status = 'FECHADA'
GROUP BY c.nome;


WITH receita_mensal AS (
    SELECT
        TRUNC(dt_venda, 'MM') AS mes_ref,
        SUM(valor_liquido) AS receita
    FROM tb_venda
    WHERE status = 'FECHADA'
    GROUP BY TRUNC(dt_venda, 'MM')
)
SELECT
    mes_ref,
    receita
FROM receita_mensal
ORDER BY mes_ref;

WITH qtd_produto AS (
    SELECT
        p.nome AS produto,
        SUM(i.quantidade) AS total_vendido
    FROM tb_produto p
    JOIN tb_venda_item i
        ON p.id_produto = i.id_produto
    GROUP BY p.nome
)
SELECT
    produto,
    total_vendido
FROM qtd_produto
ORDER BY total_vendido DESC
FETCH FIRST 5 ROWS ONLY;

SELECT
    nome,
    email,
    telefone
FROM tb_cliente
WHERE ativo = 'S'
ORDER BY nome;

SELECT
    id_venda,
    dt_venda,
    valor_liquido
FROM tb_venda
WHERE canal = 'APP'
AND status = 'FECHADA';

SELECT
    p.nome AS produto,
    p.sku,
    c.nome AS categoria
FROM tb_produto p
JOIN tb_categoria c
    ON p.id_categoria = c.id_categoria
ORDER BY p.nome;

SELECT
    COUNT(*) AS total_vendedores
FROM tb_vendedor;

SELECT
    nome,
    preco_unit
FROM tb_produto
WHERE ativo = 'S'
ORDER BY preco_unit DESC;

SELECT
    canal,
    SUM(valor_liquido) AS faturamento_total
FROM tb_venda
WHERE status = 'FECHADA'
GROUP BY canal
ORDER BY faturamento_total DESC;

SELECT
    ven.nome AS vendedor,
    ROUND(AVG(v.valor_liquido), 2) AS ticket_medio
FROM tb_vendedor ven
JOIN tb_venda v
    ON ven.id_vendedor = v.id_vendedor
WHERE v.status = 'FECHADA'
GROUP BY ven.nome
ORDER BY ticket_medio DESC;

SELECT
    c.nome,
    c.email
FROM tb_cliente c
WHERE NOT EXISTS (
    SELECT 1
    FROM tb_venda v
    WHERE v.id_cliente = c.id_cliente
);

SELECT
    v.id_venda,
    c.nome AS cliente,
    v.valor_liquido
FROM tb_venda v
JOIN tb_cliente c
    ON c.id_cliente = v.id_cliente
WHERE v.status = 'FECHADA'
AND v.valor_liquido > (
    SELECT AVG(valor_liquido)
    FROM tb_venda
    WHERE status = 'FECHADA'
);


SELECT
    nome,
    preco_unit,
    CASE
        WHEN preco_unit < 50 THEN 'BARATO'
        WHEN preco_unit <= 200 THEN 'MÉDIO'
        ELSE 'CARO'
    END AS faixa_preco
FROM tb_produto
ORDER BY preco_unit;

SELECT
    c.nome AS cliente,
    v.dt_venda,
    v.valor_liquido,
    ROW_NUMBER() OVER (
        PARTITION BY c.id_cliente
        ORDER BY v.dt_venda
    ) AS numero_compra
FROM tb_cliente c
JOIN tb_venda v
    ON c.id_cliente = v.id_cliente
ORDER BY c.nome, numero_compra;

SELECT
    vendedor,
    faturamento,
    ROUND(
        faturamento /
        SUM(faturamento) OVER () * 100,
        2
    ) AS percentual_faturamento
FROM (
    SELECT
        ven.nome AS vendedor,
        SUM(v.valor_liquido) AS faturamento
    FROM tb_vendedor ven
    JOIN tb_venda v
        ON ven.id_vendedor = v.id_vendedor
    WHERE v.status = 'FECHADA'
    GROUP BY ven.nome
)
ORDER BY percentual_faturamento DESC;

WITH vendas_mensais AS (
    SELECT
        TRUNC(v.dt_venda, 'MM') AS mes_ref,
        ven.nome AS vendedor,
        SUM(v.valor_liquido) AS receita
    FROM tb_venda v
    JOIN tb_vendedor ven
        ON ven.id_vendedor = v.id_vendedor
    WHERE v.status = 'FECHADA'
    GROUP BY
        TRUNC(v.dt_venda, 'MM'),
        ven.nome
)
SELECT
    mes_ref,
    vendedor,
    receita,
    DENSE_RANK() OVER (
        PARTITION BY mes_ref
        ORDER BY receita DESC
    ) AS ranking_mensal
FROM vendas_mensais
ORDER BY mes_ref, ranking_mensal;

SELECT
    id_venda,
    valor_liquido,
    valor_liquido -
        AVG(valor_liquido) OVER () AS diferenca_para_media
FROM tb_venda
ORDER BY id_venda;

WITH qtd_produto AS (
    SELECT
        p.id_produto,
        p.nome AS produto,
        SUM(i.quantidade) AS total_vendido
    FROM tb_produto p
    JOIN tb_venda_item i
        ON p.id_produto = i.id_produto
    GROUP BY
        p.id_produto,
        p.nome
),
ranking_produtos AS (
    SELECT
        produto,
        total_vendido,
        DENSE_RANK() OVER (
            ORDER BY total_vendido DESC
        ) AS ranking
    FROM qtd_produto
)
SELECT
    produto,
    total_vendido,
    ranking
FROM ranking_produtos
WHERE ranking <= 3
ORDER BY ranking;
