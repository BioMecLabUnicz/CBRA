ALTER TABLE `utente`
	CHANGE COLUMN `password` `password` VARCHAR(65) NOT NULL COLLATE 'utf8_general_ci' AFTER `username`;
