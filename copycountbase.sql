-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Fev-2022 às 23:06
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `copycountbase`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administradores`
--

CREATE TABLE `administradores` (
  `id_admin` int(11) NOT NULL,
  `administrador` varchar(100) NOT NULL,
  `passe` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `administradores`
--

INSERT INTO `administradores` (`id_admin`, `administrador`, `passe`) VALUES
(1, 'Admin', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `copias`
--

CREATE TABLE `copias` (
  `id_utilizador` int(11) DEFAULT NULL,
  `copias_preto_branco_A4` int(11) NOT NULL,
  `copias_preto_branco_A3` int(11) NOT NULL,
  `copias_cores_A4` int(11) NOT NULL,
  `copias_cores_A3` int(11) NOT NULL,
  `encardenacao_argolas` int(11) NOT NULL,
  `encardenacao_quente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes`
--

CREATE TABLE `observacoes` (
  `id_utilizador` int(11) DEFAULT NULL,
  `observacao` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `observacoes`
--

INSERT INTO `observacoes` (`id_utilizador`, `observacao`) VALUES
(16, '09/02/2022 19:54:57Registo criado!'),
(16, '09/02/2022 20:24:51: Comprou 4 cópias a preto e branco A4, 4 encadernações quentes,  dando um total de 2,80€.'),
(16, '10/02/2022 18:02:07: Comprou 10 cópias a preto e branco A4, 10 cópias a preto e branco A3, 10 copias a cores A4, 10 cópias a cores A3, 10 encadernações com argolas, 10 encadernações quentes,  dando um total de 20,00€.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saldo`
--

CREATE TABLE `saldo` (
  `id_utilizador` int(11) DEFAULT NULL,
  `saldo_utilizador` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `saldo`
--

INSERT INTO `saldo` (`id_utilizador`, `saldo_utilizador`) VALUES
(3, 10.7),
(5, 23),
(6, 22),
(7, 14),
(10, 12),
(12, 20),
(13, 10),
(16, 977.2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id_utilizador` int(11) NOT NULL,
  `numero_utilizador` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id_utilizador`, `numero_utilizador`, `nome`, `email`) VALUES
(3, '123456789', 'teste2', 'teste2@gmail.com'),
(5, 'a34567890', 'teste4', 'teste4@gmail.com'),
(6, '345678901', 'teste5', 'teste5@gmail.com'),
(7, 'a12345678', 'Teste6', 'teste6@gmail.com'),
(10, '123409876', 'Teste12', 'teste12@gmail.com'),
(12, 't12345678', 'testeee', 'testeee@gmail.com'),
(13, '123456781', 'tt', 'tt@t.com'),
(16, 'ab1234567', 'Alexandra', 'alexandra@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id_admin`);

--
-- Índices para tabela `copias`
--
ALTER TABLE `copias`
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices para tabela `observacoes`
--
ALTER TABLE `observacoes`
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices para tabela `saldo`
--
ALTER TABLE `saldo`
  ADD KEY `id_utilizador` (`id_utilizador`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id_utilizador`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id_utilizador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `copias`
--
ALTER TABLE `copias`
  ADD CONSTRAINT `copias_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `observacoes`
--
ALTER TABLE `observacoes`
  ADD CONSTRAINT `observacoes_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `saldo`
--
ALTER TABLE `saldo`
  ADD CONSTRAINT `saldo_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id_utilizador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
