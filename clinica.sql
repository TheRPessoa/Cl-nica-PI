-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2023 às 10:30
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clínica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clínica`
--

CREATE TABLE `clínica` (
  `Endereço` varchar(50) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `CRMMédico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

CREATE TABLE `exame` (
  `CRMMédico` int(11) DEFAULT NULL,
  `CPFPaciente` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `Resultado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informações_bancárias`
--

CREATE TABLE `informações_bancárias` (
  `CPFPaciente` int(11) DEFAULT NULL,
  `Cartão de crédito` varchar(50) DEFAULT NULL,
  `Cartão de débito` varchar(100) NOT NULL,
  `Chave Pix` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `médico`
--

CREATE TABLE `médico` (
  `Nome` varchar(50) DEFAULT NULL,
  `CRM` int(11) NOT NULL,
  `Especialização` varchar(50) DEFAULT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `CRMMédico` int(11) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `CPF` int(11) NOT NULL,
  `Telefone` int(11) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL,
  `Senha` text NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`CRMMédico`, `Nome`, `CPF`, `Telefone`, `Endereco`, `Senha`, `isAdmin`) VALUES
(NULL, 'pessoa', 1234, 49, 'Juvevê', '$2y$10$s/TXVZb24O7BXeXys9U7jOrNq5xrdx1TESKu1QTZgd6xPjVF1JBi2', 1),
(NULL, 'Ricardo', 123456, 49, 'Rebouças', '$2y$10$c/VaupEnpysIzXiperkHZ.W1ywPL/wTxoNRDwPfq3OF4nkIjr7mpS', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `CPFPaciente` int(11) DEFAULT NULL,
  `Boleto` varchar(50) NOT NULL,
  `Data_Pagamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clínica`
--
ALTER TABLE `clínica`
  ADD KEY `CRMMédico` (`CRMMédico`);

--
-- Índices de tabela `exame`
--
ALTER TABLE `exame`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `CRMMédico` (`CRMMédico`),
  ADD KEY `CPFPaciente` (`CPFPaciente`);

--
-- Índices de tabela `informações_bancárias`
--
ALTER TABLE `informações_bancárias`
  ADD KEY `CPFPaciente` (`CPFPaciente`);

--
-- Índices de tabela `médico`
--
ALTER TABLE `médico`
  ADD PRIMARY KEY (`CRM`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`CPF`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD KEY `CRMMédico` (`CRMMédico`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD KEY `CPFPaciente` (`CPFPaciente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `exame`
--
ALTER TABLE `exame`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clínica`
--
ALTER TABLE `clínica`
  ADD CONSTRAINT `clínica_ibfk_1` FOREIGN KEY (`CRMMédico`) REFERENCES `médico` (`CRM`),
  ADD CONSTRAINT `clínica_ibfk_2` FOREIGN KEY (`CRMMédico`) REFERENCES `médico` (`CRM`);

--
-- Restrições para tabelas `exame`
--
ALTER TABLE `exame`
  ADD CONSTRAINT `exame_ibfk_1` FOREIGN KEY (`CRMMédico`) REFERENCES `paciente` (`CRMMédico`),
  ADD CONSTRAINT `exame_ibfk_2` FOREIGN KEY (`CPFPaciente`) REFERENCES `paciente` (`CPF`);

--
-- Restrições para tabelas `informações_bancárias`
--
ALTER TABLE `informações_bancárias`
  ADD CONSTRAINT `informações_bancárias_ibfk_1` FOREIGN KEY (`CPFPaciente`) REFERENCES `paciente` (`CPF`);

--
-- Restrições para tabelas `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`CRMMédico`) REFERENCES `médico` (`CRM`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`CPFPaciente`) REFERENCES `paciente` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
