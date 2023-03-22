-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Creato il: Dic 09, 2019 alle 11:44
-- Versione del server: 5.5.42
-- Versione PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Biomarcatore`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `CartellaClinica`
--
USE biomarcatori;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE `CartellaClinica` (
  `CF` varchar(16) NOT NULL,
  `Nome` varchar(15) NOT NULL,
  `Cognome` varchar(15) NOT NULL,
  `DataDiNascita` date NOT NULL,
  `LuogoDiNascita` varchar(40) NOT NULL,
  `Sesso` varchar(1) NOT NULL,
  `Residenza` varchar(30) NOT NULL,
  `Dislipidemia` varchar(3) NOT NULL,
  `Familiarita` varchar(3) NOT NULL,
  `Diabete` varchar(3) NOT NULL,
  `Obesita` varchar(3) NOT NULL,
  `Fumo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `CartellaClinica`
--

INSERT INTO `CartellaClinica` (`CF`, `Nome`, `Cognome`, `DataDiNascita`, `LuogoDiNascita`, `Sesso`, `Residenza`, `Dislipidemia`, `Familiarita`, `Diabete`, `Obesita`, `Fumo`) VALUES
('LCCFNC80P42C352K', 'Francesco', 'Loccisano', '1980-09-02', 'CATANZARO', 'M', 'Via Petrarca II, 25', 'NO', 'NO', 'YES', 'NO', 'YES'),
('LCULLA80D42C352N', 'Aiello', 'Lucia', '1980-04-02', 'CATANZARO', 'F', 'Via Salvatore Miceli 2', 'NO', 'YES', 'NO', 'NO', 'YES'),
('RSTPTR57M49A542P', 'Pietro', 'Rostitolla', '1957-08-09', 'BADOLATO', 'M', 'Via degli eucalipti 4', 'NO', 'YES', 'YES', 'YES', 'NO');

-- --------------------------------------------------------

--
-- Struttura della tabella `DatiSimulazione`
--

