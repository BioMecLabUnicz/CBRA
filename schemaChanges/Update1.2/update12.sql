ALTER TABLE `utente`
	CHANGE COLUMN `password` `password` VARCHAR(65) NOT NULL COLLATE 'utf8_general_ci' AFTER `username`;


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


ALTER TABLE `hospitalization`
	CHANGE COLUMN `angina` `angina` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `ipertensione`;

ALTER TABLE `hospitalization`
	CHANGE COLUMN `dataPrimoSoccorso` `dataPrimoSoccorso` DATE NULL AFTER `id_medico`,
	CHANGE COLUMN `angina` `angina` TINYINT(4) UNSIGNED NULL DEFAULT '0' AFTER `ipertensione`,
	CHANGE COLUMN `HR` `HR` INT(11) UNSIGNED NULL DEFAULT '0' AFTER `angina`,
	CHANGE COLUMN `timeToTreatment` `timeToTreatment` INT(10) UNSIGNED NULL DEFAULT '0' AFTER `LBBB`,
	CHANGE COLUMN `age` `age` INT(11) UNSIGNED NULL DEFAULT '0' AFTER `weight`,
	ADD COLUMN `hypercholesterolemia` TINYINT(4) UNSIGNED NOT NULL DEFAULT '3' AFTER `loco`,
	ADD COLUMN `asa_usage_7d` TINYINT(4) UNSIGNED NOT NULL DEFAULT '3' AFTER `hypercholesterolemia`,
	ADD COLUMN `st_deviation` DOUBLE UNSIGNED NOT NULL DEFAULT 0 AFTER `asa_usage_7d`,
	ADD COLUMN `cardiac_marker` TINYINT(4) UNSIGNED NOT NULL DEFAULT '3' AFTER `st_deviation`,
	ADD COLUMN `stenosis` DOUBLE UNSIGNED NULL DEFAULT 0 AFTER `cardiac_marker`;


RENAME TABLE `datisimulazione` TO `analysis_result`;

ALTER TABLE `analysis_result`
	CHANGE COLUMN `a` `a` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `oraAnalisi`,
	CHANGE COLUMN `b` `b` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `a`,
	CHANGE COLUMN `c` `c` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `b`,
	CHANGE COLUMN `d` `d` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `c`,
	CHANGE COLUMN `Td` `Td` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `d`,
	CHANGE COLUMN `Cs0` `Cs0` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `Td`,
	CHANGE COLUMN `Cc0` `Cc0` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `Cs0`,
	CHANGE COLUMN `Kc0` `Kc0` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `Cc0`,
	CHANGE COLUMN `t` `t` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `Kc0`,
	CHANGE COLUMN `FPV` `FPV` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `t`,
	CHANGE COLUMN `FPT` `FPT` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `FPV`,
	CHANGE COLUMN `SPV` `SPV` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `FPT`,
	CHANGE COLUMN `SPT` `SPT` DOUBLE(10,5) NOT NULL DEFAULT 0 AFTER `SPV`;

