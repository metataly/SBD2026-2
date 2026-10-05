SELECT c.nome AS cliente, v.dt_venda, v.valor_liquido,
       ROW_NUMBER() OVER (PARTITION BY c.id_cliente ORDER BY v.dt_venda ASC) AS numero_compra
FROM tb_venda v
JOIN tb_cliente c ON v.id_cliente = c.id_cliente
WHERE v.status = 'FECHADA';

-- Exercício 2.1: Ranking Mensal de Vendedores (Pódio do RH)
-- Objetivo: Descobrir os melhores vendedores por período, reiniciando o ranking a cada mês[cite: 6].
WITH vendas_mensais AS (
    SELECT TRUNC(ve.dt_venda, 'MM') AS mes_ref,
           v.nome AS vendedor,
           SUM(ve.valor_liquido) AS receita_total
    FROM tb_venda ve
    JOIN tb_vendedor v ON ve.id_vendedor = v.id_vendedor
    WHERE ve.status = 'FECHADA'
    GROUP BY TRUNC(ve.dt_venda, 'MM'), v.nome
)
SELECT mes_ref, vendedor, receita_total,
       DENSE_RANK() OVER (PARTITION BY mes_ref ORDER BY receita_total DESC) AS posicao_ranking
FROM vendas_mensais;

-- Exercício 2.2: Os 2 Produtos Mais Vendidos por Categoria (Carros-chefes)
-- Objetivo: Gerar ranking por categoria filtrando os top 2 com auxílio de CTE[cite: 6].
WITH ranking_produtos AS (
    SELECT cat.nome AS categoria,
           p.nome AS produto,
           SUM(i.quantidade) AS qtd_total,
           DENSE_RANK() OVER (PARTITION BY cat.id_categoria ORDER BY SUM(i.quantidade) DESC) AS ranking
    FROM tb_venda_item i
    JOIN tb_produto p ON i.id_produto = p.id_produto
    JOIN tb_categoria cat ON p.id_categoria = cat.id_categoria
    GROUP BY cat.id_categoria, cat.nome, p.nome
)
SELECT categoria, produto, qtd_total, ranking
FROM ranking_produtos
WHERE ranking <= 2;

-- Exercício 3.1: Participação no Faturamento (Market Share Interno)
-- Objetivo: Comparar o desempenho individual do vendedor com o total geral da empresa[cite: 6].
SELECT v.nome AS vendedor,
       SUM(ve.valor_liquido) AS receita_vendedor,
       ROUND((SUM(ve.valor_liquido) / SUM(SUM(ve.valor_liquido)) OVER()) * 100, 2) AS percentual_faturamento
FROM tb_venda ve
JOIN tb_vendedor v ON ve.id_vendedor = v.id_vendedor
WHERE ve.status = 'FECHADA'
GROUP BY v.nome;


-- Exercício 3.2: Termômetro de Vendas (Acima ou Abaixo da Média?)
-- Objetivo: Exibir métricas globais e comparativas linha a linha[cite: 6].
SELECT id_venda, valor_liquido,
       AVG(valor_liquido) OVER() AS media_geral,
       valor_liquido - AVG(valor_liquido) OVER() AS diferenca_media
FROM tb_venda
WHERE status = 'FECHADA';

