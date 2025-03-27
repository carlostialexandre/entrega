CREATE TABLE IF NOT EXISTS `Conta` (
	`id_conta` int AUTO_INCREMENT NOT NULL UNIQUE,
	`E-mail` varchar(100) NOT NULL,
	`senha` varchar(100) NOT NULL,
	`telefone` varchar(20) NOT NULL,
	`data` date NOT NULL,
	`tipo_conta` varchar(2) NOT NULL,
	PRIMARY KEY (`id_conta`)
);

CREATE TABLE IF NOT EXISTS `Pessoa_física_(PF)` (
	`id_pf` int AUTO_INCREMENT NOT NULL UNIQUE,
	`cpf` varchar(11) NOT NULL,
	`nome` varchar(100) NOT NULL,
	`data_Nascimento` date NOT NULL,
	PRIMARY KEY (`id_pf`)
);

CREATE TABLE IF NOT EXISTS `Pessoa_Juridoca(PJ)` (
	`id_pj` int AUTO_INCREMENT NOT NULL UNIQUE,
	`cnpj` varchar(14) NOT NULL,
	`rasão_social` varchar(100) NOT NULL,
	`nome_fantazia` varchar(100) NOT NULL,
	PRIMARY KEY (`id_pj`)
);

CREATE TABLE IF NOT EXISTS `Pagamento` (
	`id_pagamento` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_conta` int NOT NULL,
	`tipo_pagamento` varchar(50) NOT NULL,
	`detalhes` varchar(255) NOT NULL,
	PRIMARY KEY (`id_pagamento`)
);

CREATE TABLE IF NOT EXISTS `Pedido` (
	`id_pedido` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_conta` int NOT NULL,
	`data_pedido` date NOT NULL,
	`total_pedido` decimal(10) NOT NULL,
	`status` varchar(50) NOT NULL,
	PRIMARY KEY (`id_pedido`)
);

CREATE TABLE IF NOT EXISTS `Untitled` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);




ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk1` FOREIGN KEY (`id_conta`) REFERENCES `Pessoa_Juridoca(PJ)`(`id`);
ALTER TABLE `Pedido` ADD CONSTRAINT `Pedido_fk1` FOREIGN KEY (`id_conta`) REFERENCES `Conta`(`id_conta`);
