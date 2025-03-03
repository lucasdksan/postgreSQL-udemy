# postgreSQL-udemy

Curso Completo da Udemy sobre PostgreSQL.

![Banner Postgre](/github/banner_postgreSQL.jpg)

# Sumário

* [Introdução](#introdução)
* [Criação de Tabelas](/notes/craete_table.md#criação-de-tabelas)
    * [Estrutura Básica do Comando CREATE TABLE](/notes/craete_table.md#estrutura-básica-do-comando-create-table)
    * [Principais Tipos de Dados no PostgreSQL](/notes/craete_table.md#principais-tipos-de-dados-no-postgresql)
    * [Restrições (Constraints)](/notes/craete_table.md#restrições-constraints)
    * [Herança em Tabelas](/notes/craete_table.md#herança-em-tabelas)
    * [Indexação em Tabelas](/notes/craete_table.md#indexação-em-tabelas)
    * [Melhorias com Extensões](/notes/craete_table.md#melhorias-com-extensões)
    * [Tabelas Temporárias](/notes/craete_table.md#tabelas-temporárias)
    * [Scripts de Criação com Relacionamento](/notes/craete_table.md#scripts-de-criação-com-relacionamento)
    * [Considerações de Melhor Prática](/notes/craete_table.md#considerações-de-melhor-prática)
* [Inserir dados](/notes/insert.md#inserir-dados)
    * [Estrutura Básica do Comando INSERT](/notes/insert.md#estrutura-básica-do-comando-insert)
    * [Inserção em Múltiplas Linhas](/notes/insert.md#inserção-em-múltiplas-linhas)
    * [Inserção Baseada em Consultas](/notes/insert.md#inserção-baseada-em-consultas)
    * [Inserção com Valores Padrão](/notes/insert.md#inserção-com-valores-padrão)
    * [Tratamento de Conflitos com ON CONFLICT](/notes/insert.md#tratamento-de-conflitos-com-on-conflict)
    * [Retorno de Valores com RETURNING](/notes/insert.md#retorno-de-valores-com-returning)
    * [Inserção em Tabelas Particionadas](/notes/insert.md#inserção-em-tabelas-particionadas)
    * [Inserção com Substituição de Dados com UPSERT](/notes/insert.md#inserção-com-substituição-de-dados-com-upsert)
    * [Inserção em Tabelas com Arrays](/notes/insert.md#inserção-em-tabelas-com-arrays)
    * [Inserção com Dados JSON](/notes/insert.md#inserção-com-dados-json)
    * [Boas Práticas para Inserção de Dados](/notes/insert.md#boas-práticas-para-inserção-de-dados)
* [Selecionar](/notes/select.md#selecionar)
    * [Estrutura Básica do Comando SELECT](/notes/select.md#estrutura-básica-do-comando-select)
    * [Seleção Simples](/notes/select.md#seleção-simples)
    * [Alias de Colunas e Tabelas](/notes/select.md#alias-de-colunas-e-tabelas)
    * [Filtragem com WHERE](/notes/select.md#filtragem-com-where)
    * [Ordenação com ORDER BY](/notes/select.md#ordenação-com-order-by)
    * [Limitação e Paginação](/notes/select.md#limitação-e-paginação)
    * [Agregação de Dados](/notes/select.md#agregação-de-dados)
* [Atualizar e Deletar](/notes/up-delete.md#atualizar-e-deletar)
    * [UPDATE: Atualização de Dados](/notes/up-delete.md#update-atualização-de-dados)
    * [Usando FROM para Atualização](/notes/up-delete.md#usando-from-para-atualização)
    * [Filtragem com WHERE](/notes/up-delete.md#filtragem-com-where)
    * [Utilizando o RETURNING](/notes/up-delete.md#utilizando-o-returning)
    * [DELETE: Remoção de Dados](/notes/up-delete.md#delete-remoção-de-dados)
    * [Deleção Segura com RETURNING](/notes/up-delete.md#deleção-segura-com-returning)
    * [Cascade Delete](/notes/up-delete.md#cascade-delete)
    * [Comparação: UPDATE vs DELETE](/notes/up-delete.md#comparação-update-vs-delete)
    * [Considerações de Desempenho](/notes/up-delete.md#considerações-de-desempenho)
* [Relacionamento de Tableas](/notes/relaship.md)
    * [Relacionamento 1:N](/notes/relaship.md#relacionamento-1n)
    * [Relacionamento N:N (Muitos para Muitos)](/notes/relaship.md#relacionamento-nn-muitos-para-muitos)
    * [Joins](/notes/relaship.md#joins)
        * [Inner Join](/notes/relaship.md#inner-join)
        * [Left Join](/notes/relaship.md#left-join)
        * [Right Join](/notes/relaship.md#right-join)
        * [Full Join](/notes/relaship.md#full-join)
        * [Cross Join](/notes/relaship.md#cross-join)
        * [Self Join](/notes/relaship.md#self-join)
        * [Natural Join](/notes/relaship.md#natural-join)
* [Referências](#referências)

## Introdução

PostgreSQL, comumente chamado de "Postgres", é um sistema de gerenciamento de banco de dados relacional (RDBMS) de código aberto amplamente reconhecido por sua robustez, escalabilidade e conformidade com padrões. Lançado originalmente em 1986 como um projeto de pesquisa na Universidade da Califórnia em Berkeley, evoluiu para um dos bancos de dados mais confiáveis e avançados disponíveis atualmente.

O PostgreSQL suporta uma ampla gama de recursos, incluindo conformidade total com SQL, transações ACID (Atomicidade, Consistência, Isolamento e Durabilidade), extensibilidade por meio de funções definidas pelo usuário e suporte a tipos de dados avançados como JSON, arrays e geoespaciais (por meio da extensão PostGIS). Além disso, é altamente personalizável, permitindo a criação de tipos, operadores e métodos de indexação próprios.

Com uma comunidade ativa e um modelo de licenciamento permissivo (licença PostgreSQL), ele é utilizado em uma variedade de aplicações, desde pequenas startups até grandes corporações e instituições governamentais. A escalabilidade e a compatibilidade com diversas linguagens de programação o tornam uma escolha ideal para arquiteturas modernas, como microsserviços e sistemas distribuídos.

## Referências

* [Udemy](https://udemy.com/)
* [Chat-GPT](https://chatgpt.com/)
