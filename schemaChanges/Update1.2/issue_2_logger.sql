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

