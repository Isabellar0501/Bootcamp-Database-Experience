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
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `Contato` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Serviço` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Data da solicitação` DATE NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Liberado` TINYINT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Responsável`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Responsável` (
  `idResponsável` INT NOT NULL,
  `Nivel Helpdesk` INT NULL,
  `Nome` VARCHAR(45) NULL,
  `Departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`idResponsável`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `Status da OS` VARCHAR(45) NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idOrdem de Serviço`, `Pedido_idPedido`, `Pedido_Cliente_idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Analise de Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Analise de Pedido` (
  `Responsável_idResponsável` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`Responsável_idResponsável`, `Pedido_idPedido`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
