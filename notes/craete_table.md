## Criação de Tabelas

A criação de tabelas no PostgreSQL é uma operação fundamental para o desenvolvimento de bancos de dados relacionais. Esse processo envolve o uso do comando SQL CREATE TABLE, permitindo definir a estrutura e as características de armazenamento dos dados. A seguir, exploramos os aspectos técnicos e melhores práticas para criação de tabelas no PostgreSQL:

### Estrutura Básica do Comando CREATE TABLE

A sintaxe básica para criar uma tabela é:

```sql
CREATE TABLE table_name (
    column_name1 data_type [constraints],
    column_name2 data_type [constraints],
    ...
);
```

**Elementos da Sintaxe**

* table_name: Nome da tabela, que deve ser único no esquema.
* column_name: Nome da coluna.
* data_type: Tipo de dado da coluna, como INTEGER, VARCHAR, TEXT, DATE, etc.
* constraints: Restrições para garantir integridade dos dados (e.g., NOT NULL, UNIQUE, PRIMARY KEY, CHECK, etc.).

### Principais Tipos de Dados no PostgreSQL

Os tipos de dados são categorizados em:

* Numéricos: SMALLINT, INTEGER, BIGINT, NUMERIC, DECIMAL, REAL, DOUBLE PRECISION.
* Caracteres: CHAR, VARCHAR, TEXT.
* Datas e Horários: DATE, TIME, TIMESTAMP, INTERVAL.
* Booleano: BOOLEAN.
* Dados Geoespaciais (via extensão PostGIS): GEOMETRY, GEOGRAPHY.
* JSON: JSON, JSONB (binário otimizado para consultas).
* Arrays: Tipos nativos do PostgreSQL que suportam arrays de qualquer tipo de dado.
* Enumerados (ENUM): Tipos definidos pelo usuário.

### Restrições (Constraints)

As restrições são usadas para definir regras nos dados inseridos. Principais exemplos:

* PRIMARY KEY: Define a chave primária da tabela.
* UNIQUE: Garante valores únicos em uma coluna.
* NOT NULL: Impede valores nulos.
* CHECK: Define uma condição para validar os dados.
* FOREIGN KEY: Cria uma relação com outra tabela.

Exemplo de tabela com restrições:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER CHECK (age >= 18),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Herança em Tabelas

O PostgreSQL suporta herança, onde uma tabela pode herdar colunas e restrições de outra tabela.

```sql
CREATE TABLE base_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE child_table (
    age INTEGER
) INHERITS (base_table);
```

### Particionamento de Tabelas

O particionamento é usado para dividir grandes tabelas em partes menores, otimizando consultas e gerenciamento.

**Tipos de Particionamento**

* Por Intervalo (Range Partitioning): Baseado em intervalos de valores.

```sql
CREATE TABLE sales (
    id SERIAL,
    sale_date DATE,
    amount NUMERIC
) PARTITION BY RANGE (sale_date);

CREATE TABLE sales_2023 PARTITION OF sales
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
```

* Por Lista (List Partitioning): Baseado em listas de valores.

```sql
CREATE TABLE employees (
    id SERIAL,
    department VARCHAR
) PARTITION BY LIST (department);

CREATE TABLE employees_hr PARTITION OF employees
FOR VALUES IN ('HR', 'Admin');
```

### Indexação em Tabelas

É comum criar índices durante ou após a criação de tabelas para melhorar o desempenho das consultas.

```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INTEGER
);

CREATE INDEX idx_order_date ON orders(order_date);
```

Tipos de índices incluem B-TREE, GIN, GiST, e BRIN, escolhidos com base no tipo de consulta.

### Melhorias com Extensões

O PostgreSQL oferece extensões que enriquecem a funcionalidade das tabelas:

* PostGIS: Para dados espaciais.
* pg_trgm: Suporte para buscas aproximadas em texto.
* hstore: Para armazenamento de pares chave-valor.
* Ativar uma extensão:

```sql
CREATE EXTENSION IF NOT EXISTS hstore;
```

### Tabelas Temporárias

As tabelas temporárias são úteis para armazenar dados transitórios em uma sessão.

```sql
CREATE TEMP TABLE temp_data (
    id SERIAL PRIMARY KEY,
    value TEXT
);
```

###  Scripts de Criação com Relacionamento

Para bancos de dados complexos, as tabelas geralmente possuem relações definidas por chaves estrangeiras:

```sql
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id),
    order_date DATE NOT NULL
);
```

###  Considerações de Melhor Prática

* Normalização: Use práticas de modelagem para evitar redundância e melhorar integridade.
* Nomenclatura: Use nomes consistentes e descritivos.
* Índices: Adicione apenas quando necessário para evitar sobrecarga.
* Documentação: Descreva a funcionalidade das tabelas e colunas para equipes.