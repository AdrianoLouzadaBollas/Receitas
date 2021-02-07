-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 07-Fev-2021 às 01:43
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `receitas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ingredientesreceita`
--

CREATE TABLE `ingredientesreceita` (
  `id` int(11) NOT NULL,
  `receitaId` int(11) DEFAULT NULL,
  `ingredienteId` int(11) DEFAULT NULL,
  `unidadeId` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas`
--

CREATE TABLE `receitas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preparo` text COLLATE utf8mb4_general_ci,
  `tempoPreparo` timestamp NULL DEFAULT NULL,
  `qtdPessoas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_access_log`
--

CREATE TABLE `system_access_log` (
  `id` int(11) NOT NULL,
  `sessionid` text COLLATE utf8mb4_general_ci,
  `login` text COLLATE utf8mb4_general_ci,
  `login_time` timestamp NULL DEFAULT NULL,
  `login_year` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_month` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_day` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  `impersonated` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_ip` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_access_log`
--

INSERT INTO `system_access_log` (`id`, `sessionid`, `login`, `login_time`, `login_year`, `login_month`, `login_day`, `logout_time`, `impersonated`, `access_ip`) VALUES
(1, 'eed80f7b48b963a1dc6b6f12609dfd3d', 'admin', '2021-02-06 23:51:52', '2021', '02', '06', '2021-02-06 23:52:19', 'N', '::1'),
(2, 'efc7a58aa4c66529261b2d6ea2fde562', 'admin', '2021-02-06 23:53:25', '2021', '02', '06', NULL, 'N', '::1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_change_log`
--

CREATE TABLE `system_change_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NULL DEFAULT NULL,
  `login` text COLLATE utf8mb4_general_ci,
  `tablename` text COLLATE utf8mb4_general_ci,
  `primarykey` text COLLATE utf8mb4_general_ci,
  `pkvalue` text COLLATE utf8mb4_general_ci,
  `operation` text COLLATE utf8mb4_general_ci,
  `columnname` text COLLATE utf8mb4_general_ci,
  `oldvalue` text COLLATE utf8mb4_general_ci,
  `newvalue` text COLLATE utf8mb4_general_ci,
  `access_ip` text COLLATE utf8mb4_general_ci,
  `transaction_id` text COLLATE utf8mb4_general_ci,
  `log_trace` text COLLATE utf8mb4_general_ci,
  `session_id` text COLLATE utf8mb4_general_ci,
  `class_name` text COLLATE utf8mb4_general_ci,
  `php_sapi` text COLLATE utf8mb4_general_ci,
  `log_year` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_month` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_day` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document`
--

CREATE TABLE `system_document` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `title` text COLLATE utf8mb4_general_ci,
  `description` text COLLATE utf8mb4_general_ci,
  `category_id` int(11) DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `archive_date` date DEFAULT NULL,
  `filename` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document_category`
--

CREATE TABLE `system_document_category` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_document_category`
--

INSERT INTO `system_document_category` (`id`, `name`) VALUES
(1, 'Documentação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document_group`
--

CREATE TABLE `system_document_group` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_document_user`
--

CREATE TABLE `system_document_user` (
  `id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `system_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group`
--

CREATE TABLE `system_group` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_group`
--

INSERT INTO `system_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Standard');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_group_program`
--

CREATE TABLE `system_group_program` (
  `id` int(11) NOT NULL,
  `system_group_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_group_program`
--

INSERT INTO `system_group_program` (`id`, `system_group_id`, `system_program_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 8),
(8, 1, 9),
(9, 1, 11),
(10, 1, 14),
(11, 1, 15),
(12, 2, 10),
(13, 2, 12),
(14, 2, 13),
(15, 2, 16),
(16, 2, 17),
(17, 2, 18),
(18, 2, 19),
(19, 2, 20),
(20, 1, 21),
(21, 2, 22),
(22, 2, 23),
(23, 2, 24),
(24, 2, 25),
(25, 1, 26),
(26, 1, 27),
(27, 1, 28),
(28, 1, 29),
(29, 2, 30),
(30, 1, 31),
(31, 1, 32),
(32, 1, 33),
(33, 1, 34),
(34, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 2, 41);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_message`
--

CREATE TABLE `system_message` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_user_to_id` int(11) DEFAULT NULL,
  `subject` text COLLATE utf8mb4_general_ci,
  `message` text COLLATE utf8mb4_general_ci,
  `dt_message` text COLLATE utf8mb4_general_ci,
  `checked` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_user_to_id` int(11) DEFAULT NULL,
  `subject` text COLLATE utf8mb4_general_ci,
  `message` text COLLATE utf8mb4_general_ci,
  `dt_message` text COLLATE utf8mb4_general_ci,
  `action_url` text COLLATE utf8mb4_general_ci,
  `action_label` text COLLATE utf8mb4_general_ci,
  `icon` text COLLATE utf8mb4_general_ci,
  `checked` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_preference`
--

CREATE TABLE `system_preference` (
  `id` text COLLATE utf8mb4_general_ci,
  `value` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_program`
--

CREATE TABLE `system_program` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `controller` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_program`
--

INSERT INTO `system_program` (`id`, `name`, `controller`) VALUES
(1, 'System Group Form', 'SystemGroupForm'),
(2, 'System Group List', 'SystemGroupList'),
(3, 'System Program Form', 'SystemProgramForm'),
(4, 'System Program List', 'SystemProgramList'),
(5, 'System User Form', 'SystemUserForm'),
(6, 'System User List', 'SystemUserList'),
(7, 'Common Page', 'CommonPage'),
(8, 'System PHP Info', 'SystemPHPInfoView'),
(9, 'System ChangeLog View', 'SystemChangeLogView'),
(10, 'Welcome View', 'WelcomeView'),
(11, 'System Sql Log', 'SystemSqlLogList'),
(12, 'System Profile View', 'SystemProfileView'),
(13, 'System Profile Form', 'SystemProfileForm'),
(14, 'System SQL Panel', 'SystemSQLPanel'),
(15, 'System Access Log', 'SystemAccessLogList'),
(16, 'System Message Form', 'SystemMessageForm'),
(17, 'System Message List', 'SystemMessageList'),
(18, 'System Message Form View', 'SystemMessageFormView'),
(19, 'System Notification List', 'SystemNotificationList'),
(20, 'System Notification Form View', 'SystemNotificationFormView'),
(21, 'System Document Category List', 'SystemDocumentCategoryFormList'),
(22, 'System Document Form', 'SystemDocumentForm'),
(23, 'System Document Upload Form', 'SystemDocumentUploadForm'),
(24, 'System Document List', 'SystemDocumentList'),
(25, 'System Shared Document List', 'SystemSharedDocumentList'),
(26, 'System Unit Form', 'SystemUnitForm'),
(27, 'System Unit List', 'SystemUnitList'),
(28, 'System Access stats', 'SystemAccessLogStats'),
(29, 'System Preference form', 'SystemPreferenceForm'),
(30, 'System Support form', 'SystemSupportForm'),
(31, 'System PHP Error', 'SystemPHPErrorLogView'),
(32, 'System Database Browser', 'SystemDatabaseExplorer'),
(33, 'System Table List', 'SystemTableList'),
(34, 'System Data Browser', 'SystemDataBrowser'),
(35, 'System Menu Editor', 'SystemMenuEditor'),
(36, 'System Request Log', 'SystemRequestLogList'),
(37, 'System Request Log View', 'SystemRequestLogView'),
(38, 'System Administration Dashboard', 'SystemAdministrationDashboard'),
(39, 'System Log Dashboard', 'SystemLogDashboard'),
(40, 'System Session dump', 'SystemSessionDumpView'),
(41, 'Unidades de Medida', 'UnidadesmedidaFormList');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_request_log`
--

CREATE TABLE `system_request_log` (
  `id` int(11) NOT NULL,
  `endpoint` text COLLATE utf8mb4_general_ci,
  `logdate` text COLLATE utf8mb4_general_ci,
  `log_year` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_month` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_day` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `session_id` text COLLATE utf8mb4_general_ci,
  `login` text COLLATE utf8mb4_general_ci,
  `access_ip` text COLLATE utf8mb4_general_ci,
  `class_name` text COLLATE utf8mb4_general_ci,
  `http_host` text COLLATE utf8mb4_general_ci,
  `server_port` text COLLATE utf8mb4_general_ci,
  `request_uri` text COLLATE utf8mb4_general_ci,
  `request_method` text COLLATE utf8mb4_general_ci,
  `query_string` text COLLATE utf8mb4_general_ci,
  `request_headers` text COLLATE utf8mb4_general_ci,
  `request_body` text COLLATE utf8mb4_general_ci,
  `request_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_sql_log`
--

CREATE TABLE `system_sql_log` (
  `id` int(11) NOT NULL,
  `logdate` timestamp NULL DEFAULT NULL,
  `login` text COLLATE utf8mb4_general_ci,
  `database_name` text COLLATE utf8mb4_general_ci,
  `sql_command` text COLLATE utf8mb4_general_ci,
  `statement_type` text COLLATE utf8mb4_general_ci,
  `access_ip` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id` text COLLATE utf8mb4_general_ci,
  `log_trace` text COLLATE utf8mb4_general_ci,
  `session_id` text COLLATE utf8mb4_general_ci,
  `class_name` text COLLATE utf8mb4_general_ci,
  `php_sapi` text COLLATE utf8mb4_general_ci,
  `request_id` text COLLATE utf8mb4_general_ci,
  `log_year` varchar(4) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_month` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `log_day` varchar(2) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_unit`
--

CREATE TABLE `system_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connection_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_unit`
--

INSERT INTO `system_unit` (`id`, `name`, `connection_name`) VALUES
(1, 'Unit A', 'unit_a'),
(2, 'Unit B', 'unit_b');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user`
--

CREATE TABLE `system_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `frontpage_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL,
  `active` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_user`
--

INSERT INTO `system_user` (`id`, `name`, `login`, `password`, `email`, `frontpage_id`, `system_unit_id`, `active`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.net', 10, NULL, 'Y'),
(2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user@user.net', 7, NULL, 'Y');

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_group`
--

CREATE TABLE `system_user_group` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_user_group`
--

INSERT INTO `system_user_group` (`id`, `system_user_id`, `system_group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_program`
--

CREATE TABLE `system_user_program` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_program_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_user_program`
--

INSERT INTO `system_user_program` (`id`, `system_user_id`, `system_program_id`) VALUES
(1, 2, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `system_user_unit`
--

CREATE TABLE `system_user_unit` (
  `id` int(11) NOT NULL,
  `system_user_id` int(11) DEFAULT NULL,
  `system_unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `system_user_unit`
--

INSERT INTO `system_user_unit` (`id`, `system_user_id`, `system_unit_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `unidadesmedida`
--

CREATE TABLE `unidadesmedida` (
  `id` int(11) NOT NULL,
  `unidade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `unidadesmedida`
--

INSERT INTO `unidadesmedida` (`id`, `unidade`) VALUES
(2, 'CAIXA'),
(3, 'LITROS'),
(4, 'KILO GRAMAS'),
(5, 'GRAMAS'),
(6, 'COLHERES DE SOPA');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ingredientesreceita`
--
ALTER TABLE `ingredientesreceita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredientes_receitas` (`receitaId`),
  ADD KEY `ingredientes_unidades` (`unidadeId`),
  ADD KEY `ingredientes_items` (`ingredienteId`);

--
-- Índices para tabela `receitas`
--
ALTER TABLE `receitas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_access_log`
--
ALTER TABLE `system_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_change_log`
--
ALTER TABLE `system_change_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document`
--
ALTER TABLE `system_document`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document_category`
--
ALTER TABLE `system_document_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document_group`
--
ALTER TABLE `system_document_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_document_user`
--
ALTER TABLE `system_document_user`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_group`
--
ALTER TABLE `system_group`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_group_program`
--
ALTER TABLE `system_group_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_group_program_program_idx` (`system_program_id`),
  ADD KEY `sys_group_program_group_idx` (`system_group_id`);

--
-- Índices para tabela `system_message`
--
ALTER TABLE `system_message`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_notification`
--
ALTER TABLE `system_notification`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_program`
--
ALTER TABLE `system_program`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_request_log`
--
ALTER TABLE `system_request_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_sql_log`
--
ALTER TABLE `system_sql_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_unit`
--
ALTER TABLE `system_unit`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `system_user`
--
ALTER TABLE `system_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_program_idx` (`frontpage_id`);

--
-- Índices para tabela `system_user_group`
--
ALTER TABLE `system_user_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_group_group_idx` (`system_group_id`),
  ADD KEY `sys_user_group_user_idx` (`system_user_id`);

--
-- Índices para tabela `system_user_program`
--
ALTER TABLE `system_user_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sys_user_program_program_idx` (`system_program_id`),
  ADD KEY `sys_user_program_user_idx` (`system_user_id`);

--
-- Índices para tabela `system_user_unit`
--
ALTER TABLE `system_user_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_user_id` (`system_user_id`),
  ADD KEY `system_unit_id` (`system_unit_id`);

--
-- Índices para tabela `unidadesmedida`
--
ALTER TABLE `unidadesmedida`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ingredientesreceita`
--
ALTER TABLE `ingredientesreceita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `receitas`
--
ALTER TABLE `receitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidadesmedida`
--
ALTER TABLE `unidadesmedida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ingredientesreceita`
--
ALTER TABLE `ingredientesreceita`
  ADD CONSTRAINT `ingredientes_items` FOREIGN KEY (`ingredienteId`) REFERENCES `ingredientes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ingredientes_receitas` FOREIGN KEY (`receitaId`) REFERENCES `receitas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ingredientes_unidades` FOREIGN KEY (`unidadeId`) REFERENCES `unidadesmedida` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `system_group_program`
--
ALTER TABLE `system_group_program`
  ADD CONSTRAINT `system_group_program_ibfk_1` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`),
  ADD CONSTRAINT `system_group_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user`
--
ALTER TABLE `system_user`
  ADD CONSTRAINT `system_user_ibfk_1` FOREIGN KEY (`frontpage_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user_group`
--
ALTER TABLE `system_user_group`
  ADD CONSTRAINT `system_user_group_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_group_ibfk_2` FOREIGN KEY (`system_group_id`) REFERENCES `system_group` (`id`);

--
-- Limitadores para a tabela `system_user_program`
--
ALTER TABLE `system_user_program`
  ADD CONSTRAINT `system_user_program_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_program_ibfk_2` FOREIGN KEY (`system_program_id`) REFERENCES `system_program` (`id`);

--
-- Limitadores para a tabela `system_user_unit`
--
ALTER TABLE `system_user_unit`
  ADD CONSTRAINT `system_user_unit_ibfk_1` FOREIGN KEY (`system_user_id`) REFERENCES `system_user` (`id`),
  ADD CONSTRAINT `system_user_unit_ibfk_2` FOREIGN KEY (`system_unit_id`) REFERENCES `system_unit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
