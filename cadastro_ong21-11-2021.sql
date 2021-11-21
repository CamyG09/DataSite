-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2021 às 14:53
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cadastro_ong`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insere_dependente` ()  BEGIN
INSERT INTO dependente (id_dep, nome, data_nasc, NIS, Renda, fk_titulardep) VALUES ( 2, 'Carla', '2012-11-05', '1245125596473', '100', 2);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleciona_dependente` ()  BEGIN
SELECT * FROM dependente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleciona_titular` ()  BEGIN
SELECT nome FROM titular;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `associados`
--
-- Criação: 21-Nov-2021 às 13:04
--

CREATE TABLE `associados` (
  `id` int(11) NOT NULL,
  `Nome` varchar(60) COLLATE utf8_estonian_ci NOT NULL,
  `Email` varchar(30) COLLATE utf8_estonian_ci NOT NULL,
  `Senha` char(16) COLLATE utf8_estonian_ci NOT NULL,
  `data_inclusao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_usuario` enum('Administrador','Editor','Consultor') COLLATE utf8_estonian_ci NOT NULL,
  `ultimo_acesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- RELATIONS FOR TABLE `associados`:
--

--
-- Extraindo dados da tabela `associados`
--

INSERT INTO `associados` (`id`, `Nome`, `Email`, `Senha`, `data_inclusao`, `tipo_usuario`, `ultimo_acesso`) VALUES
(1, 'Teste', 'sememail@sememail.com', 'z1x2c3', '2021-10-10 14:49:05', 'Editor', '2021-10-10 15:04:27'),
(2, 'Teste', 'sememail@sememail.com', 'z1x2c3', '2021-10-10 14:57:39', 'Editor', '2021-10-10 15:04:27'),
(3, 'Teste3', 'sememail@sememail.com', '?,Nrǻ2h\Z??W???', '2021-10-10 15:06:52', '', '2021-10-10 15:06:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conjugue`
--
-- Criação: 21-Nov-2021 às 13:04
--

CREATE TABLE `conjugue` (
  `id_conjugue` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET latin1 NOT NULL,
  `data_nasc` date NOT NULL,
  `sexo` enum('M','F') CHARACTER SET latin1 NOT NULL,
  `escolaridade` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nis` char(13) NOT NULL,
  `rg` int(9) NOT NULL,
  `cpf` char(11) NOT NULL,
  `titulo` char(12) NOT NULL,
  `zona` int(3) NOT NULL,
  `secao` int(4) NOT NULL,
  `celular` char(11) CHARACTER SET latin1 NOT NULL,
  `e-mail` varchar(30) CHARACTER SET latin1 NOT NULL,
  `facebook` varchar(20) CHARACTER SET latin1 NOT NULL,
  `profissao` varchar(30) CHARACTER SET latin1 NOT NULL,
  `renda` char(10) CHARACTER SET latin1 NOT NULL,
  `fk_titularconj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `conjugue`:
--   `fk_titularconj`
--       `titular` -> `matricula`
--   `fk_titularconj`
--       `titular` -> `matricula`
--

--
-- Extraindo dados da tabela `conjugue`
--

INSERT INTO `conjugue` (`id_conjugue`, `nome`, `data_nasc`, `sexo`, `escolaridade`, `nis`, `rg`, `cpf`, `titulo`, `zona`, `secao`, `celular`, `e-mail`, `facebook`, `profissao`, `renda`, `fk_titularconj`) VALUES
(4, 'Fulano', '1990-05-20', 'M', 'Superior ', '1547859654124', 145268745, '14524589631', '154269754121', 54, 5263, '11964526149', 'cagioli@gmail.com', '', 'Finceiro', '1400,00', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--
-- Criação: 21-Nov-2021 às 13:04
--

CREATE TABLE `dependente` (
  `id_dep` int(6) NOT NULL,
  `Nome` varchar(60) CHARACTER SET latin1 NOT NULL,
  `data_nasc` date NOT NULL,
  `NIS` char(13) NOT NULL,
  `Renda` varchar(10) CHARACTER SET latin1 NOT NULL,
  `fk_titulardep` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `dependente`:
--   `fk_titulardep`
--       `titular` -> `matricula`
--   `fk_titulardep`
--       `titular` -> `matricula`
--

--
-- Extraindo dados da tabela `dependente`
--

INSERT INTO `dependente` (`id_dep`, `Nome`, `data_nasc`, `NIS`, `Renda`, `fk_titulardep`) VALUES
(1, 'Giovana', '2015-06-12', '124578596473', '0', 2),
(2, 'Carla', '2012-11-05', '1245125596473', '100', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `programas_habitacionais`
--
-- Criação: 21-Nov-2021 às 13:04
--

CREATE TABLE `programas_habitacionais` (
  `id_prog` int(11) NOT NULL,
  `Incrição` enum('Sim','Não') CHARACTER SET latin1 NOT NULL,
  `Qual_in` varchar(20) CHARACTER SET latin1 NOT NULL,
  `N_inscrição` char(15) CHARACTER SET latin1 NOT NULL,
  `Outra_associação` enum('Sim','Não') CHARACTER SET latin1 NOT NULL,
  `Qual_associação` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Total_renda` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fk_titularprog` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `programas_habitacionais`:
--   `fk_titularprog`
--       `titular` -> `matricula`
--   `fk_titularprog`
--       `titular` -> `matricula`
--

--
-- Extraindo dados da tabela `programas_habitacionais`
--

INSERT INTO `programas_habitacionais` (`id_prog`, `Incrição`, `Qual_in`, `N_inscrição`, `Outra_associação`, `Qual_associação`, `Total_renda`, `fk_titularprog`) VALUES
(2, 'Não', '', '', 'Não', '', '2800,00', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `titular`
--
-- Criação: 21-Nov-2021 às 13:04
--

CREATE TABLE `titular` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(60) CHARACTER SET latin1 NOT NULL,
  `endereco` varchar(50) CHARACTER SET latin1 NOT NULL,
  `complemeto` varchar(20) CHARACTER SET latin1 NOT NULL,
  `bairro` varchar(15) CHARACTER SET latin1 NOT NULL,
  `cep` char(8) CHARACTER SET latin1 NOT NULL,
  `cidade` varchar(20) CHARACTER SET latin1 NOT NULL,
  `estado` char(2) CHARACTER SET latin1 NOT NULL,
  `naturalidade` varchar(20) CHARACTER SET latin1 NOT NULL,
  `data_nasc` date NOT NULL,
  `estado_civil` varchar(10) CHARACTER SET latin1 NOT NULL,
  `sexo` enum('M','F') CHARACTER SET latin1 NOT NULL,
  `escolaridade` varchar(25) CHARACTER SET latin1 NOT NULL,
  `profissao` varchar(30) CHARACTER SET latin1 NOT NULL,
  `renda` varchar(10) CHARACTER SET latin1 NOT NULL,
  `telefone` char(10) CHARACTER SET latin1 NOT NULL,
  `celular` char(11) CHARACTER SET latin1 NOT NULL,
  `telefone_rec` char(11) CHARACTER SET latin1 NOT NULL,
  `e-mail` varchar(30) CHARACTER SET latin1 NOT NULL,
  `facebook` varchar(25) CHARACTER SET latin1 NOT NULL,
  `nis` char(13) NOT NULL,
  `rg` int(9) NOT NULL,
  `cpf` char(11) NOT NULL,
  `titulo` char(12) NOT NULL,
  `zona` int(3) NOT NULL,
  `secao` int(4) NOT NULL,
  `moradia` enum('Aluguel','Cedida','Favela','Ocupação','Área livre','Área de risco') CHARACTER SET latin1 NOT NULL,
  `ativo` char(5) NOT NULL DEFAULT 'Sim'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- RELATIONS FOR TABLE `titular`:
--

--
-- Extraindo dados da tabela `titular`
--

INSERT INTO `titular` (`matricula`, `nome`, `endereco`, `complemeto`, `bairro`, `cep`, `cidade`, `estado`, `naturalidade`, `data_nasc`, `estado_civil`, `sexo`, `escolaridade`, `profissao`, `renda`, `telefone`, `celular`, `telefone_rec`, `e-mail`, `facebook`, `nis`, `rg`, `cpf`, `titulo`, `zona`, `secao`, `moradia`, `ativo`) VALUES
(2, 'Camila ', 'Rua sem info', '', 'jd. Noronha', '04800000', 'São Paulo', 'SP', 'Brasileira', '1991-12-09', 'Solteira', 'F', 'Superior Incompleto', 'Analista Finceiro', '1400,00', '1155555555', '11999999999', '', 'sememail@gmail.com', '', '1547859654124', 370001112, '33001122330', '124587457412', 111, 111, 'Aluguel', 'Sim'),
(5, 'Teste', 'teste', 'teste', 'teste', '00004574', 'São Paulo', 'SP', 'Brasileira', '1985-05-10', 'Solteira', 'F', 'Superior ', 'Finceiro', '1400,00', '1159346194', '11964526149', '', 'sememail@gmail.com', '', '1452469784521', 125487595, '00245978454', '114556975544', 154, 1452, 'Aluguel', 'Sim');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `associados`
--
ALTER TABLE `associados`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conjugue`
--
ALTER TABLE `conjugue`
  ADD PRIMARY KEY (`id_conjugue`),
  ADD KEY `fk_titularconj` (`fk_titularconj`);

--
-- Indexes for table `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`id_dep`),
  ADD KEY `fk_titulardep` (`fk_titulardep`);

--
-- Indexes for table `programas_habitacionais`
--
ALTER TABLE `programas_habitacionais`
  ADD PRIMARY KEY (`id_prog`),
  ADD KEY `fk_titularprog` (`fk_titularprog`);

--
-- Indexes for table `titular`
--
ALTER TABLE `titular`
  ADD PRIMARY KEY (`matricula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `associados`
--
ALTER TABLE `associados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `conjugue`
--
ALTER TABLE `conjugue`
  MODIFY `id_conjugue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dependente`
--
ALTER TABLE `dependente`
  MODIFY `id_dep` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `programas_habitacionais`
--
ALTER TABLE `programas_habitacionais`
  MODIFY `id_prog` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `titular`
--
ALTER TABLE `titular`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `conjugue`
--
ALTER TABLE `conjugue`
  ADD CONSTRAINT `fk_titularconj` FOREIGN KEY (`fk_titularconj`) REFERENCES `titular` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `titulardep` FOREIGN KEY (`fk_titulardep`) REFERENCES `titular` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `programas_habitacionais`
--
ALTER TABLE `programas_habitacionais`
  ADD CONSTRAINT `fk_titularprog` FOREIGN KEY (`fk_titularprog`) REFERENCES `titular` (`matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
