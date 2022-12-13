-- Tabellen, verbunden

-- Mastertabelle (MT), unverändert
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

DESCRIBE mydb.cats;

-- Detailtabelle (DT): Verbindung zur MT über Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  `cats_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_servants_cats_idx` (`cats_ID` ASC),
  CONSTRAINT `fk_servants_cats`
    FOREIGN KEY (`cats_ID`)
    REFERENCES `mydb`.`cats` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DESCRIBE mydb.servants;