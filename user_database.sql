CREATE DATABASE `user_database`;

USE `user_database`;


CREATE TABLE IF NOT EXISTS `users` (
	`user_id` INT(10) NOT NULL AUTO_INCREMENT,
    `username` 	VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    `admin` TINYINT(1) NOT NULL,
    PRIMARY KEY(`user_id`)
);

INSERT INTO `users`
	(`username`, `password`, `admin`)
VALUES
	('admin', 'admin', 1),
    ('chengyu', 'chengyu', 0),
    ('yufei', 'yufei', 0),
    ('ziyan', 'ziyan', 0),
    ('yang', 'yang', 0);