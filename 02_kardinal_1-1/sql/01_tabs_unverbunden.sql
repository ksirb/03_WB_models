

CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

DESCRIBE mydb.cats;

CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

DESCRIBE mydb.servants;

