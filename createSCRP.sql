-- MySQL Script generated by MySQL Workbench
-- Tue Apr 14 14:27:55 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff` (
  `staffId` INT NOT NULL,
  `position` VARCHAR(45) NULL,
  `admin` TINYINT NULL,
  PRIMARY KEY (`staffId`),
  UNIQUE INDEX `personId_UNIQUE` (`staffId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Deliveries` (
  `driver` INT NOT NULL,
  `location` INT NOT NULL,
  PRIMARY KEY (`driver`, `location`),
  UNIQUE INDEX `driverId_UNIQUE` (`driver` ASC) VISIBLE,
  UNIQUE INDEX `locationId_UNIQUE` (`location` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Drivers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Drivers` (
  `driverId` INT NOT NULL,
  `licenseNumber` VARCHAR(45) NULL,
  `dateHired` VARCHAR(45) NULL,
  `rating` DOUBLE NULL,
  `vehicleMake` VARCHAR(45) NULL,
  `vehicleModel` VARCHAR(45) NULL,
  PRIMARY KEY (`driverId`),
  UNIQUE INDEX `driverId_UNIQUE` (`driverId` ASC) VISIBLE,
    FOREIGN KEY (`driverId`)
    REFERENCES `mydb`.`Deliveries` (`driverId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Student` (
  `studentId` INT NOT NULL,
  `gradYear` INT NULL,
  `major` VARCHAR(45) NULL,
  `majorType` VARCHAR(45) NULL,
  `driverId` VARCHAR(45) NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE INDEX `personId_UNIQUE` (`studentId` ASC) VISIBLE,
  UNIQUE INDEX `driverId_UNIQUE` (`driverId` ASC) VISIBLE,
    FOREIGN KEY (`driverId`)
    REFERENCES `mydb`.`Drivers` (`driverId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculty` (
  `facultyId` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `highest_degree` VARCHAR(45) NULL,
  `degreeCollege` VARCHAR(45) NULL,
  PRIMARY KEY (`facultyId`),
  UNIQUE INDEX `personID_UNIQUE` (`facultyId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Person` (
  `personId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `cell` VARCHAR(10) NULL,
  PRIMARY KEY (`personId`),
  UNIQUE INDEX `personID_UNIQUE` (`personId` ASC) VISIBLE,
    FOREIGN KEY (`staffId`)
    REFERENCES `mydb`.`Staff` (`staffId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`studentId`)
    REFERENCES `mydb`.`Student` (`studentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`facultyId`)
    REFERENCES `mydb`.`Faculty` (`facultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Locations` (
  `locationId` INT NOT NULL,
  `locationName` VARCHAR(45) NULL,
  `locationAddress` VARCHAR(45) NULL,
  `food_drop_off_location` VARCHAR(45) NULL,
  PRIMARY KEY (`locationId`),
  UNIQUE INDEX `LocationId_UNIQUE` (`locationId` ASC) VISIBLE,
    FOREIGN KEY (`locationId`)
    REFERENCES `mydb`.`Deliveries` (`locationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurants` (
  `restaurantId` INT NOT NULL,
  `adress` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `rating` DOUBLE NULL,
  `foodType` VARCHAR(45) NULL,
  `link` VARCHAR(45) NULL,
  `schedule` VARCHAR(45) NULL,
  PRIMARY KEY (`restaurantId`),
  UNIQUE INDEX `restaurantId_UNIQUE` (`restaurantId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `itemId` INT NOT NULL,
  `itemName` VARCHAR(45) NULL,
  `itemCategory` VARCHAR(45) NULL,
  `itemDescription` VARCHAR(45) NULL,
  `itemPrice` DOUBLE NULL,
  `restaurantId` INT NULL,
  PRIMARY KEY (`itemId`),
  UNIQUE INDEX `itemId_UNIQUE` (`itemId` ASC) VISIBLE,
    FOREIGN KEY (`restaurantId`)
    REFERENCES `mydb`.`Restaurants` (`restaurantId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderHistory` (
  `orderId` INT NOT NULL,
  `price` DOUBLE NULL,
  `driverId` INT NULL,
  `restaurantId` INT NULL,
  `orderDetails` VARCHAR(45) NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE INDEX `orderId_UNIQUE` (`orderId` ASC) VISIBLE,
    FOREIGN KEY (`driverId`)
    REFERENCES `mydb`.`Drivers` (`driverId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`restaurantId`)
    REFERENCES `mydb`.`Restaurants` (`restaurantId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
