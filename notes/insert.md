## Inserir dados

A inserção de dados no PostgreSQL é um processo central para alimentar as tabelas com informações úteis, sendo feita principalmente com o comando INSERT. Este comando permite adicionar linhas completas ou parcialmente preenchidas em uma tabela. A seguir, vamos explorar profundamente os conceitos, técnicas avançadas, e melhores práticas para a inserção de dados.

### Estrutura Básica do Comando INSERT

A sintaxe básica para inserir dados é:

```sql
INSERT INTO table_name (column1, column2, ...) 
VALUES (value1, value2, ...);
```

**Elementos da Sintaxe**

* table_name: Nome da tabela onde os dados serão inseridos.
* column1, column2, ...: Colunas nas quais os valores serão adicionados (opcional; pode ser omitido se os valores forem fornecidos para todas as colunas na ordem definida na tabela).
* VALUES: Palavra-chave para fornecer os dados.

```sql
INSERT INTO users (username, email, age) 
VALUES ('john_doe', 'john@example.com', 25);
```

### Inserção em Múltiplas Linhas

O PostgreSQL permite inserir múltiplas linhas com um único comando para eficiência.

```sql
INSERT INTO users (username, email, age) 
VALUES 
    ('alice', 'alice@example.com', 30),
    ('bob', 'bob@example.com', 22),
    ('charlie', 'charlie@example.com', 35);
```

### Inserção Baseada em Consultas

O PostgreSQL permite inserir dados usando o resultado de uma consulta com INSERT INTO ... SELECT.

```sql
INSERT INTO employees (name, position, salary)
SELECT name, 'Intern', 3000
FROM applicants
WHERE passed_test = TRUE;
```

Isso é útil para preencher uma tabela com base em outra.

```sql
```

### Inserção com Valores Padrão

Se algumas colunas têm valores padrão definidos, você pode omitir esses campos na inserção:

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email) 
VALUES ('jane_doe', 'jane@example.com');
```

### Tratamento de Conflitos com ON CONFLICT

Ao lidar com chaves únicas ou primárias, você pode evitar falhas na inserção devido a conflitos, utilizando o ON CONFLICT.

**Ignorar Conflitos**

Use ON CONFLICT DO NOTHING para ignorar linhas conflitantes:

```sql
INSERT INTO users (username, email) 
VALUES ('alice', 'alice@example.com')
ON CONFLICT (email) DO NOTHING;
```

**Atualizar Dados em Caso de Conflito**

Use ON CONFLICT DO UPDATE para atualizar registros conflitantes:

```sql
INSERT INTO users (username, email, age) 
VALUES ('alice', 'alice@example.com', 25)
ON CONFLICT (email) DO UPDATE 
SET age = EXCLUDED.age, username = EXCLUDED.username;
```

Aqui, EXCLUDED referencia os valores propostos na inserção.

### Retorno de Valores com RETURNING

O PostgreSQL suporta o uso de RETURNING para obter informações da linha inserida.

```sql
INSERT INTO users (username, email, age) 
VALUES ('david', 'david@example.com', 28)
RETURNING id, created_at
```

Isso é útil para obter o ID gerado automaticamente ou outras informações.

### Inserção em Tabelas Particionadas

Se a tabela estiver particionada, o PostgreSQL distribui automaticamente os dados entre as partições com base nas regras definidas.

```sql
CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    sale_date DATE NOT NULL,
    amount NUMERIC NOT NULL
) PARTITION BY RANGE (sale_date);

CREATE TABLE sales_2023 PARTITION OF sales
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

INSERT INTO sales (sale_date, amount) 
VALUES ('2023-06-15', 1000);
```

A linha será automaticamente direcionada para a partição sales_2023.

### Inserção com Substituição de Dados com UPSERT

O termo UPSERT refere-se a uma operação que insere dados ou os atualiza caso já existam. Ele é implementado no PostgreSQL com ON CONFLICT.

```sql
INSERT INTO products (id, name, price) 
VALUES (1, 'Product A', 100)
ON CONFLICT (id) DO UPDATE 
SET price = EXCLUDED.price;
```

### Inserção em Tabelas com Arrays

O PostgreSQL suporta a inserção direta de arrays em colunas configuradas como tal.

```sql
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    tag_list TEXT[]
);

INSERT INTO tags (tag_list) 
VALUES (ARRAY['tag1', 'tag2', 'tag3']);
```

### Inserção com Dados JSON

O PostgreSQL possui tipos de dados JSON e JSONB, permitindo armazenar documentos estruturados.

```sql
CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    log_data JSONB
);

INSERT INTO logs (log_data) 
VALUES ('{"event": "login", "user": "john_doe", "timestamp": "2024-12-09T12:34:56"}');
```

### Boas Práticas para Inserção de Dados

* Use transações para inserções em massa: Envolver múltiplos comandos INSERT em uma transação reduz o overhead.

```sql
BEGIN;
INSERT INTO users (...) VALUES (...);
INSERT INTO users (...) VALUES (...);
COMMIT;
```

* Valide os dados antes da inserção: Use CHECK ou CONSTRAINTS para evitar inserção de dados inconsistentes.

* Minimize bloqueios: Quando possível, use índices e particionamento para reduzir contenções durante a inserção.

* Monitore desempenho: Inserções em massa podem ser otimizadas ajustando os parâmetros de configuração do PostgreSQL, como work_mem e maintenance_work_mem.

* Utilize tabelas temporárias para cargas intermediárias: Elas podem ajudar na manipulação e validação de dados antes de movê-los para as tabelas principais.