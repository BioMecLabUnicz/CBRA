-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.7.24 - MySQL Community Server (GPL)
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database cbra_new
CREATE DATABASE IF NOT EXISTS `cbra_new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cbra_new`;

-- Dump della struttura di tabella cbra_new.acquisizione
CREATE TABLE IF NOT EXISTS `acquisizione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataAcquisizione` date NOT NULL,
  `oraAcquisizione` time NOT NULL,
  `ctnt` double NOT NULL DEFAULT '0',
  `ctni` double NOT NULL DEFAULT '0',
  `ckmb` double NOT NULL DEFAULT '0',
  `na` double NOT NULL DEFAULT '0',
  `k` double NOT NULL DEFAULT '0',
  `id_hospedalization` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`dataAcquisizione`,`oraAcquisizione`),
  KEY `fk_ospedalizzazione_idx` (`id_hospedalization`),
  CONSTRAINT `fk_ospedalizzazione` FOREIGN KEY (`id_hospedalization`) REFERENCES `hospedalization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.acquisizione: ~12 rows (circa)
INSERT INTO `acquisizione` (`id`, `dataAcquisizione`, `oraAcquisizione`, `ctnt`, `ctni`, `ckmb`, `na`, `k`, `id_hospedalization`) VALUES
	(1, '2022-06-08', '17:34:19', 34, 2.4, 56.3, 54, 67, 1),
	(2, '2022-06-08', '19:34:21', 34, 2.4, 56.3, 54, 68, 1),
	(3, '2022-06-09', '04:02:02', 12, 12, 12, 12, 12, 1),
	(4, '2022-06-09', '06:02:02', 34, 13, 45, 12, 23, 1),
	(5, '2022-06-09', '08:02:02', 56, 11, 34, 43, 43, 1),
	(6, '2022-06-09', '02:02:02', 75, 13, 45, 12, 35, 1),
	(49, '2022-06-08', '17:34:19', 34, 2.4, 56.3, 54, 67, 27),
	(50, '2022-06-08', '19:34:21', 34, 2.4, 56.3, 54, 68, 27),
	(51, '2022-06-09', '04:02:02', 12, 12, 12, 12, 12, 27),
	(52, '2022-06-09', '06:02:02', 34, 13, 45, 12, 23, 27),
	(53, '2022-06-09', '08:02:02', 56, 11, 34, 43, 43, 27),
	(54, '2022-06-09', '02:02:02', 75, 13, 45, 12, 35, 27);

-- Dump della struttura di tabella cbra_new.amministratore_centro
CREATE TABLE IF NOT EXISTS `amministratore_centro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_amministratore` int(10) unsigned NOT NULL DEFAULT '0',
  `id_centro` int(10) unsigned NOT NULL DEFAULT '0',
  `data_da` timestamp NULL DEFAULT NULL,
  `data_a` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNIQUE` (`id_amministratore`,`id_centro`),
  KEY `FK_cetnro` (`id_centro`),
  KEY `FK_utente` (`id_amministratore`) USING BTREE,
  CONSTRAINT `FK_cetnro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_utente` FOREIGN KEY (`id_amministratore`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.amministratore_centro: ~0 rows (circa)

-- Dump della struttura di tabella cbra_new.centro
CREATE TABLE IF NOT EXISTS `centro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `indirizzo` varchar(127) NOT NULL,
  `citta` varchar(127) NOT NULL,
  `amministratore` int(10) unsigned DEFAULT NULL,
  `numero_medici` int(10) unsigned DEFAULT '0',
  `numero_pazienti` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_centro_admin` (`amministratore`),
  CONSTRAINT `fk_centro_admin` FOREIGN KEY (`amministratore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.centro: ~4 rows (circa)
INSERT INTO `centro` (`id`, `nome`, `indirizzo`, `citta`, `amministratore`, `numero_medici`, `numero_pazienti`) VALUES
	(1, 'ADMIN', 'ADMIN', 'ADMIN', 1, 0, 0),
	(2, 'CentroCS', 'Cosenza', 'Cosenza', 1, 8, 3),
	(3, 'Reggio Center', 'Reggio Calabria', 'Reggio Calabria', 1, 0, 0),
	(4, 'UMG', 'Germaneto', 'Germaneto', 1, 16, 0),
	(5, 'test0608', 'test0608', 'test0608', 6, 0, 0),
	(6, 'test200622', 'test200622', 'test200622', 22, 0, 0);

-- Dump della struttura di tabella cbra_new.datisimulazione
CREATE TABLE IF NOT EXISTS `datisimulazione` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataAnalisi` date NOT NULL,
  `oraAnalisi` time NOT NULL,
  `a` int(11) NOT NULL,
  `b` int(11) NOT NULL,
  `c` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  `Td` int(11) NOT NULL,
  `Cs0` int(11) NOT NULL,
  `Cc0` int(11) NOT NULL,
  `Kc0` int(11) NOT NULL,
  `t` int(11) NOT NULL,
  `FPV` int(11) NOT NULL,
  `FPT` int(11) NOT NULL,
  `SPV` int(11) NOT NULL,
  `SPT` int(11) NOT NULL,
  `id_hospedalization` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_datisimulazione_hospedalization` (`id_hospedalization`),
  CONSTRAINT `FK_datisimulazione_hospedalization` FOREIGN KEY (`id_hospedalization`) REFERENCES `hospedalization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella cbra_new.datisimulazione: ~0 rows (circa)

-- Dump della struttura di tabella cbra_new.hospedalization
CREATE TABLE IF NOT EXISTS `hospedalization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataRicovero` date NOT NULL,
  `oraRicovero` time NOT NULL,
  `dataEvento` date NOT NULL,
  `oraEvento` time NOT NULL,
  `id_paziente` int(10) unsigned DEFAULT NULL,
  `id_medico` int(10) unsigned DEFAULT NULL,
  `dataPrimoSoccorso` datetime DEFAULT NULL,
  `diabete` tinyint(4) NOT NULL DEFAULT '0',
  `ipertensione` tinyint(4) NOT NULL DEFAULT '0',
  `angina` tinyint(4) NOT NULL DEFAULT '0',
  `HR` int(11) DEFAULT NULL,
  `killipClass` tinyint(5) NOT NULL DEFAULT '0',
  `anteroSTElev` tinyint(4) NOT NULL DEFAULT '0',
  `LBBB` tinyint(4) NOT NULL DEFAULT '0',
  `timeToTreatment` int(10) unsigned DEFAULT NULL,
  `smoke` tinyint(4) NOT NULL DEFAULT '0',
  `familiarity` tinyint(4) NOT NULL DEFAULT '0',
  `prevAMI` tinyint(4) NOT NULL DEFAULT '0',
  `obesity` tinyint(4) NOT NULL DEFAULT '0',
  `dislip` tinyint(4) NOT NULL DEFAULT '0',
  `timi` double DEFAULT NULL,
  `referto` text,
  `systolicBP` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`oraRicovero`,`dataRicovero`,`dataEvento`,`oraEvento`) USING BTREE,
  KEY `fk_medico_idx` (`id_medico`),
  KEY `fk_paziente_idx` (`id_paziente`),
  CONSTRAINT `fk_medico` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.hospedalization: ~7 rows (circa)
INSERT INTO `hospedalization` (`id`, `dataRicovero`, `oraRicovero`, `dataEvento`, `oraEvento`, `id_paziente`, `id_medico`, `dataPrimoSoccorso`, `diabete`, `ipertensione`, `angina`, `HR`, `killipClass`, `anteroSTElev`, `LBBB`, `timeToTreatment`, `smoke`, `familiarity`, `prevAMI`, `obesity`, `dislip`, `timi`, `referto`, `systolicBP`, `weight`, `age`) VALUES
	(1, '2022-06-08', '17:00:05', '2022-06-08', '15:00:07', 1, 2, '2022-03-08 00:00:00', 1, 1, 1, 1, 1, 1, 1, 12, 1, 1, 1, 1, 1, 0, 'referto', 1, 1, 1),
	(2, '2022-03-08', '17:32:32', '2022-03-08', '17:32:33', 1, 2, '2022-03-08 17:32:39', 2, 2, 2, 2, 2, 2, 2, NULL, 2, 2, 2, 2, 2, 2, NULL, 2, 2, 2),
	(3, '2022-03-08', '17:32:44', '2022-03-08', '17:32:45', 1, 2, '2022-03-08 17:32:52', 3, 3, 3, 3, 3, 3, 3, NULL, 3, 3, 3, 3, 3, 3, NULL, 3, 3, 3),
	(4, '2022-03-08', '17:32:57', '2022-03-08', '17:32:58', 4, 2, '2022-03-08 17:33:06', 1, 1, 1, 4, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1),
	(6, '2022-03-24', '17:32:05', '2022-03-24', '15:44:47', 1, 1, '2022-03-08 00:00:00', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 0, 'referto', 1, 1, 1),
	(7, '2022-03-25', '17:32:05', '2022-03-24', '15:44:47', 1, 1, '2022-03-08 00:00:00', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 0, 'referto', 1, 1, 1),
	(8, '2022-03-31', '17:32:05', '2022-03-24', '15:44:48', 1, 1, '2022-03-08 00:00:00', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, 1, 0, 'referto', 1, 1, 1),
	(27, '2022-06-08', '17:00:05', '2022-06-08', '15:00:07', 50, 2, '2022-03-08 00:00:00', 1, 1, 1, 1, 1, 1, 1, 12, 1, 1, 1, 1, 1, 0, 'referto', 1, 1, 1);

-- Dump della struttura di tabella cbra_new.medico_paziente
CREATE TABLE IF NOT EXISTS `medico_paziente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_medico` int(10) unsigned NOT NULL,
  `id_paziente` int(10) unsigned NOT NULL,
  `data_ins` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_medico1_idx` (`id_medico`),
  KEY `fk_paziente1_idx` (`id_paziente`),
  KEY `uniqueMP` (`id_medico`,`id_paziente`) USING BTREE,
  CONSTRAINT `fk_medico1` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paziente1` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.medico_paziente: ~4 rows (circa)
INSERT INTO `medico_paziente` (`id`, `id_medico`, `id_paziente`, `data_ins`) VALUES
	(1, 2, 1, '2022-04-08 17:08:29'),
	(4, 2, 4, '2022-04-08 17:08:31'),
	(6, 2, 16, '2022-04-10 12:05:53'),
	(16, 2, 50, '2022-07-20 08:49:45');

-- Dump della struttura di tabella cbra_new.paziente
CREATE TABLE IF NOT EXISTS `paziente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cf` varchar(16) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `sesso` varchar(1) NOT NULL,
  `indirizzo_residenza` varchar(100) NOT NULL,
  `data_nascita` date NOT NULL,
  `luogo_nascita` varchar(45) NOT NULL,
  `id_centro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `cf_UNIQUE` (`cf`) USING BTREE,
  KEY `cf` (`cf`),
  KEY `fk_paziente_centro` (`id_centro`),
  CONSTRAINT `fk_paziente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.paziente: ~10 rows (circa)
INSERT INTO `paziente` (`id`, `cf`, `nome`, `cognome`, `sesso`, `indirizzo_residenza`, `data_nascita`, `luogo_nascita`, `id_centro`) VALUES
	(1, 'cftest1', 'test1', 'test1', 'M', 'test13', '2022-03-08', 'AICURZIO', 4),
	(4, 'cftest4', 'test4', 'test4', 'M', 'test4', '2022-03-08', 'test4', 2),
	(16, 'PZNPNT22D10C352H', 'paziente1004', 'paziente1004', 'M', 'paziente1004', '2022-04-10', '3081', 3),
	(17, 'TSTTT322H88A136V', 'test356', 'test356', 'M', 'test356', '2022-06-08', '174', 1),
	(18, 'TSTTT022H48I673H', 'test09', 'test09', 'F', 'test09', '2022-06-08', '11402', 4),
	(22, 'TSTTT022H58I872K', 'test08', 'test08', 'F', 'test08', '2022-06-18', '11640', 4),
	(24, 'TSTTT022H58I673I', 'test07', 'test07', 'F', 'test07', '2022-06-18', '11402', 4),
	(28, 'CRTNCL96B21I872D', 'Nicola', 'Cortese', 'M', 'Via Boscarelli 8', '1996-02-21', 'SOVERATO', 4),
	(29, 'TSTTT222H15I872C', 'test200622', 'test200622', 'M', 'test200622', '2022-06-15', 'SOVERATO', 4),
	(50, 'imported1-4-2', 'imported1-4-2', 'imported1-4-2', 'X', 'unknown', '2022-07-20', 'unknown', 4);

-- Dump della struttura di tabella cbra_new.tp_utente
CREATE TABLE IF NOT EXISTS `tp_utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.tp_utente: ~3 rows (circa)
INSERT INTO `tp_utente` (`id`, `nome`) VALUES
	(1, 'ADMIN'),
	(2, 'CENTER'),
	(3, 'CLINIC');

-- Dump della struttura di tabella cbra_new.utente
CREATE TABLE IF NOT EXISTS `utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `code_fis` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_centro` int(10) unsigned DEFAULT NULL,
  `livello` int(10) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `code_fis_UNIQUE` (`code_fis`),
  KEY `fk_utente_centro_idx` (`id_centro`),
  KEY `fk_utente_tp_utente_idx` (`livello`),
  CONSTRAINT `fk_utente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`),
  CONSTRAINT `fk_utente_tp_utente` FOREIGN KEY (`livello`) REFERENCES `tp_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.utente: ~14 rows (circa)
INSERT INTO `utente` (`id`, `nome`, `cognome`, `code_fis`, `username`, `password`, `email`, `id_centro`, `livello`) VALUES
	(1, 'Nicola', 'Cortese', 'nclcrt96b21i872d', 'n.cortese', 'n.cortese', NULL, 1, 1),
	(2, 'Medico1', 'Medico1', 'Medico1Medico1Medico1', 'Medico1', 'Medico1', 'Medico1@Medico1.it', 4, 3),
	(6, 'center1', 'center1', 'center1', 'center1', 'center1', 'center1center1', 4, 2),
	(7, 'test080622', 'test080622', 'test080622', 'test080622', 'test080622', 'test080622', 4, 3),
	(8, 'test0806220001', 'test0806220001', 'test0806220001', 'test0806220001', 'test0806220001', 'test0806220001', 4, 2),
	(9, 'test0806220002', 'test0806220002', 'test0806220002', 'test0806220002', 'test0806220002', 'test0806220002', 4, 2),
	(10, 'test0806220003', 'test0806220003', 'test0806220003', 'test0806220003', 'test0806220003', 'test0806220003', 4, 2),
	(11, 'test0806220004', 'test0806220004', 'test0806220004', 'test0806220004', 'test0806220004', 'test0806220004', 4, 2),
	(12, 'test0806220005', 'test0806220005', 'test0806220005', 'test0806220005', 'test0806220005', 'test0806220005', 4, 2),
	(13, 'test0806220005', 'test0806220005', 'test0806220006', 'test0806220006', 'test0806220005', 'test0806220005', 4, 2),
	(14, 'test0806220005', 'test0806220005', 'test0806220007', 'test0806220007', 'test0806220005', 'test0806220005', 4, 2),
	(21, 'test08062200092', 'test0806220009', 'test0806220009', 'test0806220009', 'test0806220009', 'test0806220009', 4, 2),
	(22, 'test200622', 'test200622', 'test200622', 'test200622', 'test200622', 'test200622', 4, 3),
	(31, 'testClinic12', 'testClinic12', 'testClinic12', 'testClinic12', '', 'testClinic12', 4, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
