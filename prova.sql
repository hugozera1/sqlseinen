Use SEINENJUMP;
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

-- Criando a tabela Pedido
CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    Data_Pedido DATE,
    Total INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

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

-- Criando a tabela Pagamentos
CREATE TABLE Pagamentos (
    ID_Pagamentos INT PRIMARY KEY,
    Tipo_Pagamento VARCHAR(50),
    Data_Pagamento DATE,
    Valor_Pagamento VARCHAR(40),
    ID_Pedido INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);


use SEINENJUMP;
	select * from Manga
-- Inserindo dados na tabela Manga
INSERT INTO Manga (ID_Manga, Titulo, Autor, Editora, Genero, Preço, Qtd) VALUES
    (1, 'Attack on Titan', 'Hajime Isayama', 'Panini', 'Ação', '35.00', 50),
    (2, 'One Piece', 'Eiichiro Oda', 'Panini', 'Aventura', '30.00', 100),
    (3, 'My Hero Academia', 'Kohei Horikoshi', 'Panini', 'Shonen', '28.00', 75),
    (4, 'Demon Slayer', 'Koyoharu Gotouge', 'Panini', 'Ação', '32.00', 60),
    (5, 'Naruto', 'Masashi Kishimoto', 'Panini', 'Shonen', '25.00', 120),
    (6, 'Bleach', 'Tite Kubo', 'Panini', 'Ação', '27.00', 80),
    (7, 'Jujutsu Kaisen', 'Gege Akutami', 'Panini', 'Sobrenatural', '30.00', 55),
    (8, 'Tokyo Ghoul', 'Sui Ishida', 'Panini', 'Terror', '29.00', 45),
    (9, 'Fullmetal Alchemist', 'Hiromu Arakawa', 'Panini', 'Fantasia', '33.00', 65),
    (10, 'Death Note', 'Tsugumi Ohba', 'Panini', 'Suspense', '26.00', 90),
    (11, 'Hunter x Hunter', 'Yoshihiro Togashi', 'Panini', 'Aventura', '31.00', 50),
    (12, 'Dragon Ball', 'Akira Toriyama', 'Panini', 'Ação', '24.00', 150),
    (13, 'Yu-Gi-Oh!', 'Kazuki Takahashi', 'Panini', 'Jogo', '28.00', 70),
    (14, 'Fairy Tail', 'Hiro Mashima', 'Panini', 'Fantasia', '29.00', 60),
    (15, 'Black Clover', 'Yuki Tabata', 'Panini', 'Fantasia', '30.00', 55),
    (16, 'The Promised Neverland', 'Kaiu Shirai', 'Panini', 'Terror', '32.00', 45),
    (17, 'Dr. Stone', 'Riichiro Inagaki', 'Panini', 'Aventura', '27.00', 65),
    (18, 'Chainsaw Man', 'Tatsuki Fujimoto', 'Panini', 'Terror', '31.00', 50),
    (19, 'Made in Abyss', 'Akihito Tsukushi', 'Panini', 'Aventura', '28.00', 40),
    (20, 'Vinland Saga', 'Makoto Yukimura', 'Panini', 'Histórico', '33.00', 35);


	-- Adiciona Shueisha
UPDATE Manga SET Editora = 'Shueisha' WHERE Editora = 'Panini' AND ID_Manga IN (1, 2, 4, 6, 8, 9, 10, 12, 14, 15, 16, 18, 19);

-- Adiciona JBC
UPDATE Manga SET Editora = 'JBC' WHERE Editora = 'Panini' AND ID_Manga IN (3, 5, 7, 11, 13, 17, 20);

-- Adiciona NewPOP
UPDATE Manga SET Editora = 'NewPOP' WHERE Editora = 'Panini' AND ID_Manga = 21;

-- Adiciona a Panini novamente
UPDATE Manga SET Editora = 'Panini' WHERE Editora = 'Shueisha' AND ID_Manga IN (2, 3, 6, 14);

