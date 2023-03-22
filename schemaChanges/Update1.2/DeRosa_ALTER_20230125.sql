#Indirizzo not mandatory
ALTER TABLE `centro`
	CHANGE COLUMN `nome` `nome` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci' AFTER `id`,
	CHANGE COLUMN `indirizzo` `indirizzo` VARCHAR(127) NULL COLLATE 'utf8_general_ci' AFTER `nome`;

ALTER TABLE `paziente`
	CHANGE COLUMN `indirizzo_residenza` `indirizzo_residenza` VARCHAR(100) NULL COLLATE 'utf8_general_ci' AFTER `sesso`;

#From anteroSTElev to STEMI
ALTER TABLE `hospedalization`
	CHANGE COLUMN `anteroSTElev` `STEMI` TINYINT(4) NOT NULL DEFAULT '0' AFTER `killipClass`;

#Imort/Export
ALTER TABLE `paziente`
	DROP INDEX `cf_UNIQUE`,
	ADD UNIQUE INDEX `cf_UNIQUE` (`cf`, `id_centro`) USING BTREE,
	DROP INDEX `code_UNIQUE`,
	ADD UNIQUE INDEX `code_UNIQUE` (`code`, `id_centro`) USING BTREE;
ALTER TABLE `paziente`
	ADD COLUMN `origin_center` VARCHAR(14) NULL DEFAULT NULL COLLATE 'utf8_general_ci' AFTER `code`;

#update unicode
ALTER TABLE `paziente`
	CHANGE COLUMN `code` `code` VARCHAR(26) NOT NULL COMMENT 'cen 000 00000000 tro 000000000' COLLATE 'utf8_general_ci' AFTER `id_centro`;

#update hospedalization table to ensure empty values
ALTER TABLE `hospedalization`
	CHANGE COLUMN `id_paziente` `id_paziente` INT(10) UNSIGNED NOT NULL AFTER `oraEvento`;

ALTER TABLE `hospedalization`
	CHANGE COLUMN `diabete` `diabete` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `dataPrimoSoccorso`,
	CHANGE COLUMN `ipertensione` `ipertensione` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `diabete`,
	CHANGE COLUMN `angina` `angina` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `ipertensione`,
	CHANGE COLUMN `killipClass` `killipClass` TINYINT(5) UNSIGNED NOT NULL DEFAULT 1 AFTER `HR`,
	CHANGE COLUMN `STEMI` `STEMI` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `killipClass`,
	CHANGE COLUMN `LBBB` `LBBB` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `STEMI`,
	CHANGE COLUMN `timeToTreatment` `timeToTreatment` INT(10) UNSIGNED NULL DEFAULT 0 AFTER `LBBB`,
	CHANGE COLUMN `smoke` `smoke` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `timeToTreatment`,
	CHANGE COLUMN `familiarity` `familiarity` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `smoke`,
	CHANGE COLUMN `prevAMI` `prevAMI` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `familiarity`,
	CHANGE COLUMN `obesity` `obesity` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `prevAMI`,
	CHANGE COLUMN `dislip` `dislip` TINYINT(4) UNSIGNED NOT NULL DEFAULT 3 AFTER `obesity`,
	CHANGE COLUMN `timi` `timi` DOUBLE UNSIGNED NULL DEFAULT 0 AFTER `dislip`,
	CHANGE COLUMN `systolicBP` `systolicBP` DOUBLE UNSIGNED NULL DEFAULT 0 AFTER `referto`,
	CHANGE COLUMN `dyastolicBP` `dyastolicBP` DOUBLE UNSIGNED NULL DEFAULT 0 AFTER `systolicBP`,
	CHANGE COLUMN `weight` `weight` DOUBLE UNSIGNED NULL DEFAULT 0 AFTER `dyastolicBP`,
	CHANGE COLUMN `age` `age` INT(11) UNSIGNED NULL DEFAULT 0 AFTER `weight`;

ALTER TABLE `hospedalization`
	CHANGE COLUMN `HR` `HR` INT(11) NULL DEFAULT 0 AFTER `angina`;
ALTER TABLE `hospedalization`
	CHANGE COLUMN `id_medico` `id_medico` INT(10) UNSIGNED NOT NULL AFTER `id_paziente`;

#id_centro not NULL
ALTER TABLE `utente`
	CHANGE COLUMN `id_centro` `id_centro` INT(10) UNSIGNED NOT NULL AFTER `email`;

RENAME TABLE `hospedalization` TO `hospitalization`;