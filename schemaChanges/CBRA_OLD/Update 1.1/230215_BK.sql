-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.7.24 - MySQL Community Server (GPL)
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.3.0.6589
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
  CONSTRAINT `fk_ospedalizzazione` FOREIGN KEY (`id_hospedalization`) REFERENCES `hospitalization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.acquisizione: ~7 rows (circa)
INSERT INTO `acquisizione` (`id`, `dataAcquisizione`, `oraAcquisizione`, `ctnt`, `ctni`, `ckmb`, `na`, `k`, `id_hospedalization`) VALUES
	(11, '2014-10-04', '09:08:00', 1.43, 1.43, 1.43, 138, 120, 41),
	(12, '2014-10-04', '10:17:00', 1.09, 1.09, 1.09, 141, 118, 41),
	(13, '2014-10-04', '17:11:00', 0.952, 0.952, 0.952, 139, 125, 41),
	(14, '2014-10-05', '09:55:00', 1.22, 1.22, 1.22, 139, 125, 41),
	(15, '2014-10-06', '09:51:00', 1.26, 1.26, 1.26, 141, 115, 41),
	(16, '2022-10-20', '13:45:00', 65, 50, 50, 50, 70, 42),
	(17, '2023-02-02', '13:58:00', 34, 34, 34, 34, 34, 82);

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
  `nome` varchar(45) NOT NULL,
  `indirizzo` varchar(127) DEFAULT NULL,
  `citta` varchar(127) NOT NULL,
  `amministratore` int(10) unsigned DEFAULT NULL,
  `numero_medici` int(10) unsigned DEFAULT '0',
  `numero_pazienti` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_centro_admin` (`amministratore`),
  CONSTRAINT `fk_centro_admin` FOREIGN KEY (`amministratore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.centro: ~5 rows (circa)
INSERT INTO `centro` (`id`, `nome`, `indirizzo`, `citta`, `amministratore`, `numero_medici`, `numero_pazienti`) VALUES
	(11, 'PrimoCentro', 'PrimoCentro', 'PrimoCentro', 1, 2, 3),
	(12, 'UMG', 'Viale Europa', 'Catanzaro', 1, 0, 0),
	(13, 'ProvaMSGCentro', 'ProvaMSGCentro', 'ProvaMSGCentro', 1, 0, 0),
	(14, 'TestSave123', 'TestSave123', 'TestSave123', 1, 0, 0),
	(15, 'TestSave123121', 'TestSave123121', 'TestSave123121', 1, 0, 0);

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
  CONSTRAINT `FK_datisimulazione_hospedalization` FOREIGN KEY (`id_hospedalization`) REFERENCES `hospitalization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dump dei dati della tabella cbra_new.datisimulazione: ~6 rows (circa)
INSERT INTO `datisimulazione` (`id`, `dataAnalisi`, `oraAnalisi`, `a`, `b`, `c`, `d`, `Td`, `Cs0`, `Cc0`, `Kc0`, `t`, `FPV`, `FPT`, `SPV`, `SPT`, `id_hospedalization`) VALUES
	(1, '2022-10-19', '19:56:47', 0, 0, 0, 0, 72, 8, 3, 0, 0, 1, 40, 1, 40, 41),
	(2, '2022-10-21', '20:37:30', 0, 0, 0, 0, 72, 8, 3, 0, 0, 1, 40, 1, 40, 41),
	(3, '2022-10-21', '20:43:49', 0, 0, 0, 0, 72, 8, 3, 0, 0, 1, 40, 1, 40, 41),
	(4, '2022-10-21', '20:53:39', 0, 0, 0, 0, 72, 8, 3, 0, 0, 1, 40, 1, 40, 41),
	(5, '2023-01-26', '12:42:45', 0, 0, 0, 0, 71, 8, 3, 0, 0, 1, 40, 1, 40, 41),
	(6, '2023-01-26', '12:43:21', 0, 0, 0, 0, 71, 8, 3, 0, 0, 1, 40, 1, 40, 41),
	(7, '2023-01-26', '12:44:24', 0, 0, 0, 0, 71, 8, 3, 0, 0, 1, 40, 1, 40, 41);

-- Dump della struttura di tabella cbra_new.hospitalization
CREATE TABLE IF NOT EXISTS `hospitalization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataRicovero` date NOT NULL,
  `oraRicovero` time NOT NULL,
  `dataEvento` date NOT NULL,
  `oraEvento` time NOT NULL,
  `id_paziente` int(10) unsigned NOT NULL,
  `id_medico` int(10) unsigned NOT NULL,
  `dataPrimoSoccorso` date DEFAULT NULL,
  `diabete` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `ipertensione` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `angina` tinyint(4) unsigned DEFAULT '0',
  `HR` int(11) unsigned DEFAULT '0',
  `killipClass` tinyint(5) unsigned NOT NULL DEFAULT '1',
  `STEMI` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `LBBB` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `timeToTreatment` int(10) unsigned DEFAULT '0',
  `smoke` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `familiarity` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `prevAMI` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `obesity` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `dislip` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `timi` double unsigned DEFAULT '0',
  `referto` text,
  `systolicBP` double unsigned DEFAULT '0',
  `dyastolicBP` double unsigned DEFAULT '0',
  `weight` double unsigned DEFAULT '0',
  `age` int(11) unsigned DEFAULT '0',
  `dataTrombolisi` date DEFAULT NULL,
  `oraTrombolisi` time DEFAULT NULL,
  `farmaco` varchar(50) DEFAULT NULL,
  `dataRivascolarizzazione` date DEFAULT NULL,
  `oraRivascolarizzazione` time DEFAULT NULL,
  `loco` varchar(50) DEFAULT NULL,
  `hypercholesterolemia` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `asa_usage_7d` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `st_deviation` double unsigned NOT NULL DEFAULT '0',
  `cardiac_marker` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `stenosis` double unsigned DEFAULT '0',
  PRIMARY KEY (`id`,`oraRicovero`,`dataRicovero`,`dataEvento`,`oraEvento`) USING BTREE,
  KEY `fk_medico_idx` (`id_medico`),
  KEY `fk_paziente_idx` (`id_paziente`),
  CONSTRAINT `fk_medico` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.hospitalization: ~7 rows (circa)
INSERT INTO `hospitalization` (`id`, `dataRicovero`, `oraRicovero`, `dataEvento`, `oraEvento`, `id_paziente`, `id_medico`, `dataPrimoSoccorso`, `diabete`, `ipertensione`, `angina`, `HR`, `killipClass`, `STEMI`, `LBBB`, `timeToTreatment`, `smoke`, `familiarity`, `prevAMI`, `obesity`, `dislip`, `timi`, `referto`, `systolicBP`, `dyastolicBP`, `weight`, `age`, `dataTrombolisi`, `oraTrombolisi`, `farmaco`, `dataRivascolarizzazione`, `oraRivascolarizzazione`, `loco`, `hypercholesterolemia`, `asa_usage_7d`, `st_deviation`, `cardiac_marker`, `stenosis`) VALUES
	(41, '2014-10-04', '04:30:00', '2014-10-04', '04:00:00', 100, 40, '2014-10-04', 1, 2, 0, 65, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 'referto', 120, 80, 83, 41, '2022-09-14', '03:00:00', 'FarmacoProva', '2022-09-14', '02:21:00', 'PosizioneProva', 3, 3, 0, 3, 0),
	(42, '2022-10-20', '11:30:00', '2022-10-20', '11:00:00', 103, 1, NULL, 1, 1, 0, 100, 2, 1, 1, 1, 1, 1, 1, 2, 1, 2, 'referto', 120, 80, 80, 42, '2022-10-20', '11:45:00', 'Farmaco', '2022-10-20', '11:45:00', 'Loco', 3, 3, 0, 3, 0),
	(55, '2014-10-04', '04:30:00', '2014-10-04', '04:00:00', 100, 1, '2014-10-04', 1, 2, 0, 65, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 'referto', 120, 80, 83, 41, '2022-09-14', '03:00:00', 'FarmacoProva', '2022-09-14', '02:21:00', 'PosizioneProva', 3, 3, 0, 3, 0),
	(56, '2023-01-03', '01:02:00', '2023-01-03', '01:05:00', 100, 1, NULL, 3, 3, 0, 0, 1, 3, 3, 0, 3, 3, 3, 3, 3, 0, 'referto', 0, 0, 0, 0, NULL, '00:00:00', NULL, NULL, '00:00:00', NULL, 3, 3, 0, 3, 0),
	(82, '2023-02-02', '13:55:35', '2023-02-02', '12:55:30', 100, 1, '2023-02-02', 2, 2, 2, 55, 3, 1, 2, 1, 2, 2, 2, 2, 2, 6, 'referto', 85, 65, 120, 40, NULL, '00:00:00', '', NULL, '00:00:00', '', 2, 2, 1, 2, 55),
	(102, '2023-02-02', '13:55:35', '2023-02-02', '12:55:30', 100, 1, '2023-02-02', 2, 2, 2, 55, 3, 2, 2, 1, 2, 2, 2, 2, 2, 7, 'referto', 85, 65, 120, 40, NULL, '00:00:00', NULL, NULL, '00:00:00', NULL, 2, 2, 1, 2, 55),
	(103, '2023-02-16', '05:00:00', '2023-02-16', '04:00:00', 106, 1, '2023-02-16', 1, 2, 1, 100, 2, 2, 2, 1, 1, 1, 1, 2, 2, 7, 'referto', 123, 73, 125, 118, '2023-02-16', '06:00:00', 'ASA 123', '2023-02-16', '07:00:00', 'Chest', 2, 1, 0.2, 2, 14);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.medico_paziente: ~1 rows (circa)
INSERT INTO `medico_paziente` (`id`, `id_medico`, `id_paziente`, `data_ins`) VALUES
	(5, 40, 100, '2022-09-27 19:26:20');

-- Dump della struttura di tabella cbra_new.paziente
CREATE TABLE IF NOT EXISTS `paziente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cf` varchar(24) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `sesso` varchar(1) NOT NULL,
  `indirizzo_residenza` varchar(100) DEFAULT NULL,
  `data_nascita` date NOT NULL,
  `luogo_nascita` varchar(45) NOT NULL,
  `id_centro` int(10) unsigned NOT NULL,
  `code` varchar(26) NOT NULL COMMENT 'cen 000 00000000 tro 000000000',
  `origin_center` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `cf_UNIQUE` (`cf`,`id_centro`) USING BTREE,
  UNIQUE KEY `code_UNIQUE` (`code`,`id_centro`) USING BTREE,
  KEY `cf` (`cf`),
  KEY `fk_paziente_centro` (`id_centro`),
  CONSTRAINT `fk_paziente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.paziente: ~3 rows (circa)
INSERT INTO `paziente` (`id`, `cf`, `nome`, `cognome`, `sesso`, `indirizzo_residenza`, `data_nascita`, `luogo_nascita`, `id_centro`, `code`, `origin_center`) VALUES
	(100, 'RSSMRA82P15H501M', 'Mario', 'Rossi', 'M', 'Via Colosseo, 15', '1982-09-15', 'ROMA', 11, 'PRI011100TRO212620086456', NULL),
	(103, 'CHLTTR80A01H501C', 'Ettore', 'Achille', 'M', 'Colosseo', '1980-01-01', 'ROMA', 12, 'UMG012103UMG211022200841', NULL),
	(106, 'TSTTTN03B04A001C', 'TestNSTEMI', 'TestNSTEMI', 'M', 'TestNSTEMI', '1903-02-04', 'ABANO TERME', 11, 'PRI01100000106TRO154217282', NULL);

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
  `id_centro` int(10) unsigned NOT NULL,
  `livello` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `code_fis_UNIQUE` (`code_fis`),
  KEY `fk_utente_centro_idx` (`id_centro`),
  KEY `fk_utente_tp_utente_idx` (`livello`),
  CONSTRAINT `fk_utente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`),
  CONSTRAINT `fk_utente_tp_utente` FOREIGN KEY (`livello`) REFERENCES `tp_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.utente: ~8 rows (circa)
INSERT INTO `utente` (`id`, `nome`, `cognome`, `code_fis`, `username`, `password`, `email`, `id_centro`, `livello`) VALUES
	(1, 'admin', 'admin', 'admin', 'admin', 'admin', NULL, 11, 1),
	(40, 'ClinicianUsr', 'ClinicianUsr', 'CLINICIANUSR', 'ClinicianUsr', 'ClinicianUsr', 'ClinicianUsr', 11, 3),
	(41, 'CenterUsr', 'CenterUsr', 'CENTERUSR', 'CenterUsr', 'CenterUsr', 'CenterUsr', 11, 2),
	(42, 'Massimo', 'Decimo', 'DCMMSM80A01H501Z', 'Decimo', 'massimo', 'massimo@decimo.it', 11, 3),
	(43, 'ciao1', 'ciao1', 'CIAO', 'ciao1', 'ciao', '', 11, 1),
	(44, 'ProvaMSG1', 'ProvaMSG1', 'PROVAMSG', 'ProvaMSG1', 'ProvaMSG1', 'ProvaMSG1', 11, 1),
	(45, 'Test23012', 'Test23012', 'TEST230123', 'Test23012', 'Test23012', 'Test23012', 11, 1),
	(46, 'Prova', 'Prova', 'PROVA', 'Prova', 'Prova', NULL, 11, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