use SEINENJUMP;
-- Inserindo dados na tabela Cliente
select * from Cliente
INSERT INTO Cliente (ID_Cliente, Nome, Email, Telefone, Endereço, Rua, Cidade, Estado, CEP, DATA_NASC) VALUES
    (1, 'João Silva', 'joao.silva@email.com', '11999991111', 'Rua A, 123', 'Rua A', 'São Paulo', 'SP', '01001000', '1980-01-01'),
    (2, 'Maria Santos', 'maria.santos@email.com', '21988882222', 'Av. B, 456', 'Av. B', 'Rio de Janeiro', 'RJ', '20000000', '1985-05-15'),
    (3, 'Pedro Oliveira', 'pedro.oliveira@email.com', '12977773333', 'Rua C, 789', 'Rua C', 'Campinas', 'SP', '13000000', '1990-10-20'),
    (4, 'Ana Rodrigues', 'ana.rodrigues@email.com', '41966664444', 'Av. D, 1011', 'Av. D', 'Curitiba', 'PR', '80000000', '1995-02-28'),
    (5, 'Carlos Ferreira', 'carlos.ferreira@email.com', '11955555555', 'Rua E, 1213', 'Rua E', 'São Paulo', 'SP', '02002000', '1975-08-12'),
    (6, 'Fernanda Almeida', 'fernanda.almeida@email.com', '31944446666', 'Av. F, 1415', 'Av. F', 'Belo Horizonte', 'MG', '30000000', '1988-11-03'),
    (7, 'Luiz Costa', 'luiz.costa@email.com', '21933337777', 'Rua G, 1617', 'Rua G', 'Rio de Janeiro', 'RJ', '22000000', '1978-03-07'),
    (8, 'Gabriela Silva', 'gabriela.silva@email.com', '19922228888', 'Av. H, 1819', 'Av. H', 'Porto Alegre', 'RS', '90000000', '1992-06-19'),
    (9, 'Ricardo Santos', 'ricardo.santos@email.com', '11911119999', 'Rua I, 2021', 'Rua I', 'São Paulo', 'SP', '03003000', '1982-09-25'),
    (10, 'Bruna Oliveira', 'bruna.oliveira@email.com', '61900001111', 'Av. J, 2223', 'Av. J', 'Brasília', 'DF', '70000000', '1997-01-10'),
    (11, 'Rafael Rodrigues', 'rafael.rodrigues@email.com', '21987654321', 'Rua K, 2425', 'Rua K', 'Rio de Janeiro', 'RJ', '21000000', '1989-04-05'),
    (12, 'Letícia Ferreira', 'leticia.ferreira@email.com', '11978901234', 'Av. L, 2627', 'Av. L', 'São Paulo', 'SP', '04004000', '1993-07-22'),
    (13, 'Gustavo Almeida', 'gustavo.almeida@email.com', '32965432109', 'Rua M, 2829', 'Rua M', 'Belo Horizonte', 'MG', '31000000', '1986-10-11'),
    (14, 'Mariana Costa', 'mariana.costa@email.com', '11954321098', 'Av. N, 3031', 'Av. N', 'São Paulo', 'SP', '05005000', '1998-02-03'),
    (15, 'Henrique Silva', 'henrique.silva@email.com', '51943210987', 'Rua O, 3233', 'Rua O', 'Porto Alegre', 'RS', '91000000', '1981-05-18'),
    (16, 'Beatriz Santos', 'beatriz.santos@email.com', '11932109876', 'Av. P, 3435', 'Av. P', 'São Paulo', 'SP', '06006000', '1994-08-27'),
    (17, 'Felipe Oliveira', 'felipe.oliveira@email.com', '62921098765', 'Rua Q, 3637', 'Rua Q', 'Brasília', 'DF', '71000000', '1983-11-13'),
    (18, 'Camila Rodrigues', 'camila.rodrigues@email.com', '21910987654', 'Av. R, 3839', 'Av. R', 'Rio de Janeiro', 'RJ', '23000000', '1996-03-09'),
    (19, 'Daniel Ferreira', 'daniel.ferreira@email.com', '11909876543', 'Rua S, 4041', 'Rua S', 'São Paulo', 'SP', '07007000', '1987-06-24'),
    (20, 'Isabela Almeida', 'isabela.almeida@email.com', '31998765432', 'Av. T, 4243', 'Av. T', 'Belo Horizonte', 'MG', '32000000', '1999-09-16');


