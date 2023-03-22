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

-- SOSTITUIRE LE PAROLE CHIAVI 'PrimoCentro' E 'admin' NELLO SCRIPT CON I VALORI DEFINITIVI
-- CONSIGLIATO: GENERARE PASSWORD GIA CRIPTATA IN SHA-256

-- Dump della struttura del database cbra_new
DROP DATABASE IF EXISTS `cbra_new`;
CREATE DATABASE IF NOT EXISTS `cbra_new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cbra_new`;

-- Dump della struttura di tabella cbra_new.acquisizione
DROP TABLE IF EXISTS `acquisizione`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.amministratore_centro
DROP TABLE IF EXISTS `amministratore_centro`;
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

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.centro
DROP TABLE IF EXISTS `centro`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `centro` (`id`, `nome`, `indirizzo`, `citta`, `amministratore`, `numero_medici`, `numero_pazienti`) VALUES
	('PrimoCentro', 'PrimoCentro', 'PrimoCentro', 1, 0, 0);

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.datisimulazione
DROP TABLE IF EXISTS `datisimulazione`;
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

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.hospedalization
DROP TABLE IF EXISTS `hospedalization`;
CREATE TABLE IF NOT EXISTS `hospedalization` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataRicovero` date NOT NULL,
  `oraRicovero` time NOT NULL,
  `dataEvento` date NOT NULL,
  `oraEvento` time NOT NULL,
  `id_paziente` int(10) unsigned NOT NULL,
  `id_medico` int(10) unsigned NOT NULL,
  `dataPrimoSoccorso` datetime DEFAULT NULL,
  `diabete` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `ipertensione` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `angina` tinyint(4) unsigned NOT NULL DEFAULT '3',
  `HR` int(11) DEFAULT '0',
  `killipClass` tinyint(5) unsigned NOT NULL DEFAULT '3',
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
  PRIMARY KEY (`id`,`oraRicovero`,`dataRicovero`,`dataEvento`,`oraEvento`) USING BTREE,
  KEY `fk_medico_idx` (`id_medico`),
  KEY `fk_paziente_idx` (`id_paziente`),
  CONSTRAINT `fk_medico` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.medico_paziente
DROP TABLE IF EXISTS `medico_paziente`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.paziente
DROP TABLE IF EXISTS `paziente`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.tp_utente
DROP TABLE IF EXISTS `tp_utente`;
CREATE TABLE IF NOT EXISTS `tp_utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tp_utente` (`id`, `nome`) VALUES
	(1, 'ADMIN'),
	(2, 'CENTER'),
	(3, 'CLINIC');

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.utente
DROP TABLE IF EXISTS `utente`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `utente` (`id`, `nome`, `cognome`, `code_fis`, `username`, `password`, `email`, `id_centro`, `livello`) VALUES
	('admin', 'admin', 'admin', 'admin', 'admin', NULL, 1, 1);

-- L’esportazione dei dati non era selezionata.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
