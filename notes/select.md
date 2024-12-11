## Selecionar

O comando SELECT no PostgreSQL é uma das operações mais usadas e versáteis, permitindo consultar, transformar e combinar dados de uma ou mais tabelas. Ele é altamente configurável e oferece uma ampla gama de funcionalidades. A seguir, discutimos em profundidade como usar SELECT no PostgreSQL, com exemplos detalhados.

### Estrutura Básica do Comando SELECT

A sintaxe básica é:

```sql
SELECT column1, column2, ...
FROM table_name
[WHERE condition]
[GROUP BY column1, column2, ...]
[HAVING condition]
[ORDER BY column1 [ASC|DESC]]
[LIMIT number OFFSET number];
```

### Seleção Simples

Seleciona colunas específicas ou todas as colunas de uma tabela:

Selecionando todas as colunas:

```sql
SELECT * FROM users;
```

Selecionando colunas específicas:

```sql
SELECT username, email FROM users;
```

### Alias de Colunas e Tabelas

Os alias renomeiam colunas ou tabelas temporariamente para maior clareza ou conveniência.

Alias para colunas:

```sql
SELECT username AS user_name, email AS user_email FROM users;
```

Alias para tabelas:

```sql
SELECT u.username, u.email 
FROM users AS u;
```

### Filtragem com WHERE

O WHERE filtra as linhas retornadas com base em condições.

Condições básicas:

```sql
SELECT * FROM users WHERE age > 30;
```

Usando operadores lógicos:

```sql
SELECT * FROM users WHERE age > 30 AND email LIKE '%example.com';
```

Usando operadores de comparação:

* =, != ou <> (diferente), <, >, <=, >=.
* IN, BETWEEN, LIKE, ILIKE (insensível a maiúsculas/minúsculas).

```sql
SELECT * FROM users WHERE age BETWEEN 18 AND 30;
```

### Ordenação com ORDER BY

Controla a ordem dos resultados.

Ordem crescente (padrão):

```sql
SELECT * FROM users ORDER BY age;
```

Ordem decrescente:

```sql
SELECT * FROM users ORDER BY age DESC;
```

Ordenação por múltiplas colunas:

```sql
SELECT * FROM users ORDER BY age DESC, username ASC;
```

### Limitação e Paginação

Controle o número de linhas retornadas e implemente paginação.

Retornar um número limitado de resultados:

```sql
SELECT * FROM users LIMIT 10;
```

Paginação com OFFSET:

```sql
SELECT * FROM users ORDER BY id LIMIT 10 OFFSET 20;
```

### Agregação de Dados

Funções agregadas processam conjuntos de linhas e retornam um único valor.

* Funções comuns:
* COUNT(): Conta o número de linhas.
* SUM(): Soma os valores.
* AVG(): Calcula a média.
* MIN(), MAX(): Encontra o menor/maior valor.

Exemplo:

```sql
SELECT COUNT(*) AS user_count FROM users;
```

Agrupamento com GROUP BY:

Agrupa linhas antes de aplicar funções agregadas.

```sql
SELECT age, COUNT(*) AS count_by_age 
FROM users 
GROUP BY age;
```

Filtrando grupos com HAVING:

```sql
SELECT age, COUNT(*) AS count_by_age 
FROM users 
GROUP BY age 
HAVING COUNT(*) > 5;
```