use SEINENJUMP;
-- Inserindo dados na tabela Pedido
select * from Pedido
INSERT INTO Pedido (ID_Pedido, Data_Pedido, Total, ID_Cliente) VALUES
    (1, '2023-03-15', 105, 1),
    (2, '2023-03-18', 75, 2),
    (3, '2023-03-22', 56, 3),
    (4, '2023-03-25', 90, 4),
    (5, '2023-03-28', 120, 5),
    (6, '2023-04-01', 60, 6),
    (7, '2023-04-05', 150, 7),
    (8, '2023-04-08', 45, 8),
    (9, '2023-04-12', 110, 9),
    (10, '2023-04-15', 85, 10),
    (11, '2023-04-19', 70, 11),
    (12, '2023-04-22', 130, 12),
    (13, '2023-04-26', 55, 13),
    (14, '2023-04-29', 100, 14),
    (15, '2023-05-03', 95, 15),
    (16, '2023-05-06', 65, 16),
    (17, '2023-05-10', 125, 17),
    (18, '2023-05-13', 80, 18),
    (19, '2023-05-17', 40, 19),
    (20, '2023-05-20', 115, 20);


	use SEINENJUMP;
select * from Item_Pedido
-- Inserindo dados na tabela Item_Pedido
INSERT INTO Item_Pedido (ID_Item, Qtd, Preço_Unidade, ID_Manga, ID_Pedido) VALUES
    (1, 2, '35.00', 1, 1),
    (2, 1, '30.00', 2, 1),
    (3, 1, '28.00', 3, 2),
    (4, 2, '32.00', 4, 2),
    (5, 1, '25.00', 5, 3),
    (6, 2, '27.00', 6, 3),
    (7, 2, '30.00', 7, 4),
    (8, 1, '29.00', 8, 4),
    (9, 3, '33.00', 9, 5),
    (10, 1, '26.00', 10, 5),
    (11, 2, '31.00', 11, 6),
    (12, 1, '24.00', 12, 6),
    (13, 3, '28.00', 13, 7),
    (14, 2, '29.00', 14, 7),
    (15, 2, '30.00', 15, 8),
    (16, 1, '32.00', 16, 8),
    (17, 4, '27.00', 17, 9),
    (18, 1, '31.00', 18, 9),
    (19, 1, '28.00', 19, 10),
    (20, 3, '33.00', 20, 10),
    (21, 2, '35.00', 1, 11),
    (22, 1, '30.00', 2, 11),
    (23, 1, '28.00', 3, 12),
    (24, 2, '32.00', 4, 12),
    (25, 1, '25.00', 5, 13),
    (26, 2, '27.00', 6, 13),
    (27, 2, '30.00', 7, 14),
    (28, 1, '29.00', 8, 14),
    (29, 3, '33.00', 9, 15),
    (30, 1, '26.00', 10, 15),
    (31, 2, '31.00', 11, 16),
    (32, 1, '24.00', 12, 16),
    (33, 3, '28.00', 13, 17),
    (34, 2, '29.00', 14, 17),
    (35, 2, '30.00', 15, 18),
    (36, 1, '32.00', 16, 18),
    (37, 4, '27.00', 17, 19),
    (38, 1, '31.00', 18, 19),
    (39, 1, '28.00', 19, 20),
    (40, 3, '33.00', 20, 20);


	use SEINENJUMP;




-- Inserindo dados na tabela Pagamentos
INSERT INTO Pagamentos (ID_Pagamentos, Tipo_Pagamento, Data_Pagamento, Valor_Pagamento, ID_Pedido) VALUES
    (1, 'Cartão de Crédito', '2023-03-15', '105.00', 1),
    (2, 'Débito', '2023-03-18', '75.00', 2),
    (3, 'Dinheiro', '2023-03-22', '56.00', 3),
    (4, 'Cartão de Crédito', '2023-03-25', '90.00', 4),
    (5, 'Débito', '2023-03-28', '120.00', 5),
    (6, 'Dinheiro', '2023-04-01', '60.00', 6),
    (7, 'Cartão de Crédito', '2023-04-05', '150.00', 7),
    (8, 'Débito', '2023-04-08', '45.00', 8),
    (9, 'Dinheiro', '2023-04-12', '110.00', 9),
    (10, 'Cartão de Crédito', '2023-04-15', '85.00', 10),
    (11, 'Débito', '2023-04-19', '70.00', 11),
    (12, 'Dinheiro', '2023-04-22', '130.00', 12),
    (13, 'Cartão de Crédito', '2023-04-26', '55.00', 13),
    (14, 'Débito', '2023-04-29', '100.00', 14),
    (15, 'Dinheiro', '2023-05-03', '95.00', 15),
    (16, 'Cartão de Crédito', '2023-05-06', '65.00', 16),
    (17, 'Débito', '2023-05-10', '125.00', 17),
    (18, 'Dinheiro', '2023-05-13', '80.00', 18),
    (19, 'Cartão de Crédito', '2023-05-17', '40.00', 19),
    (20, 'Débito', '2023-05-20', '115.00', 20);

