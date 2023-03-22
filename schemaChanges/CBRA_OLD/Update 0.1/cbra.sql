-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2021 at 09:17 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbra`
--

-- --------------------------------------------------------

--
-- Table structure for table `centro`
--
USE cbra_old;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE `centro` (
  `id` int(20) NOT NULL,
  `tipo` int(10) NOT NULL,
  `nomestruttura` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centro`
--

INSERT INTO `centro` (`id`, `tipo`, `nomestruttura`, `username`, `password`) VALUES
(1, 2, 'Università Magna Graecia', 'magnagraecia@unicz.it', 'magnificoretto'),
(2, 2, 'Uneversità del pendolo', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `datisimulazione`
--

CREATE TABLE `datisimulazione` (
  `ricovero` int(11) NOT NULL,
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
  `CF` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `misure`
--

CREATE TABLE `misure` (
  `ricovero` int(20) NOT NULL,
  `dataAcquisizione` date NOT NULL,
  `oraAcquisizione` time NOT NULL,
  `CF` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `troponinaT` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `troponinaI` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ckmb` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Na` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `K` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partecipaa`
--

CREATE TABLE `partecipaa` (
  `paziente` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progetto` int(11) NOT NULL,
  `medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paziente`
--

CREATE TABLE `paziente` (
  `CF` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cognome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sesso` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `residenza` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataNascita` date NOT NULL,
  `luogoNascita` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paziente`
--

INSERT INTO `paziente` (`CF`, `nome`, `cognome`, `sesso`, `residenza`, `dataNascita`, `luogoNascita`) VALUES
('CJKLSS21R48A006G', 'alessia', 'cjkld', 'F', 'hlglhfhgh', '2021-10-08', 'ABBADIA LARIANA'),
('CPCLSS21R41A002M', 'alessia', 'capace', 'F', 'Via bu, 24', '2021-10-01', 'ABBADIA'),
('DFDFFD21R41A002M', 'ffd', 'dfdf', 'F', 'Via slksdlf', '2021-10-01', 'ABANO BAGNI'),
('DFGFGD21R48A001K', 'fgd', 'dfg', 'F', 'fdkljgkjf', '2021-10-08', 'ABANO TERME'),
('HJXGHF21R41A002Z', 'ghf', 'hj', 'F', 'hjghj', '2021-10-01', 'ABANO BAGNI'),
('LLRFJJ21R42A013M', 'fhjjkdks', 'llrltr', 'F', 'Via Gluy', '2021-10-02', 'ABETONE'),
('NSCFNC93T63C352K', 'francesca', 'nesci', 'F', 'Via Soverato', '1993-12-23', 'CATANZARO'),
('PRCNNA21R41A002E', 'anna', 'procopio', 'F', 'Alber', '2021-10-01', 'ABBADIA SOPRA ADDA'),
('RLÒHLK21R51A026Z', 'haklkals', 'rlòkmynb', 'F', 'tyerty', '2021-10-11', 'ACI BONACCORSI'),
('RYKDFK21R51D498P', 'dgfkdf', 'rykjkh', 'F', 'uiou', '2021-10-11', 'FARFENGO'),
('ZFFPLA21R15A008E', 'paolo', 'zaffino', 'M', 'vksdkfsd', '2021-10-15', 'ABBASANTA'),
('ZFFPLA21R48A008N', 'paolo', 'zaffina', 'F', 'Cfkfo', '2021-10-08', 'ABBASANTA'),
('ZFFPLA21R48D777L', 'paola', 'zaffina', 'F', 'ghf', '2021-10-08', 'FRASSINELLE POLESINE'),
('ZFFPLA21R88A004H', 'paolo', 'zaffino', 'M', 'fjhksg', '2021-10-08', 'ABBADIA ALPINA');

-- --------------------------------------------------------

--
-- Table structure for table `progetto`
--

CREATE TABLE `progetto` (
  `id` int(11) NOT NULL,
  `shortAbstr` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requisiti` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `numPat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ricovero`
--

CREATE TABLE `ricovero` (
  `idricovero` int(20) NOT NULL,
  `dataRicovero` date NOT NULL,
  `oraRicovero` time NOT NULL,
  `dataEvento` date NOT NULL,
  `oraEvento` time NOT NULL,
  `paziente` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medico` int(11) NOT NULL,
  `primoContattoMedico` date NOT NULL,
  `diabete` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipertensione` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angina` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HR` int(3) NOT NULL,
  `killipClass` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anteroSTElev` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LBBB` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeTotreatment` date NOT NULL,
  `fumo` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `familiarita` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prevAMI` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `obesita` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dislip` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMI` int(2) NOT NULL,
  `Referto` text COLLATE utf8mb4_unicode_ci,
  `SystolicBP` int(4) NOT NULL,
  `Peso` int(3) NOT NULL,
  `eta` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ricovero`
--

INSERT INTO `ricovero` (`idricovero`, `dataRicovero`, `oraRicovero`, `dataEvento`, `oraEvento`, `paziente`, `medico`, `primoContattoMedico`, `diabete`, `ipertensione`, `angina`, `HR`, `killipClass`, `anteroSTElev`, `LBBB`, `timeTotreatment`, `fumo`, `familiarita`, `prevAMI`, `obesita`, `dislip`, `TIMI`, `Referto`, `SystolicBP`, `Peso`, `eta`) VALUES
(2, '2021-02-19', '12:03:41', '2021-02-18', '12:03:23', 'CPCLSS21R41A002M', 2, '2021-09-02', 'No', 'No', 'No', 123, 'I', 'No', 'No', '2021-10-12', 'No', 'No', 'No', 'No', 'No', 4, 'fgdfgdfg', 123, 123, 123),
(3, '2021-12-02', '12:03:42', '2021-12-02', '12:03:42', 'PRCNNA21R41A002E', 2, '2021-12-02', 'No', 'No', 'No', 7, 'II', 'No', 'No', '2021-12-01', 'No', 'No', 'No', 'No', 'No', 7, 'fhjoif', 7, 7, 7),
(4, '2021-10-01', '01:01:01', '2021-10-01', '01:01:01', 'PRCNNA21R41A002E', 2, '2021-10-07', 'No', 'No', 'No', 67, 'No', 'No', 'No', '0001-03-07', 'No', 'No', 'No', 'No', 'No', 6, NULL, 67, 67, 67),
(5, '2021-10-08', '00:00:00', '2021-10-08', '00:00:00', 'ZFFPLA21R48D777L', 2, '2021-10-08', 'No', 'No', 'No', 56, 'No', 'No', 'No', '0001-02-25', 'No', 'No', 'No', 'No', 'No', 5, NULL, 65, 66, 656),
(6, '2021-10-08', '00:00:00', '2021-10-12', '00:00:00', 'RYKDFK21R51D498P', 2, '2021-10-12', 'No', 'No', 'No', 89, 'No', 'No', 'No', '0001-03-29', 'No', 'No', 'No', 'No', 'No', 4, NULL, 89, 89, 89),
(7, '2021-11-04', '01:01:01', '2021-11-11', '01:01:01', 'CPCLSS21R41A002M', 2, '2021-11-09', 'No', 'No', 'No', 12, 'No', 'No', 'No', '0001-01-12', 'No', 'No', 'No', 'No', 'No', 5, NULL, 12, 12, 12),
(8, '2021-11-04', '01:01:01', '2021-11-04', '01:01:01', 'CPCLSS21R41A002M', 2, '2021-11-01', 'No', 'No', 'No', 123, 'No', 'No', 'No', '0001-01-02', 'No', 'No', 'No', 'No', 'No', 6, NULL, 23, 23, 23);

-- --------------------------------------------------------

--
-- Table structure for table `superuser`
--

CREATE TABLE `superuser` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `superuser`
--

INSERT INTO `superuser` (`id`, `tipo`) VALUES
(1, 'admin'),
(2, 'centro'),
(3, 'medico');

-- --------------------------------------------------------

--
-- Table structure for table `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `tipo` int(10) NOT NULL,
  `struttura` int(10) NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cognome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biblio` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `utente`
--

INSERT INTO `utente` (`id`, `tipo`, `struttura`, `nome`, `cognome`, `biblio`, `username`, `password`) VALUES
(1, 1, 1, '', '', '', 'root', 'root'),
(2, 3, 1, 'Salvatore', 'De Rosa', '', 'sl@unicz.it', 'bur45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo` (`tipo`);

--
-- Indexes for table `datisimulazione`
--
ALTER TABLE `datisimulazione`
  ADD PRIMARY KEY (`ricovero`,`CF`);

--
-- Indexes for table `misure`
--
ALTER TABLE `misure`
  ADD PRIMARY KEY (`ricovero`,`dataAcquisizione`,`oraAcquisizione`),
  ADD KEY `dataAcquisizione` (`dataAcquisizione`,`oraAcquisizione`,`CF`),
  ADD KEY `CF` (`CF`);

--
-- Indexes for table `partecipaa`
--
ALTER TABLE `partecipaa`
  ADD PRIMARY KEY (`paziente`,`progetto`,`medico`),
  ADD KEY `paziente` (`paziente`,`progetto`,`medico`),
  ADD KEY `medico` (`medico`),
  ADD KEY `progetto` (`progetto`);

--
-- Indexes for table `paziente`
--
ALTER TABLE `paziente`
  ADD PRIMARY KEY (`CF`);

--
-- Indexes for table `progetto`
--
ALTER TABLE `progetto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ricovero`
--
ALTER TABLE `ricovero`
  ADD PRIMARY KEY (`idricovero`),
  ADD KEY `paziente` (`paziente`,`medico`),
  ADD KEY `medico` (`medico`);

--
-- Indexes for table `superuser`
--
ALTER TABLE `superuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo` (`tipo`),
  ADD KEY `struttura` (`struttura`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `centro`
--
ALTER TABLE `centro`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `progetto`
--
ALTER TABLE `progetto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ricovero`
--
ALTER TABLE `ricovero`
  MODIFY `idricovero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `utente`
--
ALTER TABLE `utente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `misure`
--
ALTER TABLE `misure`
  ADD CONSTRAINT `misure_ibfk_2` FOREIGN KEY (`CF`) REFERENCES `paziente` (`CF`),
  ADD CONSTRAINT `misure_ibfk_3` FOREIGN KEY (`ricovero`) REFERENCES `ricovero` (`idricovero`);

--
-- Constraints for table `partecipaa`
--
ALTER TABLE `partecipaa`
  ADD CONSTRAINT `partecipaa_ibfk_1` FOREIGN KEY (`paziente`) REFERENCES `paziente` (`CF`),
  ADD CONSTRAINT `partecipaa_ibfk_2` FOREIGN KEY (`medico`) REFERENCES `utente` (`id`),
  ADD CONSTRAINT `partecipaa_ibfk_3` FOREIGN KEY (`progetto`) REFERENCES `progetto` (`id`);

--
-- Constraints for table `ricovero`
--
ALTER TABLE `ricovero`
  ADD CONSTRAINT `ricovero_ibfk_2` FOREIGN KEY (`paziente`) REFERENCES `paziente` (`CF`),
  ADD CONSTRAINT `ricovero_ibfk_3` FOREIGN KEY (`medico`) REFERENCES `utente` (`id`);
COMMIT;

SET FOREIGN_KEY_CHECKS = 0;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
