-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.7.24 - MySQL Community Server (GPL)
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.4.0.6659
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
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000',
  PRIMARY KEY (`id`,`dataAcquisizione`,`oraAcquisizione`),
  KEY `fk_ospedalizzazione_idx` (`id_hospedalization`),
  CONSTRAINT `fk_ospedalizzazione` FOREIGN KEY (`id_hospedalization`) REFERENCES `hospitalization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.amministratore_centro
CREATE TABLE IF NOT EXISTS `amministratore_centro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_amministratore` int(10) unsigned NOT NULL DEFAULT '0',
  `id_centro` int(10) unsigned NOT NULL DEFAULT '0',
  `data_da` datetime DEFAULT NULL,
  `data_a` datetime DEFAULT NULL,
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNIQUE` (`id_amministratore`,`id_centro`),
  KEY `FK_cetnro` (`id_centro`),
  KEY `FK_utente` (`id_amministratore`) USING BTREE,
  CONSTRAINT `FK_cetnro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_utente` FOREIGN KEY (`id_amministratore`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.analysis_params
CREATE TABLE IF NOT EXISTS `analysis_params` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_lb` double(10,3) unsigned DEFAULT NULL,
  `b_lb` double(10,3) unsigned DEFAULT NULL,
  `td_lb` double(10,3) unsigned DEFAULT NULL,
  `cs0_lb` double(10,3) unsigned DEFAULT NULL,
  `cc0_lb` double(10,3) unsigned DEFAULT NULL,
  `a_ub` double(10,3) DEFAULT NULL,
  `b_ub` double(10,3) unsigned DEFAULT NULL,
  `td_ub` double(10,3) unsigned DEFAULT NULL,
  `cs0_ub` double(10,3) unsigned DEFAULT NULL,
  `cc0_ub` double(10,3) unsigned DEFAULT NULL,
  `a_init` double(10,3) unsigned DEFAULT NULL,
  `b_init` double(10,3) unsigned DEFAULT NULL,
  `td_init` double(10,3) unsigned DEFAULT NULL,
  `cs0_init` double(10,3) unsigned DEFAULT NULL,
  `cc0_init` double(10,3) unsigned DEFAULT NULL,
  `iterations` int(10) unsigned DEFAULT NULL,
  `a_fixed` double(10,3) unsigned DEFAULT NULL,
  `b_fixed` double(10,3) unsigned DEFAULT NULL,
  `td_fixed` double(10,3) unsigned DEFAULT NULL,
  `cs0_fixed` double(10,3) unsigned DEFAULT NULL,
  `cc0_fixed` double(10,3) unsigned DEFAULT NULL,
  `global_alg` varchar(45) DEFAULT NULL,
  `local_alg` varchar(45) DEFAULT NULL,
  `time` double(10,5) unsigned DEFAULT NULL,
  `id_result` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_UNIQUE` (`id`) USING BTREE,
  KEY `param_result_idx` (`id_result`) USING BTREE,
  CONSTRAINT `param_result` FOREIGN KEY (`id_result`) REFERENCES `analysis_result` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Params used to perform analysis';

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.analysis_result
CREATE TABLE IF NOT EXISTS `analysis_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataAnalisi` date NOT NULL,
  `oraAnalisi` time NOT NULL,
  `a` double(10,5) NOT NULL DEFAULT '0.00000',
  `b` double(10,5) NOT NULL DEFAULT '0.00000',
  `c` double(10,5) NOT NULL DEFAULT '0.00000',
  `d` double(10,5) NOT NULL DEFAULT '0.00000',
  `Td` double(10,5) NOT NULL DEFAULT '0.00000',
  `Cs0` double(10,5) NOT NULL DEFAULT '0.00000',
  `Cc0` double(10,5) NOT NULL DEFAULT '0.00000',
  `Kc0` double(10,5) NOT NULL DEFAULT '0.00000',
  `t` double(10,5) NOT NULL DEFAULT '0.00000',
  `FPV` double(10,5) NOT NULL DEFAULT '0.00000',
  `FPT` double(10,5) NOT NULL DEFAULT '0.00000',
  `SPV` double(10,5) NOT NULL DEFAULT '0.00000',
  `SPT` double(10,5) NOT NULL DEFAULT '0.00000',
  `id_hospedalization` int(10) unsigned NOT NULL,
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_datisimulazione_hospedalization` (`id_hospedalization`),
  CONSTRAINT `FK_datisimulazione_hospedalization` FOREIGN KEY (`id_hospedalization`) REFERENCES `hospitalization` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.centro
CREATE TABLE IF NOT EXISTS `centro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `indirizzo` varchar(127) DEFAULT NULL,
  `citta` varchar(127) NOT NULL,
  `amministratore` int(10) unsigned DEFAULT NULL,
  `numero_medici` int(10) unsigned DEFAULT '0',
  `numero_pazienti` int(10) unsigned DEFAULT '0',
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`),
  KEY `fk_centro_admin` (`amministratore`),
  CONSTRAINT `fk_centro_admin` FOREIGN KEY (`amministratore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO `centro` (`id`, `nome`, `indirizzo`, `citta`, `amministratore`, `numero_medici`, `numero_pazienti`) VALUES
	('centerOne', 'centerOne', 'centerOne', 1, 0, 0);


-- Dump della struttura di tabella cbra_new.error_log
CREATE TABLE IF NOT EXISTS `error_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `identifier` varchar(200) NOT NULL,
  `line` int(11) NOT NULL,
  `function_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iderror_log_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

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
  `angina` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `HR` int(11) unsigned NOT NULL DEFAULT '0',
  `killipClass` tinyint(5) unsigned NOT NULL DEFAULT '1',
  `STEMI` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `LBBB` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `timeToTreatment` int(10) unsigned NOT NULL DEFAULT '0',
  `smoke` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `familiarity` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `prevAMI` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `obesity` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `dislip` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `timi` double unsigned NOT NULL DEFAULT '0',
  `referto` text,
  `systolicBP` double unsigned NOT NULL DEFAULT '0',
  `dyastolicBP` double unsigned NOT NULL DEFAULT '0',
  `weight` double unsigned NOT NULL DEFAULT '0',
  `age` int(11) unsigned NOT NULL DEFAULT '0',
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
  `stenosis` double unsigned NOT NULL DEFAULT '0',
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  PRIMARY KEY (`id`,`oraRicovero`,`dataRicovero`,`dataEvento`,`oraEvento`) USING BTREE,
  KEY `fk_medico_idx` (`id_medico`),
  KEY `fk_paziente_idx` (`id_paziente`),
  CONSTRAINT `fk_medico` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logged_user` varchar(45) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `access_level` int(11) unsigned NOT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idlogin_UNIQUE` (`id`),
  KEY `login_user_id_idx` (`user_id`),
  CONSTRAINT `login_user_id` FOREIGN KEY (`user_id`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.medico_paziente
CREATE TABLE IF NOT EXISTS `medico_paziente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_medico` int(10) unsigned NOT NULL,
  `id_paziente` int(10) unsigned NOT NULL,
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_medico1_idx` (`id_medico`),
  KEY `fk_paziente1_idx` (`id_paziente`),
  KEY `uniqueMP` (`id_medico`,`id_paziente`) USING BTREE,
  CONSTRAINT `fk_medico1` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paziente1` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

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
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `cf_UNIQUE` (`cf`,`id_centro`) USING BTREE,
  UNIQUE KEY `code_UNIQUE` (`code`,`id_centro`) USING BTREE,
  KEY `cf` (`cf`),
  KEY `fk_paziente_centro` (`id_centro`),
  CONSTRAINT `fk_paziente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.tp_utente
CREATE TABLE IF NOT EXISTS `tp_utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
  `password` varchar(65) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_centro` int(10) unsigned NOT NULL,
  `livello` int(10) unsigned NOT NULL DEFAULT '3',
  `date_insert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_edit` datetime DEFAULT NULL,
  `evaluation_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  `execution_time` double(10,6) unsigned DEFAULT '0.000000' COMMENT 'Units: seconds',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `code_fis_UNIQUE` (`code_fis`),
  KEY `fk_utente_centro_idx` (`id_centro`),
  KEY `fk_utente_tp_utente_idx` (`livello`),
  CONSTRAINT `fk_utente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`),
  CONSTRAINT `fk_utente_tp_utente` FOREIGN KEY (`livello`) REFERENCES `tp_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

INSERT INTO `utente` (`id`, `nome`, `cognome`, `code_fis`, `username`, `password`, `email`, `id_centro`, `livello`) VALUES
	('admin', 'admin', 'admin', 'admin', 'admin', NULL, 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
