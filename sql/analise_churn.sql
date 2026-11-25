
-- =========================================================
-- PROJETO: ANALISE DE CHURN - TELCO CUSTOMER CHURN
-- Banco de dados: analise_churn
-- Objetivo: investigar padroes de cancelamento de clientes
-- =========================================================


-- 1. DISTRIBUICAO GERAL DE CHURN

SELECT
    churn,
    COUNT(*) AS quantidade_clientes,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentual
FROM clientes_churn
GROUP BY churn
ORDER BY churn;


-- 2. CHURN POR TIPO DE CONTRATO

SELECT
    contract,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY contract
ORDER BY taxa_churn DESC;


-- 3. CHURN POR TEMPO DE RELACIONAMENTO

SELECT
    CASE
        WHEN tenure <= 12 THEN 'Ate 12 meses'
        WHEN tenure <= 36 THEN '13 a 36 meses'
        ELSE 'Mais de 36 meses'
    END AS grupo_tenure,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY grupo_tenure
ORDER BY taxa_churn DESC;


-- 4. CHURN POR FORMA DE PAGAMENTO

SELECT
    paymentmethod,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY paymentmethod
ORDER BY taxa_churn DESC;


-- 5. CHURN POR SERVICO DE INTERNET

SELECT
    internetservice,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY internetservice
ORDER BY taxa_churn DESC;


-- 6. CHURN POR SUPORTE TECNICO
-- Considera somente clientes que possuem internet.

SELECT
    techsupport,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
WHERE internetservice <> 'No'
GROUP BY techsupport
ORDER BY taxa_churn DESC;


-- 7. CHURN POR SEGURANCA ONLINE
-- Considera somente clientes que possuem internet.

SELECT
    onlinesecurity,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
WHERE internetservice <> 'No'
GROUP BY onlinesecurity
ORDER BY taxa_churn DESC;


-- 8. COBRANCA MENSAL MEDIA POR STATUS DO CLIENTE

SELECT
    churn,
    COUNT(*) AS total_clientes,
    ROUND(AVG(monthlycharges), 2) AS media_cobranca_mensal,
    ROUND(MIN(monthlycharges), 2) AS menor_cobranca,
    ROUND(MAX(monthlycharges), 2) AS maior_cobranca
FROM clientes_churn
GROUP BY churn
ORDER BY churn;


-- 9. CHURN POR CATEGORIA DE IDADE

SELECT
    CASE
        WHEN seniorcitizen = 1 THEN 'Idoso'
        ELSE 'Nao idoso'
    END AS categoria_idade,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY seniorcitizen
ORDER BY taxa_churn DESC;


-- 10. CHURN POR PRESENCA DE DEPENDENTES

SELECT
    dependents,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY dependents
ORDER BY taxa_churn DESC;


-- 11. CHURN POR PROTECAO DE DISPOSITIVO
-- Considera somente clientes que possuem internet.

SELECT
    deviceprotection,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
WHERE internetservice <> 'No'
GROUP BY deviceprotection
ORDER BY taxa_churn DESC;


-- 12. CHURN POR FATURA DIGITAL

SELECT
    paperlessbilling,
    COUNT(*) AS total_clientes,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    ROUND(
        COUNT(*) FILTER (WHERE churn = 'Yes') * 100.0 / COUNT(*),
        2
    ) AS taxa_churn
FROM clientes_churn
GROUP BY paperlessbilling
ORDER BY taxa_churn DESC;


-- 13. VALIDACAO FINAL DA BASE

SELECT
    COUNT(*) AS total_clientes,
    COUNT(DISTINCT customerid) AS clientes_unicos,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clientes_cancelados,
    COUNT(*) FILTER (WHERE churn = 'No') AS clientes_ativos,
    COUNT(*) FILTER (WHERE totalcharges IS NULL) AS totalcharges_ausentes
FROM clientes_churn;
