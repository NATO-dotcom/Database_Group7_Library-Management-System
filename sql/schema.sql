-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LIBRARY_DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LIBRARY_DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LIBRARY_DB` DEFAULT CHARACTER SET utf8 ;
USE `LIBRARY_DB` ;

-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Publisher` (
  `publisher_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `website` VARCHAR(100) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`publisher_id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(20) NULL,
  `title` VARCHAR(255) NULL,
  `edition` VARCHAR(50) NULL,
  `publication_year` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `language` VARCHAR(50) NULL,
  `page_count` INT NULL,
  `created_at` VARCHAR(45) NULL,
  `Publisher_publisher_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_Book_Publisher1_idx` (`Publisher_publisher_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_Publisher1`
    FOREIGN KEY (`Publisher_publisher_id`)
    REFERENCES `LIBRARY_DB`.`Publisher` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `floor` VARCHAR(20) NULL,
  `section` VARCHAR(50) NULL,
  PRIMARY KEY (`location_id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Book_copy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Book_copy` (
  `copy_id` INT NOT NULL AUTO_INCREMENT,
  `barcode` VARCHAR(50) NULL,
  `acquisition_date` DATE NULL,
  `price` DECIMAL(10,2) NULL,
  `copy_condition` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `shelf_location` VARCHAR(50) NULL,
  `notes` VARCHAR(45) NULL,
  `Book_book_id` INT NOT NULL,
  `Location_location_id` INT NOT NULL,
  PRIMARY KEY (`copy_id`),
  UNIQUE INDEX `barcode_UNIQUE` (`barcode` ASC) VISIBLE,
  INDEX `fk_Book_copy_Book_idx` (`Book_book_id` ASC) VISIBLE,
  INDEX `fk_Book_copy_Location1_idx` (`Location_location_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_copy_Book`
    FOREIGN KEY (`Book_book_id`)
    REFERENCES `LIBRARY_DB`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_copy_Location1`
    FOREIGN KEY (`Location_location_id`)
    REFERENCES `LIBRARY_DB`.`Location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Author` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `birth_date` DATE NULL,
  `nationality` VARCHAR(100) NULL,
  `biography` VARCHAR(45) NULL,
  PRIMARY KEY (`author_id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(45) NULL,
  `category` VARCHAR(255) NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Patron`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Patron` (
  `patron _id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  `address` VARCHAR(45) NULL,
  `max_books_allowed` INT NULL,
  PRIMARY KEY (`patron _id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Librarian`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Librarian` (
  `librarian_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `phone` VARCHAR(20) NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`librarian_id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Loan` (
  `loan_id` INT NOT NULL AUTO_INCREMENT,
  `loan_date` DATE NULL,
  `due_date` DATE NULL,
  `return_date` DATE NULL,
  `Book_copy_copy_id` INT NOT NULL,
  `Librarian_librarian_id` INT NOT NULL,
  `Patron_patron _id` INT NOT NULL,
  PRIMARY KEY (`loan_id`),
  INDEX `fk_Loan_Book_copy1_idx` (`Book_copy_copy_id` ASC) VISIBLE,
  INDEX `fk_Loan_Librarian1_idx` (`Librarian_librarian_id` ASC) VISIBLE,
  INDEX `fk_Loan_Patron1_idx` (`Patron_patron _id` ASC) VISIBLE,
  CONSTRAINT `fk_Loan_Book_copy1`
    FOREIGN KEY (`Book_copy_copy_id`)
    REFERENCES `LIBRARY_DB`.`Book_copy` (`copy_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loan_Librarian1`
    FOREIGN KEY (`Librarian_librarian_id`)
    REFERENCES `LIBRARY_DB`.`Librarian` (`librarian_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Loan_Patron1`
    FOREIGN KEY (`Patron_patron _id`)
    REFERENCES `LIBRARY_DB`.`Patron` (`patron _id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Reservation` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `reservation_date` DATE NULL,
  `expiry_date` DATE NULL,
  `status` VARCHAR(45) NULL,
  `Patron_patron _id` INT NOT NULL,
  `Book_book_id` INT NOT NULL,
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_Reservation_Patron1_idx` (`Patron_patron _id` ASC) VISIBLE,
  INDEX `fk_Reservation_Book1_idx` (`Book_book_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reservation_Patron1`
    FOREIGN KEY (`Patron_patron _id`)
    REFERENCES `LIBRARY_DB`.`Patron` (`patron _id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_Book1`
    FOREIGN KEY (`Book_book_id`)
    REFERENCES `LIBRARY_DB`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Fine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Fine` (
  `fine_id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
  `amount` INT NULL,
  `Loan_loan_id` INT NOT NULL,
  PRIMARY KEY (`fine_id`),
  INDEX `fk_Fine_Loan1_idx` (`Loan_loan_id` ASC) VISIBLE,
  CONSTRAINT `fk_Fine_Loan1`
    FOREIGN KEY (`Loan_loan_id`)
    REFERENCES `LIBRARY_DB`.`Loan` (`loan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Supplier` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `contact_person` VARCHAR(100) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(100) NULL,
  `delivery_timeframe` VARCHAR(50) NULL,
  PRIMARY KEY (`supplier_id`));


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Acquisition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Acquisition` (
  `acquisition_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NULL,
  `order_number` VARCHAR(50) NULL,
  `quantity` INT NULL,
  `unit_price` DECIMAL(10,2) NULL,
  `total_amount` DECIMAL(12,2) NULL,
  `status` VARCHAR(45) NULL,
  `Supplier_supplier_id` INT NOT NULL,
  `Book_book_id` INT NOT NULL,
  PRIMARY KEY (`acquisition_id`),
  INDEX `fk_Acquisition_Supplier1_idx` (`Supplier_supplier_id` ASC) VISIBLE,
  INDEX `fk_Acquisition_Book1_idx` (`Book_book_id` ASC) VISIBLE,
  CONSTRAINT `fk_Acquisition_Supplier1`
    FOREIGN KEY (`Supplier_supplier_id`)
    REFERENCES `LIBRARY_DB`.`Supplier` (`supplier_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acquisition_Book1`
    FOREIGN KEY (`Book_book_id`)
    REFERENCES `LIBRARY_DB`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`BookAuthor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`BookAuthor` (
  `Book_book_id` INT NOT NULL,
  `Author_author_id` INT NOT NULL,
  INDEX `fk_BookAuthor_Book1_idx` (`Book_book_id` ASC) VISIBLE,
  INDEX `fk_BookAuthor_Author1_idx` (`Author_author_id` ASC) VISIBLE,
  CONSTRAINT `fk_BookAuthor_Book1`
    FOREIGN KEY (`Book_book_id`)
    REFERENCES `LIBRARY_DB`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookAuthor_Author1`
    FOREIGN KEY (`Author_author_id`)
    REFERENCES `LIBRARY_DB`.`Author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `LIBRARY_DB`.`Book_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LIBRARY_DB`.`Book_category` (
  `Book_book_id` INT NOT NULL,
  `category_category_id` INT NOT NULL,
  INDEX `fk_Book_category_Book1_idx` (`Book_book_id` ASC) VISIBLE,
  INDEX `fk_Book_category_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_Book_category_Book1`
    FOREIGN KEY (`Book_book_id`)
    REFERENCES `LIBRARY_DB`.`Book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Book_category_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `LIBRARY_DB`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
