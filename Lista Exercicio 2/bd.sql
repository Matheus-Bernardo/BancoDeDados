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
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `preco` FLOAT NULL,
  `quantidade_disponivel` INT NULL,
  PRIMARY KEY (`idProduto`))



-- -----------------------------------------------------
-- Table `mydb`.`Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Loja` (
  `idLoja` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idLoja`))



-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf`))


-- -----------------------------------------------------
-- Table `mydb`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra` (
  `valorTotal` FLOAT NULL,
  `tipo_pagamento` VARCHAR(45) NULL,
  `cod_rastreamento` INT NOT NULL,
  PRIMARY KEY (`cod_rastreamento`))


-- -----------------------------------------------------
-- Table `mydb`.`Correio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Correio` (
  `idCorreio` INT NOT NULL,
  `prazo_entrega` INT NOT NULL,
  `valor_frete` FLOAT NOT NULL,
  `Compra_cod_rastreamento` INT NOT NULL,
  PRIMARY KEY (`idCorreio`),
  
  CONSTRAINT `fk_Correio_Compra1`
    FOREIGN KEY (`Compra_cod_rastreamento`)
    REFERENCES `mydb`.`Compra` (`cod_rastreamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`Avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao` (
  `nota` INT NOT NULL,
  `descricao_nota` VARCHAR(60) NULL,
  PRIMARY KEY (`nota`))


-- -----------------------------------------------------
-- Table `mydb`.`Produto_da_Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_da_Loja` (
  `Produto_idProduto` INT NOT NULL,
  `Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Loja_idLoja`),
  CONSTRAINT `fk_Produto_has_Loja_Produto`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Loja_Loja1`
    FOREIGN KEY (`Loja_idLoja`)
    REFERENCES `mydb`.`Loja` (`idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`Cliente_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente_Compra` (
  `Compra_cod_rastreamento` INT NOT NULL,
  `Cliente_cpf` INT NOT NULL,
  PRIMARY KEY (`Compra_cod_rastreamento`, `Cliente_cpf`),
  CONSTRAINT `fk_Compra_has_Cliente_Compra1`
    FOREIGN KEY (`Compra_cod_rastreamento`)
    REFERENCES `mydb`.`Compra` (`cod_rastreamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`Avaliacao_Compra_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao_Compra_Cliente` (
  `Avaliacao_nota` INT NOT NULL,
  `Compra_Cliente_Compra_cod_rastreamento` INT NOT NULL,
  `Compra_Cliente_Cliente_cpf` INT NOT NULL,
  PRIMARY KEY (`Avaliacao_nota`, `Compra_Cliente_Compra_cod_rastreamento`, `Compra_Cliente_Cliente_cpf`),
  CONSTRAINT `fk_Avaliacao_has_Compra_has_Cliente_Avaliacao1`
    FOREIGN KEY (`Avaliacao_nota`)
    REFERENCES `mydb`.`Avaliacao` (`nota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Avaliacao_has_Compra_has_Cliente_Compra_has_Cliente1`
    FOREIGN KEY (`Compra_Cliente_Compra_cod_rastreamento` , `Compra_Cliente_Cliente_cpf`)
    REFERENCES `mydb`.`Cliente_Compra` (`Compra_cod_rastreamento` , `Cliente_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table `mydb`.`Compra_Cliente_Produto_da_Loja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compra_Cliente_Produto_da_Loja` (
  `Compra_Cliente_Compra_cod_rastreamento` INT NOT NULL,
  `Compra_Cliente_Cliente_cpf` INT NOT NULL,
  `Produto_da_Loja_Produto_idProduto` INT NOT NULL,
  `Produto_da_Loja_Loja_idLoja` INT NOT NULL,
  PRIMARY KEY (`Compra_Cliente_Compra_cod_rastreamento`, `Compra_Cliente_Cliente_cpf`, `Produto_da_Loja_Produto_idProduto`, `Produto_da_Loja_Loja_idLoja`),
  CONSTRAINT `fk_Compra_has_Cliente_has_Produto_da_Loja_Compra_has_Cliente1`
    FOREIGN KEY (`Compra_Cliente_Compra_cod_rastreamento` , `Compra_Cliente_Cliente_cpf`)
    REFERENCES `mydb`.`Cliente_Compra` (`Compra_cod_rastreamento` , `Cliente_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compra_has_Cliente_has_Produto_da_Loja_Produto_da_Loja1`
    FOREIGN KEY (`Produto_da_Loja_Produto_idProduto` , `Produto_da_Loja_Loja_idLoja`)
    REFERENCES `mydb`.`Produto_da_Loja` (`Produto_idProduto` , `Loja_idLoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)




