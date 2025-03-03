## Relacionando Tabelas com Chaves Estrangeiras

Para estabelecer relacionamentos, utilizamos chaves estrangeiras (FOREIGN KEY), que referenciam a chave primária de outra tabela.

### Relacionamento 1:N

Um cliente pode fazer vários pedidos, então criamos a tabela pedidos referenciando clientes.

```sql
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);
```

**Explicação**

* *cliente_id INT NOT NULL*: Armazena a relação com a tabela clientes.

* *FOREIGN KEY (cliente_id) REFERENCES clientes(id)*: Define cliente_id como chave estrangeira vinculada a id de clientes.

* *ON DELETE CASCADE*: Se um cliente for excluído, seus pedidos também serão removidos automaticamente.

### Relacionamento N:N (Muitos para Muitos)

Quando há uma relação muitos para muitos, criamos uma tabela intermediária.
Por exemplo, um pedido pode ter vários produtos e um produto pode estar em vários pedidos.

* Passo 1: Criar a tabela produtos

```sql
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);
```

* Passo 2: Criar a tabela intermediária pedido_produto

```sql
CREATE TABLE pedido_produto (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (pedido_id, produto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);
```

**Explicação**

* pedido_id e produto_id formam uma chave primária composta (PRIMARY KEY (pedido_id, produto_id)).
* FOREIGN KEY garante integridade referencial.
* ON DELETE CASCADE mantém a consistência ao excluir um pedido ou produto.

## Joins

O PostgreSQL suporta os seguintes tipos de JOINs:

* INNER JOIN – Retorna apenas os registros correspondentes entre as tabelas.
* LEFT JOIN (ou LEFT OUTER JOIN) – Retorna todos os registros da tabela à esquerda e os correspondentes da direita (se existirem).
* RIGHT JOIN (ou RIGHT OUTER JOIN) – Retorna todos os registros da tabela à direita e os correspondentes da esquerda (se existirem).
* FULL JOIN (ou FULL OUTER JOIN) – Retorna todos os registros de ambas as tabelas, combinando os correspondentes e mantendo os não correspondentes.
* CROSS JOIN – Combina todas as linhas de ambas as tabelas, criando um produto cartesiano.
* SELF JOIN – Uma tabela se junta a si mesma.
* NATURAL JOIN – Faz um JOIN automático baseado em colunas com o mesmo nome e tipo.

### INNER JOIN

O INNER JOIN retorna apenas os registros que possuem correspondência em ambas as tabelas.

```sql
SELECT pedidos.id, clientes.nome, pedidos.valor_total
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.id;
```

**Explicação**

* Retorna somente os pedidos que têm clientes associados.
* Se houver um cliente sem pedidos, ele não será exibido.

### LEFT JOIN

O LEFT JOIN retorna todos os registros da tabela à esquerda e os correspondentes da direita (se existirem). Se não houver correspondência, valores NULL são retornados.

```sql
SELECT clientes.nome, pedidos.id AS pedido_id, pedidos.valor_total
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id;
```

**Explicação**

* Retorna todos os clientes.
* Se um cliente não tiver pedidos, a coluna pedido_id e valor_total serão NULL.

### RIGHT JOIN

O RIGHT JOIN é o inverso do LEFT JOIN, retornando todos os registros da tabela à direita e os correspondentes da esquerda (se existirem).

```sql
SELECT clientes.nome, pedidos.id AS pedido_id, pedidos.valor_total
FROM clientes
RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id;
```

**Explicação**

* Retorna todos os pedidos.
* Se um pedido não tiver um cliente correspondente (por exemplo, se o cliente foi deletado e a FOREIGN KEY não foi definida com ON DELETE CASCADE), o nome do cliente será NULL.

### FULL JOIN

O FULL JOIN retorna todos os registros de ambas as tabelas, preenchendo com NULL onde não houver correspondência.

```sql
SELECT clientes.nome, pedidos.id AS pedido_id, pedidos.valor_total
FROM clientes
FULL JOIN pedidos ON clientes.id = pedidos.cliente_id;
```

**Explicação**

* Retorna todos os clientes e todos os pedidos.
* Se um cliente não tiver pedidos, pedido_id e valor_total serão NULL.
* Se um pedido não tiver cliente (caso o cliente tenha sido excluído), o nome será NULL.

### CROSS JOIN

O CROSS JOIN combina todas as linhas das tabelas, gerando um produto cartesiano.

```sql
SELECT clientes.nome, produtos.nome AS produto
FROM clientes
CROSS JOIN produtos;
```

**Explicação**

* Cada cliente será combinado com todos os produtos.
* Se houver 3 clientes e 4 produtos, teremos 3 × 4 = 12 combinações.

### SELF JOIN

Um SELF JOIN é quando uma tabela se junta a si mesma. É útil para relacionamentos hierárquicos.

```sql
CREATE TABLE funcionarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    gerente_id INT,
    FOREIGN KEY (gerente_id) REFERENCES funcionarios(id) ON DELETE SET NULL
);
```

Agora, podemos buscar os funcionários e seus gerentes:

```sql
SELECT f1.nome AS funcionario, f2.nome AS gerente
FROM funcionarios f1
LEFT JOIN funcionarios f2 ON f1.gerente_id = f2.id;
```

**Explicação**

* f1 representa os funcionários.
* f2 representa os gerentes.
* O LEFT JOIN garante que todos os funcionários apareçam, mesmo sem um gerente.

### NATURAL JOIN

O NATURAL JOIN junta automaticamente tabelas com colunas de mesmo nome e tipo.

```sql
SELECT * FROM clientes NATURAL JOIN pedidos;
```

**Explicação**

* Se ambas as tabelas possuírem a coluna id, o PostgreSQL automaticamente usará essa coluna para a junção.

```
⚠️ Nota: O NATURAL JOIN pode gerar resultados inesperados se existirem colunas com nomes iguais que não deveriam ser usadas na junção.
```