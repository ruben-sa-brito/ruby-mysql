CREATE DATABASE IF NOT EXISTS orm_mysql_prod;
USE orm_mysql_prod;

-- Criação da tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14)
);

-- Criação da tabela de fornecedores
CREATE TABLE IF NOT EXISTS fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    cnpj VARCHAR(18),
    endereco VARCHAR(200)
);

-- Inserção de registros na tabela de clientes
INSERT INTO clientes (nome, telefone, cpf) VALUES
    ('João da Silva', '(11) 1234-5678', '123.456.789-00'),
    ('Maria Santos', '(21) 9876-5432', '987.654.321-00'),
    ('Pedro Oliveira', '(31) 5555-4444', '555.444.333-22'),
    ('Ana Souza', '(41) 9999-8888', '999.888.777-66'),
    ('Lucas Pereira', '(51) 2222-1111', '222.111.000-99'),
    ('Carla Ferreira', '(61) 7777-6666', '777.666.555-44'),
    ('Fernando Costa', '(71) 3333-2222', '333.222.111-00'),
    ('Juliana Almeida', '(81) 8888-7777', '888.777.666-55'),
    ('Rafaela Oliveira', '(91) 4444-3333', '444.333.222-11'),
    ('Gustavo Rodrigues', '(01) 6666-5555', '666.555.444-33');

-- Inserção de registros na tabela de fornecedores
INSERT INTO fornecedores (nome, telefone, cnpj, endereco) VALUES
    ('Empresa A', '(11) 1111-1111', '11.111.111/0001-11', 'Rua A, 123'),
    ('Empresa B', '(22) 2222-2222', '22.222.222/0002-22', 'Avenida B, 456'),
    ('Empresa C', '(33) 3333-3333', '33.333.333/0003-33', 'Travessa C, 789'),
    ('Empresa D', '(44) 4444-4444', '44.444.444/0004-44', 'Praça D, 101'),
    ('Empresa E', '(55) 5555-5555', '55.555.555/0005-55', 'Alameda E, 202'),
    ('Empresa F', '(66) 6666-6666', '66.666.666/0006-66', 'Estrada F, 303'),
    ('Empresa G', '(77) 7777-7777', '77.777.777/0007-77', 'Avenida G, 404'),
    ('Empresa H', '(88) 8888-8888', '88.888.888/0008-88', 'Rua H, 505'),
    ('Empresa I', '(99) 9999-9999', '99.999.999/0009-99', 'Avenida I, 606'),
    ('Empresa J', '(00) 0000-0000', '00.000.000/0010-00', 'Praça J, 707');