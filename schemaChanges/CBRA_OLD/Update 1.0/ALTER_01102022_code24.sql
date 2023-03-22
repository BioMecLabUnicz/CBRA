ALTER TABLE `paziente`
	CHANGE COLUMN `code` `code` VARCHAR(24) NOT NULL COLLATE 'utf8_general_ci' AFTER `id_centro`;