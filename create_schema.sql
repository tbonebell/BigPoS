SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `deli_pos` DEFAULT CHARACTER SET latin1 ;
USE `deli_pos` ;

-- -----------------------------------------------------
-- Table `deli_pos`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deli_pos`.`employee` ;

CREATE  TABLE IF NOT EXISTS `deli_pos`.`employee` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(255) NULL DEFAULT NULL ,
  `last_name` VARCHAR(255) NULL DEFAULT NULL ,
  `ssn` VARCHAR(12) NULL DEFAULT NULL ,
  `password` VARCHAR(10) NULL DEFAULT NULL ,
  `phone_number` VARCHAR(40) NULL DEFAULT NULL ,
  `address` VARCHAR(255) NULL DEFAULT NULL ,
  `city` VARCHAR(255) NULL DEFAULT NULL ,
  `state` VARCHAR(2) NULL DEFAULT NULL ,
  `zip` VARCHAR(20) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `deli_pos`.`menu_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deli_pos`.`menu_items` ;

CREATE  TABLE IF NOT EXISTS `deli_pos`.`menu_items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL DEFAULT NULL ,
  `price` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `deli_pos`.`order_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deli_pos`.`order_items` ;

CREATE  TABLE IF NOT EXISTS `deli_pos`.`order_items` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `order_number` INT(11) NULL DEFAULT NULL ,
  `menu_item` INT(11) NULL DEFAULT NULL ,
  `register` INT(11) NULL DEFAULT NULL ,
  `sub_total` VARCHAR(45) NULL DEFAULT NULL ,
  `total` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 42
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `deli_pos`.`pos_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deli_pos`.`pos_order` ;

CREATE  TABLE IF NOT EXISTS `deli_pos`.`pos_order` (
  `order_number` INT(11) NOT NULL AUTO_INCREMENT ,
  `order_time` DATETIME NULL DEFAULT NULL ,
  `cashier` VARCHAR(45) NULL DEFAULT NULL ,
  `open` TINYINT(4) NULL DEFAULT NULL ,
  `sub_total` INT(11) NULL DEFAULT NULL ,
  `total` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`order_number`) )
ENGINE = InnoDB
AUTO_INCREMENT = 54
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `deli_pos`.`register`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deli_pos`.`register` ;

CREATE  TABLE IF NOT EXISTS `deli_pos`.`register` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `cashier` VARCHAR(45) NULL DEFAULT NULL ,
  `opened` DATETIME NULL DEFAULT NULL ,
  `closed` DATETIME NULL DEFAULT NULL ,
  `starting_amount` DECIMAL(10,2) NULL DEFAULT NULL ,
  `current_balance` DECIMAL(10,2) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `deli_pos`.`timecard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deli_pos`.`timecard` ;

CREATE  TABLE IF NOT EXISTS `deli_pos`.`timecard` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '	' ,
  `timein` DATETIME NULL DEFAULT NULL ,
  `timeout` DATETIME NULL DEFAULT NULL ,
  `employee_id` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
