-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2024 at 11:57 AM
-- Server version: 8.0.31
-- PHP Version: 8.2.0
DROP DATABASE IF EXISTS epharmacy;
CREATE DATABASE IF NOT EXISTS epharmacy;
USE epharmacy;
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `actif` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `actif`) VALUES
(1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
CREATE TABLE IF NOT EXISTS `cart_product` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total` double(15,2) NOT NULL,
  `tax` double(15,2) NOT NULL,
  `quantity_remainder` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`cart_id`, `product_id`, `quantity`, `total`, `tax`, `quantity_remainder`) VALUES
(1, 1, 1, 23.40, 0.00, 0),
(1, 3, 1, 43.87, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `connection_history`
--

DROP TABLE IF EXISTS `connection_history`;
CREATE TABLE IF NOT EXISTS `connection_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_date` datetime NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  `onsite_time` time DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `connection_history`
--

INSERT INTO `connection_history` (`id`, `login_date`, `logout_date`, `onsite_time`, `user_id`) VALUES
(1, '2024-02-05 20:00:03', '2024-02-05 20:00:03', '00:00:00', 2),
(2, '2024-02-05 20:20:50', '2024-02-05 20:20:50', '00:00:00', 2),
(3, '2024-02-05 20:24:41', '2024-02-05 20:26:19', '00:01:38', 2),
(4, '2024-02-05 20:26:46', '2024-02-05 23:25:00', '02:58:14', 2),
(5, '2024-02-05 23:40:27', '2024-02-05 23:40:27', '00:00:00', 2),
(6, '2024-02-08 09:06:42', '2024-02-08 09:21:44', '00:15:02', 2),
(7, '2024-02-08 09:32:35', '2024-02-08 09:57:24', '00:24:49', 2),
(8, '2024-02-08 10:08:52', '2024-02-08 10:11:39', '00:02:47', 2),
(9, '2024-02-08 10:12:36', '2024-02-08 10:12:36', '00:00:00', 2),
(10, '2024-02-12 02:22:56', '2024-02-12 02:22:56', '00:00:00', 2),
(11, '2024-02-13 03:50:58', '2024-02-13 03:50:58', '00:00:00', 2),
(12, '2024-02-13 18:04:26', '2024-02-13 18:04:26', '00:00:00', 2),
(13, '2024-02-15 10:04:30', '2024-02-15 10:04:30', '00:00:00', 2),
(14, '2024-02-18 06:06:45', '2024-02-18 06:06:45', '00:00:00', 2),
(15, '2024-02-19 00:23:37', '2024-02-19 00:34:54', '00:11:17', 2),
(16, '2024-02-19 00:34:59', '2024-02-19 02:07:08', '01:32:09', 4),
(17, '2024-02-19 02:07:13', '2024-02-19 04:24:09', '02:16:56', 2),
(18, '2024-02-19 04:24:17', '2024-02-19 04:24:29', '00:00:12', 2),
(19, '2024-02-19 04:24:52', '2024-02-19 04:24:57', '00:00:05', 2),
(20, '2024-02-19 04:25:06', '2024-02-19 05:06:13', '00:41:07', 4),
(21, '2024-02-20 00:11:24', '2024-02-20 02:30:39', '02:19:15', 4),
(22, '2024-02-20 02:30:51', '2024-02-20 03:09:04', '00:38:13', 4),
(23, '2024-02-20 14:23:46', '2024-02-20 14:23:46', '00:00:00', 4),
(24, '2024-02-21 22:40:44', '2024-02-21 22:54:07', '00:13:23', 4),
(25, '2024-02-21 22:54:15', '2024-02-22 01:03:59', '02:09:44', 4),
(26, '2024-02-22 01:04:06', '2024-02-22 01:04:23', '00:00:17', 2),
(27, '2024-02-22 01:04:39', '2024-02-22 01:05:00', '00:00:21', 2),
(28, '2024-02-22 09:12:18', '2024-02-22 09:12:18', '00:00:00', 2),
(29, '2024-02-22 09:47:56', '2024-02-22 09:47:56', '00:00:00', 2),
(30, '2024-02-24 22:17:10', '2024-02-24 22:17:10', '00:00:00', 2),
(31, '2024-02-25 03:46:41', '2024-02-25 03:46:41', '00:00:00', 2),
(32, '2024-02-28 22:47:52', '2024-02-28 22:48:07', '00:00:15', 3),
(33, '2024-02-28 22:48:21', '2024-02-28 23:41:59', '00:53:38', 4),
(34, '2024-02-28 23:42:05', '2024-02-28 23:49:39', '00:07:34', 2),
(35, '2024-02-28 23:49:58', '2024-02-28 23:50:07', '00:00:09', 2),
(36, '2024-02-28 23:50:33', '2024-02-28 23:50:38', '00:00:05', 4),
(37, '2024-02-28 23:51:22', '2024-02-28 23:51:26', '00:00:04', 3),
(38, '2024-02-28 23:52:46', '2024-02-28 23:59:40', '00:06:54', 2),
(39, '2024-02-28 23:59:48', '2024-02-29 00:19:05', '00:19:17', 2),
(40, '2024-02-29 00:19:18', '2024-02-29 00:43:56', '00:24:38', 4),
(41, '2024-02-29 00:44:07', '2024-02-29 02:14:52', '01:30:45', 2),
(42, '2024-02-29 02:15:02', '2024-02-29 02:16:19', '00:01:17', 4),
(43, '2024-02-29 02:16:27', '2024-02-29 03:07:36', '00:51:09', 2),
(44, '2024-02-29 03:07:45', '2024-02-29 03:08:28', '00:00:43', 4),
(45, '2024-02-29 03:08:37', '2024-02-29 03:08:37', '00:00:00', 2),
(46, '2024-03-12 04:27:00', '2024-03-12 04:27:30', '00:00:30', 3),
(47, '2024-03-12 04:27:43', '2024-03-12 04:28:40', '00:00:57', 4),
(48, '2024-03-12 04:28:52', '2024-03-12 04:35:21', '00:06:29', 3),
(49, '2024-03-12 04:35:31', '2024-03-12 04:35:31', '00:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `montant` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tax` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_users` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_elements`
--

DROP TABLE IF EXISTS `invoice_elements`;
CREATE TABLE IF NOT EXISTS `invoice_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `stocks_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_element_invoice` (`invoice_id`),
  KEY `fk_invoice_element_stocks` (`stocks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` int NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `cart_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `order_date`, `total_amount`, `status`, `user_id`, `cart_id`) VALUES
