-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ECommStoreDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ECommStoreDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ECommStoreDB` DEFAULT CHARACTER SET utf8 ;
USE `ECommStoreDB` ;

-- -----------------------------------------------------
-- Table `ECommStoreDB`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`address` (
  `address_id` BIGINT NOT NULL,
  `customer_id` INT NOT NULL,
  `house_number` VARCHAR(55) NOT NULL,
  `street` VARCHAR(55) NOT NULL,
  `city` TEXT NOT NULL,
  `state` TEXT NOT NULL,
  `pincode` BIGINT NOT NULL,
  `contact` INT NOT NULL,
  PRIMARY KEY (`address_id`));


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`customer_favourate_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`customer_favourate_products` (
  `customer_id` INT NOT NULL,
  `products` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`customer_id`));


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`customers` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(55) NOT NULL,
  `last_name` VARCHAR(55) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `address_id` BIGINT NULL,
  `customer_favourate_products_customer_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `address_address_id_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `address_address_id`
    FOREIGN KEY (`address_id`)
    REFERENCES `ECommStoreDB`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_customer_favourate_products1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ECommStoreDB`.`customer_favourate_products` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`employees` (
  `employee_id` INT NOT NULL,
  `first_name` VARCHAR(55) NOT NULL,
  `last_name` VARCHAR(55) NOT NULL,
  `position` VARCHAR(55) NOT NULL,
  `hire_date` DATE NOT NULL,
  PRIMARY KEY (`employee_id`));


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`category` (
  `category_id` BIGINT NOT NULL,
  `product_id` INT NOT NULL,
  `category` VARCHAR(55) NOT NULL,
  `parent_id` BIGINT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `category_parent_id` (`category_id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`brand` (
  `brand_id` INT NOT NULL,
  `brand_name` VARCHAR(55) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`brand_id`));


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(55) NOT NULL,
  `Tagline` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `cost` FLOAT NOT NULL,
  `launch_date` DATE NOT NULL,
  `brand_id` INT NOT NULL,
  `category_id` BIGINT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `category_category_id_idx` (`category_id` ASC) VISIBLE,
  INDEX `brand_brand_id_idx` (`brand_id` ASC) VISIBLE,
  CONSTRAINT `category_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `ECommStoreDB`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `brand_brand_id`
    FOREIGN KEY (`brand_id`)
    REFERENCES `ECommStoreDB`.`brand` (`brand_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`customer_purchases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`customer_purchases` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `amount` DECIMAL(10) NOT NULL,
  `customer_purchase_id` BIGINT NULL,
  `purchase_at` TIMESTAMP NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `employees_employee_id_idx` (`employee_id` ASC) VISIBLE,
  INDEX `products_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customers_customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ECommStoreDB`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employees_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `ECommStoreDB`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `products_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `ECommStoreDB`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `ECommStoreDB`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ECommStoreDB`.`reviews` (
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `rating` INT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `products_product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customers_customer_id0`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ECommStoreDB`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `products_product_id0`
    FOREIGN KEY (`product_id`)
    REFERENCES `ECommStoreDB`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE USER 'storedbdba' IDENTIFIED BY 'storedb';

GRANT ALL ON `ECommStoreDB`.* TO 'storedbdba';
GRANT SELECT ON TABLE `ECommStoreDB`.* TO 'storedbdba';
GRANT SELECT, INSERT, TRIGGER ON TABLE `ECommStoreDB`.* TO 'storedbdba';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `ECommStoreDB`.* TO 'storedbdba';
GRANT EXECUTE ON ROUTINE `ECommStoreDB`.* TO 'storedbdba';
CREATE USER 'Analyst' IDENTIFIED BY 'analyst';

GRANT SELECT ON TABLE `ECommStoreDB`.* TO 'Analyst';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
