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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

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

-- L’esportazione dei dati non era selezionata.

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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

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

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.hospedalization
CREATE TABLE IF NOT EXISTS `hospedalization` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`dataRicovero` DATE NOT NULL,
	`oraRicovero` TIME NOT NULL,
	`dataEvento` DATE NOT NULL,
	`oraEvento` TIME NOT NULL,
	`id_paziente` INT(10) UNSIGNED NULL DEFAULT NULL,
	`id_medico` INT(10) UNSIGNED NULL DEFAULT NULL,
	`dataPrimoSoccorso` DATETIME NULL DEFAULT NULL,
	`diabete` TINYINT(4) NOT NULL DEFAULT '0',
	`ipertensione` TINYINT(4) NOT NULL DEFAULT '0',
	`angina` TINYINT(4) NOT NULL DEFAULT '0',
	`HR` INT(11) NULL DEFAULT NULL,
	`killipClass` TINYINT(5) NOT NULL DEFAULT '0',
	`anteroSTElev` TINYINT(4) NOT NULL DEFAULT '0',
	`LBBB` TINYINT(4) NOT NULL DEFAULT '0',
	`timeToTreatment` INT(10) UNSIGNED NULL DEFAULT NULL,
	`smoke` TINYINT(4) NOT NULL DEFAULT '0',
	`familiarity` TINYINT(4) NOT NULL DEFAULT '0',
	`prevAMI` TINYINT(4) NOT NULL DEFAULT '0',
	`obesity` TINYINT(4) NOT NULL DEFAULT '0',
	`dislip` TINYINT(4) NOT NULL DEFAULT '0',
	`timi` DOUBLE NULL DEFAULT NULL,
	`referto` TEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`systolicBP` DOUBLE NULL DEFAULT NULL,
	`dyastolicBP` DOUBLE NULL DEFAULT NULL,
	`weight` DOUBLE NULL DEFAULT NULL,
	`age` INT(11) NULL DEFAULT NULL,
	`dataTrombolisi` DATE NULL DEFAULT NULL,
	`oraTrombolisi` TIME NULL DEFAULT NULL,
	`farmaco` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`dataRivascolarizzazione` DATE NULL DEFAULT NULL,
	`oraRivascolarizzazione` TIME NULL DEFAULT NULL,
	`loco` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`, `oraRicovero`, `dataRicovero`, `dataEvento`, `oraEvento`) USING BTREE,
	INDEX `fk_medico_idx` (`id_medico`) USING BTREE,
	INDEX `fk_paziente_idx` (`id_paziente`) USING BTREE,
	CONSTRAINT `fk_medico` FOREIGN KEY (`id_medico`) REFERENCES `utente` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `fk_paziente` FOREIGN KEY (`id_paziente`) REFERENCES `paziente` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

-- L’esportazione dei dati non era selezionata.

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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

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
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella cbra_new.tp_utente
CREATE TABLE IF NOT EXISTS `tp_utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.tp_utente: ~3 rows (circa)
REPLACE INTO `tp_utente` (`id`, `nome`) VALUES
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
  `livello` int(10) unsigned NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `code_fis_UNIQUE` (`code_fis`),
  KEY `fk_utente_centro_idx` (`id_centro`),
  KEY `fk_utente_tp_utente_idx` (`livello`),
  CONSTRAINT `fk_utente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`),
  CONSTRAINT `fk_utente_tp_utente` FOREIGN KEY (`livello`) REFERENCES `tp_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

-- L’esportazione dei dati non era selezionata.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;