## Prova de Banco de Dados - SEINENJUMP

Este repositório contém a prova de banco de dados para o sistema de uma loja de mangás, "SEINENJUMP",  abordando os seguintes tópicos:

**1 - Cenário**

A SEINENJUMP é uma loja online que vende mangás de diversos gêneros. A loja possui um sistema para gerenciar seus produtos, clientes, pedidos e pagamentos.
Esse banco de dados foi criado para gerenciar a "SEINENJUMP". O sistema pode verificar o cadastro dos clientes,mostrando também dados como CEP,Nome,Email,Tefelone entre outras informações, quais mangás eles compraram, quantos mangas existem no sistemas e tambémseus generos,editores,autores e etc.
No banco também possui um sistema de pagamento que ve qual item foi selecionado pelo cilente e qual foi o total do seu pedido, para isso o sistema faz um relacionamento com o  cadastro do usuario e qual mangá ele escolheu.

**2 - Modelagem Conceitual**
![image](https://github.com/hugozera1/sqlseinen/assets/161486790/5c0f7ed6-b3c1-400b-9197-f46270024ae9)
## Diagrama Entidade-Relacionamento (DER) do Banco de Dados SEINENJUMP

O Diagrama Entidade-Relacionamento (DER) ilustra a estrutura lógica do banco de dados SEINENJUMP, responsável por gerenciar informações de uma loja online de mangás. O DER representa as entidades do sistema e os relacionamentos entre elas, definindo as regras de integridade e as cardinalidades.

**Entidades:**

* **Cliente:** Representa os clientes da loja, com atributos como:
    * **ID_Cliente (PK):** Identificador único do cliente.
    * **Nome:** Nome completo do cliente.
    * **Email:** Endereço de email do cliente.
    * **Telefone:** Número de telefone do cliente.
    * **Endereço:** Endereço completo do cliente.
    * **CEP:** Código de Endereçamento Postal do cliente.
    * **DATA_NASC:** Data de nascimento do cliente.
* **Manga:** Representa os mangás vendidos pela loja, com atributos como:
    * **ID_Manga (PK):** Identificador único do mangá.
    * **Titulo:** Título do mangá.
    * **Autor:** Nome do autor do mangá.
    * **Editora:** Editora responsável pela publicação do mangá.
    * **Genero:** Gênero do mangá.
    * **Preço:** Preço unitário do mangá.
    * **Qtd:** Quantidade do mangá em estoque.
* **Pedido:** Representa os pedidos realizados pelos clientes, com atributos como:
    * **ID_Pedido (PK):** Identificador único do pedido.
    * **Data_Pedido:** Data em que o pedido foi realizado.
    * **Total:** Valor total do pedido.
    * **ID_Cliente (FK):** Chave estrangeira referenciando a entidade Cliente, indicando o cliente que realizou o pedido.
* **Item_Pedido:** Representa os itens que compõem cada pedido, com atributos como:
    * **ID_Item (PK):** Identificador único do item do pedido.
    * **Qtd:** Quantidade do mangá comprada no pedido.
    * **Preço_Unidade:** Preço unitário do mangá no pedido.
    * **ID_Manga (FK):** Chave estrangeira referenciando a entidade Manga, indicando o mangá comprado no pedido.
    * **ID_Pedido (FK):** Chave estrangeira referenciando a entidade Pedido, indicando o pedido a que o item pertence.
* **Pagamento:** Representa os métodos de pagamento utilizados pelos clientes, com atributos como:
    * **ID_Pagamento (PK):** Identificador único do pagamento.
    * **Tipo_Pagamento:** Tipo de pagamento (ex: cartão de crédito, débito, dinheiro).
    * **Data_Pagamento:** Data em que o pagamento foi realizado.
    * **Valor_Pagamento:** Valor total do pagamento.
    * **ID_Pedido (FK):** Chave estrangeira referenciando a entidade Pedido, indicando o pedido ao qual o pagamento se refere.

**Relacionamentos:**

* **Cliente faz Pedido:** Um cliente pode realizar vários pedidos, mas cada pedido é realizado por apenas um cliente (relacionamento 1:N).
* **Pedido contém Item_Pedido:** Um pedido pode conter vários itens, mas cada item pertence a apenas um pedido (relacionamento 1:N).
* **Item_Pedido contém Manga:** Um item do pedido representa um único mangá. Cada mangá pode ser comprado em vários pedidos (relacionamento N:1).
* **Genero com Mangá:** Um manga pode tem varios generos. Varios generos podem estar em varios mangás (relacionamento N:N).

**Cardinalidades:**

* **Cliente -> Pedido:** (1,N) Um cliente pode fazer vários pedidos.
* **Pedido -> Item_Pedido:** (1,N) Um pedido pode conter vários itens.
* **Item_Pedido -> Manga:** (N,1) Um mangá pode ser comprado em vários pedidos.


**3 - Modelagem Logica**


![image](https://github.com/hugozera1/sqlseinen/assets/161486790/62db393b-836c-4b66-905a-39ce2a462d65)

## Esquema do Banco de Dados SEINENJUMP

**Tabelas:**

1. **Manga:**

   - **PK**: `ID_Manga` (INT)
   - **Atributos:**
      - `Titulo` (VARCHAR(50))
      - `Autor` (VARCHAR(50))
      - `Editora` (VARCHAR(50))
      - `Genero` (VARCHAR(50))
      - `Preco` (VARCHAR(20))
      - `Qtd` (INT)


2. **Item_Pedido:**

   - **PK**: `ID_Item` (INT)
   - **Atributos:**
      - `Qtd` (INT)
      - `Preco_Unidade` (VARCHAR(50))
      - **FK**: `ID_Manga` (INT) REFERENCIANDO `Manga` (`ID_Manga`)
      - **FK**: `ID_Pedido` (INT) REFERENCIANDO `Pedido` (`ID_Pedido`)


3. **Pedido:**

   - **PK**: `ID_Pedido` (INT)
   - **Atributos:**
      - `Data_Pedido` (DATE)
      - `Total` (INT)
      - **FK**: `ID_Cliente` (INT) REFERENCIANDO `Cliente` (`ID_Cliente`)


4. **Pagamentos:**

   - **PK**: `ID_Pagamentos` (INT)
   - **Atributos:**
      - `Tipo_Pagamento` (VARCHAR(50))
      - `Data_Pagamento` (DATE)
      - `Valor_Pagamento` (VARCHAR(40))
      - **FK**: `ID_Pedido` (INT) REFERENCIANDO `Pedido` (`ID_Pedido`)

5. **Cliente:**

   - **PK**: `ID_Cliente` (INT)
   - **Atributos:**
      - `Nome` (VARCHAR(50))
      - `Email` (VARCHAR(50))
      - `Telefone` (VARCHAR(11))
      - `Endereco` (VARCHAR(60))
      - `Rua` (VARCHAR(60))
      - `Cidade` (VARCHAR(50))
      - `Estado` (VARCHAR(2))
      - `CEP` (VARCHAR(9))
      - `DATA_NASC` (VARCHAR(10))


**Relações:**

* **Um para Muitos:** Um mangá pode ser parte de muitos itens em diferentes pedidos.
* **Um para Muitos:** Um cliente pode fazer vários pedidos.
* **Um para Muitos:** Um pedido pode ter vários métodos de pagamento.

**4 - Modelagem Fisica**

## A criação do banco de dados (modelagem fisica)

Para criar um banco de dados geralmente utiliza-se alguns dos "SGBDs (Sistema de gerenciamento de banco de dados)" o utilizado pela "SEINENJUMP" é o Microsoft Sql Server.
Dentro desse banco de dados utliza-se a linguagem sql para criar as tabelas e fazer todo o arranjo das consultas. Exemplo de como foi criado as nossas tabelas no nosso banco de dados

**Tabela Manga**
```
-- Criando a tabela Manga
CREATE TABLE Manga (
    ID_Manga INT PRIMARY KEY,
    Titulo VARCHAR(50),
    Autor VARCHAR(50),
    Editora VARCHAR(50),
    Genero VARCHAR(50),
    Preço VARCHAR(20),
    Qtd INT
);
```
**Tabela Cliente**
```
-- Criando a tabela Cliente
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(50),
    Email VARCHAR(50),
    Telefone VARCHAR(11),
    Endereço VARCHAR(60),
    Rua VARCHAR(60),
    Cidade VARCHAR(50),
    Estado VARCHAR(2),
    CEP VARCHAR(9),
    DATA_NASC VARCHAR(10)
);
```
**Tabela Pedido**
```
CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Data_Pedido DATE,
    Total INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);
```
**Tabela Item_Pedido**
```
-- Criando a tabela Item_Pedido
CREATE TABLE Item_Pedido (
    ID_Item INT PRIMARY KEY,
    Qtd INT,
    Preço_Unidade VARCHAR(50),
    ID_Manga INT,
    ID_Pedido INT,
    FOREIGN KEY (ID_Manga) REFERENCES Manga(ID_Manga),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

```
**Tabela Pagamentos**
```
-- Criando a tabela Pagamentos
CREATE TABLE Pagamentos (
    ID_Pagamentos INT PRIMARY KEY,
    Tipo_Pagamento VARCHAR(50),
    Data_Pagamento DATE,
    Valor_Pagamento VARCHAR(40),
    ID_Pedido INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);
```


