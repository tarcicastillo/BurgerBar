# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.38)
# Database: BurgerBar
# Generation Time: 2014-10-13 23:29:37 +0000
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


# Dump of table Bun
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Bun`;

CREATE TABLE `Bun` (
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Bun` WRITE;
/*!40000 ALTER TABLE `Bun` DISABLE KEYS */;

INSERT INTO `Bun` (`Name`, `Price`)
VALUES
	('Texas Toast',0.75),
	('Wheat',0.5),
	('White',0.5);

/*!40000 ALTER TABLE `Bun` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Burger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Burger`;

CREATE TABLE `Burger` (
  `BurgerID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) unsigned NOT NULL,
  `Meat` varchar(30) DEFAULT '',
  `Cheese` varchar(30) DEFAULT '',
  `Bun` varchar(30) DEFAULT '',
  `Side` varchar(30) DEFAULT '',
  `Quantity` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `Price` double unsigned NOT NULL,
  PRIMARY KEY (`BurgerID`),
  KEY `Meat FK` (`Meat`),
  KEY `Cheese FK` (`Cheese`),
  KEY `Bun FK` (`Bun`),
  KEY `Side FK` (`Side`),
  KEY `Order  FK` (`OrderID`),
  CONSTRAINT `Bun FK` FOREIGN KEY (`Bun`) REFERENCES `Bun` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Cheese FK` FOREIGN KEY (`Cheese`) REFERENCES `Cheese` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Meat FK` FOREIGN KEY (`Meat`) REFERENCES `Meat` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Order  FK` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Side FK` FOREIGN KEY (`Side`) REFERENCES `Side` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Burger` WRITE;
/*!40000 ALTER TABLE `Burger` DISABLE KEYS */;

INSERT INTO `Burger` (`BurgerID`, `OrderID`, `Meat`, `Cheese`, `Bun`, `Side`, `Quantity`, `Price`)
VALUES
	(9,12,'Turkey','None','White','None',3,0),
	(10,12,'1/2 lb. Beef','Cheddar','Wheat','Tater Tots',1,0);

/*!40000 ALTER TABLE `Burger` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Cheese
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cheese`;

CREATE TABLE `Cheese` (
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Cheese` WRITE;
/*!40000 ALTER TABLE `Cheese` DISABLE KEYS */;

INSERT INTO `Cheese` (`Name`, `Price`)
VALUES
	('American',0.35),
	('Cheddar',0.35),
	('None',0),
	('Swiss',0.35);

/*!40000 ALTER TABLE `Cheese` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Meat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Meat`;

CREATE TABLE `Meat` (
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Meat` WRITE;
/*!40000 ALTER TABLE `Meat` DISABLE KEYS */;

INSERT INTO `Meat` (`Name`, `Price`)
VALUES
	('1/2 lb. Beef',2.25),
	('1/3 lb. Beef',2),
	('2/3 lb. Beef',2.5),
	('Turkey',2),
	('Veggie',2);

/*!40000 ALTER TABLE `Meat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order`;

CREATE TABLE `Order` (
  `OrderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) unsigned DEFAULT NULL,
  `Price` double unsigned NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerFK` (`CustomerID`),
  CONSTRAINT `CustomerFK` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;

INSERT INTO `Order` (`OrderID`, `CustomerID`, `Price`)
VALUES
	(12,2,0);

/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `CustomerID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) DEFAULT NULL,
  `LastName` varchar(30) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `Password` char(64) DEFAULT NULL,
  `CreditCardProvider` varchar(20) DEFAULT NULL,
  `CreditCardNumber` varchar(16) DEFAULT NULL,
  `LastOrder` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `Order FK` (`LastOrder`),
  CONSTRAINT `Order FK` FOREIGN KEY (`LastOrder`) REFERENCES `Order` (`OrderID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;

INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `Password`, `CreditCardProvider`, `CreditCardNumber`, `LastOrder`)
VALUES
	(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Sauce
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Sauce`;

CREATE TABLE `Sauce` (
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Sauce` WRITE;
/*!40000 ALTER TABLE `Sauce` DISABLE KEYS */;

INSERT INTO `Sauce` (`Name`, `Price`)
VALUES
	('BBQ',0),
	('Ketchup',0),
	('Mayonnaise',0),
	('Mustard',0),
	('None',0);

/*!40000 ALTER TABLE `Sauce` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table SauceDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SauceDetail`;

CREATE TABLE `SauceDetail` (
  `BurgerID` int(11) unsigned NOT NULL,
  `Sauce` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`BurgerID`,`Sauce`),
  KEY `Sauce FK` (`Sauce`),
  CONSTRAINT `Sauce FK` FOREIGN KEY (`Sauce`) REFERENCES `Sauce` (`name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `BurgerFK` FOREIGN KEY (`BurgerID`) REFERENCES `Burger` (`BurgerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `SauceDetail` WRITE;
/*!40000 ALTER TABLE `SauceDetail` DISABLE KEYS */;

INSERT INTO `SauceDetail` (`BurgerID`, `Sauce`)
VALUES
	(10,'Ketchup'),
	(10,'Mayonnaise'),
	(9,'None');

/*!40000 ALTER TABLE `SauceDetail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Side
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Side`;

CREATE TABLE `Side` (
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Side` WRITE;
/*!40000 ALTER TABLE `Side` DISABLE KEYS */;

INSERT INTO `Side` (`Name`, `Price`)
VALUES
	('French Fries',1),
	('None',0),
	('Onion Rings',1),
	('Tater Tots',1);

/*!40000 ALTER TABLE `Side` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Topping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Topping`;

CREATE TABLE `Topping` (
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Topping` WRITE;
/*!40000 ALTER TABLE `Topping` DISABLE KEYS */;

INSERT INTO `Topping` (`Name`, `Price`)
VALUES
	('Bacon',1),
	('Jalapenos',0),
	('Lettuce',0),
	('Mushrooms',0),
	('None',0),
	('Onions',0),
	('Pickles',0),
	('Red Onion',0),
	('Tomatoes',0);

/*!40000 ALTER TABLE `Topping` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ToppingDetail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ToppingDetail`;

CREATE TABLE `ToppingDetail` (
  `BurgerID` int(11) unsigned NOT NULL,
  `Topping` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`BurgerID`,`Topping`),
  KEY `Topping FK` (`Topping`),
  CONSTRAINT `Topping FK` FOREIGN KEY (`Topping`) REFERENCES `Topping` (`Name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Burger FK` FOREIGN KEY (`BurgerID`) REFERENCES `Burger` (`BurgerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
