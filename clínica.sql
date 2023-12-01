-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/10/2023 às 14:56
-- Versão do servidor: 8.0.28
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
  `Telefone` int DEFAULT NULL,
  `CRMMédico` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

CREATE TABLE `exame` (
  `CRMMédico` int DEFAULT NULL,
  `CPFPaciente` int DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `ID` int NOT NULL,
  `Resultado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `informações_bancárias`
--

CREATE TABLE `informações_bancárias` (
  `CPFPaciente` int DEFAULT NULL,
  `Cartão de crédito` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Cartão de débito` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Chave Pix` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `médico`
--

CREATE TABLE `médico` (
  `Nome` varchar(50) DEFAULT NULL,
  `CRM` int NOT NULL,
  `Especialização` varchar(50) DEFAULT NULL,
  `Telefone` int DEFAULT NULL,
  `Status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `CRMMédico` int DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `CPF` int NOT NULL,
  `Telefone` int DEFAULT NULL,
  `Endereço` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `CPFPaciente` int DEFAULT NULL,
  `Boleto` varchar(50) NOT NULL,
  `Data_Pagamento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `clínica`
--
ALTER TABLE `clínica`
  ADD CONSTRAINT `clínica_ibfk_1` FOREIGN KEY (`CRMMédico`) REFERENCES `médico` (`CRM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
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
