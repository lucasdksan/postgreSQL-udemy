## Atualizar e Deletar

Os métodos UPDATE e DELETE no PostgreSQL são fundamentais para manipular e gerenciar dados em tabelas. Vamos explorar esses comandos de forma técnica, abordando sua estrutura, recursos avançados, melhores práticas, e exemplos.

### UPDATE: Atualização de Dados

O comando UPDATE modifica os valores de colunas em linhas específicas de uma tabela.

**Estrutura Básica**

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
[FROM other_table]
[WHERE condition]
[RETURNING column1, column2, ...];
```

**Exemplos Práticos**

Atualização simples:

```sql
UPDATE users
SET email = 'new_email@example.com'
WHERE id = 1;
```

Atualizando múltiplos campos:

```sql
UPDATE users
SET email = 'user@example.com', updated_at = NOW()
WHERE username = 'john_doe';
```

Atualização em massa:

```sql
UPDATE products
SET price = price * 1.10; -- Aumenta o preço em 10%
```

### Usando FROM para Atualização

Você pode usar dados de outra tabela para atualizar valores.

```sql
UPDATE orders o
SET total_price = p.price * o.quantity
FROM products p
WHERE o.product_id = p.id
```

### Filtragem com WHERE

O WHERE controla quais linhas serão afetadas. Sem ele, todas as linhas da tabela serão atualizadas, o que pode ser perigoso.

Atualizando apenas linhas específicas:

```sql
UPDATE users
SET status = 'inactive'
WHERE last_login < NOW() - INTERVAL '1 year';
```

### Utilizando o RETURNING

O RETURNING retorna os valores atualizados, útil para verificar as mudanças feitas.

```sql
UPDATE users
SET email = 'updated@example.com'
WHERE id = 1
RETURNING id, email;
```

**Boas Práticas para UPDATE**

* Sempre use WHERE para evitar atualizações globais acidentais.
* Verifique a consulta antes de executar, especialmente em tabelas grandes.
* Use índices para melhorar o desempenho em consultas complexas.
* Teste em ambientes de desenvolvimento antes de aplicar em produção.

### DELETE: Remoção de Dados

O comando DELETE remove linhas de uma tabela com base em condições.

**Estrutura Básica**

```sql
DELETE FROM table_name
[USING other_table]
[WHERE condition]
[RETURNING column1, column2, ...];
```

**Exemplos Práticos**

Deletando uma linha específica:

```sql
DELETE FROM users
WHERE id = 1;
```

Deletando várias linhas:

```sql
DELETE FROM users
WHERE status = 'inactive' AND last_login < NOW() - INTERVAL '2 years';
```

**Deleção com USING**

O USING permite usar outra tabela para determinar quais linhas remover.

```sql
DELETE FROM orders o
USING products p
WHERE o.product_id = p.id AND p.is_discontinued = true;
```

**Deleção Total**

Evite deletar todas as linhas de uma tabela sem necessidade, mas se for necessário:

```sql
DELETE FROM users;
```

### Deleção Segura com RETURNING

O RETURNING também é aplicável no DELETE para obter informações das linhas removidas.

```sql
DELETE FROM users
WHERE last_login < NOW() - INTERVAL '5 years'
RETURNING id, email;
```

### Cascade Delete

Se a tabela possui chaves estrangeiras com a opção ON DELETE CASCADE, o PostgreSQL remove automaticamente as linhas relacionadas.

Exemplo:

```sql
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE
);

-- Ao deletar um usuário, todos os pedidos associados são deletados automaticamente:
DELETE FROM users WHERE id = 1;
```

### Comparação: UPDATE vs DELETE

| Aspecto | UPDATE | DELETE |
| Uso Principal | Modificar valores em linhas existentes. | Remover linhas da tabela. |
| Sintaxe | Inclui SET para definir novos valores. | Simplesmente especifica a linha alvo. |
| Risco | Alterações indesejadas se WHERE for omitido. | Remoção acidental de dados. |
| Impacto | Preserva as linhas; apenas altera valores. | Remove linhas permanentemente. |
| Desempenho | Pode ser custoso em atualizações em massa. | Mais rápido, mas pode afetar integridade. |

### Considerações de Desempenho

* Índices:
    * Usar índices adequados melhora a eficiência dos filtros em WHERE.
* Vacuum e AutoVacuum:
    * Linhas deletadas ou atualizadas continuam ocupando espaço até que o VACUUM seja executado.
    * Configuração correta do autovacuum é essencial para evitar inchaço da tabela.
* Tabelas com Muitas Alterações:
    * Considere o particionamento de tabelas para operações mais eficientes.