CREATE TABLE `analysis_params` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`a_lb` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`b_lb` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`td_lb` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cs0_lb` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cc0_lb` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`a_ub` DOUBLE(10,3) NULL DEFAULT NULL,
	`b_ub` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`td_ub` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cs0_ub` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cc0_ub` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`a_init` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`b_init` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`td_init` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cs0_init` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cc0_init` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`iterations` INT(10) UNSIGNED NULL DEFAULT NULL,
	`a_fixed` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`b_fixed` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`td_fixed` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cs0_fixed` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`cc0_fixed` DOUBLE(10,3) UNSIGNED NULL DEFAULT NULL,
	`global_alg` VARCHAR(45) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`local_alg` VARCHAR(45) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`time` DOUBLE(10,5) UNSIGNED NULL DEFAULT NULL,
	`id_result` INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `id_UNIQUE` (`id`) USING BTREE,
	INDEX `param_result_idx` (`id_result`) USING BTREE,
	CONSTRAINT `param_result` FOREIGN KEY (`id_result`) REFERENCES `analysis_result` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE
)
COMMENT='Params used to perform analysis'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


ALTER TABLE `acquisizione`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `id_hospedalization`,
	ADD COLUMN `date_edit` DATETIME NOT NULL AFTER `date_insert`;

ALTER TABLE `amministratore_centro`
	CHANGE COLUMN `data_da` `data_da` DATETIME NULL DEFAULT NULL AFTER `id_centro`,
	CHANGE COLUMN `data_a` `data_a` DATETIME NULL AFTER `data_da`,
    ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `data_a`,
	ADD COLUMN `date_edit` DATETIME NULL AFTER `date_insert`;

ALTER TABLE `analysis_result`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `id_hospedalization`,
  ADD COLUMN `date_edit` DATETIME NULL AFTER `date_insert`;

ALTER TABLE `centro`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `numero_pazienti`,
	ADD COLUMN `date_edit` DATETIME NULL DEFAULT NULL AFTER `date_insert`;

ALTER TABLE `hospitalization`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `stenosis`,
	ADD COLUMN `date_edit` DATETIME NULL DEFAULT NULL AFTER `date_insert`;

ALTER TABLE `medico_paziente`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `id_paziente`,
	ADD COLUMN `date_edit` DATETIME NULL DEFAULT NULL AFTER `date_insert`;

ALTER TABLE `paziente`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `origin_center`,
	ADD COLUMN `date_edit` DATETIME NULL AFTER `date_insert`;

ALTER TABLE `utente`
	ADD COLUMN `date_insert` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `livello`,
	ADD COLUMN `date_edit` DATETIME NULL DEFAULT NULL AFTER `date_insert`;

CREATE TABLE `login` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`logged_user` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`user_id` INT(10) UNSIGNED NOT NULL,
	`access_level` INT(11) UNSIGNED NOT NULL,
	`evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT '0.000000' COMMENT 'Units: seconds',
	`execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT '0.000000' COMMENT 'Units: seconds',
	`date_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `idlogin_UNIQUE` (`id`) USING BTREE,
	INDEX `login_user_id_idx` (`user_id`) USING BTREE,
	CONSTRAINT `login_user_id` FOREIGN KEY (`user_id`) REFERENCES `utente` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `cbra_new`.`error_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_time` `date_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP() AFTER `id`,
  `identifier` varchar(200) NOT NULL,
  `line` int(11) NOT NULL,
  `function_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iderror_log_UNIQUE` (`id`),
  KEY `error_user_idx` (`user_id`),
  CONSTRAINT `error_user` FOREIGN KEY (`user_id`) REFERENCES `utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `utente`
	ADD COLUMN `evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `date_edit`,
	ADD COLUMN `execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `evaluation_time`;

ALTER TABLE `centro`
	ADD COLUMN `evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `date_edit`,
	ADD COLUMN `execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `evaluation_time`;

ALTER TABLE `paziente`
	ADD COLUMN `evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `date_edit`,
	ADD COLUMN `execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `evaluation_time`;

ALTER TABLE `hospitalization`
	ADD COLUMN `evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `date_edit`,
	ADD COLUMN `execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 COMMENT 'Units: seconds' AFTER `evaluation_time`;

ALTER TABLE `hospitalization`
	CHANGE COLUMN `angina` `angina` TINYINT(4) UNSIGNED NOT NULL DEFAULT '0' AFTER `ipertensione`,
	CHANGE COLUMN `HR` `HR` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `angina`,
	CHANGE COLUMN `timeToTreatment` `timeToTreatment` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `LBBB`,
	CHANGE COLUMN `timi` `timi` DOUBLE UNSIGNED NOT NULL DEFAULT '0' AFTER `dislip`,
	CHANGE COLUMN `referto` `referto` TEXT NULL COLLATE 'utf8_general_ci' AFTER `timi`,
	CHANGE COLUMN `systolicBP` `systolicBP` DOUBLE UNSIGNED NOT NULL DEFAULT '0' AFTER `referto`,
	CHANGE COLUMN `dyastolicBP` `dyastolicBP` DOUBLE UNSIGNED NOT NULL DEFAULT '0' AFTER `systolicBP`,
	CHANGE COLUMN `weight` `weight` DOUBLE UNSIGNED NOT NULL DEFAULT '0' AFTER `dyastolicBP`,
	CHANGE COLUMN `age` `age` INT(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `weight`,
	CHANGE COLUMN `stenosis` `stenosis` DOUBLE UNSIGNED NOT NULL DEFAULT '0' AFTER `cardiac_marker`;

ALTER TABLE `acquisizione`
	ADD COLUMN `evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 AFTER `date_edit`,
	ADD COLUMN `execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 AFTER `evaluation_time`;

ALTER TABLE `analysis_result`
	ADD COLUMN `evaluation_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 AFTER `date_edit`,
	ADD COLUMN `execution_time` DOUBLE(10,6) UNSIGNED NULL DEFAULT 0 AFTER `evaluation_time`;