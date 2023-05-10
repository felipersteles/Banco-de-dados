# Banco de dados

Trabalho desenvolvido para a terceira nota da disciplina de banco de dados utilizando PostgresSQL

## Modelo relacional

## Modelagem de banco de dados

É atraves da modalagem que é possivel visualizar como as informações presentes em um banco de dados serão armazenadas e quais serão os relacionamentos entre as tabelas.

### Objetivo

> Representar o mundo real que nos observamos com o máximo de precisão, para auxiliar as decisões de negócio.
> Nada é por acaso.

### Modelos de dados

> pode ser divido em três (3):

1. Modelo conceitual

Primeira etapa da modelagem, onde os requisitos são analisados para obteção de maior clareza e entendimento do problema. Aqui ocorre a representação gráfica do banco de dados.

2. Modelo Lógico

Representação das entidades, atributos e relações nas estruturas de tabelas. Criação das tabelas em forma de ideia ou desenho, ou seja, ainda não tem contato com os códigos.

3. Modelo físico
   Execução do programa. Escolher banco de dados relacional (meu preferido: Postgres). Injeção de comandos, ou scripts, SQL.

## Cardinalidade

### Relacionamento

É um conjunto de associações entre entidades. O relacionamento é representado por um losango no gráfico do MER.

### Cardinalidade dos relacionamento

![image](https://www.devmedia.com.br/imagens/sqlmagazine/abr2006/18-05pic04.JPG)

A cardinalidade é um número que expressa o comportamento (numero de ocorrencias) de determinada entidade associada a uma ocorrencia de entidade em questão atraves do relacionamento. Existem dois tipos de cardinalidade: mínima e máxima.

A máxima expressa o número máximo de ocorrências de determinada entidade, associada a uma ocorrência da entidade em questão. A minima o oposto.

Exemplo:

![image2](https://www.devmedia.com.br/imagens/sqlmagazine/abr2006/18-05pic05.JPG)

Traduzindo a imagem acima podemos constatar que um **empregado** pode **não possuir dependentes** ou **possuir vários**. Enquanto o dependente possui **um** e **somente um** empregado responsável.

## Comandos **SQL**

SQL signfica _Structured Query Language (Linguagem de Consulta Estruturada)_ e, é uma linguagem padrão de gerenciamento de dados que interage com os principais bancos de dados baseados no modelo relacional.

### **DQL**

> Data Query Language

> Possui **um** único comando: `SELECT`

> Utilizado para realizar consultas aos dados de uma determinada tabela. Exemplo:

```
SELECT * FOM nome_tabela;

```

### **DDL**

> Data Definition Language

> Possui **três** comando: `CREATE`, `ALTER`, `DROP`

> Utilizado para realizar a criação, alteração no banco de dados. Exemplos:

```
/*cria novo banco*/
CREATE DATABASE banco_de_teste;

/*cria nova tabela*/
CREATE TABLE nova_tabela (id INT, nome VARCHAR(7));

/*Altera a tabela criada acima e adiciona a coluna idade após o nome*/
ALTER TABLE nova_tabela ADD idade INT AFTER nome;

/*deleta o banco*/
DROP DATABASE banco_de_teste;

/*deleta table*/
CREATE TABLE nova_tabela;

```

### **DML**

> Data Manipulation Language

> Possui **três** comandos: `INSERT`, `UPDATE`, `DELETE`

> Utilizado para realizar modificações aos dados presentes em uma determinada tabela. Exemplo:

```
/*insere dado na tabela*/
INSERT INTO tabela (id, nome, idade) VALUES (1, 'felipe teles', 22);

/*modifica a coluna idade onde o valor da coluna id for igual a um(1)*/
UPDATE tabela SET idade = 23 WHERE id 1;

/*remove usuario com ID 1 da tabela*/
DELETE FROM tabela WHERE id = 1;

```

## SQL Join

Para facilitar a busca de informações em um banco de dados relacional com comandos SQL é necessário entender a Teoria dos Conjuntos, presente na **matemática**:

![image3](https://arquivo.devmedia.com.br/artigos/Fernanda_sallai/sql_join/image001.jpg)

Para apresentar os comandos abaixo vamos utilizar como exemplo duas tabelas chamadas:

1. `Tabela A`
2. `Tabela B`

### Inner Join

> Retorna os dados em comum entre a tabela A e a tabela B.

### Left Join

> Retorna os todos os dados da Tabela A somados aos dados em como com a Tabela B.

### Right Join

> Retorna os todos os dados da Tabela B somados aos dados em como com a Tabela A.

### Outer Join

> Retorna todos os dados da Tabela B e todos os dados da Tabela A.

### Left Excluding Join

> Retorna todos os dados da Tabela A que não estão na Tabela B.

### Right Excluding Join

> Retorna todos os dados da Tabela B que não estão na Tabela A.

### Outer Excluding Join

> Retorna todos os dados que estão na Tabela B e na Tabela A, mas que não são comuns entre elas.

## Fontes

1. [modelagem](https://www.youtube.com/watch?v=W49AO7f93Jk&ab_channel=HashtagPrograma%C3%A7%C3%A3o)
2. [cardinalidade](https://www.devmedia.com.br/tecnologias-de-banco-de-dados-e-modelagem-de-dados/1660)
3. [comandos](https://www.treinaweb.com.br/blog/principais-comandos-sql)
4. [joins](https://www.devmedia.com.br/sql-join-entenda-como-funciona-o-retorno-dos-dados/31006)
