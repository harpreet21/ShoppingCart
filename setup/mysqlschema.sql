-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema shopping
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shopping
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shopping` DEFAULT CHARACTER SET latin1 ;
USE `shopping` ;

-- -----------------------------------------------------
-- Table `shopping`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`PRODUCT` (
  `PID` INT(11) NOT NULL,
  `DESCRIPTION` VARCHAR(255) NULL DEFAULT NULL,
  `BOOKIMAGE` VARCHAR(255) NULL DEFAULT NULL,
  `NAME` VARCHAR(255) NULL DEFAULT NULL,
  `PRICE` DOUBLE NULL DEFAULT NULL,
  `PTYPE` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`PID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `shopping`.`CARTDETAILS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`CARTDETAILS` (
  `CID` INT(11) NOT NULL,
  `CREF` INT(11) NULL DEFAULT NULL,
  `QUANTITY` INT(11) NULL DEFAULT NULL,
  `PID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`CID`),
  INDEX `FK_CARTDETAILS_PID_idx` (`PID` ASC),
  CONSTRAINT `FK_CARTDETAILS_PID`
    FOREIGN KEY (`PID`)
    REFERENCES `shopping`.`PRODUCT` (`PID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `shopping`.`ORDERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`ORDERS` (
  `ORDERID` INT(11) NOT NULL,
  `CREF` INT(11) NULL DEFAULT NULL,
  `ORDERDATE` DATE NULL DEFAULT NULL,
  `TOTAL` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`ORDERID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
