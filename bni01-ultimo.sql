-- MySQL Script generated by MySQL Workbench
-- mié 08 nov 2017 17:23:17 CST
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NULL,
  `fecha_alta` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `verified` TINYINT NULL,
  `verification_token` VARCHAR(15) NULL,
  `admin` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`region` (
  `idregion` INT NOT NULL AUTO_INCREMENT,
  `nombre_region` VARCHAR(45) NULL,
  PRIMARY KEY (`idregion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`capitulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`capitulos` (
  `idcapitulos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `id_region` INT NULL,
  PRIMARY KEY (`idcapitulos`),
  INDEX `fk_capitulos_1_idx` (`id_region` ASC),
  CONSTRAINT `fk_capitulos_region`
    FOREIGN KEY (`id_region`)
    REFERENCES `mydb`.`region` (`idregion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`datos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `empresa` VARCHAR(45) NULL,
  `giro` VARCHAR(45) NULL,
  `giro_real` VARCHAR(45) NULL,
  `invito` INT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_alta` DATE NULL,
  `id_capitulo` INT NULL,
  `img_solicitud` VARCHAR(45) NULL,
  `logo` VARCHAR(45) NULL,
  `carta` VARCHAR(45) NULL,
  `cometarios` VARCHAR(545) NULL,
  `comprobante_pago` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `page_web` VARCHAR(45) NULL,
  `ventaja` VARCHAR(545) NULL,
  `id` VARCHAR(545) NULL,
  `ref_ideal` VARCHAR(445) NULL,
  `ref_semanal` VARCHAR(445) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_datos_capitulos_idx` (`id_capitulo` ASC),
  CONSTRAINT `fk_datos_capitulos`
    FOREIGN KEY (`id_capitulo`)
    REFERENCES `mydb`.`capitulos` (`idcapitulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`solicitudes` (
  `idsolicitudes` INT NOT NULL AUTO_INCREMENT,
  `folio` VARCHAR(45) NULL,
  `id_user` INT NULL,
  `id_datos` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`idsolicitudes`, `id_datos`),
  INDEX `fk_solicitudes_users_idx` (`id_user` ASC),
  INDEX `fk_solicitudes_datos_idx` (`id_datos` ASC),
  CONSTRAINT `fk_solicitudes_users`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitudes_datos`
    FOREIGN KEY (`id_datos`)
    REFERENCES `mydb`.`datos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`miembros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`miembros` (
  `idmiembros` INT NOT NULL AUTO_INCREMENT,
  `id_datos` INT NOT NULL,
  `ed` INT NULL,
  `dc` INT NULL,
  `pw` INT NULL,
  `user` VARCHAR(45) NULL,
  PRIMARY KEY (`idmiembros`, `id_datos`),
  INDEX `fk_miembros_datos_idx` (`id_datos` ASC),
  CONSTRAINT `fk_miembros_datos`
    FOREIGN KEY (`id_datos`)
    REFERENCES `mydb`.`datos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