(1, 4, '2024-03-12 04:28:33', '67.27', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code_product` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `supplier_id` int NOT NULL,
  `warehouse_id` int NOT NULL,
  `image` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `min_quantity` int NOT NULL,
  `price` double(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_supplier` (`supplier_id`),
  KEY `fk_products_warehouse` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `code_product`, `supplier_id`, `warehouse_id`, `image`, `min_quantity`, `price`) VALUES
(1, 'Tilenol', '', 'T4567', 1, 1, NULL, 5, 23.40),
(2, 'Paracetamol2', 'Test', 'P768', 1, 2, NULL, 5, 12.19),
(3, 'Advile', 'Anti inflamatoire', 'A678', 2, 1, NULL, 5, 43.87),
(4, 'Bon Koga', '', 'B456', 1, 1, NULL, 10, 35.10),
(5, 'Trinid', 'Un produit de test', 'tt35', 2, 2, NULL, 10, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'Admin', ''),
(2, 'Agent', ''),
(3, 'Customer', '');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `name`, `expire_date`) VALUES
(1, 'A20248', '2024-02-16'),
(2, 'A278', '2024-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `stock_product`
--

DROP TABLE IF EXISTS `stock_product`;
CREATE TABLE IF NOT EXISTS `stock_product` (
  `stock_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  KEY `fk_stock_id` (`stock_id`),
  KEY `fk_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_product`
--

INSERT INTO `stock_product` (`stock_id`, `product_id`, `quantity`) VALUES
(1, 1, 0),
(1, 4, 33),
(1, 3, 0),
(2, 1, 47),
(2, 5, 85),
(2, 2, 0),
(2, 3, 25);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `adress` varchar(125) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(125) COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(125) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `adress`, `city`, `province`, `country`, `postal_code`, `phone`, `email`) VALUES
(1, 'MedSupply International', '123 Pharma Drive', 'Tredor', 'Cityville', 'Global', '12345', '+1-555-123-4567', 'info@medsupplyintl.com'),
(2, 'HealthCare Distributors Ltd', '456 Medical Plaza', 'Citytown', 'CT', 'United States', '54321', '+1-555-789-0123', 'info@healthcaredistributors.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adress` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `postal_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `actif` int NOT NULL DEFAULT '1',
  `image` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `designation`, `adress`, `city`, `province`, `country`, `postal_code`, `phone`, `email`, `password`, `actif`, `image`, `role_id`) VALUES
(2, 'Abdoulaye', 'Mohamed', 'Developer', '357 pascal avenue', 'Moncton', 'New Brunswick', 'country', '', '5068506548', 'admin@gmail.com', '$2y$10$mxu4KE3tqTdy8s34o1eTgu/pDFDcIptUbVh2MkC97XK24HRu02MKC', 1, 'hockey.png', 1),
(3, 'Ali', 'Sani', '', '', '', '', 'country', '', '', 'm2atodev@gmail.com', '$2y$10$ZkWc4jbbtcp8KRB8424IkenOiahdqGHtYsAV.4qVTP7tGTSo6Pg5O', 1, 'agro piece.png', 2),
(4, 'Fati', 'Amadou', 'Secretaire', '45 rue govin', 'Bathurst', 'New Brunswick', 'CA', 'E1A2C6', '5068598659', 'fati@gmail.com', '$2y$10$UfyW7UaIuxfnEuiMZS17JObEjaUvutOPHbDqp6DvFSr3dGdvNyClK', 1, '', 3),
(5, 'Dupom', 'Poupi', '', '', '', '', 'country', '', '', 'poupi@gmail.com', '$2y$10$WgwKYSRsq4opsQ4b0npAZeo2gH3TDlrgwW8vZWh9ILT.8HSVudScm', 0, 'agro piece.png', 3),
(6, 'Oumar', 'Moussa', 'RH', '', '', '', 'AF', 'E1A 2C', '', 'oumar@gmail.com', '$2y$10$yK0hyP693ZE94WVfNMgY7OkARBAWsgL6r1aW2Tv/GDOg9LZwWmADW', 1, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `adress` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `adress`, `city`, `province`, `country`) VALUES
(1, 'Central Pharmacy', NULL, 'Moncton', NULL, NULL),
(2, 'Regional Warehouse', NULL, 'Dieppe', NULL, NULL),
(3, 'Romeo2', '23 rue cord', 'Dieppe', 'New Brunswick', 'CX');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoice_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `invoice_elements`
--
ALTER TABLE `invoice_elements`
  ADD CONSTRAINT `fk_invoice_element_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `fk_invoice_element_stocks` FOREIGN KEY (`stocks_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `fk_products_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `stock_product`
--
ALTER TABLE `stock_product`
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `fk_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET FOREIGN_KEY_CHECKS = 1;