ALTER TABLE `paziente`
	CHANGE COLUMN `cf` `cf` VARCHAR(24) NOT NULL COLLATE 'utf8_general_ci' AFTER `id`;