# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.39)
# Database: BurgerBar
# Generation Time: 2014-10-12 22:01:42 +0000
# ************************************************************

# Create the database
DROP DATABASE IF EXISTS BurgerBar;
CREATE DATABASE BurgerBar;
USE BurgerBar;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Buns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Buns`;

CREATE TABLE `Buns` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `price` double DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Buns` WRITE;
/*!40000 ALTER TABLE `Buns` DISABLE KEYS */;

INSERT INTO `Buns` (`name`, `price`)
VALUES
	('Texas Toast',0.75),
	('Wheat',0.5),
	('White',0.5);

/*!40000 ALTER TABLE `Buns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Burger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Burger`;

CREATE TABLE `Burger` (
  `BurgerID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Meat` varchar(30) DEFAULT NULL,
  `Cheese` varchar(30) DEFAULT NULL,
  `Bun` varchar(30) DEFAULT NULL,
  `Side` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BurgerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Burger` WRITE;
/*!40000 ALTER TABLE `Burger` DISABLE KEYS */;

INSERT INTO `Burger` (`BurgerID`, `Meat`, `Cheese`, `Bun`, `Side`)
VALUES
	(1,'1/3 lb. Beef','American','White','French Fries'),
	(4,'1/2 lb. Beef','American','White','Onion Rings'),
	(5,'1/3 lb. Beef','Swiss','Texas Toast','Onion Rings'),
	(6,'1/2 lb. Beef','Cheddar','Wheat','Onion Rings'),
	(7,'Turkey','Cheddar','Texas','Onion Rings'),
	(8,'1/2 lb. Beef','American','White','Onion Rings');

/*!40000 ALTER TABLE `Burger` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Meats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Meats`;

CREATE TABLE `Meats` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `price` double DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Meats` WRITE;
/*!40000 ALTER TABLE `Meats` DISABLE KEYS */;

INSERT INTO `Meats` (`name`, `price`)
VALUES
	('1/2 lb. Beef',2.25),
	('1/3 lb. Beef',2),
	('2/3 lb. Beef',2.5),
	('Turkey',2),
	('Veggie',2);

/*!40000 ALTER TABLE `Meats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Cheeses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cheeses`;

CREATE TABLE `Cheeses` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `price` double DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Cheeses` WRITE;
/*!40000 ALTER TABLE `Cheeses` DISABLE KEYS */;

INSERT INTO `Cheeses` (`name`, `price`)
VALUES
	('american',0.35),
	('cheddar',0.35),
	('swiss',0.35);

/*!40000 ALTER TABLE `Cheeses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderForm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderForm`;

CREATE TABLE `OrderForm` (
  `OrderId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `OrderForm` WRITE;
/*!40000 ALTER TABLE `OrderForm` DISABLE KEYS */;

INSERT INTO `OrderForm` (`OrderId`, `UserID`, `Price`)
VALUES
	(1,666,120),
	(2,923,NULL),
	(3,243,NULL);

/*!40000 ALTER TABLE `OrderForm` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderDetail`;

CREATE TABLE `OrderDetail` (
  `OrderID` int(11) unsigned NOT NULL,
  `BurgerID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Cost` float unsigned NOT NULL,
  KEY `Combination` (`BurgerID`,`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;

INSERT INTO `OrderDetail` (`OrderID`, `BurgerID`, `Quantity`, `Cost`)
VALUES
	(1,1,3,20),
	(1,2,3,20),
	(2,6,1,20);

/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table RegisteredUser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RegisteredUser`;

CREATE TABLE `RegisteredUser` (
  `email` varchar(11) NOT NULL DEFAULT '',
  `password` int(11) DEFAULT NULL,
  `loggedIn` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Sauces
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sauces`;

CREATE TABLE `Sauces` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `price` double DEFAULT NULL,
  `typeID` int(1) DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Sauces` WRITE;
/*!40000 ALTER TABLE `Sauces` DISABLE KEYS */;

INSERT INTO `Sauces` (`name`, `price`, `typeID`)
VALUES
	('BBQ',0,1),
	('Ketchup',0,1),
	('Mayonnaise',0,1),
	('Mustard',0,1),
	('None',0,1);

/*!40000 ALTER TABLE `Sauces` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SaucesDetails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SaucesDetails`;

CREATE TABLE `SaucesDetails` (
  `BurgerID` int(11) unsigned NOT NULL,
  `SauceName` varchar(30) NOT NULL DEFAULT '',
  KEY `maybe` (`BurgerID`,`SauceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `SaucesDetails` WRITE;
/*!40000 ALTER TABLE `SaucesDetails` DISABLE KEYS */;

INSERT INTO `SaucesDetails` (`BurgerID`, `SauceName`)
VALUES
	(1,'Ketchup'),
	(1,'Mustard'),
	(4,'BBQ'),
	(4,'Ketchup'),
	(4,'Mayonnaise');

/*!40000 ALTER TABLE `SaucesDetails` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Sides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sides`;

CREATE TABLE `Sides` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `price` double DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Sides` WRITE;
/*!40000 ALTER TABLE `Sides` DISABLE KEYS */;

INSERT INTO `Sides` (`name`, `price`)
VALUES
	('French Fries',1),
	('Onion Rings',1),
	('Tater Tots',1);

/*!40000 ALTER TABLE `Sides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ToppingDetails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ToppingDetails`;

CREATE TABLE `ToppingDetails` (
  `BurgerID` int(11) unsigned NOT NULL,
  `ToppingName` varchar(30) NOT NULL DEFAULT '',
  KEY `maybe` (`BurgerID`,`ToppingName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ToppingDetails` WRITE;
/*!40000 ALTER TABLE `ToppingDetails` DISABLE KEYS */;

INSERT INTO `ToppingDetails` (`BurgerID`, `ToppingName`)
VALUES
	(1,'Bacon'),
	(1,'Lettuce'),
	(4,'Lettuce'),
	(4,'Mushrooms'),
	(4,'Tomatoes');

/*!40000 ALTER TABLE `ToppingDetails` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Toppings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Toppings`;

CREATE TABLE `Toppings` (
  `name` varchar(30) NOT NULL DEFAULT '',
  `price` double DEFAULT NULL,
  `typeID` int(11) DEFAULT '2',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Toppings` WRITE;
/*!40000 ALTER TABLE `Toppings` DISABLE KEYS */;

INSERT INTO `Toppings` (`name`, `price`, `typeID`)
VALUES
	('Bacon',1,2),
	('Jalapenos',0,2),
	('Lettuce',0,2),
	('Mushrooms',0,2),
	('None',0,2),
	('Onions',0,2),
	('Pickles',0,2),
	('Tomatoes',0,2);

/*!40000 ALTER TABLE `Toppings` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
