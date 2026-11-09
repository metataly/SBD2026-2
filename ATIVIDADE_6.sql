-- ====================================================================
-- ATIVIDADE 6 - UNIDADE 4: VIEWS COMO CAMADA DE ABSTRAÇÃO, SEGURANÇA E REUSO
-- SISTEMA DE VENDAS E ANÁLISE COMERCIAL (Oracle Database 23ai / APEX)
-- ====================================================================

-- Questão 1: View de Resumo de Vendas (V_VENDAS_RESUMO)
CREATE OR REPLACE VIEW v_vendas_resumo AS
SELECT 
    v.id_venda,
    v.dt_venda,
    v.status,
    v.canal,
    c.nome AS nome_cliente,
    ven.nome AS nome_vendedor,
    v.valor_liquido
FROM tb_venda v
JOIN tb_cliente c ON v.id_cliente = c.id_cliente
JOIN tb_vendedor ven ON v.id_vendedor = ven.id_vendedor;

-- Questão 2: View de Cliente Público (V_CLIENTE_PUBLICO)
CREATE OR REPLACE VIEW v_cliente_publico AS
SELECT 
    id_cliente,
    nome,
    email,
    ativo
FROM tb_cliente
WHERE ativo = 'S';

-- Questão 3: View de Receita por Categoria (V_VENDAS_POR_CATEGORIA)
CREATE OR REPLACE VIEW v_vendas_por_categoria AS
SELECT 
    TRUNC(v.dt_venda, 'MM') AS mes_ref,
    cat.nome AS categoria,
    SUM(i.valor_total) AS faturamento_acumulado
FROM tb_venda v
JOIN tb_venda_item i ON v.id_venda = i.id_venda
JOIN tb_produto p ON i.id_produto = p.id_produto
JOIN tb_categoria cat ON p.id_categoria = cat.id_categoria
WHERE v.status = 'FECHADA'
GROUP BY TRUNC(v.dt_venda, 'MM'), cat.nome;


-- Questão 4: Consumindo a View Analítica (Faturamento > R$ 5.000,00 no mês corrente)
SELECT 
    mes_ref,
    categoria,
    faturamento_acumulado
FROM v_vendas_por_categoria
WHERE mes_ref = TRUNC(SYSDATE, 'MM')
  AND faturamento_acumulado > 5000.00;
