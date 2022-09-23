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
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Campus` VARCHAR(45) NOT NULL,
  `idProfessor_coordenador` INT NOT NULL,
  PRIMARY KEY (`idDepartamento`, `idProfessor_coordenador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pessoa` (
  `idPessoa` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idPessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  `Registro` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessor`, `Departamento_idDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL,
  `Pessoa_idPessoa` INT NOT NULL,
  `Matricula` VARCHAR(45) NULL,
  PRIMARY KEY (`idAluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disiplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disiplina` (
  `idDisiplina` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idDisiplina`, `Professor_idProfessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  PRIMARY KEY (`idCurso`, `Departamento_idDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matriculado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matriculado` (
  `Aluno_idAluno` INT NOT NULL,
  `Disiplina_idDisiplina` INT NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`, `Disiplina_idDisiplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disiplina & Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disiplina & Curso` (
  `Disiplina_idDisiplina` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`Disiplina_idDisiplina`, `Curso_idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pré Requisitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pré Requisitos` (
  `idPré Requisitos` INT NOT NULL,
  PRIMARY KEY (`idPré Requisitos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pré Requisitos das Disciplinas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pré Requisitos das Disciplinas` (
  `Disiplina_idDisiplina` INT NOT NULL,
  `Pré Requisitos_idPré Requisitos` INT NOT NULL,
  PRIMARY KEY (`Disiplina_idDisiplina`, `Pré Requisitos_idPré Requisitos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Periodo` (
  `idPeriodo` INT NOT NULL,
  `Ano` VARCHAR(45) NULL,
  `Semestre` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Oferta de Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Oferta de Disciplina` (
  `Disiplina_idDisiplina` INT NOT NULL,
  `Disiplina_Professor_idProfessor` INT NOT NULL,
  `Periodo_idPeriodo` INT NOT NULL,
  PRIMARY KEY (`Disiplina_idDisiplina`, `Disiplina_Professor_idProfessor`, `Periodo_idPeriodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno Matriculado Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno Matriculado Curso` (
  `Aluno_idAluno` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`Aluno_idAluno`, `Curso_idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Extensão`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Extensão` (
  `idExtensão` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Area` VARCHAR(45) NOT NULL,
  `Instituição` VARCHAR(45) NOT NULL,
  `Extensãocol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idExtensão`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Extensão_has_Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Extensão_has_Aluno` (
  `Extensão_idExtensão` INT NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`Extensão_idExtensão`, `Aluno_idAluno`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
