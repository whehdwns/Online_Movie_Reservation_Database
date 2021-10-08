-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema online_movie_reservation_model
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_movie_reservation_model
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_movie_reservation_model` DEFAULT CHARACTER SET utf8 ;
USE `online_movie_reservation_model` ;

-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`Screen_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`Screen_level` (
  `level_id` INT NOT NULL AUTO_INCREMENT,
  `watching_standard` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`level_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`Movie` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_name` VARCHAR(255) NOT NULL,
  `running_time` VARCHAR(10) NOT NULL,
  `director` VARCHAR(255) NOT NULL,
  `actor_name` VARCHAR(255) NOT NULL,
  `release_date` DATE NOT NULL,
  `IMDB_rating` DECIMAL(3,1) NOT NULL,
  `level_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `fk_Movie_Screen_level_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_Screen_level`
    FOREIGN KEY (`level_id`)
    REFERENCES `online_movie_reservation_model`.`Screen_level` (`level_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`genre` (
  `genre_id` INT NOT NULL AUTO_INCREMENT,
  `genre_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`showtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`showtime` (
  `show_id` INT NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`show_id`),
  INDEX `fk_showtime_Movie1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_showtime_Movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `online_movie_reservation_model`.`Movie` (`movie_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`theater`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`theater` (
  `theater_id` INT NOT NULL AUTO_INCREMENT,
  `theater_name` VARCHAR(255) NOT NULL,
  `theater_Street` VARCHAR(255) NOT NULL,
  `theater_City` VARCHAR(50) NOT NULL,
  `theater_State` VARCHAR(50) NOT NULL,
  `theater_Postal_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`theater_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`screen_area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`screen_area` (
  `screen_id` INT NOT NULL AUTO_INCREMENT,
  `screen_count` INT NOT NULL,
  `screen_name` VARCHAR(50) NOT NULL,
  `screen_size` INT NOT NULL,
  `remain_seats` INT NOT NULL,
  `theater_id` INT NOT NULL,
  `show_id` INT NOT NULL,
  PRIMARY KEY (`screen_id`),
  INDEX `fk_screen_area_cinema1_idx` (`theater_id` ASC) VISIBLE,
  INDEX `fk_screen_area_showtime1_idx` (`show_id` ASC) VISIBLE,
  CONSTRAINT `fk_screen_area_cinema1`
    FOREIGN KEY (`theater_id`)
    REFERENCES `online_movie_reservation_model`.`theater` (`theater_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_screen_area_showtime1`
    FOREIGN KEY (`show_id`)
    REFERENCES `online_movie_reservation_model`.`showtime` (`show_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(256) NOT NULL,
  `fname` VARCHAR(255) NOT NULL,
  `lname` VARCHAR(255) NOT NULL,
  `password` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`customer_movie_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`customer_movie_info` (
  `cmovie_id` INT NOT NULL AUTO_INCREMENT,
  `point` VARCHAR(10) NOT NULL,
  `member_grade` INT NOT NULL,
  `watch_count` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`cmovie_id`, `customer_id`),
  INDEX `fk_customer_movie_info_Customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_customer_movie_info_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `online_movie_reservation_model`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`personal_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`personal_information` (
  `peronsal_info_id` INT NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(255) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `Postal_code` VARCHAR(5) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Birth_date` DATE NOT NULL,
  `phone_number` VARCHAR(15) NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`peronsal_info_id`, `customer_id`),
  INDEX `fk_personal_information_Customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_personal_information_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `online_movie_reservation_model`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`payment_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`payment_detail` (
  `payment_detail_id` INT NOT NULL AUTO_INCREMENT,
  `Card_type` VARCHAR(255) NOT NULL,
  `Card_number` VARCHAR(16) NOT NULL,
  `Expire_date` VARCHAR(8) NOT NULL,
  `csv` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`payment_detail_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`payment` (
  `payment_id` VARCHAR(45) NOT NULL,
  `payment_date` DATE NOT NULL,
  `payment_time` TIME NOT NULL,
  `payment_detail_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_payment_detail1_idx` (`payment_detail_id` ASC) VISIBLE,
  INDEX `fk_payment_Customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_payment_detail1`
    FOREIGN KEY (`payment_detail_id`)
    REFERENCES `online_movie_reservation_model`.`payment_detail` (`payment_detail_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `online_movie_reservation_model`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`seat` (
  `seat_id` INT NOT NULL AUTO_INCREMENT,
  `seat_whether` CHAR(1) NOT NULL,
  `seat_type` VARCHAR(20) NOT NULL,
  `screen_id` INT NOT NULL,
  PRIMARY KEY (`seat_id`),
  INDEX `fk_seat_screen_area1_idx` (`screen_id` ASC) VISIBLE,
  CONSTRAINT `fk_seat_screen_area1`
    FOREIGN KEY (`screen_id`)
    REFERENCES `online_movie_reservation_model`.`screen_area` (`screen_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`ticket` (
  `ticket_number` INT NOT NULL AUTO_INCREMENT,
  `number_of_seat` INT NOT NULL,
  `ticket_price` DECIMAL(10,2) NOT NULL,
  `screen_id` INT NOT NULL,
  `seat_id` INT NOT NULL,
  `payment_id` VARCHAR(45) NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`ticket_number`),
  INDEX `fk_ticket_screen_area1_idx` (`screen_id` ASC) VISIBLE,
  INDEX `fk_ticket_seat1_idx` (`seat_id` ASC) VISIBLE,
  INDEX `fk_ticket_payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_ticket_Movie1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_screen_area1`
    FOREIGN KEY (`screen_id`)
    REFERENCES `online_movie_reservation_model`.`screen_area` (`screen_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_seat1`
    FOREIGN KEY (`seat_id`)
    REFERENCES `online_movie_reservation_model`.`seat` (`seat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `online_movie_reservation_model`.`payment` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ticket_Movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `online_movie_reservation_model`.`Movie` (`movie_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `online_movie_reservation_model`.`movie_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_movie_reservation_model`.`movie_genre` (
  `movie_genre_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`movie_genre_id`),
  INDEX `fk_movie_genre_Movie1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `fk_movie_genre_genre1_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_genre_Movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `online_movie_reservation_model`.`Movie` (`movie_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `online_movie_reservation_model`.`genre` (`genre_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
