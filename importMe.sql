-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 02:37 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution', 'caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(23, 'society_ambulance', 0, NULL),
(24, 'society_cardealer', 0, NULL),
(25, 'society_police', 0, NULL),
(26, 'society_taxi', 0, NULL),
(27, 'caution', 0, 'steam:110000109405ebb'),
(28, 'property_black_money', 0, 'steam:110000109405ebb');

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `irpid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT '[]',
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `identifier`, `irpid`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `is_dead`, `last_property`) VALUES
(537, 'steam:110000109405ebb', 'a8GYCvUl5r', NULL, 0, '', '{\"moles_2\":0,\"mask_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"complexion_2\":0,\"skin\":0,\"age_2\":0,\"shoes_1\":0,\"ears_1\":-1,\"decals_1\":0,\"glasses_1\":0,\"beard_1\":0,\"bags_2\":0,\"blush_2\":0,\"lipstick_4\":0,\"tshirt_1\":0,\"hair_1\":1,\"makeup_3\":0,\"pants_1\":0,\"hair_color_1\":0,\"hair_color_2\":0,\"mask_1\":0,\"sex\":1,\"chain_2\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"makeup_1\":0,\"chest_2\":0,\"bodyb_1\":0,\"beard_4\":0,\"glasses_2\":0,\"ears_2\":0,\"complexion_1\":0,\"eye_color\":0,\"blush_3\":0,\"blush_1\":0,\"helmet_1\":-1,\"eyebrows_3\":0,\"decals_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"helmet_2\":0,\"eyebrows_2\":0,\"face\":2,\"bracelets_2\":0,\"bracelets_1\":-1,\"torso_2\":0,\"torso_1\":0,\"sun_1\":0,\"bags_1\":0,\"arms\":0,\"lipstick_1\":0,\"shoes_2\":0,\"arms_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"watches_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"chest_1\":0,\"beard_2\":0,\"hair_2\":0,\"chest_3\":0,\"moles_1\":0,\"chain_1\":0,\"blemishes_2\":0,\"age_1\":0,\"eyebrows_4\":0,\"beard_3\":0,\"bproof_2\":0,\"bproof_1\":0}', 'unemployed', 0, '[]', NULL, 4200, 0, NULL, 'Tester', 'Tester', '1900', 'm', '200', NULL, NULL, NULL),
(538, 'steam:110000109405ebb', 'onD6zouav4', NULL, 0, '', '{\"moles_2\":0,\"mask_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"complexion_2\":0,\"skin\":0,\"age_2\":0,\"shoes_1\":0,\"ears_1\":-1,\"decals_1\":0,\"glasses_1\":0,\"beard_1\":0,\"bags_2\":0,\"blush_2\":0,\"lipstick_4\":0,\"tshirt_1\":0,\"hair_1\":1,\"makeup_3\":0,\"pants_1\":0,\"hair_color_1\":0,\"hair_color_2\":0,\"mask_1\":0,\"sex\":1,\"chain_2\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"makeup_1\":0,\"chest_2\":0,\"bodyb_1\":0,\"beard_4\":0,\"glasses_2\":0,\"ears_2\":0,\"complexion_1\":0,\"eye_color\":0,\"blush_3\":0,\"blush_1\":0,\"helmet_1\":-1,\"eyebrows_3\":0,\"decals_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"helmet_2\":0,\"eyebrows_2\":0,\"face\":2,\"bracelets_2\":0,\"bracelets_1\":-1,\"torso_2\":0,\"torso_1\":0,\"sun_1\":0,\"bags_1\":0,\"arms\":0,\"lipstick_1\":0,\"shoes_2\":0,\"arms_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"watches_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"chest_1\":0,\"beard_2\":0,\"hair_2\":0,\"chest_3\":0,\"moles_1\":0,\"chain_1\":0,\"blemishes_2\":0,\"age_1\":0,\"eyebrows_4\":0,\"beard_3\":0,\"bproof_2\":0,\"bproof_1\":0}', 'unemployed', 0, '[]', NULL, 3600, 0, NULL, 'Tester', 'Tester', '1900', 'm', '200', NULL, NULL, NULL),
(539, 'steam:110000109405ebb', 'nVpCrSlQLP', NULL, 0, '', '{\"moles_2\":0,\"mask_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"complexion_2\":0,\"skin\":0,\"age_2\":0,\"shoes_1\":0,\"ears_1\":-1,\"decals_1\":0,\"glasses_1\":0,\"beard_1\":0,\"bags_2\":0,\"blush_2\":0,\"lipstick_4\":0,\"tshirt_1\":0,\"hair_1\":0,\"makeup_3\":0,\"pants_1\":0,\"hair_color_1\":0,\"hair_color_2\":0,\"mask_1\":0,\"sex\":0,\"chain_2\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"makeup_1\":0,\"chest_2\":0,\"bodyb_1\":0,\"beard_4\":0,\"glasses_2\":0,\"ears_2\":0,\"complexion_1\":0,\"eye_color\":0,\"blush_3\":0,\"blush_1\":0,\"helmet_1\":-1,\"eyebrows_3\":0,\"decals_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"helmet_2\":0,\"eyebrows_2\":0,\"face\":0,\"bracelets_2\":0,\"bracelets_1\":-1,\"torso_2\":0,\"torso_1\":0,\"sun_1\":0,\"bags_1\":0,\"arms\":0,\"lipstick_1\":0,\"shoes_2\":0,\"arms_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"watches_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"chest_1\":0,\"beard_2\":0,\"hair_2\":0,\"chest_3\":0,\"moles_1\":0,\"chain_1\":0,\"blemishes_2\":0,\"age_1\":0,\"eyebrows_4\":0,\"beard_3\":0,\"bproof_2\":0,\"bproof_1\":0}', 'unemployed', 0, '[]', NULL, 4800, 0, NULL, 'TestWater', 'TestWater', '1900', 'm', '200', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `character_inventory`
--

CREATE TABLE `character_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `irpid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `character_inventory`
--

INSERT INTO `character_inventory` (`id`, `identifier`, `irpid`, `item`, `count`) VALUES
(127, 'steam:110000109405ebb', 'e8sdOMUYf6', 'marijuana', 0),
(128, 'steam:110000109405ebb', 'e8sdOMUYf6', 'reeses', 0),
(129, 'steam:110000109405ebb', 'e8sdOMUYf6', 'packaged_chicken', 0),
(130, 'steam:110000109405ebb', 'e8sdOMUYf6', 'alive_chicken', 0),
(131, 'steam:110000109405ebb', 'e8sdOMUYf6', 'copper', 0),
(132, 'steam:110000109405ebb', 'e8sdOMUYf6', 'petrol_raffin', 0),
(133, 'steam:110000109405ebb', 'e8sdOMUYf6', 'diamond', 0),
(134, 'steam:110000109405ebb', 'e8sdOMUYf6', 'banana', 0),
(135, 'steam:110000109405ebb', 'e8sdOMUYf6', 'wool', 0),
(136, 'steam:110000109405ebb', 'e8sdOMUYf6', 'potatochips', 0),
(137, 'steam:110000109405ebb', 'e8sdOMUYf6', 'hotdog', 14),
(138, 'steam:110000109405ebb', 'e8sdOMUYf6', 'slaughtered_chicken', 0),
(139, 'steam:110000109405ebb', 'e8sdOMUYf6', 'cannabis', 0),
(140, 'steam:110000109405ebb', 'e8sdOMUYf6', 'keytovault', 0),
(141, 'steam:110000109405ebb', 'e8sdOMUYf6', 'fish', 0),
(142, 'steam:110000109405ebb', 'e8sdOMUYf6', 'packaged_plank', 0),
(143, 'steam:110000109405ebb', 'e8sdOMUYf6', 'pizza', 0),
(144, 'steam:110000109405ebb', 'e8sdOMUYf6', 'juicebox', 0),
(145, 'steam:110000109405ebb', 'e8sdOMUYf6', 'gold', 0),
(146, 'steam:110000109405ebb', 'e8sdOMUYf6', 'donut', 0),
(147, 'steam:110000109405ebb', 'e8sdOMUYf6', 'wood', 0),
(148, 'steam:110000109405ebb', 'e8sdOMUYf6', 'water', 0),
(149, 'steam:110000109405ebb', 'e8sdOMUYf6', 'washed_stone', 0),
(150, 'steam:110000109405ebb', 'e8sdOMUYf6', 'monster', 0),
(151, 'steam:110000109405ebb', 'e8sdOMUYf6', 'stone', 0),
(152, 'steam:110000109405ebb', 'e8sdOMUYf6', 'chocolatemilk', 0),
(153, 'steam:110000109405ebb', 'e8sdOMUYf6', 'fabric', 0),
(154, 'steam:110000109405ebb', 'e8sdOMUYf6', 'sourpatch', 0),
(155, 'steam:110000109405ebb', 'e8sdOMUYf6', 'cutted_wood', 0),
(156, 'steam:110000109405ebb', 'e8sdOMUYf6', 'bandage', 0),
(157, 'steam:110000109405ebb', 'e8sdOMUYf6', 'clothe', 0),
(158, 'steam:110000109405ebb', 'e8sdOMUYf6', 'essence', 0),
(159, 'steam:110000109405ebb', 'e8sdOMUYf6', 'petrol', 0),
(160, 'steam:110000109405ebb', 'e8sdOMUYf6', 'medikit', 0),
(161, 'steam:110000109405ebb', 'e8sdOMUYf6', 'iron', 0),
(162, 'steam:110000109405ebb', 'e8sdOMUYf6', 'bread', 0),
(253, 'steam:110000109405ebb', '2e44ILjiGo', 'marijuana', 0),
(254, 'steam:110000109405ebb', '2e44ILjiGo', 'reeses', 0),
(255, 'steam:110000109405ebb', '2e44ILjiGo', 'packaged_chicken', 0),
(256, 'steam:110000109405ebb', '2e44ILjiGo', 'alive_chicken', 0),
(257, 'steam:110000109405ebb', '2e44ILjiGo', 'copper', 0),
(258, 'steam:110000109405ebb', '2e44ILjiGo', 'petrol_raffin', 0),
(259, 'steam:110000109405ebb', '2e44ILjiGo', 'diamond', 0),
(260, 'steam:110000109405ebb', '2e44ILjiGo', 'banana', 0),
(261, 'steam:110000109405ebb', '2e44ILjiGo', 'wool', 0),
(262, 'steam:110000109405ebb', '2e44ILjiGo', 'potatochips', 0),
(263, 'steam:110000109405ebb', '2e44ILjiGo', 'hotdog', 14),
(264, 'steam:110000109405ebb', '2e44ILjiGo', 'slaughtered_chicken', 0),
(265, 'steam:110000109405ebb', '2e44ILjiGo', 'cannabis', 0),
(266, 'steam:110000109405ebb', '2e44ILjiGo', 'keytovault', 0),
(267, 'steam:110000109405ebb', '2e44ILjiGo', 'fish', 0),
(268, 'steam:110000109405ebb', '2e44ILjiGo', 'packaged_plank', 0),
(269, 'steam:110000109405ebb', '2e44ILjiGo', 'pizza', 0),
(270, 'steam:110000109405ebb', '2e44ILjiGo', 'juicebox', 0),
(271, 'steam:110000109405ebb', '2e44ILjiGo', 'gold', 0),
(272, 'steam:110000109405ebb', '2e44ILjiGo', 'donut', 0),
(273, 'steam:110000109405ebb', '2e44ILjiGo', 'wood', 0),
(274, 'steam:110000109405ebb', '2e44ILjiGo', 'water', 0),
(275, 'steam:110000109405ebb', '2e44ILjiGo', 'washed_stone', 0),
(276, 'steam:110000109405ebb', '2e44ILjiGo', 'monster', 0),
(277, 'steam:110000109405ebb', '2e44ILjiGo', 'stone', 0),
(278, 'steam:110000109405ebb', '2e44ILjiGo', 'chocolatemilk', 0),
(279, 'steam:110000109405ebb', '2e44ILjiGo', 'fabric', 0),
(280, 'steam:110000109405ebb', '2e44ILjiGo', 'sourpatch', 0),
(281, 'steam:110000109405ebb', '2e44ILjiGo', 'cutted_wood', 0),
(282, 'steam:110000109405ebb', '2e44ILjiGo', 'bandage', 0),
(283, 'steam:110000109405ebb', '2e44ILjiGo', 'clothe', 0),
(284, 'steam:110000109405ebb', '2e44ILjiGo', 'essence', 0),
(285, 'steam:110000109405ebb', '2e44ILjiGo', 'petrol', 0),
(286, 'steam:110000109405ebb', '2e44ILjiGo', 'medikit', 0),
(287, 'steam:110000109405ebb', '2e44ILjiGo', 'iron', 0),
(288, 'steam:110000109405ebb', '2e44ILjiGo', 'bread', 0),
(316, 'steam:110000109405ebb', 'IZVsyq4LXg', 'marijuana', 0),
(317, 'steam:110000109405ebb', 'IZVsyq4LXg', 'reeses', 0),
(318, 'steam:110000109405ebb', 'IZVsyq4LXg', 'packaged_chicken', 0),
(319, 'steam:110000109405ebb', 'IZVsyq4LXg', 'alive_chicken', 0),
(320, 'steam:110000109405ebb', 'IZVsyq4LXg', 'copper', 0),
(321, 'steam:110000109405ebb', 'IZVsyq4LXg', 'petrol_raffin', 0),
(322, 'steam:110000109405ebb', 'IZVsyq4LXg', 'diamond', 0),
(323, 'steam:110000109405ebb', 'IZVsyq4LXg', 'banana', 0),
(324, 'steam:110000109405ebb', 'IZVsyq4LXg', 'wool', 0),
(325, 'steam:110000109405ebb', 'IZVsyq4LXg', 'potatochips', 0),
(326, 'steam:110000109405ebb', 'IZVsyq4LXg', 'hotdog', 14),
(327, 'steam:110000109405ebb', 'IZVsyq4LXg', 'slaughtered_chicken', 0),
(328, 'steam:110000109405ebb', 'IZVsyq4LXg', 'cannabis', 0),
(329, 'steam:110000109405ebb', 'IZVsyq4LXg', 'keytovault', 0),
(330, 'steam:110000109405ebb', 'IZVsyq4LXg', 'fish', 0),
(331, 'steam:110000109405ebb', 'IZVsyq4LXg', 'packaged_plank', 0),
(332, 'steam:110000109405ebb', 'IZVsyq4LXg', 'pizza', 0),
(333, 'steam:110000109405ebb', 'IZVsyq4LXg', 'juicebox', 0),
(334, 'steam:110000109405ebb', 'IZVsyq4LXg', 'gold', 0),
(335, 'steam:110000109405ebb', 'IZVsyq4LXg', 'donut', 0),
(336, 'steam:110000109405ebb', 'IZVsyq4LXg', 'wood', 0),
(337, 'steam:110000109405ebb', 'IZVsyq4LXg', 'water', 0),
(338, 'steam:110000109405ebb', 'IZVsyq4LXg', 'washed_stone', 0),
(339, 'steam:110000109405ebb', 'IZVsyq4LXg', 'monster', 0),
(340, 'steam:110000109405ebb', 'IZVsyq4LXg', 'stone', 0),
(341, 'steam:110000109405ebb', 'IZVsyq4LXg', 'chocolatemilk', 0),
(342, 'steam:110000109405ebb', 'IZVsyq4LXg', 'fabric', 0),
(343, 'steam:110000109405ebb', 'IZVsyq4LXg', 'sourpatch', 0),
(344, 'steam:110000109405ebb', 'IZVsyq4LXg', 'cutted_wood', 0),
(345, 'steam:110000109405ebb', 'IZVsyq4LXg', 'bandage', 0),
(346, 'steam:110000109405ebb', 'IZVsyq4LXg', 'clothe', 0),
(347, 'steam:110000109405ebb', 'IZVsyq4LXg', 'essence', 0),
(348, 'steam:110000109405ebb', 'IZVsyq4LXg', 'petrol', 0),
(349, 'steam:110000109405ebb', 'IZVsyq4LXg', 'medikit', 0),
(350, 'steam:110000109405ebb', 'IZVsyq4LXg', 'iron', 0),
(351, 'steam:110000109405ebb', 'IZVsyq4LXg', 'bread', 0),
(1828, 'steam:110000109405ebb', 'a8GYCvUl5r', 'marijuana', 0),
(1829, 'steam:110000109405ebb', 'a8GYCvUl5r', 'reeses', 0),
(1830, 'steam:110000109405ebb', 'a8GYCvUl5r', 'packaged_chicken', 0),
(1831, 'steam:110000109405ebb', 'a8GYCvUl5r', 'alive_chicken', 0),
(1832, 'steam:110000109405ebb', 'a8GYCvUl5r', 'copper', 0),
(1833, 'steam:110000109405ebb', 'a8GYCvUl5r', 'petrol_raffin', 0),
(1834, 'steam:110000109405ebb', 'a8GYCvUl5r', 'diamond', 0),
(1835, 'steam:110000109405ebb', 'a8GYCvUl5r', 'banana', 0),
(1836, 'steam:110000109405ebb', 'a8GYCvUl5r', 'wool', 0),
(1837, 'steam:110000109405ebb', 'a8GYCvUl5r', 'potatochips', 0),
(1838, 'steam:110000109405ebb', 'a8GYCvUl5r', 'hotdog', 14),
(1839, 'steam:110000109405ebb', 'a8GYCvUl5r', 'slaughtered_chicken', 0),
(1840, 'steam:110000109405ebb', 'a8GYCvUl5r', 'cannabis', 0),
(1841, 'steam:110000109405ebb', 'a8GYCvUl5r', 'keytovault', 0),
(1842, 'steam:110000109405ebb', 'a8GYCvUl5r', 'fish', 0),
(1843, 'steam:110000109405ebb', 'a8GYCvUl5r', 'packaged_plank', 0),
(1844, 'steam:110000109405ebb', 'a8GYCvUl5r', 'pizza', 0),
(1845, 'steam:110000109405ebb', 'a8GYCvUl5r', 'juicebox', 0),
(1846, 'steam:110000109405ebb', 'a8GYCvUl5r', 'gold', 0),
(1847, 'steam:110000109405ebb', 'a8GYCvUl5r', 'donut', 0),
(1848, 'steam:110000109405ebb', 'a8GYCvUl5r', 'wood', 0),
(1849, 'steam:110000109405ebb', 'a8GYCvUl5r', 'water', 0),
(1850, 'steam:110000109405ebb', 'a8GYCvUl5r', 'washed_stone', 0),
(1851, 'steam:110000109405ebb', 'a8GYCvUl5r', 'monster', 0),
(1852, 'steam:110000109405ebb', 'a8GYCvUl5r', 'stone', 0),
(1853, 'steam:110000109405ebb', 'a8GYCvUl5r', 'chocolatemilk', 0),
(1854, 'steam:110000109405ebb', 'a8GYCvUl5r', 'fabric', 0),
(1855, 'steam:110000109405ebb', 'a8GYCvUl5r', 'sourpatch', 0),
(1856, 'steam:110000109405ebb', 'a8GYCvUl5r', 'cutted_wood', 0),
(1857, 'steam:110000109405ebb', 'a8GYCvUl5r', 'bandage', 0),
(1858, 'steam:110000109405ebb', 'a8GYCvUl5r', 'clothe', 0),
(1859, 'steam:110000109405ebb', 'a8GYCvUl5r', 'essence', 0),
(1860, 'steam:110000109405ebb', 'a8GYCvUl5r', 'petrol', 0),
(1861, 'steam:110000109405ebb', 'a8GYCvUl5r', 'medikit', 0),
(1862, 'steam:110000109405ebb', 'a8GYCvUl5r', 'iron', 0),
(1863, 'steam:110000109405ebb', 'a8GYCvUl5r', 'bread', 0),
(1891, 'steam:110000109405ebb', 'onD6zouav4', 'marijuana', 0),
(1892, 'steam:110000109405ebb', 'onD6zouav4', 'reeses', 0),
(1893, 'steam:110000109405ebb', 'onD6zouav4', 'packaged_chicken', 0),
(1894, 'steam:110000109405ebb', 'onD6zouav4', 'alive_chicken', 0),
(1895, 'steam:110000109405ebb', 'onD6zouav4', 'copper', 0),
(1896, 'steam:110000109405ebb', 'onD6zouav4', 'petrol_raffin', 0),
(1897, 'steam:110000109405ebb', 'onD6zouav4', 'diamond', 0),
(1898, 'steam:110000109405ebb', 'onD6zouav4', 'banana', 0),
(1899, 'steam:110000109405ebb', 'onD6zouav4', 'wool', 0),
(1900, 'steam:110000109405ebb', 'onD6zouav4', 'potatochips', 0),
(1901, 'steam:110000109405ebb', 'onD6zouav4', 'hotdog', 0),
(1902, 'steam:110000109405ebb', 'onD6zouav4', 'slaughtered_chicken', 0),
(1903, 'steam:110000109405ebb', 'onD6zouav4', 'cannabis', 0),
(1904, 'steam:110000109405ebb', 'onD6zouav4', 'keytovault', 0),
(1905, 'steam:110000109405ebb', 'onD6zouav4', 'fish', 0),
(1906, 'steam:110000109405ebb', 'onD6zouav4', 'packaged_plank', 0),
(1907, 'steam:110000109405ebb', 'onD6zouav4', 'pizza', 0),
(1908, 'steam:110000109405ebb', 'onD6zouav4', 'juicebox', 0),
(1909, 'steam:110000109405ebb', 'onD6zouav4', 'gold', 0),
(1910, 'steam:110000109405ebb', 'onD6zouav4', 'donut', 0),
(1911, 'steam:110000109405ebb', 'onD6zouav4', 'wood', 0),
(1912, 'steam:110000109405ebb', 'onD6zouav4', 'water', 0),
(1913, 'steam:110000109405ebb', 'onD6zouav4', 'washed_stone', 0),
(1914, 'steam:110000109405ebb', 'onD6zouav4', 'monster', 0),
(1915, 'steam:110000109405ebb', 'onD6zouav4', 'stone', 0),
(1916, 'steam:110000109405ebb', 'onD6zouav4', 'chocolatemilk', 0),
(1917, 'steam:110000109405ebb', 'onD6zouav4', 'fabric', 0),
(1918, 'steam:110000109405ebb', 'onD6zouav4', 'sourpatch', 0),
(1919, 'steam:110000109405ebb', 'onD6zouav4', 'cutted_wood', 0),
(1920, 'steam:110000109405ebb', 'onD6zouav4', 'bandage', 0),
(1921, 'steam:110000109405ebb', 'onD6zouav4', 'clothe', 0),
(1922, 'steam:110000109405ebb', 'onD6zouav4', 'essence', 0),
(1923, 'steam:110000109405ebb', 'onD6zouav4', 'petrol', 0),
(1924, 'steam:110000109405ebb', 'onD6zouav4', 'medikit', 0),
(1925, 'steam:110000109405ebb', 'onD6zouav4', 'iron', 0),
(1926, 'steam:110000109405ebb', 'onD6zouav4', 'bread', 0),
(1954, 'steam:110000109405ebb', 'nVpCrSlQLP', 'marijuana', 0),
(1955, 'steam:110000109405ebb', 'nVpCrSlQLP', 'reeses', 0),
(1956, 'steam:110000109405ebb', 'nVpCrSlQLP', 'packaged_chicken', 0),
(1957, 'steam:110000109405ebb', 'nVpCrSlQLP', 'alive_chicken', 0),
(1958, 'steam:110000109405ebb', 'nVpCrSlQLP', 'copper', 0),
(1959, 'steam:110000109405ebb', 'nVpCrSlQLP', 'petrol_raffin', 0),
(1960, 'steam:110000109405ebb', 'nVpCrSlQLP', 'diamond', 0),
(1961, 'steam:110000109405ebb', 'nVpCrSlQLP', 'banana', 0),
(1962, 'steam:110000109405ebb', 'nVpCrSlQLP', 'wool', 0),
(1963, 'steam:110000109405ebb', 'nVpCrSlQLP', 'potatochips', 0),
(1964, 'steam:110000109405ebb', 'nVpCrSlQLP', 'hotdog', 0),
(1965, 'steam:110000109405ebb', 'nVpCrSlQLP', 'slaughtered_chicken', 0),
(1966, 'steam:110000109405ebb', 'nVpCrSlQLP', 'cannabis', 0),
(1967, 'steam:110000109405ebb', 'nVpCrSlQLP', 'keytovault', 0),
(1968, 'steam:110000109405ebb', 'nVpCrSlQLP', 'fish', 0),
(1969, 'steam:110000109405ebb', 'nVpCrSlQLP', 'packaged_plank', 0),
(1970, 'steam:110000109405ebb', 'nVpCrSlQLP', 'pizza', 0),
(1971, 'steam:110000109405ebb', 'nVpCrSlQLP', 'juicebox', 0),
(1972, 'steam:110000109405ebb', 'nVpCrSlQLP', 'gold', 0),
(1973, 'steam:110000109405ebb', 'nVpCrSlQLP', 'donut', 0),
(1974, 'steam:110000109405ebb', 'nVpCrSlQLP', 'wood', 0),
(1975, 'steam:110000109405ebb', 'nVpCrSlQLP', 'water', 13),
(1976, 'steam:110000109405ebb', 'nVpCrSlQLP', 'washed_stone', 0),
(1977, 'steam:110000109405ebb', 'nVpCrSlQLP', 'monster', 0),
(1978, 'steam:110000109405ebb', 'nVpCrSlQLP', 'stone', 0),
(1979, 'steam:110000109405ebb', 'nVpCrSlQLP', 'chocolatemilk', 0),
(1980, 'steam:110000109405ebb', 'nVpCrSlQLP', 'fabric', 0),
(1981, 'steam:110000109405ebb', 'nVpCrSlQLP', 'sourpatch', 0),
(1982, 'steam:110000109405ebb', 'nVpCrSlQLP', 'cutted_wood', 0),
(1983, 'steam:110000109405ebb', 'nVpCrSlQLP', 'bandage', 0),
(1984, 'steam:110000109405ebb', 'nVpCrSlQLP', 'clothe', 0),
(1985, 'steam:110000109405ebb', 'nVpCrSlQLP', 'essence', 0),
(1986, 'steam:110000109405ebb', 'nVpCrSlQLP', 'petrol', 0),
(1987, 'steam:110000109405ebb', 'nVpCrSlQLP', 'medikit', 0),
(1988, 'steam:110000109405ebb', 'nVpCrSlQLP', 'iron', 0),
(1989, 'steam:110000109405ebb', 'nVpCrSlQLP', 'bread', 0);

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_ambulance', NULL, '{}'),
(2, 'society_police', NULL, '{\"weapons\":[{\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"name\":\"WEAPON_APPISTOL\",\"count\":0}]}'),
(3, 'society_taxi', NULL, '{}'),
(4, 'property', 'steam:110000109405ebb', '{}'),
(5, 'property', 'steam:110000106b31b55', '{}'),
(6, 'property', 'steam:11000013415581a', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Misuse of a horn', 30, 0),
(2, 'Illegally Crossing a continuous Line', 40, 0),
(3, 'Driving on the wrong side of the road', 250, 0),
(4, 'Illegal U-Turn', 250, 0),
(5, 'Illegally Driving Off-road', 170, 0),
(6, 'Refusing a Lawful Command', 30, 0),
(7, 'Illegally Stopping a Vehicle', 150, 0),
(8, 'Illegal Parking', 70, 0),
(9, 'Failing to Yield to the right', 70, 0),
(10, 'Failure to comply with Vehicle Information', 90, 0),
(11, 'Failing to stop at a Stop Sign ', 105, 0),
(12, 'Failing to stop at a Red Light', 130, 0),
(13, 'Illegal Passing', 100, 0),
(14, 'Driving an illegal Vehicle', 100, 0),
(15, 'Driving without a License', 1500, 0),
(16, 'Hit and Run', 800, 0),
(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
(21, 'Impeding traffic flow', 110, 1),
(22, 'Public Intoxication', 90, 1),
(23, 'Disorderly conduct', 90, 1),
(24, 'Obstruction of Justice', 130, 1),
(25, 'Insults towards Civilans', 75, 1),
(26, 'Disrespecting of an LEO', 110, 1),
(27, 'Verbal Threat towards a Civilan', 90, 1),
(28, 'Verbal Threat towards an LEO', 150, 1),
(29, 'Providing False Information', 250, 1),
(30, 'Attempt of Corruption', 1500, 1),
(31, 'Brandishing a weapon in city Limits', 120, 2),
(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
(33, 'No Firearms License', 600, 2),
(34, 'Possession of an Illegal Weapon', 700, 2),
(35, 'Possession of Burglary Tools', 300, 2),
(36, 'Grand Theft Auto', 1800, 2),
(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
(38, 'Frabrication of an Illegal Substance', 1500, 2),
(39, 'Possession of an Illegal Substance ', 650, 2),
(40, 'Kidnapping of a Civilan', 1500, 2),
(41, 'Kidnapping of an LEO', 2000, 2),
(42, 'Robbery', 650, 2),
(43, 'Armed Robbery of a Store', 650, 2),
(44, 'Armed Robbery of a Bank', 1500, 2),
(45, 'Assault on a Civilian', 2000, 3),
(46, 'Assault of an LEO', 2500, 3),
(47, 'Attempt of Murder of a Civilian', 3000, 3),
(48, 'Attempt of Murder of an LEO', 5000, 3),
(49, 'Murder of a Civilian', 10000, 3),
(50, 'Murder of an LEO', 30000, 3),
(51, 'Involuntary manslaughter', 1800, 3),
(52, 'Fraud', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  `limit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `limit`) VALUES
('alive_chicken', 'living chicken', 1, 0, 1, 20),
('banana', 'Banana', 1, 0, 1, 5),
('bandage', 'Bandage', 2, 0, 1, 0),
('bread', 'bread', 1, 0, 1, 10),
('cannabis', 'Cannabis', 1, 0, 1, 40),
('chocolatemilk', 'Chocolate Milk', 1, 0, 1, 5),
('clothe', 'cloth', 1, 0, 1, 40),
('copper', 'copper', 1, 0, 1, 56),
('cutted_wood', 'cut wood', 1, 0, 1, 20),
('diamond', 'diamond', 1, 0, 1, 50),
('donut', 'Dough Nut', 1, 0, 1, 12),
('essence', 'gas', 1, 0, 1, 24),
('fabric', 'fabric', 1, 0, 1, 80),
('fish', 'fish', 1, 0, 1, 100),
('gold', 'gold', 1, 0, 1, 21),
('hotdog', 'Hotdog', 1, 0, 1, 6),
('iron', 'iron', 1, 0, 1, 42),
('juicebox', 'Juice Box', 1, 0, 1, 6),
('keytovault', 'Pacific Bank Vault Key', 1, 0, 1, 1),
('marijuana', 'Marijuana', 1, 0, 1, 14),
('medikit', 'Medikit', 2, 0, 1, 0),
('monster', 'Monster', 1, 0, 1, 0),
('packaged_chicken', 'chicken fillet', 1, 0, 1, 100),
('packaged_plank', 'packaged wood', 1, 0, 1, 100),
('petrol', 'oil', 1, 0, 1, 24),
('petrol_raffin', 'processed oil', 1, 0, 1, 24),
('pizza', 'Pizza', 1, 0, 1, 8),
('potatochips', 'Potato Chips', 1, 0, 1, 6),
('reeses', 'Reeses', 1, 0, 1, 8),
('slaughtered_chicken', 'slaughtered chicken', 1, 0, 1, 20),
('sourpatch', 'Sour Patch Kids', 1, 0, 1, 6),
('stone', 'stone', 1, 0, 1, 7),
('washed_stone', 'washed stone', 1, 0, 1, 7),
('water', 'water', 1, 0, 1, 5),
('wood', 'wood', 1, 0, 1, 20),
('wool', 'wool', 1, 0, 1, 40);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'EMS', 0),
('cardealer', 'Cardealer', 0),
('fisherman', 'Fisherman', 0),
('fueler', 'Fueler', 0),
('lumberjack', 'Lumberjack', 0),
('miner', 'Miner', 0),
('police', 'Police', 0),
('reporter', 'Reporter', 0),
('slaughterer', 'Butcher', 0),
('tailor', 'Tailor', 0),
('taxi', 'Taxi', 0),
('unemployed', 'Unemployed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(2, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
(3, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
(4, 'fueler', 0, 'employee', 'Employee', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(5, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
(6, 'tailor', 0, 'employee', 'Employee', 0, '{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}', '{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(7, 'miner', 0, 'employee', 'Employee', 0, '{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}', '{}'),
(8, 'slaughterer', 0, 'employee', 'Employee', 0, '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}', '{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(9, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
(10, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
(11, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
(12, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(13, 'police', 4, 'boss', 'Chief', 100, '{}', '{}'),
(14, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(15, 'ambulance', 1, 'doctor', 'EMT', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(16, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(17, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(23, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(24, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(25, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
(26, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(27, 'taxi', 0, 'recrue', 'Recruit', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(28, 'taxi', 1, 'novice', 'Cabby', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(29, 'taxi', 2, 'experimente', 'Experienced', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(30, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(31, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('weapon', 'Permis de port d\'arme'),
('weed_processing', 'Weed Processing License');

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `stored` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `state`) VALUES
('steam:110000109405ebb', 'AAZ 565', '{\"modRearBumper\":-1,\"modLivery\":1,\"modSpoilers\":-1,\"modFrame\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"extras\":{\"8\":true,\"9\":false,\"5\":false,\"2\":false,\"3\":false,\"4\":false,\"1\":false,\"6\":false,\"7\":true,\"10\":false,\"11\":false},\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modTrimB\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"color1\":134,\"modVanityPlate\":-1,\"windowTint\":-1,\"modBrakes\":-1,\"color2\":134,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modHood\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"plate\":\"AAZ 565\",\"modArmor\":-1,\"bodyHealth\":1000.0,\"modPlateHolder\":-1,\"modFender\":-1,\"modDashboard\":-1,\"wheelColor\":156,\"modTank\":-1,\"modTransmission\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"fuelLevel\":75.1,\"modRoof\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"modXenon\":false,\"pearlescentColor\":156,\"plateIndex\":4,\"modEngine\":-1,\"dirtLevel\":0.0,\"modStruts\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"wheels\":1,\"model\":-1739648114}', 'car', 'police', 0, 1),
('steam:110000109405ebb', 'BWP 558', '{\"modRearBumper\":-1,\"modLivery\":0,\"modSpoilers\":-1,\"modFrame\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"extras\":{\"8\":false,\"9\":false,\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"6\":false,\"1\":true,\"12\":false,\"7\":false,\"10\":false,\"11\":false},\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modTrimB\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"color1\":134,\"modVanityPlate\":-1,\"windowTint\":-1,\"modBrakes\":-1,\"color2\":134,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modHood\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"plate\":\"BWP 558\",\"modArmor\":-1,\"bodyHealth\":1000.0,\"modPlateHolder\":-1,\"modFender\":-1,\"modDashboard\":-1,\"wheelColor\":156,\"modTank\":-1,\"modTransmission\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"fuelLevel\":69.7,\"modRoof\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"modXenon\":false,\"pearlescentColor\":156,\"plateIndex\":4,\"modEngine\":-1,\"dirtLevel\":1.0,\"modStruts\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"wheels\":0,\"model\":2023478304}', 'car', 'police', 0, 1),
('steam:110000106b31b55', 'CTD 338', '{\"modBackWheels\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modAerials\":-1,\"neonColor\":[255,0,255],\"modTank\":-1,\"model\":1475773103,\"modSuspension\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHood\":-1,\"modRearBumper\":-1,\"modFrontWheels\":-1,\"wheels\":1,\"plate\":\"CTD 338\",\"modTrimA\":-1,\"modSeats\":-1,\"modGrille\":-1,\"modStruts\":-1,\"modEngine\":-1,\"modHorns\":-1,\"dirtLevel\":7.0,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modExhaust\":-1,\"plateIndex\":0,\"modBrakes\":-1,\"modOrnaments\":-1,\"modSpeakers\":-1,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modRoof\":-1,\"modDial\":-1,\"modRightFender\":-1,\"bodyHealth\":1000.0,\"modWindows\":-1,\"fuelLevel\":65.0,\"modDoorSpeaker\":-1,\"modAirFilter\":-1,\"modAPlate\":-1,\"extras\":{\"5\":true,\"3\":true,\"4\":true,\"1\":true,\"2\":true,\"9\":false,\"8\":true},\"modHydrolic\":-1,\"wheelColor\":156,\"windowTint\":-1,\"modArmor\":-1,\"modXenon\":false,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"color1\":105,\"modTrimB\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modTurbo\":false,\"tyreSmokeColor\":[255,255,255],\"color2\":1,\"modSideSkirt\":-1,\"modLivery\":-1,\"modFrame\":-1,\"pearlescentColor\":1,\"modSpoilers\":-1}', '', '', 0, 1),
('steam:110000106b31b55', 'GIT 639', '{\"model\":-2007026063,\"modSuspension\":-1,\"modTransmission\":-1,\"modTurbo\":false,\"modEngine\":-1,\"modPlateHolder\":-1,\"modDashboard\":-1,\"color1\":77,\"modOrnaments\":-1,\"modFrontBumper\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"modDial\":-1,\"modBackWheels\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"color2\":0,\"windowTint\":-1,\"fuelLevel\":21.0,\"modSmokeEnabled\":false,\"wheels\":0,\"modTrimB\":-1,\"modAerials\":-1,\"modRoof\":-1,\"modGrille\":-1,\"modExhaust\":-1,\"modSeats\":-1,\"extras\":[],\"plateIndex\":4,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"modTrunk\":-1,\"dirtLevel\":10.0,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modAPlate\":-1,\"modRightFender\":-1,\"wheelColor\":156,\"modShifterLeavers\":-1,\"modWindows\":-1,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modStruts\":-1,\"modBrakes\":-1,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"modFrame\":-1,\"pearlescentColor\":0,\"modHood\":-1,\"modHorns\":-1,\"plate\":\"GIT 639\",\"modFender\":-1,\"modXenon\":false,\"tyreSmokeColor\":[255,255,255],\"modLivery\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modRearBumper\":-1,\"modSpeakers\":-1}', 'car', 'police', 0, 1),
('steam:110000109405ebb', 'INZ 838', '{\"modRearBumper\":-1,\"modLivery\":0,\"modSpoilers\":-1,\"modFrame\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"extras\":{\"2\":false,\"3\":true,\"1\":false},\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modTrimB\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"color1\":0,\"modVanityPlate\":-1,\"windowTint\":-1,\"modBrakes\":-1,\"color2\":0,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modHood\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"plate\":\"INZ 838\",\"modArmor\":-1,\"bodyHealth\":1000.0,\"modPlateHolder\":-1,\"modFender\":-1,\"modDashboard\":-1,\"wheelColor\":156,\"modTank\":-1,\"modTransmission\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"fuelLevel\":78.3,\"modRoof\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"modXenon\":false,\"pearlescentColor\":156,\"plateIndex\":4,\"modEngine\":-1,\"dirtLevel\":0.0,\"modStruts\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"wheels\":1,\"model\":-85613452}', 'car', 'police', 0, 1),
('steam:110000109405ebb', 'KVJ 900', '{\"modRearBumper\":-1,\"modLivery\":0,\"modSpoilers\":-1,\"modFrame\":-1,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"extras\":{\"8\":false,\"9\":false,\"5\":false,\"2\":true,\"3\":false,\"4\":false,\"1\":false,\"6\":false,\"7\":false,\"10\":false,\"11\":true},\"tyreSmokeColor\":[255,255,255],\"neonColor\":[255,0,255],\"modTrimB\":-1,\"modFrontBumper\":-1,\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modHorns\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"color1\":134,\"modVanityPlate\":-1,\"windowTint\":-1,\"modBrakes\":-1,\"color2\":134,\"modSideSkirt\":-1,\"modAirFilter\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"engineHealth\":1000.0,\"modGrille\":-1,\"modHood\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"plate\":\"KVJ 900\",\"modArmor\":-1,\"bodyHealth\":1000.0,\"modPlateHolder\":-1,\"modFender\":-1,\"modDashboard\":-1,\"wheelColor\":156,\"modTank\":-1,\"modTransmission\":-1,\"modSpeakers\":-1,\"modTrunk\":-1,\"fuelLevel\":48.9,\"modRoof\":-1,\"modRightFender\":-1,\"modSeats\":-1,\"modXenon\":false,\"pearlescentColor\":156,\"plateIndex\":4,\"modEngine\":-1,\"dirtLevel\":0.0,\"modStruts\":-1,\"modSuspension\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modFrontWheels\":-1,\"wheels\":1,\"model\":-1739648114}', 'car', 'police', 0, 1),
('steam:110000109405ebb', 'OPX 905', '{\"modTrimA\":-1,\"modSmokeEnabled\":false,\"model\":330661258,\"modFrontBumper\":-1,\"modFender\":-1,\"modTransmission\":-1,\"modDoorSpeaker\":-1,\"modTrunk\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"neonColor\":[255,0,255],\"wheelColor\":156,\"modEngineBlock\":-1,\"modHood\":-1,\"fuelLevel\":65.0,\"modArmor\":-1,\"modTurbo\":false,\"pearlescentColor\":24,\"modWindows\":-1,\"modRightFender\":-1,\"color1\":2,\"modVanityPlate\":-1,\"modAerials\":-1,\"modSeats\":-1,\"bodyHealth\":1000.0,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSuspension\":-1,\"wheels\":0,\"modSideSkirt\":-1,\"modDial\":-1,\"modOrnaments\":-1,\"modGrille\":-1,\"tyreSmokeColor\":[255,255,255],\"modHorns\":-1,\"modTank\":-1,\"modBrakes\":-1,\"dirtLevel\":9.0,\"modRearBumper\":-1,\"modPlateHolder\":-1,\"modLivery\":-1,\"modSpoilers\":-1,\"modFrame\":-1,\"extras\":[],\"modDashboard\":-1,\"plateIndex\":0,\"neonEnabled\":[false,false,false,false],\"engineHealth\":1000.0,\"modStruts\":-1,\"color2\":1,\"modEngine\":-1,\"modExhaust\":-1,\"modBackWheels\":-1,\"modArchCover\":-1,\"modAPlate\":-1,\"modSteeringWheel\":-1,\"modXenon\":false,\"modHydrolic\":-1,\"plate\":\"OPX 905\",\"modAirFilter\":-1,\"modRoof\":-1,\"modTrimB\":-1}', '', '', 0, 0),
('steam:110000106b31b55', 'PFV 752', '{\"modSteeringWheel\":-1,\"engineHealth\":724.7,\"modOrnaments\":-1,\"modAerials\":-1,\"wheels\":1,\"color2\":1,\"modTurbo\":false,\"modSuspension\":-1,\"modStruts\":-1,\"modEngine\":-1,\"modFrontWheels\":-1,\"modXenon\":false,\"modSpoilers\":-1,\"modTransmission\":-1,\"modArchCover\":-1,\"modHood\":-1,\"plate\":\"PFV 752\",\"modRightFender\":-1,\"modTrimA\":-1,\"modAPlate\":-1,\"modWindows\":-1,\"modDoorSpeaker\":-1,\"plateIndex\":0,\"modTrimB\":-1,\"model\":1475773103,\"modGrille\":-1,\"wheelColor\":156,\"modFrame\":-1,\"modTrunk\":-1,\"neonColor\":[255,0,255],\"extras\":{\"5\":true,\"4\":true,\"3\":true,\"2\":true,\"9\":false,\"8\":true,\"1\":true},\"modHydrolic\":-1,\"modTank\":-1,\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"modEngineBlock\":-1,\"modFrontBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":22.1,\"modDial\":-1,\"pearlescentColor\":1,\"modDashboard\":-1,\"modRoof\":-1,\"modRearBumper\":-1,\"modLivery\":-1,\"windowTint\":-1,\"modBackWheels\":-1,\"modArmor\":-1,\"modSideSkirt\":-1,\"modSpeakers\":-1,\"bodyHealth\":420.6,\"color1\":105,\"neonEnabled\":[false,false,false,false],\"modBrakes\":-1,\"modSeats\":-1,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"dirtLevel\":9.9,\"modExhaust\":-1,\"modFender\":-1,\"modHorns\":-1}', '', '', 0, 1),
('steam:110000106b31b55', 'SVC 892', '{\"modTank\":-1,\"modLivery\":0,\"modFrontBumper\":-1,\"modAPlate\":-1,\"neonColor\":[255,0,255],\"wheels\":1,\"modXenon\":false,\"modSuspension\":-1,\"engineHealth\":1000.0,\"modTrunk\":-1,\"modHood\":-1,\"modDoorSpeaker\":-1,\"modFrontWheels\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"modTrimA\":-1,\"modSeats\":-1,\"modGrille\":-1,\"modOrnaments\":-1,\"modEngine\":-1,\"modFender\":-1,\"dirtLevel\":6.0,\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modRightFender\":-1,\"wheelColor\":156,\"modExhaust\":-1,\"modFrame\":-1,\"modBrakes\":-1,\"modSideSkirt\":-1,\"modSpeakers\":-1,\"neonEnabled\":[false,false,false,false],\"modAirFilter\":-1,\"modStruts\":-1,\"modVanityPlate\":-1,\"plate\":\"SVC 892\",\"modDial\":-1,\"modWindows\":-1,\"modArchCover\":-1,\"bodyHealth\":1000.0,\"modEngineBlock\":-1,\"modAerials\":-1,\"model\":1162065741,\"extras\":[],\"modHorns\":-1,\"windowTint\":-1,\"modArmor\":-1,\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modPlateHolder\":-1,\"color1\":26,\"modTrimB\":-1,\"fuelLevel\":65.0,\"modShifterLeavers\":-1,\"modTurbo\":false,\"modDashboard\":-1,\"color2\":0,\"tyreSmokeColor\":[255,255,255],\"modRoof\":-1,\"plateIndex\":3,\"pearlescentColor\":5,\"modSpoilers\":-1}', '', '', 0, 1),
('steam:110000109405ebb', 'WBX 554', '{\"modGrille\":-1,\"modAPlate\":-1,\"modTurbo\":false,\"modSpoilers\":-1,\"engineHealth\":1000.0,\"modArmor\":-1,\"modShifterLeavers\":-1,\"modXenon\":false,\"modRightFender\":-1,\"extras\":{\"10\":false,\"11\":true,\"12\":false,\"1\":false},\"modTank\":-1,\"modEngine\":-1,\"plateIndex\":3,\"modEngineBlock\":-1,\"modTrimA\":-1,\"modAirFilter\":-1,\"modFender\":-1,\"modLivery\":-1,\"modDial\":-1,\"modHydrolic\":-1,\"modSideSkirt\":-1,\"tyreSmokeColor\":[255,255,255],\"modSteeringWheel\":-1,\"modSmokeEnabled\":false,\"modFrontBumper\":-1,\"wheels\":3,\"modSuspension\":-1,\"dirtLevel\":3.0,\"modStruts\":-1,\"modOrnaments\":-1,\"windowTint\":-1,\"modHood\":-1,\"fuelLevel\":70.8,\"modDashboard\":-1,\"modBrakes\":-1,\"modArchCover\":-1,\"modWindows\":-1,\"modPlateHolder\":-1,\"modFrontWheels\":-1,\"modVanityPlate\":-1,\"modDoorSpeaker\":-1,\"plate\":\"WBX 554\",\"modExhaust\":-1,\"modSpeakers\":-1,\"modTransmission\":-1,\"modHorns\":-1,\"modBackWheels\":-1,\"color1\":2,\"neonEnabled\":[false,false,false,false],\"color2\":2,\"model\":1069929536,\"pearlescentColor\":4,\"modTrimB\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"modTrunk\":-1,\"modFrame\":-1,\"bodyHealth\":1000.0,\"modAerials\":-1,\"modRoof\":-1,\"wheelColor\":156,\"modRearBumper\":-1}', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `entering` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `exit` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `outside` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipls` varchar(255) COLLATE utf8mb4_bin DEFAULT '[]',
  `gateway` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000);

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `store` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(7, 'RobsLiquor', 'banana', 2),
(8, 'RobsLiquor', 'chocolatemilk', 4),
(9, 'RobsLiquor', 'donut', 2),
(14, 'RobsLiquor', 'reeses', 2),
(15, 'RobsLiquor', 'sourpatch', 2),
(16, 'RobsLiquor', 'bread', 4),
(17, 'RobsLiquor', 'water', 2),
(18, 'RobsLiquor', 'hotdog', 2),
(19, 'RobsLiquor', 'juicebox', 3),
(20, 'RobsLiquor', 'pizza', 4),
(21, 'RobsLiquor', 'potatochips', 3),
(23, 'LTDgasoline', 'banana', 2),
(24, 'LTDgasoline', 'chocolatemilk', 4),
(25, 'LTDgasoline', 'donut', 2),
(26, 'LTDgasoline', 'reeses', 2),
(27, 'LTDgasoline', 'sourpatch', 2),
(28, 'LTDgasoline', 'bread', 4),
(29, 'LTDgasoline', 'water', 2),
(30, 'LTDgasoline', 'hotdog', 2),
(31, 'LTDgasoline', 'juicebox', 3),
(32, 'LTDgasoline', 'pizza', 4),
(33, 'LTDgasoline', 'potatochips', 3),
(34, 'TwentyFourSeven', 'banana', 2),
(35, 'TwentyFourSeven', 'chocolatemilk', 4),
(36, 'TwentyFourSeven', 'donut', 2),
(37, 'TwentyFourSeven', 'reeses', 2),
(38, 'TwentyFourSeven', 'sourpatch', 2),
(39, 'TwentyFourSeven', 'bread', 4),
(40, 'TwentyFourSeven', 'water', 2),
(41, 'TwentyFourSeven', 'hotdog', 2),
(42, 'TwentyFourSeven', 'pizza', 4),
(43, 'TwentyFourSeven', 'potatochips', 3),
(44, 'TwentyFourSeven', 'monster', 2),
(45, 'RobsLiquor', 'monster', 2),
(46, 'LTDgasoline', 'monster', 2),
(47, 'TwentyFourSeven', 'juicebox', 3);

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `truck_inventory`
--

CREATE TABLE `truck_inventory` (
  `id` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `owned` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `irpid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT '[]',
  `position` varchar(36) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `irpid`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `is_dead`, `last_property`) VALUES
('steam:110000109405ebb', 'nVpCrSlQLP', 'license:497ca7ff807cd6a340e04f957603553f93d2f55b', 0, 'PerFect', '{\"moles_2\":0,\"mask_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"complexion_2\":0,\"skin\":0,\"age_2\":0,\"shoes_1\":0,\"ears_1\":-1,\"decals_1\":0,\"glasses_1\":0,\"beard_1\":0,\"bags_2\":0,\"blush_2\":0,\"lipstick_4\":0,\"tshirt_1\":0,\"hair_1\":0,\"makeup_3\":0,\"pants_1\":0,\"hair_color_1\":0,\"hair_color_2\":0,\"mask_1\":0,\"sex\":0,\"chain_2\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"bodyb_2\":0,\"makeup_1\":0,\"chest_2\":0,\"bodyb_1\":0,\"beard_4\":0,\"glasses_2\":0,\"ears_2\":0,\"complexion_1\":0,\"eye_color\":0,\"blush_3\":0,\"blush_1\":0,\"helmet_1\":-1,\"eyebrows_3\":0,\"decals_2\":0,\"lipstick_2\":0,\"watches_2\":0,\"helmet_2\":0,\"eyebrows_2\":0,\"face\":0,\"bracelets_2\":0,\"bracelets_1\":-1,\"torso_2\":0,\"torso_1\":0,\"sun_1\":0,\"bags_1\":0,\"arms\":0,\"lipstick_1\":0,\"shoes_2\":0,\"arms_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"watches_1\":-1,\"pants_2\":0,\"makeup_4\":0,\"chest_1\":0,\"beard_2\":0,\"hair_2\":0,\"chest_3\":0,\"moles_1\":0,\"chain_1\":0,\"blemishes_2\":0,\"age_1\":0,\"eyebrows_4\":0,\"beard_3\":0,\"bproof_2\":0,\"bproof_1\":0}', 'unemployed', 0, '[]', '{\"y\":-1388.0,\"z\":32.1,\"x\":325.1}', 5600, 0, 'superadmin', 'TestWater', 'TestWater', '1900', 'm', '200', '[{\"percent\":81.16,\"name\":\"hunger\",\"val\":811600},{\"percent\":93.8725,\"name\":\"thirst\",\"val\":938725}]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(40, 'steam:110000109405ebb', 'black_money', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `irpid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `irpid`, `item`, `count`) VALUES
(73, 'steam:110000109405ebb', 'nVpCrSlQLP', 'marijuana', 0),
(74, 'steam:110000109405ebb', 'nVpCrSlQLP', 'reeses', 0),
(75, 'steam:110000109405ebb', 'nVpCrSlQLP', 'packaged_chicken', 0),
(76, 'steam:110000109405ebb', 'nVpCrSlQLP', 'alive_chicken', 0),
(77, 'steam:110000109405ebb', 'nVpCrSlQLP', 'copper', 0),
(78, 'steam:110000109405ebb', 'nVpCrSlQLP', 'petrol_raffin', 0),
(79, 'steam:110000109405ebb', 'nVpCrSlQLP', 'diamond', 0),
(80, 'steam:110000109405ebb', 'nVpCrSlQLP', 'banana', 0),
(81, 'steam:110000109405ebb', 'nVpCrSlQLP', 'wool', 0),
(82, 'steam:110000109405ebb', 'nVpCrSlQLP', 'potatochips', 0),
(83, 'steam:110000109405ebb', 'nVpCrSlQLP', 'hotdog', 0),
(84, 'steam:110000109405ebb', 'nVpCrSlQLP', 'slaughtered_chicken', 0),
(85, 'steam:110000109405ebb', 'nVpCrSlQLP', 'cannabis', 0),
(86, 'steam:110000109405ebb', 'nVpCrSlQLP', 'keytovault', 0),
(87, 'steam:110000109405ebb', 'nVpCrSlQLP', 'fish', 0),
(88, 'steam:110000109405ebb', 'nVpCrSlQLP', 'packaged_plank', 0),
(89, 'steam:110000109405ebb', 'nVpCrSlQLP', 'pizza', 0),
(90, 'steam:110000109405ebb', 'nVpCrSlQLP', 'juicebox', 0),
(91, 'steam:110000109405ebb', 'nVpCrSlQLP', 'gold', 0),
(92, 'steam:110000109405ebb', 'nVpCrSlQLP', 'donut', 0),
(93, 'steam:110000109405ebb', 'nVpCrSlQLP', 'wood', 0),
(94, 'steam:110000109405ebb', 'nVpCrSlQLP', 'water', 13),
(95, 'steam:110000109405ebb', 'nVpCrSlQLP', 'washed_stone', 0),
(96, 'steam:110000109405ebb', 'nVpCrSlQLP', 'monster', 0),
(97, 'steam:110000109405ebb', 'nVpCrSlQLP', 'stone', 0),
(98, 'steam:110000109405ebb', 'nVpCrSlQLP', 'chocolatemilk', 0),
(99, 'steam:110000109405ebb', 'nVpCrSlQLP', 'fabric', 0),
(100, 'steam:110000109405ebb', 'nVpCrSlQLP', 'sourpatch', 0),
(101, 'steam:110000109405ebb', 'nVpCrSlQLP', 'cutted_wood', 0),
(102, 'steam:110000109405ebb', 'nVpCrSlQLP', 'bandage', 0),
(103, 'steam:110000109405ebb', 'nVpCrSlQLP', 'clothe', 0),
(104, 'steam:110000109405ebb', 'nVpCrSlQLP', 'essence', 0),
(105, 'steam:110000109405ebb', 'nVpCrSlQLP', 'petrol', 0),
(106, 'steam:110000109405ebb', 'nVpCrSlQLP', 'medikit', 0),
(107, 'steam:110000109405ebb', 'nVpCrSlQLP', 'iron', 0),
(108, 'steam:110000109405ebb', 'nVpCrSlQLP', 'bread', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(2, 'weapon', 'steam:110000109405ebb');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Adder', 'adder', 900000, 'super'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupes'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Table structure for table `weashops`
--

CREATE TABLE `weashops` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weashops`
--

INSERT INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
(1, 'GunShop', 'WEAPON_PISTOL', 300),
(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
(5, 'GunShop', 'WEAPON_MACHETE', 90),
(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
(9, 'GunShop', 'WEAPON_BAT', 100),
(10, 'BlackWeashop', 'WEAPON_BAT', 100),
(11, 'GunShop', 'WEAPON_STUNGUN', 50),
(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
(25, 'GunShop', 'WEAPON_GRENADE', 500),
(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
(27, 'GunShop', 'WEAPON_BZGAS', 200),
(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
(31, 'GunShop', 'WEAPON_BALL', 50),
(32, 'BlackWeashop', 'WEAPON_BALL', 50),
(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Indexes for table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_inventory`
--
ALTER TABLE `character_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Indexes for table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `truck_inventory`
--
ALTER TABLE `truck_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item` (`item`,`plate`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `weashops`
--
ALTER TABLE `weashops`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=540;

--
-- AUTO_INCREMENT for table `character_inventory`
--
ALTER TABLE `character_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2017;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `truck_inventory`
--
ALTER TABLE `truck_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weashops`
--
ALTER TABLE `weashops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
