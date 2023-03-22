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