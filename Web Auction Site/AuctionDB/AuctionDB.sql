-- MySQL Script generated by MySQL Workbench
-- 08/02/16 21:30:58
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `UserId` VARCHAR(45) NOT NULL,
  `Trn` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `Address` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Latitude` FLOAT NULL,
  `Longitude` FLOAT NULL,
  `Sell_rating` FLOAT NULL,
  `Bid_rating` FLOAT NULL,
  `Password` VARCHAR(45) NULL,
  `Access_lvl` INT NULL,
  PRIMARY KEY (`UserId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Auction` (
  `AuctionId` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Image` VARCHAR(45) NULL,
  `Current_Bid` FLOAT NULL,
  `Starting_Bid` FLOAT NULL,
  `Buy_Price` FLOAT NULL,
  `Num_of_bids` INT NULL,
  `Latitude` FLOAT NULL,
  `Longitude` FLOAT NULL,
  `Location` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Start_time` DATETIME NULL,
  `Expiration_time` DATETIME NULL,
  `Description` LONGTEXT NULL,
  PRIMARY KEY (`AuctionId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Message` (
  `idMessages` INT NOT NULL,
  `User_UserId` VARCHAR(45) NOT NULL,
  `User_UserId1` VARCHAR(45) NOT NULL,
  `Is_read` TINYINT(1) NULL,
  `Time` DATETIME NULL,
  `Subject` TINYTEXT NULL,
  `Text` LONGTEXT NULL,
  PRIMARY KEY (`idMessages`, `User_UserId`, `User_UserId1`),
  INDEX `fk_Messages_Users_idx` (`User_UserId` ASC),
  INDEX `fk_Messages_Users1_idx` (`User_UserId1` ASC),
  CONSTRAINT `fk_Messages_Users`
    FOREIGN KEY (`User_UserId`)
    REFERENCES `mydb`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Messages_Users1`
    FOREIGN KEY (`User_UserId1`)
    REFERENCES `mydb`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `Name` VARCHAR(45) NOT NULL,
  `Parent` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auction_has_Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Auction_has_Category` (
  `Auctions_ItemId` INT NOT NULL,
  `Category_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Auctions_ItemId`, `Category_Name`),
  INDEX `fk_Auctions_has_Category_Category1_idx` (`Category_Name` ASC),
  INDEX `fk_Auctions_has_Category_Auctions1_idx` (`Auctions_ItemId` ASC),
  CONSTRAINT `fk_Auctions_has_Category_Auctions1`
    FOREIGN KEY (`Auctions_ItemId`)
    REFERENCES `mydb`.`Auction` (`AuctionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Auctions_has_Category_Category1`
    FOREIGN KEY (`Category_Name`)
    REFERENCES `mydb`.`Category` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_bid_Auction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_bid_Auction` (
  `User_UserId` VARCHAR(45) NOT NULL,
  `Auction_AuctionId` INT NOT NULL,
  `Time` DATETIME NULL,
  `Price` FLOAT NULL,
  PRIMARY KEY (`User_UserId`, `Auction_AuctionId`),
  INDEX `fk_User_has_Auction_Auction1_idx` (`Auction_AuctionId` ASC),
  INDEX `fk_User_has_Auction_User1_idx` (`User_UserId` ASC),
  CONSTRAINT `fk_User_has_Auction_User1`
    FOREIGN KEY (`User_UserId`)
    REFERENCES `mydb`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Auction_Auction1`
    FOREIGN KEY (`Auction_AuctionId`)
    REFERENCES `mydb`.`Auction` (`AuctionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_has_Auction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_has_Auction` (
  `User_UserId` VARCHAR(45) NOT NULL,
  `Auction_AuctionId` INT NOT NULL,
  PRIMARY KEY (`User_UserId`, `Auction_AuctionId`),
  INDEX `fk_User_has_Auction_Auction2_idx` (`Auction_AuctionId` ASC),
  INDEX `fk_User_has_Auction_User2_idx` (`User_UserId` ASC),
  CONSTRAINT `fk_User_has_Auction_User2`
    FOREIGN KEY (`User_UserId`)
    REFERENCES `mydb`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Auction_Auction2`
    FOREIGN KEY (`Auction_AuctionId`)
    REFERENCES `mydb`.`Auction` (`AuctionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
