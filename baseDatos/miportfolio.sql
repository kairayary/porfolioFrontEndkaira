-- MySQL Script generated by MySQL Workbench
-- Fri Oct 28 15:35:28 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema miPortfolio
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `miPortfolio` ;

-- -----------------------------------------------------
-- Schema miPortfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miPortfolio` DEFAULT CHARACTER SET utf8 ;
USE `miPortfolio` ;

-- -----------------------------------------------------
-- Table `miPortfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `domicilio` VARCHAR(45) NULL,
  `profesión` VARCHAR(45) NULL,
  `sobre_mi` VARCHAR(200) NULL,
  `correo_personal` VARCHAR(45) NULL,
  `url_foto` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `miPortfolio`.`educación`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`educación` (
  `id` INT NOT NULL,
  `institución` VARCHAR(150) NULL,
  `titulo` VARCHAR(300) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_final` DATE NULL,
  `descripción` VARCHAR(300) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_educación_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_educación_persona1_idx` ON `miPortfolio`.`educación` (`persona_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `miPortfolio`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`experiencia_laboral` (
  `id` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `descripción_tareas` VARCHAR(200) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_final` DATE NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_experiencia_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_experiencia_laboral_persona1_idx` ON `miPortfolio`.`experiencia_laboral` (`persona_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `miPortfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`proyectos` (
  `id` INT NOT NULL,
  `nombre_proyecto` VARCHAR(45) NULL,
  `descripción` VARCHAR(200) NULL,
  `descripción_hards` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_proyectos_persona1_idx` ON `miPortfolio`.`proyectos` (`persona_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `miPortfolio`.`softs_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`softs_skills` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(150) NULL,
  `ponderación` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_softs_skills_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_softs_skills_persona1_idx` ON `miPortfolio`.`softs_skills` (`persona_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `miPortfolio`.`hards_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`hards_skills` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `ponderación` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_hards_skills_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_hards_skills_persona1_idx` ON `miPortfolio`.`hards_skills` (`persona_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `miPortfolio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `miPortfolio`.`usuario` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `clave` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  CONSTRAINT `fk_usuario_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `miPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_usuario_persona_idx` ON `miPortfolio`.`usuario` (`persona_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
