-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/11/2025 às 19:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `albergue_la`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `quartos`
--

CREATE TABLE `quartos` (
  `id` int(11) NOT NULL,
  `number` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` enum('disponivel','ocupado','manutencao') DEFAULT 'disponivel',
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `quartos`
--

INSERT INTO `quartos` (`id`, `number`, `type`, `price`, `capacity`, `status`, `description`, `created_at`) VALUES
(1, '101', 'Dormitório misto com 04 camas', 100.00, 4, 'disponivel', 'Dormitório misto com 04 camas', '2025-11-13 19:27:42'),
(2, '102', 'Dormitório misto com 08 camas (sem banheiro)', 60.00, 8, 'ocupado', 'Dormitório misto com 08 camas (sem banheiro)', '2025-11-13 19:27:42'),
(3, '103', 'Dormitório misto com 12 camas', 75.00, 12, 'disponivel', 'Dormitório misto com 12 camas', '2025-11-13 19:27:42'),
(6, '104', 'Dormitório misto com 04 camas', 100.00, 4, 'disponivel', 'Dormitório misto com 04 camas', '2025-11-19 16:07:46'),
(7, '105', 'Dormitório misto com 08 camas (sem banheiro)', 60.00, 8, 'disponivel', 'Dormitório misto com 08 camas (sem banheiro)', '2025-11-19 16:08:04'),
(8, '106', 'Dormitório misto com 12 camas', 75.00, 12, 'disponivel', 'Dormitório misto com 12 camas', '2025-11-19 16:08:41');

-- --------------------------------------------------------

--
-- Estrutura para tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `status` enum('pendente','confirmada','cancelada','concluida') DEFAULT 'pendente',
  `total_price` decimal(10,2) DEFAULT NULL,
  `observations` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reservas`
--

INSERT INTO `reservas` (`id`, `user_id`, `room_id`, `check_in`, `check_out`, `status`, `total_price`, `observations`, `created_at`) VALUES
(1, 2, 1, '2025-11-28', '2025-11-30', 'cancelada', 200.00, '', '2025-11-17 16:53:51'),
(2, 2, 3, '2025-11-20', '2025-11-28', 'cancelada', 600.00, '', '2025-11-17 20:08:02'),
(3, 2, 1, '2025-11-21', '2025-11-23', 'cancelada', 200.00, '', '2025-11-17 23:47:31'),
(4, 2, 1, '2025-11-29', '2025-11-30', 'cancelada', 100.00, '', '2025-11-19 15:53:44'),
(5, 2, 3, '2025-11-29', '2025-12-02', 'cancelada', 225.00, '', '2025-11-19 16:38:51'),
(6, 2, 8, '2025-11-29', '2025-12-02', 'cancelada', 225.00, '', '2025-11-19 16:44:51'),
(7, 2, 2, '2025-11-29', '2025-12-02', 'cancelada', 180.00, '', '2025-11-19 16:45:32'),
(8, 2, 2, '2025-11-29', '2025-12-06', 'confirmada', 420.00, '', '2025-11-19 17:26:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','cliente') NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`, `name`, `email`, `telefone`, `cpf`, `created_at`) VALUES
(1, 'admin', 'admin123', 'admin', 'Administrador', 'admin@alberguea.com', NULL, NULL, '2025-11-13 19:27:42'),
(2, 'cliente1', '123456', 'cliente', 'João Silva', 'joao@email.com', NULL, '123.456.789-00', '2025-11-13 19:27:42');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `quartos`
--
ALTER TABLE `quartos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Índices de tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `quartos`
--
ALTER TABLE `quartos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `quartos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
