-- MySQL Workbench Forward Engineering
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `id_professor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `materia` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  PRIMARY KEY (`id_professor`))

-- -----------------------------------------------------
-- Table `mydb`.`Faculdade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculdade` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `Professor_id_professor` INT NOT NULL,
  PRIMARY KEY (`id`, `Professor_id_professor`),
  CONSTRAINT `fk_Faculdade_Professor1`
    FOREIGN KEY (`Professor_id_professor`)
    REFERENCES `mydb`.`Professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `matricula` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `peso` FLOAT NULL,
  `idade` INT NULL,
  `periodo` INT NULL,
  PRIMARY KEY (`matricula`))



-- -----------------------------------------------------
-- Table `mydb`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Curso` (
  `idCurso` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `Aluno_matricula` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`, `Aluno_matricula`),
  CONSTRAINT `fk_Curso_Aluno1`
    FOREIGN KEY (`Aluno_matricula`)
    REFERENCES `mydb`.`Aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`Diretor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diretor` (
  `id_diretor` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT NULL,
  `cpf` VARCHAR(20) NULL,
  `Faculdade_id` INT NOT NULL,
  PRIMARY KEY (`id_diretor`, `Faculdade_id`),
  CONSTRAINT `fk_Diretor_Faculdade`
    FOREIGN KEY (`Faculdade_id`)
    REFERENCES `mydb`.`Faculdade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Aula_com`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aula_com` (
  `Aluno_matricula` VARCHAR(45) NOT NULL,
  `Professor_id_professor` INT NOT NULL,
  `Professor_Faculdade_id` INT NOT NULL,
  PRIMARY KEY (`Aluno_matricula`, `Professor_id_professor`, `Professor_Faculdade_id`),
  CONSTRAINT `fk_Aluno_has_Professor_Aluno1`
    FOREIGN KEY (`Aluno_matricula`)
    REFERENCES `mydb`.`Aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aluno_has_Professor_Professor1`
    FOREIGN KEY (`Professor_id_professor`)
    REFERENCES `mydb`.`Professor` (`id_professor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