CREATE TABLE `DatiSimulazione` (
  `CF` varchar(16) NOT NULL,
  `DataEvento` date NOT NULL,
  `OraEvento` time NOT NULL,
  `DataRicovero` date NOT NULL,
  `OraRicovero` time NOT NULL,
  `DataAnalisi` date NOT NULL,
  `OraAnalisi` time NOT NULL,
  `a` varchar(10) NOT NULL,
  `b` varchar(10) NOT NULL,
  `c` varchar(10) NOT NULL,
  `d` varchar(10) NOT NULL,
  `Td` varchar(10) NOT NULL,
  `Cs0` varchar(10) NOT NULL,
  `Cc0` varchar(10) NOT NULL,
  `Kc0` varchar(10) NOT NULL,
  `t` varchar(10) NOT NULL,
  `FPV` varchar(10) NOT NULL,
  `FPT` varchar(10) NOT NULL,
  `SPV` varchar(10) NOT NULL,
  `SPT` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `DatiSimulazione`
--

INSERT INTO `DatiSimulazione` (`CF`, `DataEvento`, `OraEvento`, `DataRicovero`, `OraRicovero`, `DataAnalisi`, `OraAnalisi`, `a`, `b`, `c`, `d`, `Td`, `Cs0`, `Cc0`, `Kc0`, `t`, `FPV`, `FPT`, `SPV`, `SPT`) VALUES
('RSTPTR57M49A542P', '2016-09-15', '16:00:00', '2016-09-15', '18:00:00', '2019-12-07', '10:33:27', '0.33683', '0.035023', '0', '0', '25.7132', '0.038699', '42.7505', '0', '0', '18.9013', '5.2037', '5.2037', '18.9013');

-- --------------------------------------------------------

--
-- Struttura della tabella `Intervento`
--

CREATE TABLE `Intervento` (
  `DataIntervento` date NOT NULL,
  `OraIntervento` time NOT NULL,
  `TipoIntervento` varchar(15) NOT NULL,
  `Farmaco` varchar(20) NOT NULL,
  `Vasoculprit` varchar(20) NOT NULL,
  `CF` varchar(16) NOT NULL,
  `DataEvento` date NOT NULL,
  `OraEvento` time NOT NULL,
  `DataRicovero` date NOT NULL,
  `OraRicovero` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `Misure`
--

CREATE TABLE `Misure` (
  `DataAcquisizione` date NOT NULL,
  `OraAcquisizione` time NOT NULL,
  `LivTroponina` varchar(6) NOT NULL,
  `LivSodio` varchar(6) NOT NULL,
  `LivPotassio` varchar(6) NOT NULL,
  `LivCKMB` varchar(6) NOT NULL,
  `CF` varchar(16) NOT NULL,
  `DataRicovero` date NOT NULL,
  `OraRicovero` time NOT NULL,
  `DataEvento` date NOT NULL,
  `OraEvento` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Misure`
--

INSERT INTO `Misure` (`DataAcquisizione`, `OraAcquisizione`, `LivTroponina`, `LivSodio`, `LivPotassio`, `LivCKMB`, `CF`, `DataRicovero`, `OraRicovero`, `DataEvento`, `OraEvento`) VALUES
('2016-09-08', '00:23:00', '0.153', '138', '3.6', '5.5', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-08', '08:05:00', '0.155', '141', '3.8', '8.07', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-08', '10:07:00', '0.174', '138', '5', '8.24', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-09', '10:16:00', '0.113', '139', '5.2', '8.33', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-10', '09:50:00', '0.114', '4.8', '4.8', '3.16', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-11', '10:02:00', '0.142', '139', '4.6', '2.65', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-12', '10:22:00', '0.07', '137', '3.7', '3.24', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-13', '13:34:00', '0.142', '139', '4', '8.34', 'LCULLA80D42C352N', '2016-09-07', '23:00:00', '2016-09-07', '20:00:00'),
('2016-09-15', '23:22:00', '18.240', '134', '4.6', '482.7', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-16', '07:45:00', '11.910', '136', '5', '169.8', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-16', '17:32:00', '8.330', '140', '4.8', '122.5', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-17', '11:17:00', '6.010', '140', '4.4', '24.54', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-18', '10:25:00', '5.640', '144', '3.6', '6.44', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-19', '09:34:00', '5.680', '143', '3.8', '3.63', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-20', '10:56:00', '5.450', '140', '4', '3.35', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-22', '10:37:00', '2.070', '141', '3.7', '3.53', 'RSTPTR57M49A542P', '2016-09-15', '18:00:00', '2016-09-15', '16:00:00'),
('2016-09-28', '12:00:00', '0.142', '137', '4', '8.24', 'LCCFNC80P42C352K', '2016-09-15', '20:00:00', '2016-09-13', '19:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `Ricovero`
--

CREATE TABLE `Ricovero` (
  `DataEvento` date NOT NULL,
  `OraEvento` time NOT NULL,
  `DataRicovero` date NOT NULL,
  `OraRicovero` time NOT NULL,
  `PrimoContattoMedico` date NOT NULL,
  `CF` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Ricovero`
--

INSERT INTO `Ricovero` (`DataEvento`, `OraEvento`, `DataRicovero`, `OraRicovero`, `PrimoContattoMedico`, `CF`) VALUES
('2016-09-07', '20:00:00', '2016-09-07', '23:00:00', '2016-09-07', 'LCULLA80D42C352N'),
('2016-09-13', '19:00:00', '2016-09-15', '20:00:00', '2016-09-15', 'LCCFNC80P42C352K'),
('2016-09-15', '16:00:00', '2016-09-15', '18:00:00', '2016-09-15', 'RSTPTR57M49A542P');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `CartellaClinica`
--
ALTER TABLE `CartellaClinica`
  ADD PRIMARY KEY (`CF`);

--
-- Indici per le tabelle `DatiSimulazione`
--
ALTER TABLE `DatiSimulazione`
  ADD PRIMARY KEY (`CF`,`DataEvento`,`OraEvento`,`DataRicovero`,`OraRicovero`,`DataAnalisi`,`OraAnalisi`),
  ADD KEY `salvadati_ibfk_2` (`DataEvento`),
  ADD KEY `salvadati_ibfk_3` (`DataRicovero`),
  ADD KEY `salvadati_ibfk_4` (`OraRicovero`),
  ADD KEY `salvadati_ibfk_5` (`OraEvento`);

--
-- Indici per le tabelle `Intervento`
--
ALTER TABLE `Intervento`
  ADD PRIMARY KEY (`DataIntervento`,`OraIntervento`,`CF`,`DataEvento`,`OraEvento`,`DataRicovero`,`OraRicovero`),
  ADD KEY `OraEvento` (`OraEvento`),
  ADD KEY `CF` (`CF`,`DataEvento`,`OraEvento`),
  ADD KEY `intervento_ibfk_2` (`DataEvento`),
  ADD KEY `intervento_ibfk_4` (`DataRicovero`),
  ADD KEY `intervento_ibfk_5` (`OraRicovero`);

--
-- Indici per le tabelle `Misure`
--
ALTER TABLE `Misure`
  ADD PRIMARY KEY (`DataAcquisizione`,`OraAcquisizione`,`CF`,`DataRicovero`,`OraRicovero`,`DataEvento`,`OraEvento`),
  ADD KEY `DataRicovero` (`DataRicovero`,`OraRicovero`),
  ADD KEY `DataEvento` (`DataEvento`,`OraEvento`),
  ADD KEY `CF` (`CF`) USING BTREE,
  ADD KEY `misure_ibfk_3` (`OraRicovero`),
  ADD KEY `misure_ibfk_5` (`OraEvento`);

--
-- Indici per le tabelle `Ricovero`
--
ALTER TABLE `Ricovero`
  ADD PRIMARY KEY (`DataEvento`,`OraEvento`,`DataRicovero`,`OraRicovero`,`CF`),
  ADD KEY `OraRicovero` (`OraRicovero`),
  ADD KEY `OraEvento` (`OraEvento`),
  ADD KEY `DataRicovero` (`DataRicovero`),
  ADD KEY `DataEvento` (`DataEvento`,`OraEvento`,`DataRicovero`,`OraRicovero`),
  ADD KEY `DataEvento_2` (`DataEvento`,`OraEvento`),
  ADD KEY `DataEvento_3` (`DataEvento`,`OraEvento`),
  ADD KEY `ricovero_ibfk_1` (`CF`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `DatiSimulazione`
--
ALTER TABLE `DatiSimulazione`
  ADD CONSTRAINT `salvadati_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `Ricovero` (`CF`) ON DELETE CASCADE,
  ADD CONSTRAINT `salvadati_ibfk_2` FOREIGN KEY (`DataEvento`) REFERENCES `Ricovero` (`DataEvento`) ON DELETE CASCADE,
  ADD CONSTRAINT `salvadati_ibfk_3` FOREIGN KEY (`DataRicovero`) REFERENCES `Ricovero` (`DataRicovero`) ON DELETE CASCADE,
  ADD CONSTRAINT `salvadati_ibfk_4` FOREIGN KEY (`OraRicovero`) REFERENCES `Ricovero` (`OraRicovero`) ON DELETE CASCADE,
  ADD CONSTRAINT `salvadati_ibfk_5` FOREIGN KEY (`OraEvento`) REFERENCES `Ricovero` (`OraEvento`) ON DELETE CASCADE;

--
-- Limiti per la tabella `Intervento`
--
ALTER TABLE `Intervento`
  ADD CONSTRAINT `intervento_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `Ricovero` (`CF`) ON DELETE CASCADE,
  ADD CONSTRAINT `intervento_ibfk_2` FOREIGN KEY (`DataEvento`) REFERENCES `Ricovero` (`DataEvento`) ON DELETE CASCADE,
  ADD CONSTRAINT `intervento_ibfk_3` FOREIGN KEY (`OraEvento`) REFERENCES `Ricovero` (`OraEvento`) ON DELETE CASCADE,
  ADD CONSTRAINT `intervento_ibfk_4` FOREIGN KEY (`DataRicovero`) REFERENCES `Ricovero` (`DataRicovero`) ON DELETE CASCADE,
  ADD CONSTRAINT `intervento_ibfk_5` FOREIGN KEY (`OraRicovero`) REFERENCES `Ricovero` (`OraRicovero`) ON DELETE CASCADE;

--
-- Limiti per la tabella `Misure`
--
ALTER TABLE `Misure`
  ADD CONSTRAINT `misure_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `Ricovero` (`CF`) ON DELETE CASCADE,
  ADD CONSTRAINT `misure_ibfk_2` FOREIGN KEY (`DataRicovero`) REFERENCES `Ricovero` (`DataRicovero`) ON DELETE CASCADE,
  ADD CONSTRAINT `misure_ibfk_3` FOREIGN KEY (`OraRicovero`) REFERENCES `Ricovero` (`OraRicovero`) ON DELETE CASCADE,
  ADD CONSTRAINT `misure_ibfk_4` FOREIGN KEY (`DataEvento`) REFERENCES `Ricovero` (`DataEvento`) ON DELETE CASCADE,
  ADD CONSTRAINT `misure_ibfk_5` FOREIGN KEY (`OraEvento`) REFERENCES `Ricovero` (`OraEvento`) ON DELETE CASCADE;

--
-- Limiti per la tabella `Ricovero`
--
ALTER TABLE `Ricovero`
  ADD CONSTRAINT `ricovero_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `CartellaClinica` (`CF`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET FOREIGN_KEY_CHECKS = 1;