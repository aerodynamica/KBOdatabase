-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- -----------------------------------------------------
-- Schema kbo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `kbo` ;

CREATE SCHEMA IF NOT EXISTS `kbo` DEFAULT CHARACTER SET utf8mb4 ;
USE `kbo` ;

-- -----------------------------------------------------
-- Table `kbo`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`activity` (
  `EntityNumber` VARCHAR(13) NOT NULL,
  `ActivityGroup` VARCHAR(6) NOT NULL,
  `NaceVersion` VARCHAR(4) NOT NULL,
  `NaceCode` VARCHAR(9) NOT NULL,
  `Classification` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`EntityNumber`, `NaceCode`, `NaceVersion`, `Classification`, `ActivityGroup`),
  INDEX `NaceCode_idx` (`NaceCode` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`address` (
  `EntityNumber` VARCHAR(13) NOT NULL,
  `TypeOfAddress` VARCHAR(4) NOT NULL,
  `CountryNL` VARCHAR(100) NULL DEFAULT NULL,
  `CountryFR` VARCHAR(100) NULL DEFAULT NULL,
  `Zipcode` VARCHAR(20) NULL DEFAULT NULL,
  `MunicipalityNL` VARCHAR(200) NULL DEFAULT NULL,
  `MunicipalityFR` VARCHAR(200) NULL DEFAULT NULL,
  `StreetNL` VARCHAR(200) NULL DEFAULT NULL,
  `StreetFR` VARCHAR(200) NULL DEFAULT NULL,
  `HouseNumber` VARCHAR(22) NULL DEFAULT NULL,
  `Box` VARCHAR(20) NULL DEFAULT NULL,
  `ExtraAddressInfo` VARCHAR(80) NULL DEFAULT NULL,
  `DateStrikingOff` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`EntityNumber`, `TypeOfAddress`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`code` (
  `Category` VARCHAR(20) NOT NULL,
  `Code` VARCHAR(7) NOT NULL,
  `Language` VARCHAR(2) NOT NULL,
  `Description` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`Code`, `Language`, `Category`),
  INDEX `Code_idx` (`Code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`contact` (
  `EntityNumber` VARCHAR(13) NOT NULL,
  `EntityContact` VARCHAR(3) NOT NULL,
  `ContactType` VARCHAR(5) NOT NULL,
  `Value` VARCHAR(254) NOT NULL,
  PRIMARY KEY (`EntityNumber`, `Value`, `EntityContact`, `ContactType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`denomination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`denomination` (
  `EntityNumber` VARCHAR(13) NOT NULL,
  `Language` VARCHAR(1) NOT NULL,
  `TypeOfDenomination` VARCHAR(3) NOT NULL,
  `Denomination` VARCHAR(320) NOT NULL,
  PRIMARY KEY (`EntityNumber`, `TypeOfDenomination`, `Language`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`enterprise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`enterprise` (
  `EnterpriseNumber` VARCHAR(12) NOT NULL,
  `EnterpriseStatus` VARCHAR(2) NOT NULL,
  `JuridicalSituation` VARCHAR(3) NOT NULL,
  `TypeOfEnterprise` VARCHAR(1) NOT NULL,
  `JuridicalForm` VARCHAR(3) NULL DEFAULT NULL,
  `StartDate` DATE NOT NULL,
  PRIMARY KEY (`EnterpriseNumber`),
  INDEX `JuridicalForm_idx` (`JuridicalForm` ASC),
  INDEX `StartDate_idx` (`StartDate` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`establishment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`establishment` (
  `EstablishmentNumber` VARCHAR(13) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EnterpriseNumber` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`EstablishmentNumber`),
  INDEX `StartDate_idx` (`StartDate` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `kbo`.`meta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kbo`.`meta` (
  `Variable` VARCHAR(30) NOT NULL,
  `Value` VARCHAR(45) NULL,
  PRIMARY KEY (`Variable`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
