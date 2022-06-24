/*
 Navicat Premium Data Transfer

 Source Server         : PBD
 Source Server Type    : MariaDB
 Source Server Version : 100703
 Source Host           : localhost:3306
 Source Schema         : ProjektV2

 Target Server Type    : MariaDB
 Target Server Version : 100703
 File Encoding         : 65001

 Date: 22/06/2022 19:28:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Category
-- ----------------------------
DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `Category_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Category_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Category
-- ----------------------------
BEGIN;
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (1, 'Danie główne');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (2, 'Przystawka');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (3, 'Zupa');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (4, 'Deser');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (5, 'Danie wegetariańskie');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (6, 'Dodatki');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (7, 'Napoje');
INSERT INTO `Category` (`Category_ID`, `Category_name`) VALUES (8, 'Alkohol');
COMMIT;

-- ----------------------------
-- Table structure for Customer
-- ----------------------------
DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `Customer_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int(10) unsigned DEFAULT NULL,
  `Phone` varchar(15) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Surname` varchar(40) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Customer
-- ----------------------------
BEGIN;
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (1, 13, '+48 123789456', 'Mariusz', 'Kowalski');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (2, 14, '+48 321654987', 'Jarosław', 'Duda');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (3, 15, '+48 567123321', 'Hubert', 'Król');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (4, 16, '+48 666333123', 'Monika', 'Lupa');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (5, 17, '+48 731456123', 'Bartosz', 'Adamczyk');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (6, 18, '+48 997101123', 'Adam', 'Bartosiak');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (7, 19, '+48 998102124', 'Ewa', 'Grzyb');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (8, 20, '+48 999103124', 'Bartosz', 'Kurek');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (10, 21, '+49 123456789', 'Adam', 'Kowalski');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (11, 22, '+48 123-456-789', 'Bartosz', 'Kniaziewicz');
INSERT INTO `Customer` (`Customer_ID`, `user_ID`, `Phone`, `Name`, `Surname`) VALUES (12, 26, '+48 456-908-123', 'Bartosz', 'Adamek');
COMMIT;

-- ----------------------------
-- Table structure for Individual_customer
-- ----------------------------
DROP TABLE IF EXISTS `Individual_customer`;
CREATE TABLE `Individual_customer` (
  `Individual_customer_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Table_ID` int(10) unsigned DEFAULT NULL,
  `Add_time` datetime DEFAULT curtime(),
  `Ended` tinyint(1) DEFAULT 0,
  `Reservation_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Individual_customer_ID`),
  KEY `Table_ID` (`Table_ID`),
  KEY `idx_Individual_customer_Reservation` (`Reservation_ID`),
  CONSTRAINT `Individual_customer_ibfk_1` FOREIGN KEY (`Table_ID`) REFERENCES `Table` (`Table_ID`),
  CONSTRAINT `idx_Individual_customer_Reservation` FOREIGN KEY (`Reservation_ID`) REFERENCES `Reservation` (`Reservation_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 WITH SYSTEM VERSIONING;

-- ----------------------------
-- Records of Individual_customer
-- ----------------------------
BEGIN;
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (4, 3, '2022-03-27 16:09:43', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (5, 4, '2022-03-27 17:01:45', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (6, 11, '2022-03-27 17:31:48', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (7, 28, '2022-03-27 17:32:03', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (8, 2, '2022-03-27 17:44:07', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (9, 21, '2022-03-27 18:02:12', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (10, 6, '2022-03-27 18:08:37', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (13, 9, '2022-06-05 20:34:31', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (14, 10, '2022-06-05 20:34:43', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (15, 9, '2022-06-06 19:38:51', 1, 21);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (16, 9, '2022-06-07 12:56:41', 1, 21);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (17, 9, '2022-06-07 12:56:45', 1, 21);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (18, 3, '2022-06-21 19:35:07', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (19, 1, '2022-06-21 19:37:47', 1, NULL);
INSERT INTO `Individual_customer` (`Individual_customer_ID`, `Table_ID`, `Add_time`, `Ended`, `Reservation_ID`) VALUES (20, 4, '2022-06-21 19:50:27', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for Ingredients
-- ----------------------------
DROP TABLE IF EXISTS `Ingredients`;
CREATE TABLE `Ingredients` (
  `Meal_ID` int(10) unsigned NOT NULL,
  `Product_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Meal_ID`,`Product_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `Ingredients_ibfk_1` FOREIGN KEY (`Meal_ID`) REFERENCES `Meal` (`Meal_ID`),
  CONSTRAINT `Ingredients_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Ingredients
-- ----------------------------
BEGIN;
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (1, 6);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (1, 39);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (2, 7);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (2, 20);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (2, 22);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (3, 8);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (3, 39);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (5, 9);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (5, 12);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (5, 17);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (6, 10);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (6, 13);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (6, 16);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (7, 11);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (7, 12);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (7, 15);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (8, 13);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (8, 18);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (9, 19);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (9, 20);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (9, 21);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (9, 23);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (10, 20);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (10, 21);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (10, 23);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (10, 24);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (11, 25);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (11, 26);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (12, 34);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (13, 26);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (13, 27);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (13, 28);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (14, 29);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (14, 30);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (15, 31);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (15, 32);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (16, 14);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (16, 33);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (17, 13);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (18, 12);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (19, 14);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (20, 36);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (21, 35);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (22, 37);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (23, 38);
INSERT INTO `Ingredients` (`Meal_ID`, `Product_ID`) VALUES (24, 38);
COMMIT;

-- ----------------------------
-- Table structure for Logs
-- ----------------------------
DROP TABLE IF EXISTS `Logs`;
CREATE TABLE `Logs` (
  `Log_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) DEFAULT NULL,
  `Ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Log_ID`,`Ts`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4
 PARTITION BY RANGE (year(`Ts`))
(PARTITION `mniejsze_od_2022` VALUES LESS THAN (2022) ENGINE = InnoDB,
 PARTITION `mniejsze_od_2023` VALUES LESS THAN (2023) ENGINE = InnoDB,
 PARTITION `wieksze_od_2022` VALUES LESS THAN MAXVALUE ENGINE = InnoDB);

-- ----------------------------
-- Records of Logs
-- ----------------------------
BEGIN;
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (1, 22, '2022-06-14 18:25:31');
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (2, 25, '2022-06-14 18:30:06');
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (3, 26, '2022-06-14 19:07:43');
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (4, 26, '2022-06-14 19:09:11');
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (5, 5, '2022-06-21 19:38:28');
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (6, 5, '2022-06-21 19:39:05');
INSERT INTO `Logs` (`Log_ID`, `User_ID`, `Ts`) VALUES (7, 5, '2022-06-21 19:39:15');
COMMIT;

-- ----------------------------
-- Table structure for Meal
-- ----------------------------
DROP TABLE IF EXISTS `Meal`;
CREATE TABLE `Meal` (
  `Meal_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Price` decimal(10,2) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Category_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Meal_ID`),
  KEY `Category_ID` (`Category_ID`),
  FULLTEXT KEY `Name` (`Name`),
  CONSTRAINT `Meal_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `Category` (`Category_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Meal
-- ----------------------------
BEGIN;
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (1, 15.50, 'Pomidorowa', 3);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (2, 16.00, 'Żurek', 3);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (3, 18.00, 'Rosół', 3);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (5, 26.00, 'Kotlet schabowy', 1);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (6, 23.50, 'Filet z kurczaka', 1);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (7, 24.00, 'Kotlet de volaille', 1);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (8, 16.00, 'Skrzydełka z kurczaka', 2);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (9, 20.99, 'Tatar wołowy', 2);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (10, 21.90, 'Tatar z łososia', 2);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (11, 15.00, 'Szarlotka', 4);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (12, 13.00, 'Sernik', 4);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (13, 17.50, 'Puchar lodowy', 4);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (14, 14.00, 'Naleśniki z dżemem', 5);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (15, 16.60, 'Gołąbki w sosie pomidorowym', 5);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (16, 20.00, 'Kotlet z kaszy jaglanej', 5);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (17, 7.00, 'Frytki', 6);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (18, 6.00, 'Ziemniaki', 6);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (19, 6.50, 'Ryż', 6);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (20, 3.50, 'Woda gazowana', 7);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (21, 4.00, 'Woda niegazowana', 7);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (22, 5.00, 'Sok pomarańczowy', 7);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (23, 10.00, 'Piwo - 500ml', 8);
INSERT INTO `Meal` (`Meal_ID`, `Price`, `Name`, `Category_ID`) VALUES (24, 8.00, 'Piwo - 300ml', 8);
COMMIT;

-- ----------------------------
-- Table structure for Menager
-- ----------------------------
DROP TABLE IF EXISTS `Menager`;
CREATE TABLE `Menager` (
  `Menager_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(40) NOT NULL,
  `Surname` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Mail` varchar(255) DEFAULT NULL,
  `Photo` longblob DEFAULT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `Building_number` int(11) DEFAULT NULL,
  `House_number` int(11) DEFAULT NULL,
  `Postal_code` varchar(6) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Menager_ID`),
  KEY `user_ID` (`user_ID`),
  CONSTRAINT `menager_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`),
  CONSTRAINT `mail_check` CHECK (`Mail` like '%@%.%'),
  CONSTRAINT `phone_check` CHECK (`Phone` regexp '\\+[0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Menager
-- ----------------------------
BEGIN;
INSERT INTO `Menager` (`Menager_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (1, 1, 'Jan', 'Kowalski', '+48 543-234-123', 'jan.kowalski@gmail.com', NULL, 3456.60, 'Cicha', 34, 54, '12-009', 'Kraków');
INSERT INTO `Menager` (`Menager_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (2, 2, 'Paweł', 'Nowak', '+48 456-789-321', 'nowakPawel@wp.pl', NULL, 4500.00, 'Głośna', 43, 11, '10-011', 'Kraków');
INSERT INTO `Menager` (`Menager_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (3, 3, 'Anna', 'Wojtyła', '+48 789-321-123', 'aniaw123@onet.pl', NULL, 3456.60, 'Długa', 42, 67, '30-011', 'Kraków');
COMMIT;

-- ----------------------------
-- Table structure for Order
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `Order_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(10) unsigned DEFAULT NULL,
  `Waiter_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `Waiter_ID` (`Waiter_ID`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Individual_customer` (`Individual_customer_ID`) ON DELETE SET NULL,
  CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`Waiter_ID`) REFERENCES `Waiter` (`Waiter_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Order
-- ----------------------------
BEGIN;
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (11, 13, 1);
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (12, 14, 2);
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (13, 15, 3);
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (14, 16, 3);
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (15, 17, 3);
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (16, 18, 1);
INSERT INTO `Order` (`Order_ID`, `Customer_ID`, `Waiter_ID`) VALUES (17, 19, 2);
COMMIT;

-- ----------------------------
-- Table structure for Order_details
-- ----------------------------
DROP TABLE IF EXISTS `Order_details`;
CREATE TABLE `Order_details` (
  `Meal_ID` int(10) unsigned NOT NULL,
  `Order_ID` int(10) unsigned NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Meal_ID`,`Order_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `Order_details_ibfk_1` FOREIGN KEY (`Meal_ID`) REFERENCES `Meal` (`Meal_ID`),
  CONSTRAINT `Order_details_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `Order` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Order_details
-- ----------------------------
BEGIN;
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (1, 12, 1);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (1, 15, 2);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (1, 17, 2);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (2, 11, 2);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (2, 14, 3);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (3, 15, 1);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (5, 12, 1);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (5, 17, 1);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (6, 11, 1);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (6, 15, 1);
INSERT INTO `Order_details` (`Meal_ID`, `Order_ID`, `Amount`) VALUES (9, 11, 2);
COMMIT;

-- ----------------------------
-- Table structure for Product
-- ----------------------------
DROP TABLE IF EXISTS `Product`;
CREATE TABLE `Product` (
  `Product_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Units_in_stock` int(11) NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Product
-- ----------------------------
BEGIN;
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (6, 'Zupa pomidorowa', 24);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (7, 'Żurek', 24);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (8, 'Rosół', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (9, 'Kotlet schabowy', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (10, 'Filet z kurczaka', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (11, 'Kotlet de volaille', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (12, 'Ziemniaki', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (13, 'Frytki', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (14, 'Ryż', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (15, 'Mizeria', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (16, 'Surówka z marchewki', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (17, 'Kapusta zasmażana', 29);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (18, 'Skrzydełka z kurczaka', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (19, 'Tatar wołowy', 26);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (20, 'Jajko', 15);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (21, 'Cebula', 28);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (22, 'Kiełbasa', 24);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (23, 'Ogórek', 28);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (24, 'Tatar z łososia', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (25, 'Szarlotka', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (26, 'Lody waniliowe', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (27, 'Lody czekoladowe', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (28, 'Bita śmietana', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (29, 'Naleśnik', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (30, 'Dżem', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (31, 'Gołąbki', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (32, 'Sos pomidorowy', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (33, 'Kotlet jaglany', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (34, 'Sernik', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (35, 'Woda niegazowana', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (36, 'Woda gazowana', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (37, 'Sok pomarańczowy', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (38, 'Piwo', 30);
INSERT INTO `Product` (`Product_ID`, `Name`, `Units_in_stock`) VALUES (39, 'Makaron', 23);
COMMIT;

-- ----------------------------
-- Table structure for Reservation
-- ----------------------------
DROP TABLE IF EXISTS `Reservation`;
CREATE TABLE `Reservation` (
  `Reservation_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Start_time` time NOT NULL,
  `End_time` time DEFAULT addtime(`Start_time`,'02:00:00'),
  `Num_of_people` int(11) NOT NULL,
  `Confirmed` tinyint(1) DEFAULT 0,
  `Customer_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Reservation_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`),
  CONSTRAINT `time_check` CHECK (`Start_time` < `End_time`),
  CONSTRAINT `confirmation_check` CHECK (`Confirmed` = 0 or `Confirmed` = 1),
  CONSTRAINT `people_check` CHECK (`Num_of_people` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Reservation
-- ----------------------------
BEGIN;
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (7, '2022-04-10', '16:00:00', '20:00:00', 3, 1, 1);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (8, '2022-04-12', '17:00:00', '20:00:00', 4, 0, 2);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (9, '2022-04-12', '18:00:00', '20:30:00', 2, 0, 3);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (10, '2022-04-20', '21:00:00', '23:30:00', 5, 1, 4);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (11, '2022-04-23', '17:00:00', '20:00:00', 4, 0, 5);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (12, '2022-04-24', '18:00:00', '22:30:00', 10, 1, 6);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (13, '2022-04-23', '19:00:00', '23:00:00', 12, 1, 7);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (14, '2022-04-24', '20:00:00', '23:00:00', 5, 0, 8);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (17, '2022-05-12', '18:20:00', '20:20:00', 3, 0, 1);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (20, '2022-05-15', '16:00:00', '18:00:00', 3, 0, 1);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (21, '2022-06-07', '19:00:00', '21:00:00', 3, 1, 1);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (22, '2022-06-15', '18:00:00', '20:00:00', 2, 1, 10);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (23, '2022-06-15', '18:00:00', '20:00:00', 3, 1, 8);
INSERT INTO `Reservation` (`Reservation_ID`, `Date`, `Start_time`, `End_time`, `Num_of_people`, `Confirmed`, `Customer_ID`) VALUES (24, '2022-06-16', '19:30:00', '21:30:00', 4, 1, 12);
COMMIT;

-- ----------------------------
-- Table structure for Table
-- ----------------------------
DROP TABLE IF EXISTS `Table`;
CREATE TABLE `Table` (
  `Table_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Capacity` int(11) NOT NULL,
  PRIMARY KEY (`Table_ID`),
  CONSTRAINT `capacity_check` CHECK (`Capacity` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Table
-- ----------------------------
BEGIN;
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (1, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (2, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (3, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (4, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (5, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (6, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (7, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (8, 2);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (9, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (10, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (11, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (12, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (13, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (14, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (15, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (16, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (17, 3);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (18, 4);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (19, 4);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (20, 4);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (21, 4);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (22, 4);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (23, 5);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (24, 5);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (25, 5);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (26, 5);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (27, 5);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (28, 6);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (29, 6);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (30, 6);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (31, 6);
INSERT INTO `Table` (`Table_ID`, `Capacity`) VALUES (32, 6);
COMMIT;

-- ----------------------------
-- Table structure for Table_reservation
-- ----------------------------
DROP TABLE IF EXISTS `Table_reservation`;
CREATE TABLE `Table_reservation` (
  `Table_ID` int(10) unsigned NOT NULL,
  `Reservation_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Table_ID`,`Reservation_ID`),
  KEY `Reservation_ID` (`Reservation_ID`),
  CONSTRAINT `Table_reservation_ibfk_1` FOREIGN KEY (`Table_ID`) REFERENCES `Table` (`Table_ID`),
  CONSTRAINT `Table_reservation_ibfk_2` FOREIGN KEY (`Reservation_ID`) REFERENCES `Reservation` (`Reservation_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Table_reservation
-- ----------------------------
BEGIN;
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (1, 9);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (1, 22);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (9, 7);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (9, 21);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (9, 23);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (18, 8);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (18, 24);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (19, 11);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (24, 10);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (25, 14);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (26, 12);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (27, 12);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (31, 13);
INSERT INTO `Table_reservation` (`Table_ID`, `Reservation_ID`) VALUES (32, 13);
COMMIT;

-- ----------------------------
-- Table structure for User_type
-- ----------------------------
DROP TABLE IF EXISTS `User_type`;
CREATE TABLE `User_type` (
  `type_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of User_type
-- ----------------------------
BEGIN;
INSERT INTO `User_type` (`type_ID`, `Name`) VALUES (1, 'Menager');
INSERT INTO `User_type` (`type_ID`, `Name`) VALUES (2, 'Waiter');
INSERT INTO `User_type` (`type_ID`, `Name`) VALUES (3, 'Client');
COMMIT;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `user_ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_ID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  KEY `type_ID` (`type_ID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`type_ID`) REFERENCES `User_type` (`type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 WITH SYSTEM VERSIONING;

-- ----------------------------
-- Records of Users
-- ----------------------------
BEGIN;
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (1, 'jkowal', 'kowalj', 1);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (2, 'pawko_n', 'n_pawko', 1);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (3, 'aniaw', 'wania', 1);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (4, 'kam_kow', 'kow_kam', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (5, 'pawel_k', 'k_pawel', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (6, 'm_nowak', 'nowak_m', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (7, 'daria_kot', 'kot_daria', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (8, 'k_mlot', 'mlot_k', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (9, 'darek_kulig', 'kulig_d', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (10, 'j_wiktor', 'janusz_w', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (11, 'milos_k', 'konik_m', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (12, 'wojtek_konon', 'kononowicz', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (13, 'm_kowal', 'kowal_m', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (14, 'jarek_duda', 'j_duda', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (15, 'hubertk', 'khubert', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (16, 'm_lupa', 'lupa_m', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (17, 'b_adam', 'adam_bart', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (18, 'a_bart', 'bart_adam', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (19, 'ewka_grzyb', 'grzybek', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (20, 'b_kurek', 'kurrek', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (21, 'adas_kowalski', 'kowalski_a', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (22, 'bartq', 'bartosz123', 3);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (25, 'adasko', 'adamek123', 2);
INSERT INTO `Users` (`user_ID`, `login`, `password`, `type_ID`) VALUES (26, 'bart_kn', 'kn_bart', 3);
COMMIT;

-- ----------------------------
-- Table structure for Waiter
-- ----------------------------
DROP TABLE IF EXISTS `Waiter`;
CREATE TABLE `Waiter` (
  `Waiter_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int(10) unsigned DEFAULT NULL,
  `Name` varchar(40) NOT NULL,
  `Surname` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Mail` varchar(255) DEFAULT NULL,
  `Photo` longblob DEFAULT NULL,
  `Menager_ID` int(10) unsigned DEFAULT NULL,
  `Salary` decimal(10,2) NOT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `Building_number` int(11) DEFAULT NULL,
  `House_number` int(11) DEFAULT NULL,
  `Postal_code` varchar(6) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Waiter_ID`),
  KEY `Menager_ID` (`Menager_ID`),
  KEY `idx_Waiter_User` (`user_ID`),
  CONSTRAINT `Waiter_ibfk_1` FOREIGN KEY (`Menager_ID`) REFERENCES `Menager` (`Menager_ID`),
  CONSTRAINT `idx_Waiter_User` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`),
  CONSTRAINT `mail_check` CHECK (`Mail` like '%@%.%'),
  CONSTRAINT `phone_check` CHECK (`Phone` regexp '\\+[0-9][0-9] [0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'),
  CONSTRAINT `salary_check` CHECK (`Salary` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of Waiter
-- ----------------------------
BEGIN;
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (1, 4, 'Kamil', 'Kowalski', '+48 542-234-123', NULL, NULL, 1, 3100.50, 'Szeroka', 34, 54, '12-009', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (2, 5, 'Pawel', 'Kowalski', '+48 456-790-321', NULL, NULL, 1, 3200.75, 'Wąska', 43, 11, '10-011', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (3, 6, 'Maria', 'Nowak', '+48 999-321-123', NULL, NULL, 1, 3100.50, 'Krótka', 42, 69, '30-011', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (4, 7, 'Daria', 'Kot', '+48 542-234-321', NULL, NULL, 2, 3200.75, 'Kopernika', 32, 44, '12-009', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (5, 8, 'Karolina', 'Mlot', '+48 456-000-321', NULL, NULL, 2, 3100.50, 'Spacerowa', 42, 11, '10-011', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (6, 9, 'Dariusz', 'Kulig', '+48 888-321-123', NULL, NULL, 2, 3200.75, 'Klonowa', 45, 69, '30-011', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (7, 10, 'Janusz', 'Wiktor', '+48 444-234-321', NULL, NULL, 3, 3100.50, 'A. Mickiewicza', 34, 44, '12-009', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (8, 11, 'Miłosz', 'Konik', '+48 456-004-561', NULL, NULL, 3, 3200.75, 'Wrocławska', 43, 11, '10-011', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (9, 12, 'Wojciech', 'Kononowicz', '+48 987-321-123', NULL, NULL, 3, 3200.00, 'Szkolna', NULL, 17, '15-011', 'Kraków');
INSERT INTO `Waiter` (`Waiter_ID`, `user_ID`, `Name`, `Surname`, `Phone`, `Mail`, `Photo`, `Menager_ID`, `Salary`, `Street`, `Building_number`, `House_number`, `Postal_code`, `City`) VALUES (12, 25, 'Adam', 'Dobry', '+48 442-123-123', NULL, NULL, NULL, 3200.00, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- View structure for free_tables_now
-- ----------------------------
DROP VIEW IF EXISTS `free_tables_now`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `free_tables_now` AS (select `t`.`Table_ID` AS `Table_ID` from `projektv2`.`table` `t` where !(`t`.`Table_ID` in (select `tr`.`Table_ID` from (`projektv2`.`table_reservation` `tr` join `projektv2`.`reservation` `r` on(`r`.`Reservation_ID` = `tr`.`Reservation_ID`)) where `r`.`Date` = curdate() and (`r`.`Start_time` > curtime() or `r`.`End_time` > curtime()) and (`r`.`Start_time` < addtime(curtime(),'02:00:00') or `r`.`End_time` < addtime(curtime(),'02:00:00'))))) except (select `projektv2`.`individual_customer`.`Table_ID` AS `Table_ID` from `projektv2`.`individual_customer` where `projektv2`.`individual_customer`.`Ended` = 0 and cast(`projektv2`.`individual_customer`.`Add_time` as date) = curdate());

-- ----------------------------
-- Procedure structure for Add_customer
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_customer`;
delimiter ;;
CREATE PROCEDURE `Add_customer`(IN vlogin varchar(256), IN vpassword varchar(256), 
	IN vname varchar(256), IN vsurname varchar(256), IN vphone varchar(256))
BEGIN
	DECLARE vuser_ID INT;

  IF vlogin IS NULL OR LENGTH(vlogin) = 0 
	THEN
	 SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano loginu';
	END IF;
	
	IF vpassword IS NULL OR LENGTH(vpassword) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano hasla';
	END IF;
	
	IF vname IS NULL OR LENGTH(vname) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano imienia';
	END IF;
	
	IF vsurname IS NULL OR LENGTH(vsurname) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano nazwiska';
	END IF;
	
	IF vphone IS NULL OR LENGTH(vphone) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano numeru telefonu';
	END IF;
	
	INSERT INTO Users (login, password, type_ID)
	VALUES (vlogin, vpassword, 3);
	
	SET vuser_ID = LAST_INSERT_ID();
	
	INSERT INTO Customer (user_ID, Name, Surname, Phone)
	VALUES (vuser_ID, vname, vsurname, vphone);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_individual_customer
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_individual_customer`;
delimiter ;;
CREATE PROCEDURE `Add_individual_customer`(IN vTable_ID INT)
BEGIN
  INSERT INTO Individual_customer (Table_ID)
	VALUES (vTable_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_manager
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_manager`;
delimiter ;;
CREATE PROCEDURE `Add_manager`(IN vlogin varchar(256), IN vpassword varchar(256), 
	IN vname varchar(256), IN vsurname varchar(256), IN vphone varchar(256), IN vsalary decimal(10,2))
BEGIN
  DECLARE vuser_ID INT;

  IF vlogin IS NULL OR LENGTH(vlogin) = 0 
	THEN
	 SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano loginu';
	END IF;
	
	IF vpassword IS NULL OR LENGTH(vpassword) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano hasla';
	END IF;
	
	IF vname IS NULL OR LENGTH(vname) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano imienia';
	END IF;
	
	IF vsurname IS NULL OR LENGTH(vsurname) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano nazwiska';
	END IF;
	
	IF vphone IS NULL OR LENGTH(vphone) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano numeru telefonu';
	END IF;
	
	INSERT INTO Users (login, password, type_ID)
	VALUES (vlogin, vpassword, 1);
	
	SET vuser_ID = LAST_INSERT_ID();
	
	INSERT INTO Menager (user_ID, Name, Surname, Phone, Salary)
	VALUES (vuser_ID, vname, vsurname, vphone, vsalary);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_meal
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_meal`;
delimiter ;;
CREATE PROCEDURE `Add_meal`(IN vname varchar(40), IN vprice decimal(10,2), 
	IN vcategory INT, IN vmanager_ID INT)
BEGIN
	DECLARE vuser_ID INT;
	
  IF(CHAR_LENGTH(vname) > 0, vprice > 0, vcategory > 0, vcategory < 8)
	THEN
	INSERT INTO Meal(Price, Name, Category_ID) 
	VALUES (vprice,vname,vcategory);
	END IF;
	
	SET vuser_ID = (SELECT user_ID FROM Menager WHERE Menager_ID = vmanager_ID);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_meal_to_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_meal_to_order`;
delimiter ;;
CREATE PROCEDURE `Add_meal_to_order`(IN vorder_ID int, IN vmeal_ID int, IN vamount int)
BEGIN
	DECLARE prod_ID INT;
	DECLARE done INT;
	DECLARE vuser_ID INT;
	
	DECLARE productInfo CURSOR FOR
	SELECT Product_ID FROM Ingredients
	WHERE Meal_ID = vmeal_ID;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	
	OPEN productInfo;
	
	update_prod: LOOP
	FETCH productInfo INTO prod_ID;

	IF done THEN
		LEAVE update_prod; 
	END IF; 
	
	UPDATE Product
	SET Units_in_stock = Units_in_stock - vamount
	WHERE Product_ID = prod_ID;
	
END LOOP update_prod;

CLOSE productInfo;

	INSERT INTO Order_details
	VALUES (vmeal_ID, vorder_ID, vamount);

	SET vuser_ID = (SELECT user_ID FROM Waiter WHERE Waiter_ID = (SELECT Waiter_ID FROM `Order` WHERE Order_ID = vorder_ID));
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_new_ingredients
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_new_ingredients`;
delimiter ;;
CREATE PROCEDURE `Add_new_ingredients`(IN vmeal_ID INT, IN vproduct_ID INT, IN vmanager_ID INT)
BEGIN
	DECLARE vuser_ID INT;
 
  INSERT INTO Ingredients(Meal_ID, Product_ID)
	VALUES (vmeal_ID, vproduct_ID);
	
	SET vuser_ID = (SELECT user_ID FROM Menager WHERE Menager_ID = vmanager_ID);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_order`;
delimiter ;;
CREATE PROCEDURE `Add_order`(IN vcustomer_ID int, IN vwaiter_ID int)
BEGIN
	DECLARE vuser_ID INT;	
	
  INSERT INTO `Order` (Customer_ID, Waiter_ID)
	VALUES (vcustomer_ID, vwaiter_ID);
	
	SET vuser_ID = (SELECT user_ID FROM Waiter WHERE Waiter_ID = vwaiter_ID);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_order_to_reservation
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_order_to_reservation`;
delimiter ;;
CREATE PROCEDURE `Add_order_to_reservation`(IN vReservation_ID int, IN vWaiter_ID int)
BEGIN
  DECLARE orders_num INT; -- aktualna liczba zamowien przypisana do rezerwacji 
	DECLARE orders_max INT; -- maksymalna liczba zamowien dla danej rezerwacji = liczbie osob
	DECLARE vTable_ID INT;
	DECLARE vuser_ID INT;
	
	SET orders_num = (SELECT COUNT(*) FROM Individual_customer WHERE Reservation_ID = vReservation_ID);
	SET orders_max = (SELECT Num_of_people FROM Reservation WHERE Reservation_ID = vReservation_ID);
	SET vTAble_ID = (SELECT Table_ID FROM Table_reservation WHERE Reservation_ID = vReservation_ID);
	
	IF (orders_num = orders_max) 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Osiagnieto limit';
	ELSE
		INSERT INTO Individual_customer (Table_ID, Reservation_ID)
		VALUES (vTable_ID, vReservation_ID);
		
		INSERT INTO `Order` (Customer_ID, Waiter_ID)
		VALUES (LAST_INSERT_ID(), vWaiter_ID);
END IF;

	SET vuser_ID = (SELECT user_ID FROM Waiter WHERE Waiter_ID = vwaiter_ID);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_reservation
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_reservation`;
delimiter ;;
CREATE PROCEDURE `Add_reservation`(IN vdate date, IN vstart time, IN vend time,
	IN vcustomers_num INT, IN vcustomer_ID INT)
BEGIN	

	DECLARE vuser_ID INT;
	
	IF vend IS NULL OR LENGTH(vend) = 0 THEN
	SET vend := ADDTIME(vstart,'02:00:00');
	END IF;
	
	IF(vdate > CURDATE())
	THEN
		INSERT INTO Reservation (Date, Start_time, End_time, Num_of_people, Confirmed, Customer_ID)
		VALUES (vdate, vstart, vend, vcustomers_num, 0, vcustomer_ID);
	ELSE
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Rezerawacja musi być wykonana z przynajmiej jednodniowym wyprzedzeniem!';
	END IF;
	
	SET vuser_ID = (SELECT user_ID FROM Customer WHERE Customer_ID = vcustomer_ID);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_table_to_reservation
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_table_to_reservation`;
delimiter ;;
CREATE PROCEDURE `Add_table_to_reservation`(IN vReservation_ID int, IN vTable_ID int)
BEGIN

	DECLARE start_hour TIME;
	DECLARE res_date DATE;
	DECLARE customers_num INT;
	
	IF(vTable_ID IS NULL)
	THEN
		START TRANSACTION;
		
		SET start_hour = (SELECT Start_time FROM Reservation WHERE Reservation_ID = vReservation_ID);
		SET res_date = (SELECT Date FROM Reservation WHERE Reservation_ID = vReservation_ID);
		SET customers_num = (SELECT Num_of_people FROM Reservation WHERE Reservation_ID = vReservation_ID FOR UPDATE);
		
		SET vTable_ID = Get_table_for_reservation(res_date, start_hour, customers_num);
		
		 IF(vTable_ID IS NULL)
		 THEN
			SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Brak wolnych stolików!';
		 	ROLLBACK;
		 ELSE
		 	INSERT INTO Table_reservation
		 	VALUES (vTable_ID, vReservation_ID);
		 	
		 	UPDATE Reservation SET Confirmed = 1 WHERE Reservation_ID = vReservation_ID;
			COMMIT;
		 END IF;
	ELSE
		INSERT INTO Table_reservation
		VALUES (vTable_ID, vReservation_ID);
		
		UPDATE Reservation SET Confirmed = 1 WHERE Reservation_ID = vReservation_ID;
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Add_waiter
-- ----------------------------
DROP PROCEDURE IF EXISTS `Add_waiter`;
delimiter ;;
CREATE PROCEDURE `Add_waiter`(IN vlogin varchar(256), IN vpassword varchar(256), 
	IN vname varchar(256), IN vsurname varchar(256), IN vphone varchar(256), IN vsalary decimal(10,2))
BEGIN
  DECLARE vuser_ID INT;

  IF vlogin IS NULL OR LENGTH(vlogin) = 0 
	THEN
	 SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano loginu';
	END IF;
	
	IF vpassword IS NULL OR LENGTH(vpassword) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano hasla';
	END IF;
	
	IF vname IS NULL OR LENGTH(vname) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano imienia';
	END IF;
	
	IF vsurname IS NULL OR LENGTH(vsurname) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano nazwiska';
	END IF;
	
	IF vphone IS NULL OR LENGTH(vphone) = 0 
	THEN
		SIGNAL SQLSTATE '45000' SET MYSQL_ERRNO = 30001, MESSAGE_TEXT = 'Nie podano numeru telefonu';
	END IF;
	
	INSERT INTO Users (login, password, type_ID)
	VALUES (vlogin, vpassword, 2);
	
	SET vuser_ID = LAST_INSERT_ID();
	
	INSERT INTO Waiter (user_ID, Name, Surname, Phone, Salary)
	VALUES (vuser_ID, vname, vsurname, vphone, vsalary);
	
	INSERT INTO Logs (User_ID)
	VALUES (vuser_ID);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Find_in_menu
-- ----------------------------
DROP PROCEDURE IF EXISTS `Find_in_menu`;
delimiter ;;
CREATE PROCEDURE `Find_in_menu`(IN vname varchar(256))
BEGIN
  SELECT Name, Price FROM Meal WHERE MATCH(Name) against(vname);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Free_tables_at_given_moment
-- ----------------------------
DROP PROCEDURE IF EXISTS `Free_tables_at_given_moment`;
delimiter ;;
CREATE PROCEDURE `Free_tables_at_given_moment`(IN vClient_ID int)
BEGIN
	SELECT t.Table_ID, t.Capacity FROM `Table` AS t
	WHERE t.Table_ID NOT IN (
		SELECT tr.Table_ID FROM `Table_reservation` AS tr
		INNER JOIN `Reservation` AS r ON r.Reservation_ID = tr.Reservation_ID
		WHERE r.Date = CURDATE()
		AND NOT ((r.Start_time <= CURTIME() AND r.End_time <= CURTIME()) 
							OR (r.Start_time >= ADDTIME(CURTIME(), '02:00:00') AND r.End_time >= ADDTIME(CURTIME(),'02:00:00'))) 
		);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Get_reservation_total_value
-- ----------------------------
DROP PROCEDURE IF EXISTS `Get_reservation_total_value`;
delimiter ;;
CREATE PROCEDURE `Get_reservation_total_value`(IN vReservation_ID int)
BEGIN
	DECLARE done INT;
	DECLARE cus_ID INT;
	DECLARE ord_ID INT;
	DECLARE part_sum DECIMAL(10,2) DEFAULT 0.00;
	DECLARE total_sum DECIMAL(10,2) DEFAULT 0.00;

	DECLARE customersInfo CURSOR FOR
  SELECT Individual_customer_ID FROM Individual_customer WHERE Reservation_ID = vReservation_ID;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	
		OPEN customersInfo;
	
		sum_up: LOOP
		FETCH customersInfo INTO cus_ID;

		IF done THEN
			LEAVE sum_up; 
		END IF; 
	
		SET ord_ID = (SELECT Order_ID FROM `Order` WHERE Customer_ID = cus_ID);
		SET part_sum = Order_total_price(ord_ID);
		IF (part_sum IS NOT NULL) 
		THEN
			SET total_sum = total_sum + part_sum; 
		END IF;
		
	END LOOP sum_up;

	CLOSE customersInfo;
	
	SELECT total_sum;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for Get_table_for_reservation
-- ----------------------------
DROP FUNCTION IF EXISTS `Get_table_for_reservation`;
delimiter ;;
CREATE FUNCTION `Get_table_for_reservation`(res_date date,  start_hour time,  clients_num int)
 RETURNS int(11)
BEGIN
  DECLARE founded_ID INT;
	
	SET founded_ID = (SELECT t.Table_ID FROM `Table` AS t
	WHERE t.Capacity >= clients_num
	AND t.Table_ID NOT IN (
		SELECT tr.Table_ID FROM `Table_reservation` AS tr
		INNER JOIN `Reservation` AS r ON r.Reservation_ID = tr.Reservation_ID
		WHERE r.Date = res_date
		AND NOT ((r.Start_time <= start_hour AND r.End_time <= start_hour) 
							OR (r.Start_time >= ADDTIME(start_hour, '02:00:00') AND r.End_time >= ADDTIME(start_hour,'02:00:00')))) 
	LIMIT 1);
	
RETURN founded_ID;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for Order_total_price
-- ----------------------------
DROP FUNCTION IF EXISTS `Order_total_price`;
delimiter ;;
CREATE FUNCTION `Order_total_price`(vOrder_ID int)
 RETURNS decimal(10,2)
BEGIN
  DECLARE result DECIMAL(10,2);
	
	SET result = (SELECT SUM(od.Amount * ml.Price) FROM Order_details AS od
								INNER JOIN Meal ml ON ml.Meal_ID = od.Meal_ID
								WHERE od.Order_ID = vOrder_ID);
RETURN result;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ShowIngredientsOfMeal
-- ----------------------------
DROP PROCEDURE IF EXISTS `ShowIngredientsOfMeal`;
delimiter ;;
CREATE PROCEDURE `ShowIngredientsOfMeal`(IN meal_ID int)
BEGIN
  SELECT  p.Name AS 'Składniki' FROM Ingredients i
	INNER JOIN Product p ON p.Product_ID = i.Product_ID
	WHERE i.Meal_ID = meal_ID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for Show_reserved_tables
-- ----------------------------
DROP PROCEDURE IF EXISTS `Show_reserved_tables`;
delimiter ;;
CREATE PROCEDURE `Show_reserved_tables`(IN vdate date)
BEGIN
  SELECT tab.Table_ID, res.Start_time, res.End_time, res.Date FROM Reservation res
	INNER JOIN Table_reservation tab_res ON tab_res.Reservation_ID = res.Reservation_ID
	INNER JOIN `Table` tab ON tab.Table_ID = tab_res.Table_ID
	WHERE res.Date = vdate;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SumUp_order
-- ----------------------------
DROP PROCEDURE IF EXISTS `SumUp_order`;
delimiter ;;
CREATE PROCEDURE `SumUp_order`(IN vOrder_ID int)
BEGIN
	DECLARE quantity INT;
	DECLARE calculated_price DECIMAL(10,2);
	DECLARE meal_name VARCHAR(255);
	DECLARE cus_ID INT;
	
	SELECT ml.`Name`, ml.Price, od.Amount FROM Meal AS ml
	INNER JOIN Order_details as od ON ml.Meal_ID = od.Meal_ID
	WHERE od.Order_ID = vOrder_ID
	GROUP BY Name, Price, Amount;
	
	SET calculated_price = Order_total_price(vOrder_ID);
	
	SELECT calculated_price;
	
	SET cus_ID = (SELECT Customer_ID FROM `Order` WHERE Order_ID = vOrder_ID);
	
	UPDATE Individual_customer SET Ended = 1 WHERE Individual_customer_ID;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for Clear_individual_customers
-- ----------------------------
DROP EVENT IF EXISTS `Clear_individual_customers`;
delimiter ;;
CREATE EVENT `Clear_individual_customers`
ON SCHEDULE
EVERY '1' DAY STARTS '2022-06-14 14:48:00' ENDS '2022-09-14 14:40:00'
ON COMPLETION PRESERVE
DO DELETE FROM Individual_customer WHERE DATEDIFF(NOW(), Add_time) > 90
;;
delimiter ;

-- ----------------------------
-- Event structure for Friday_delivery
-- ----------------------------
DROP EVENT IF EXISTS `Friday_delivery`;
delimiter ;;
CREATE EVENT `Friday_delivery`
ON SCHEDULE
EVERY '7' DAY STARTS '2022-06-10 10:00:00' ENDS '2022-09-10 10:00:00'
DO UPDATE Product SET Units_in_stock = Units_in_stock + 10
;
;;
delimiter ;

-- ----------------------------
-- Event structure for Monday_delivery
-- ----------------------------
DROP EVENT IF EXISTS `Monday_delivery`;
delimiter ;;
CREATE EVENT `Monday_delivery`
ON SCHEDULE
EVERY '7' DAY STARTS '2022-06-06 15:45:00' ENDS '2022-09-06 15:45:00'
DO UPDATE Product SET Units_in_stock = Units_in_stock + 10
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Menager
-- ----------------------------
DROP TRIGGER IF EXISTS `first_letter_name`;
delimiter ;;
CREATE TRIGGER `first_letter_name` BEFORE INSERT ON `Menager` FOR EACH ROW IF(NEW.Name REGEXP '^[a-zA-Z.]+$')
THEN
	SET NEW.Name = CONCAT(UCASE(LEFT(NEW.Name,1)), LCASE(SUBSTR(NEW.Name,2)));
ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong input in Name field';
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Menager
-- ----------------------------
DROP TRIGGER IF EXISTS `first_letter_surname`;
delimiter ;;
CREATE TRIGGER `first_letter_surname` BEFORE INSERT ON `Menager` FOR EACH ROW IF(NEW.Surname REGEXP '^[a-zA-Z.]+$')
THEN
	SET NEW.Surname = CONCAT(UCASE(LEFT(NEW.Surname,1)), LCASE(SUBSTR(NEW.Surname,2)));
ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong input in Surname field';
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Product
-- ----------------------------
DROP TRIGGER IF EXISTS `Units_check`;
delimiter ;;
CREATE TRIGGER `Units_check` BEFORE UPDATE ON `Product` FOR EACH ROW IF(NEW.Units_in_stock < 0)
THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There are not enough products!';
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Waiter
-- ----------------------------
DROP TRIGGER IF EXISTS `first_letter_surname_w`;
delimiter ;;
CREATE TRIGGER `first_letter_surname_w` BEFORE INSERT ON `Waiter` FOR EACH ROW IF(NEW.Surname REGEXP '^[a-zA-Z.]+$')
THEN
	SET NEW.Surname = CONCAT(UCASE(LEFT(NEW.Surname,1)), LCASE(SUBSTR(NEW.Surname,2)));
ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong input in Surname field';
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table Waiter
-- ----------------------------
DROP TRIGGER IF EXISTS `first_letter_name_w`;
delimiter ;;
CREATE TRIGGER `first_letter_name_w` BEFORE INSERT ON `Waiter` FOR EACH ROW IF(NEW.Name REGEXP '^[a-zA-Z.]+$')
THEN
	SET NEW.Name = CONCAT(UCASE(LEFT(NEW.Name,1)), LCASE(SUBSTR(NEW.Name,2)));
ELSE
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong input in Name field';
END IF
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
