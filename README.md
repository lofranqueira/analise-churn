# Análise de Churn — Telecom Customer Churn

Projeto de análise de dados desenvolvido com **PostgreSQL, SQL e Python**, utilizando o conjunto de dados Telco Customer Churn, disponibilizado pela IBM.

O objetivo é investigar padrões de cancelamento de clientes de uma empresa de telecomunicações, identificar características associadas ao churn e transformar os resultados em informações úteis para a tomada de decisões de negócio.

## Objetivos do projeto

- Identificar a taxa geral de cancelamento de clientes.
- Analisar o churn por tipo de contrato e tempo de relacionamento.
- Investigar diferenças entre formas de pagamento.
- Avaliar a relação entre serviços contratados e cancelamentos.
- Comparar o perfil de clientes ativos e cancelados.
- Apresentar os resultados por meio de visualizações e recomendações de negócio.

## Ferramentas utilizadas

- **PostgreSQL:** armazenamento, organização e consulta dos dados.
- **SQL:** exploração, agregação e análise dos indicadores.
- **Python:** análise exploratória e visualização dos resultados.
- **Pandas:** manipulação e tratamento dos dados.
- **Matplotlib:** criação de gráficos.
- **Google Colab:** ambiente de desenvolvimento Python.

## Estrutura do projeto

```text
analise-churn/
├── notebooks/
│   └── analise_churn.ipynb
├── sql/
│   └── analise_churn.sql
└── README.md
```

## Base de dados

O projeto utiliza o conjunto de dados Telco Customer Churn, disponibilizado publicamente pela IBM.

A base contém **7.043 registros e 21 colunas**, com informações sobre clientes, serviços contratados, cobranças e cancelamentos.

Fonte: [IBM — Telco Customer Churn](https://github.com/IBM/telco-customer-churn-on-icp4d/blob/master/data/Telco-Customer-Churn.csv)

## Qualidade dos dados

Durante a exploração inicial, foram identificados:

- 7.043 registros.
- 7.043 identificadores únicos de clientes.
- Nenhum identificador duplicado.
- 11 valores ausentes na coluna `totalcharges`.

Os 11 valores ausentes correspondem a clientes com tempo de relacionamento igual a zero. Esses registros foram preservados na análise.

## Principais resultados

A análise identificou uma taxa geral de cancelamento de **26,54%**.

Entre os principais resultados:

- **Contratos mensais:** taxa de churn de 42,71%.
- **Contratos bienais:** taxa de churn de 2,83%.
- **Clientes com até 12 meses de relacionamento:** churn de 47,44%.
- **Pagamento por cheque eletrônico:** churn de 45,29%.
- **Clientes de fibra óptica:** churn de 41,89%.
- **Clientes sem suporte técnico:** churn de 41,64%.
- **Cobrança mensal média:** R$ 74,44 entre clientes cancelados e R$ 61,27 entre clientes ativos.

Os resultados indicam associações entre determinadas características dos clientes e o cancelamento, sem estabelecer relações de causa e efeito.

## Recomendações de negócio

Com base nos resultados, foram identificadas oportunidades de investigação e melhoria:

- Fortalecer as ações de retenção nos primeiros meses de relacionamento.
- Avaliar benefícios e condições para contratos de maior duração.
- Investigar a experiência dos clientes de fibra óptica.
- Avaliar a contribuição dos serviços de suporte técnico e segurança online para a retenção.
- Investigar possíveis dificuldades relacionadas às formas de pagamento.
- Analisar a percepção de preço e o custo-benefício dos serviços.

## Organização das análises

O projeto está dividido em dois materiais principais:

- **Notebook Python:** exploração dos dados, análises e visualizações.
- **Script SQL:** consultas utilizadas para investigar os indicadores de churn.

## Acessar os arquivos

- [Notebook Python — Análise de Churn](notebooks/analise_churn.ipynb)
- [Consultas SQL — Análise de Churn](sql/analise_churn.sql)

## Fonte

IBM — Telco Customer Churn Dataset.

https://github.com/IBM/telco-customer-churn-on-icp4d/blob/master/data/Telco-Customer-Churn.csv
