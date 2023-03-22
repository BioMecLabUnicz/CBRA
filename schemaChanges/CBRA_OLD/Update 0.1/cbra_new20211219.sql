-- --------------------------------------------------------
-- Host:                         localhost
-- Versione server:              5.7.24 - MySQL Community Server (GPL)
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

SET foreign_key_checks = 0;
-- Dump della struttura del database cbra_new
CREATE DATABASE IF NOT EXISTS `cbra_new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cbra_new`;

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
  KEY `fk_centro_admin` (`amministratore`),
  CONSTRAINT `fk_centro_admin` FOREIGN KEY (`amministratore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.centro: ~3 rows (circa)
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` (`id`, `nome`, `indirizzo`, `citta`, `amministratore`, `numero_medici`, `numero_pazienti`) VALUES
	(1, 'UMG', 'Germaneto', '', 1, 8, 0),
	(2, 'CentroCS', 'Cosenza', '', 1, 8, 0),
	(3, 'CentroRC', 'Reggio Calabria', '', 1, 8, 0);
/*!40000 ALTER TABLE `centro` ENABLE KEYS */;

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
  UNIQUE KEY `id` (`id`,`cf`),
  KEY `cf` (`cf`),
  KEY `fk_paziente_centro` (`id_centro`),
  CONSTRAINT `fk_paziente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.paziente: ~0 rows (circa)
/*!40000 ALTER TABLE `paziente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paziente` ENABLE KEYS */;

-- Dump della struttura di tabella cbra_new.tp_utente
CREATE TABLE IF NOT EXISTS `tp_utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.tp_utente: ~3 rows (circa)
/*!40000 ALTER TABLE `tp_utente` DISABLE KEYS */;
INSERT INTO `tp_utente` (`id`, `nome`) VALUES
	(1, 'ADMIN'),
	(2, 'CENTER'),
	(3, 'CLINIC');
/*!40000 ALTER TABLE `tp_utente` ENABLE KEYS */;

-- Dump della struttura di tabella cbra_new.utente
CREATE TABLE IF NOT EXISTS `utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cognome` varchar(45) DEFAULT NULL,
  `code_fis` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `id_centro` int(10) unsigned DEFAULT NULL,
  `livello` int(10) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_utente_centro_idx` (`id_centro`),
  KEY `fk_utente_tp_utente_idx` (`livello`),
  CONSTRAINT `fk_utente_centro` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`),
  CONSTRAINT `fk_utente_tp_utente` FOREIGN KEY (`livello`) REFERENCES `tp_utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella cbra_new.utente: ~3 rows (circa)
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` (`id`, `nome`, `cognome`, `code_fis`, `username`, `password`, `email`, `id_centro`, `livello`) VALUES
	(1, 'Nicola', 'Cortese', NULL, 'n.cortese', 'n.cortese', NULL, NULL, 1),
	(2, 'Medico1', 'Medico1', 'Medico1Medico1Medico1', 'Medico1', 'Medico1', 'Medico1@Medico1.it', 1, 3),
	(6, 'Centro1', 'Centro1', 'Centro1Centro1Centro1', 'Centro1', 'Centro1', 'Centro1@Centro1.it', 1, 2);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

SET foreign_key_checks = 1;