use SEINENJUMP;
SELECT * FROM Manga WHERE Genero = 'Ação';

USE SEINENJUMP;
SELECT ID_Manga, Titulo, Autor, Editora, Genero, Preço, Qtd
FROM Manga
WHERE Titulo = 'INITAL D';
INSERT INTO Manga (ID_Manga, Titulo, Autor, Editora, Genero, Preço, Qtd) VALUES
    (21, 'INITAL D', 'Nakamura hikaru', 'Panini', 'Ação', '32.00', 50);


UPDATE Manga SET Preço = '38.00' WHERE ID_Manga = 21;
SELECT ID_Manga, Titulo, Autor, Editora, Genero, Preço, Qtd
FROM Manga
WHERE Titulo = 'INITAL D';

DELETE FROM Manga WHERE ID_Manga = 21;
--SELECT 1 
SELECT Titulo AS Manga, Autor, Editora
FROM Manga;
--


--SELECT 2
SELECT Cliente.Nome, Cliente.Email, Pedido.ID_Pedido, Pedido.Data_Pedido
FROM Cliente
JOIN Pedido ON Cliente.ID_Cliente = Pedido.ID_Cliente;
----

----SELECT 3
SELECT Titulo, Preço 
FROM Manga
WHERE CAST(REPLACE(Preço, ',', '.') AS DECIMAL) > 30.00
ORDER BY Preço DESC;
---
---SELECT 4
SELECT Cliente.Nome, Cliente.Email 
FROM Cliente
JOIN Pedido ON Cliente.ID_Cliente = Pedido.ID_Cliente
WHERE Pedido.Data_Pedido = '2023-04-01';
select * from Manga
----

---SELECT 5
SELECT Item_Pedido.Qtd, Item_Pedido.Preço_Unidade, Manga.Titulo
FROM Item_Pedido
JOIN Manga ON Item_Pedido.ID_Manga = Manga.ID_Manga
WHERE Item_Pedido.ID_Pedido = 5;
---

---SELECT 6
SELECT Titulo, Qtd
FROM Manga
ORDER BY Qtd DESC
----

----SELECT 7
SELECT DISTINCT Cliente.Nome
FROM Cliente
JOIN Pedido ON Cliente.ID_Cliente = Pedido.ID_Cliente
JOIN Item_Pedido ON Pedido.ID_Pedido = Item_Pedido.ID_Pedido
JOIN Manga ON Item_Pedido.ID_Manga = Manga.ID_Manga
WHERE Manga.Genero = 'Ação';
----

----SELECT 8
SELECT Tipo_Pagamento, COUNT(*) AS Total_Pagamentos
FROM Pagamentos
GROUP BY Tipo_Pagamento;
-----

----SELECT 9
SELECT Manga.Titulo, SUM(Item_Pedido.Qtd) AS Total_Itens_Vendidos
FROM Manga
JOIN Item_Pedido ON Manga.ID_Manga = Item_Pedido.ID_Manga
GROUP BY Manga.Titulo
ORDER BY Total_Itens_Vendidos DESC
----

----SELECT 10
SELECT 
    Cliente.Nome AS Cliente,
    Cliente.Email AS Email_Cliente,
    Pedido.Data_Pedido AS Data_do_Pedido,
    Pedido.Total AS Valor_Total_do_Pedido,
    Manga.Titulo AS Manga,
    Item_Pedido.Qtd AS Quantidade_de_Mangas,
    Item_Pedido.Preço_Unidade AS Preco_Unitario
FROM 
    Cliente
JOIN 
    Pedido ON Cliente.ID_Cliente = Pedido.ID_Cliente
JOIN 
    Item_Pedido ON Pedido.ID_Pedido = Item_Pedido.ID_Pedido
JOIN 
    Manga ON Item_Pedido.ID_Manga = Manga.ID_Manga;
----
----

