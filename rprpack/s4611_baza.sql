-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 185.16.39.91
-- Generation Time: Apr 10, 2024 at 07:38 PM
-- Server version: 10.9.5-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s4611_baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('bank_savings', 'Savings account', 0),
('caution', 'caution', 0),
('property_black_money', 'Argent Sale Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_banker', 'Bank', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_police', 528500, NULL),
(3, 'society_ambulance', 6000, NULL),
(4, 'society_mechanic', 0, NULL),
(5, 'society_taxi', 0, NULL),
(9, 'society_banker', 0, NULL),
(10, 'bank_savings', 0, 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45'),
(11, 'caution', 0, 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45'),
(14, 'caution', 0, 'char3:030ec26b21f4602ea536b6d004cd108b2ad83f45'),
(15, 'bank_savings', 0, 'char3:030ec26b21f4602ea536b6d004cd108b2ad83f45'),
(16, 'bank_savings', 0, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527'),
(17, 'caution', 0, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527'),
(18, 'property_black_money', 0, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527'),
(19, 'bank_savings', 0, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a'),
(20, 'caution', 0, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a'),
(21, 'property_black_money', 0, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a'),
(22, 'bank_savings', 0, 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f'),
(23, 'caution', 0, 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f'),
(24, 'property_black_money', 0, 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f'),
(25, 'bank_savings', 0, 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1'),
(26, 'caution', 0, 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1'),
(27, 'property_black_money', 0, 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1'),
(28, 'bank_savings', 0, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f'),
(29, 'caution', 0, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f'),
(30, 'property_black_money', 0, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f'),
(31, 'bank_savings', 0, 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056'),
(32, 'caution', 0, 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056'),
(33, 'property_black_money', 0, 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056'),
(34, 'bank_savings', 0, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4'),
(35, 'caution', 0, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4'),
(36, 'property_black_money', 0, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4'),
(37, 'property_black_money', 0, 'char1:636f6db328aeabc289967ff088473d12badf4d5f'),
(38, 'bank_savings', 0, 'char1:636f6db328aeabc289967ff088473d12badf4d5f'),
(39, 'caution', 0, 'char1:636f6db328aeabc289967ff088473d12badf4d5f'),
(40, 'bank_savings', 0, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b'),
(41, 'caution', 0, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b'),
(42, 'property_black_money', 0, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b'),
(43, 'bank_savings', 0, 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f'),
(44, 'property_black_money', 0, 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f'),
(45, 'caution', 0, 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f'),
(46, 'bank_savings', 0, 'char1:464736841e79f93c754f65f47d219b81e7b0d50a'),
(47, 'caution', 0, 'char1:464736841e79f93c754f65f47d219b81e7b0d50a'),
(48, 'property_black_money', 0, 'char1:464736841e79f93c754f65f47d219b81e7b0d50a'),
(49, 'bank_savings', 0, 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b'),
(50, 'property_black_money', 0, 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b'),
(51, 'caution', 0, 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b'),
(52, 'bank_savings', 0, 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb'),
(53, 'caution', 0, 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb'),
(54, 'property_black_money', 0, 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb'),
(55, 'caution', 0, 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5'),
(56, 'bank_savings', 0, 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5'),
(57, 'property_black_money', 0, 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5'),
(58, 'bank_savings', 0, 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d'),
(59, 'property_black_money', 0, 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d'),
(60, 'caution', 0, 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d'),
(61, 'bank_savings', 0, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541'),
(62, 'caution', 0, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541'),
(63, 'property_black_money', 0, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541'),
(64, 'bank_savings', 0, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea'),
(65, 'property_black_money', 0, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea'),
(66, 'caution', 0, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea');

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'EMS', 1),
('society_cardealer', 'Cardealer', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `av_vehicleshop`
--

CREATE TABLE `av_vehicleshop` (
  `name` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banking`
--

CREATE TABLE `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `balance` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cardealer_vehicles`
--

INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`) VALUES
(1, 'adder', 10),
(2, 'sultanrs', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Property', 0),
('society_ambulance', 'EMS', 1),
('society_mechanic', 'Mechanic', 1),
('society_police', 'Police', 1),
('society_taxi', 'Taxi', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Table structure for table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'society_police', NULL, '{}'),
(2, 'society_ambulance', NULL, '{}'),
(3, 'society_mechanic', NULL, '{}'),
(4, 'society_taxi', NULL, '{}'),
(5, 'property', NULL, '{}'),
(6, 'property', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '{\"dressing\":[{\"skin\":{\"cheeks_3\":0,\"pants_2\":0,\"lipstick_3\":0,\"tattoos\":[],\"watches_1\":-1,\"neck\":10,\"lip_thickness\":0,\"props\":[{\"prop_id\":0,\"drawable\":184,\"texture\":1},{\"prop_id\":1,\"drawable\":0,\"texture\":0},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}],\"blend_skin\":0,\"decals_2\":0,\"eyebrow_2\":10,\"sex\":0,\"moles_2\":0,\"lipstick_1\":0,\"bracelets_1\":-1,\"skin\":0,\"blush_2\":0,\"torso_2\":0,\"eyeColor\":0,\"chain_2\":0,\"moles_1\":0,\"sun_1\":0,\"helmet_1\":233,\"shoes_2\":0,\"bproof_2\":0,\"nose_3\":0,\"chest_1\":0,\"face_3\":0,\"eye_squint\":0,\"hair_1\":32,\"chimp_4\":10,\"chimp_2\":10,\"mom\":21,\"bracelets_2\":0,\"face_md_weight\":50,\"cheeks_1\":0,\"chin_13\":0,\"faceFeatures\":{\"nosePeakLowering\":-1,\"eyeBrownHigh\":0,\"nosePeakSize\":-1,\"noseWidth\":-1,\"jawBoneWidth\":-1,\"chinBoneLenght\":0,\"cheeksWidth\":-1,\"neckThickness\":0,\"chinBoneSize\":0,\"cheeksBoneWidth\":-1,\"noseBoneTwist\":-1,\"cheeksBoneHigh\":-1,\"jawBoneBackSize\":0,\"chinBoneLowering\":0,\"noseBoneHigh\":-1,\"chinHole\":0,\"nosePeakHigh\":-1,\"lipsThickness\":0,\"eyeBrownForward\":0,\"eyesOpening\":-1},\"arms_2\":0,\"tshirt_1\":202,\"lipstick_4\":0,\"nose_5\":0,\"glasses_2\":0,\"bags_1\":0,\"bodyb_3\":-1,\"eyebrows_1\":0,\"sun_2\":0,\"blush_3\":0,\"bproof_1\":0,\"eyebrows_2\":0,\"blend\":0,\"nose_6\":0,\"skin_2\":0,\"neck_thickness\":0,\"chest_2\":0,\"makeup_2\":0,\"age_1\":0,\"chin_1\":0,\"mask_2\":0,\"nose_1\":0,\"skin_3\":0,\"hair_3\":0,\"hair_2\":0,\"bodyb_1\":-1,\"lips\":10,\"eyebrow_1\":10,\"nose_2\":0,\"age_2\":0,\"bodyb_4\":0,\"helmet_2\":0,\"torso_1\":343,\"dad\":0,\"components\":[{\"drawable\":0,\"component_id\":0,\"texture\":0},{\"drawable\":0,\"component_id\":1,\"texture\":0},{\"drawable\":0,\"component_id\":2,\"texture\":0},{\"drawable\":0,\"component_id\":3,\"texture\":0},{\"drawable\":159,\"component_id\":4,\"texture\":0},{\"drawable\":0,\"component_id\":5,\"texture\":0},{\"drawable\":25,\"component_id\":6,\"texture\":0},{\"drawable\":0,\"component_id\":7,\"texture\":0},{\"drawable\":15,\"component_id\":8,\"texture\":0},{\"drawable\":0,\"component_id\":9,\"texture\":0},{\"drawable\":0,\"component_id\":10,\"texture\":0},{\"drawable\":414,\"component_id\":11,\"texture\":1}],\" arms_2\":0,\"mask_1\":0,\"ears_1\":-1,\"eyebrows_5\":0,\"blemishes_1\":0,\"chimp_1\":10,\"arms\":0,\"watches_2\":0,\"eyebrows_4\":0,\"beard_1\":0,\"chin_4\":0,\"model\":\"mp_m_freemode_01\",\"decals_1\":0,\"makeup_1\":0,\"bags_2\":0,\"hair\":{\"color\":0,\"style\":0,\"highlight\":0},\"complexion_2\":0,\"hair_color_1\":0,\"chain_1\":0,\"glasses_1\":0,\"blush_1\":0,\"chimp_3\":10,\"jaw_1\":0,\"eye_color\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"beard_2\":0,\"headOverlays\":{\"complexion\":{\"color\":0,\"style\":0,\"opacity\":0},\"blush\":{\"color\":0,\"style\":0,\"opacity\":0},\"makeUp\":{\"color\":0,\"style\":0,\"opacity\":0},\"moleAndFreckles\":{\"color\":0,\"style\":0,\"opacity\":0},\"chestHair\":{\"color\":0,\"style\":0,\"opacity\":0},\"lipstick\":{\"color\":0,\"style\":0,\"opacity\":0},\"ageing\":{\"color\":0,\"style\":0,\"opacity\":0},\"beard\":{\"color\":0,\"style\":0,\"opacity\":0},\"sunDamage\":{\"color\":0,\"style\":0,\"opacity\":0},\"blemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"bodyBlemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"eyebrows\":{\"color\":0,\"style\":0,\"opacity\":0}},\"shoes_1\":25,\"eyebrows_3\":0,\"chin_2\":0,\"blemishes_2\":0,\"ears_2\":0,\"complexion_1\":0,\"beard_3\":0,\"headBlend\":{\"shapeFirst\":0,\"shapeSecond\":0,\"skinMix\":0,\"skinSecond\":0,\"skinFirst\":0,\"shapeMix\":0},\"nose_4\":0,\"cheeks_2\":0,\"face_2\":0,\"makeup_4\":0,\"beard_4\":0,\"blend_face\":0,\"jaw_2\":0,\"face\":0,\"skin_md_weight\":50,\"eyebrows_6\":0,\"pants_1\":149,\"bodyb_2\":0,\"lipstick_2\":0,\"chest_3\":0,\"makeup_3\":0},\"label\":\"siema\"},{\"skin\":{\"cheeks_3\":0,\"pants_2\":0,\"lipstick_3\":0,\"tattoos\":[],\"watches_1\":-1,\"neck\":10,\"lip_thickness\":0,\"props\":[{\"prop_id\":0,\"drawable\":184,\"texture\":1},{\"prop_id\":1,\"drawable\":0,\"texture\":0},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}],\"blend_skin\":0,\"decals_2\":0,\"eyebrow_2\":10,\"lipstick_1\":0,\"cheeks_1\":0,\"chest_2\":0,\"bracelets_1\":-1,\"makeup_1\":0,\"blush_2\":0,\"torso_2\":0,\"eyeColor\":0,\"dad\":0,\"moles_1\":0,\"bproof_1\":0,\"helmet_1\":233,\"shoes_2\":0,\"bproof_2\":0,\"nose_3\":0,\"moles_2\":0,\"face_3\":0,\"eyebrows_5\":0,\"sun_2\":0,\"chimp_4\":10,\"hair_1\":32,\"mom\":21,\"skin\":0,\"face_md_weight\":50,\"bracelets_2\":0,\"chin_13\":0,\"faceFeatures\":{\"nosePeakLowering\":-1,\"eyeBrownHigh\":0,\"noseBoneTwist\":-1,\"noseWidth\":-1,\"jawBoneWidth\":-1,\"chinBoneLenght\":0,\"cheeksWidth\":-1,\"neckThickness\":0,\"nosePeakHigh\":-1,\"cheeksBoneWidth\":-1,\"eyesOpening\":-1,\"noseBoneHigh\":-1,\"jawBoneBackSize\":0,\"eyeBrownForward\":0,\"chinBoneSize\":0,\"chinHole\":0,\"chinBoneLowering\":0,\"lipsThickness\":0,\"nosePeakSize\":-1,\"cheeksBoneHigh\":-1},\"arms_2\":0,\"tshirt_1\":202,\"lipstick_4\":0,\"chimp_2\":10,\"nose_5\":0,\"glasses_2\":0,\"bodyb_3\":-1,\"helmet_2\":0,\"eye_squint\":0,\"eyebrows_1\":0,\"blush_3\":0,\"eyebrows_2\":0,\"blend\":0,\"nose_6\":0,\"skin_2\":0,\"neck_thickness\":0,\"chest_1\":0,\"eyebrow_1\":10,\"age_1\":0,\"chin_1\":0,\"mask_2\":0,\"nose_1\":0,\"hair_3\":0,\"makeup_2\":0,\"hair_2\":0,\"face\":0,\"lips\":10,\"blemishes_1\":0,\"nose_2\":0,\"age_2\":0,\"bodyb_4\":0,\"sex\":0,\"torso_1\":343,\"sun_1\":0,\"components\":[{\"drawable\":0,\"component_id\":0,\"texture\":0},{\"drawable\":0,\"component_id\":1,\"texture\":0},{\"drawable\":0,\"component_id\":2,\"texture\":0},{\"drawable\":0,\"component_id\":3,\"texture\":0},{\"drawable\":159,\"component_id\":4,\"texture\":0},{\"drawable\":0,\"component_id\":5,\"texture\":0},{\"drawable\":25,\"component_id\":6,\"texture\":0},{\"drawable\":0,\"component_id\":7,\"texture\":0},{\"drawable\":15,\"component_id\":8,\"texture\":0},{\"drawable\":0,\"component_id\":9,\"texture\":0},{\"drawable\":0,\"component_id\":10,\"texture\":0},{\"drawable\":414,\"component_id\":11,\"texture\":1}],\" arms_2\":0,\"chin_2\":0,\"ears_1\":-1,\"bags_1\":0,\"decals_1\":0,\"mask_1\":0,\"arms\":0,\"skin_3\":0,\"eyebrows_4\":0,\"beard_1\":0,\"chin_4\":0,\"model\":\"mp_m_freemode_01\",\"bodyb_1\":-1,\"glasses_1\":0,\"bags_2\":0,\"hair\":{\"color\":0,\"style\":0,\"highlight\":0},\"complexion_2\":0,\"hair_color_1\":0,\"chain_1\":0,\"watches_2\":0,\"blush_1\":0,\"chimp_3\":10,\"jaw_1\":0,\"eye_color\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"beard_2\":0,\"chain_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"shoes_1\":25,\"blemishes_2\":0,\"ears_2\":0,\"headOverlays\":{\"complexion\":{\"color\":0,\"style\":0,\"opacity\":0},\"blush\":{\"color\":0,\"style\":0,\"opacity\":0},\"makeUp\":{\"color\":0,\"style\":0,\"opacity\":0},\"moleAndFreckles\":{\"color\":0,\"style\":0,\"opacity\":0},\"chestHair\":{\"color\":0,\"style\":0,\"opacity\":0},\"lipstick\":{\"color\":0,\"style\":0,\"opacity\":0},\"ageing\":{\"color\":0,\"style\":0,\"opacity\":0},\"beard\":{\"color\":0,\"style\":0,\"opacity\":0},\"sunDamage\":{\"color\":0,\"style\":0,\"opacity\":0},\"blemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"bodyBlemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"eyebrows\":{\"color\":0,\"style\":0,\"opacity\":0}},\"beard_3\":0,\"headBlend\":{\"shapeFirst\":0,\"shapeSecond\":0,\"skinMix\":0,\"skinSecond\":0,\"skinFirst\":0,\"shapeMix\":0},\"nose_4\":0,\"cheeks_2\":0,\"face_2\":0,\"makeup_4\":0,\"beard_4\":0,\"blend_face\":0,\"jaw_2\":0,\"complexion_1\":0,\"skin_md_weight\":50,\"eyebrows_6\":0,\"pants_1\":149,\"bodyb_2\":0,\"lipstick_2\":0,\"chest_3\":0,\"makeup_3\":0},\"label\":\"elo\"},{\"skin\":{\"cheeks_3\":0,\"pants_2\":0,\"lipstick_3\":0,\"tattoos\":[],\"watches_1\":-1,\"neck\":10,\"chin_2\":0,\"props\":[{\"prop_id\":0,\"drawable\":184,\"texture\":1},{\"prop_id\":1,\"drawable\":0,\"texture\":0},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}],\"blend_skin\":0,\"decals_2\":0,\"eyebrow_2\":10,\"lipstick_1\":0,\"lip_thickness\":0,\"eyebrows_1\":0,\"bracelets_1\":-1,\"nose_3\":0,\"blush_2\":0,\"torso_2\":0,\"eyeColor\":0,\"dad\":0,\"moles_1\":0,\"sun_1\":0,\"helmet_1\":233,\"shoes_2\":0,\"bproof_2\":0,\"bproof_1\":0,\"eye_color\":0,\"face_3\":0,\"skin\":0,\"hair_1\":32,\"chimp_4\":10,\"bracelets_2\":0,\"mom\":21,\"chest_1\":0,\"face_md_weight\":50,\"chin_13\":0,\"chimp_2\":10,\"faceFeatures\":{\"chinBoneLowering\":0,\"eyeBrownHigh\":0,\"nosePeakSize\":-1,\"noseWidth\":-1,\"jawBoneWidth\":-1,\"chinBoneLenght\":0,\"cheeksWidth\":-1,\"neckThickness\":0,\"chinBoneSize\":0,\"cheeksBoneWidth\":-1,\"cheeksBoneHigh\":-1,\"noseBoneTwist\":-1,\"jawBoneBackSize\":0,\"noseBoneHigh\":-1,\"eyeBrownForward\":0,\"chinHole\":0,\"nosePeakLowering\":-1,\"lipsThickness\":0,\"nosePeakHigh\":-1,\"eyesOpening\":-1},\"arms_2\":0,\"tshirt_1\":202,\"lipstick_4\":0,\"nose_5\":0,\"glasses_2\":0,\"chest_2\":0,\"bodyb_3\":-1,\"blush_3\":0,\"sun_2\":0,\"blemishes_1\":0,\"chain_2\":0,\"eyebrows_2\":0,\"blend\":0,\"nose_6\":0,\"skin_2\":0,\"neck_thickness\":0,\"moles_2\":0,\"mask_2\":0,\"age_1\":0,\"chin_1\":0,\"chimp_3\":10,\"nose_1\":0,\"bodyb_1\":-1,\"makeup_2\":0,\"hair_2\":0,\"helmet_2\":0,\"eyebrow_1\":10,\"eyebrows_5\":0,\"nose_2\":0,\"age_2\":0,\"bodyb_4\":0,\"sex\":0,\"torso_1\":343,\"headOverlays\":{\"complexion\":{\"color\":0,\"style\":0,\"opacity\":0},\"blush\":{\"color\":0,\"style\":0,\"opacity\":0},\"makeUp\":{\"color\":0,\"style\":0,\"opacity\":0},\"moleAndFreckles\":{\"color\":0,\"style\":0,\"opacity\":0},\"chestHair\":{\"color\":0,\"style\":0,\"opacity\":0},\"lipstick\":{\"color\":0,\"style\":0,\"opacity\":0},\"ageing\":{\"color\":0,\"style\":0,\"opacity\":0},\"beard\":{\"color\":0,\"style\":0,\"opacity\":0},\"sunDamage\":{\"color\":0,\"style\":0,\"opacity\":0},\"blemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"bodyBlemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"eyebrows\":{\"color\":0,\"style\":0,\"opacity\":0}},\"components\":[{\"drawable\":0,\"component_id\":0,\"texture\":0},{\"drawable\":0,\"component_id\":1,\"texture\":0},{\"drawable\":0,\"component_id\":2,\"texture\":0},{\"drawable\":0,\"component_id\":3,\"texture\":0},{\"drawable\":159,\"component_id\":4,\"texture\":0},{\"drawable\":0,\"component_id\":5,\"texture\":0},{\"drawable\":25,\"component_id\":6,\"texture\":0},{\"drawable\":0,\"component_id\":7,\"texture\":0},{\"drawable\":15,\"component_id\":8,\"texture\":0},{\"drawable\":0,\"component_id\":9,\"texture\":0},{\"drawable\":0,\"component_id\":10,\"texture\":0},{\"drawable\":414,\"component_id\":11,\"texture\":1}],\" arms_2\":0,\"cheeks_1\":0,\"ears_1\":-1,\"face\":0,\"watches_2\":0,\"mask_1\":0,\"arms\":0,\"skin_3\":0,\"eyebrows_4\":0,\"beard_1\":0,\"chin_4\":0,\"model\":\"mp_m_freemode_01\",\"hair_3\":0,\"makeup_1\":0,\"bags_2\":0,\"hair\":{\"color\":0,\"style\":0,\"highlight\":0},\"complexion_2\":0,\"hair_color_1\":0,\"chain_1\":0,\"complexion_1\":0,\"blush_1\":0,\"eye_squint\":0,\"jaw_1\":0,\"decals_1\":0,\"hair_color_2\":0,\"chimp_1\":10,\"beard_2\":0,\"beard_4\":0,\"bags_1\":0,\"eyebrows_3\":0,\"tshirt_2\":0,\"blemishes_2\":0,\"ears_2\":0,\"glasses_1\":0,\"beard_3\":0,\"headBlend\":{\"shapeFirst\":0,\"shapeSecond\":0,\"skinMix\":0,\"skinSecond\":0,\"skinFirst\":0,\"shapeMix\":0},\"nose_4\":0,\"cheeks_2\":0,\"face_2\":0,\"makeup_4\":0,\"shoes_1\":25,\"blend_face\":0,\"jaw_2\":0,\"lips\":10,\"skin_md_weight\":50,\"eyebrows_6\":0,\"pants_1\":149,\"bodyb_2\":0,\"lipstick_2\":0,\"chest_3\":0,\"makeup_3\":0},\"label\":\"sle\"},{\"skin\":{\"cheeks_3\":0,\"pants_2\":0,\"lipstick_3\":0,\"tattoos\":[],\"moles_2\":0,\"neck\":10,\"chin_2\":0,\"props\":[{\"prop_id\":0,\"drawable\":184,\"texture\":1},{\"prop_id\":1,\"drawable\":0,\"texture\":0},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}],\"chin_13\":0,\"decals_2\":0,\"eyebrow_2\":10,\"lipstick_1\":0,\"bodyb_1\":-1,\"nose_3\":0,\"bracelets_1\":-1,\"chimp_2\":10,\"blush_2\":0,\"torso_2\":0,\"eyeColor\":0,\"chain_2\":0,\"moles_1\":0,\"bproof_1\":0,\"helmet_1\":233,\"shoes_2\":0,\"skin\":0,\"bproof_2\":0,\"eyebrows_3\":0,\"face_3\":0,\"decals_1\":0,\"hair_1\":32,\"chimp_4\":10,\"headOverlays\":{\"complexion\":{\"opacity\":0,\"style\":0,\"color\":0},\"blush\":{\"opacity\":0,\"style\":0,\"color\":0},\"sunDamage\":{\"opacity\":0,\"style\":0,\"color\":0},\"moleAndFreckles\":{\"opacity\":0,\"style\":0,\"color\":0},\"chestHair\":{\"opacity\":0,\"style\":0,\"color\":0},\"lipstick\":{\"opacity\":0,\"style\":0,\"color\":0},\"ageing\":{\"opacity\":0,\"style\":0,\"color\":0},\"beard\":{\"opacity\":0,\"style\":0,\"color\":0},\"bodyBlemishes\":{\"opacity\":0,\"style\":0,\"color\":0},\"blemishes\":{\"opacity\":0,\"style\":0,\"color\":0},\"makeUp\":{\"opacity\":0,\"style\":0,\"color\":0},\"eyebrows\":{\"opacity\":0,\"style\":0,\"color\":0}},\"mom\":21,\"bracelets_2\":0,\"face_md_weight\":50,\"tshirt_2\":0,\"helmet_2\":0,\"faceFeatures\":{\"nosePeakLowering\":-1,\"eyeBrownHigh\":0,\"nosePeakSize\":-1,\"noseWidth\":-1,\"jawBoneWidth\":-1,\"chinBoneLenght\":0,\"cheeksWidth\":-1,\"neckThickness\":0,\"nosePeakHigh\":-1,\"cheeksBoneWidth\":-1,\"noseBoneTwist\":-1,\"cheeksBoneHigh\":-1,\"jawBoneBackSize\":0,\"eyeBrownForward\":0,\"chinBoneSize\":0,\"chinHole\":0,\"chinBoneLowering\":0,\"lipsThickness\":0,\"noseBoneHigh\":-1,\"eyesOpening\":-1},\"arms_2\":0,\"tshirt_1\":172,\"lipstick_4\":0,\"nose_5\":0,\"glasses_2\":0,\"eye_squint\":0,\"bodyb_3\":-1,\"eyebrows_1\":0,\"sun_2\":0,\"blush_3\":0,\"lip_thickness\":0,\"eyebrows_2\":0,\"blend\":0,\"nose_6\":0,\"skin_2\":0,\"neck_thickness\":0,\"watches_1\":-1,\"mask_1\":0,\"age_1\":0,\"chin_1\":0,\"mask_2\":0,\"nose_1\":0,\"blemishes_1\":0,\"chest_1\":0,\"hair_2\":0,\"makeup_2\":0,\"beard_4\":0,\"dad\":0,\"nose_2\":0,\"age_2\":0,\"bodyb_4\":0,\"sex\":0,\"torso_1\":480,\"makeup_1\":0,\"components\":[{\"component_id\":0,\"drawable\":0,\"texture\":0},{\"component_id\":1,\"drawable\":0,\"texture\":0},{\"component_id\":2,\"drawable\":0,\"texture\":0},{\"component_id\":3,\"drawable\":0,\"texture\":0},{\"component_id\":4,\"drawable\":159,\"texture\":0},{\"component_id\":5,\"drawable\":0,\"texture\":0},{\"component_id\":6,\"drawable\":25,\"texture\":0},{\"component_id\":7,\"drawable\":0,\"texture\":0},{\"component_id\":8,\"drawable\":15,\"texture\":0},{\"component_id\":9,\"drawable\":0,\"texture\":0},{\"component_id\":10,\"drawable\":0,\"texture\":0},{\"component_id\":11,\"drawable\":414,\"texture\":1}],\" arms_2\":0,\"sun_1\":0,\"ears_1\":-1,\"face\":0,\"complexion_1\":0,\"blend_skin\":0,\"arms\":0,\"hair_3\":0,\"eyebrows_4\":0,\"beard_1\":0,\"chin_4\":0,\"model\":\"mp_m_freemode_01\",\"skin_3\":0,\"glasses_1\":0,\"bags_2\":0,\"hair\":{\"color\":0,\"style\":0,\"highlight\":0},\"complexion_2\":0,\"hair_color_1\":0,\"chain_1\":0,\"eyebrows_5\":0,\"blush_1\":0,\"watches_2\":0,\"jaw_1\":0,\"eye_color\":0,\"hair_color_2\":0,\"chimp_3\":10,\"beard_2\":0,\"chest_2\":0,\"bags_1\":0,\"shoes_1\":25,\"chimp_1\":10,\"blemishes_2\":0,\"ears_2\":0,\"lips\":10,\"beard_3\":0,\"headBlend\":{\"shapeFirst\":0,\"shapeSecond\":0,\"skinFirst\":0,\"skinSecond\":0,\"skinMix\":0,\"shapeMix\":0},\"nose_4\":0,\"cheeks_2\":0,\"face_2\":0,\"makeup_4\":0,\"cheeks_1\":0,\"blend_face\":0,\"jaw_2\":0,\"eyebrow_1\":10,\"skin_md_weight\":50,\"eyebrows_6\":0,\"pants_1\":121,\"bodyb_2\":0,\"lipstick_2\":0,\"chest_3\":0,\"makeup_3\":0},\"label\":\"bojowka\"}]}'),
(7, 'user_ears', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '{}'),
(8, 'user_glasses', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '{}'),
(9, 'user_helmet', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '{}'),
(10, 'user_mask', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '{}'),
(11, 'user_ears', 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '{}'),
(12, 'property', 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '{\"dressing\":[{\"label\":\"drip\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":15,\"chin_4\":0,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"ears_1\":-1,\"nose_4\":11,\"face\":0,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"beard_2\":0,\"bags_1\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"nose_5\":4,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"cheeks_2\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"moles_1\":0,\"blend_face\":0,\"glasses_1\":0,\"ears_2\":0,\"hair_1\":79,\"skin_3\":0,\"eyebrow_2\":10,\"eyebrows_4\":0,\"arms\":6,\"helmet_1\":-1,\"chin_13\":0,\"skin\":3,\"bracelets_1\":-1,\"eyebrows_6\":0,\"mom\":21,\"skin_md_weight\":50,\"skin_2\":0,\"nose_3\":13,\"glasses_2\":0,\"cheeks_3\":0,\"bproof_1\":0,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":10,\"beard_3\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"hair_2\":0,\"tshirt_2\":0,\"makeup_3\":0,\"eyebrows_2\":10,\"shoes_2\":3,\"hair_color_2\":0,\"blush_3\":0,\"chest_3\":0,\"watches_2\":0,\"bracelets_2\":0,\"helmet_2\":0,\"eyebrows_5\":0,\"blush_2\":0,\"mask_2\":0,\"torso_2\":0,\"eye_squint\":0,\"lipstick_2\":0,\"blend_skin\":0,\"decals_1\":0,\"pants_2\":3,\"sun_2\":0,\"chimp_3\":10,\"shoes_1\":254,\"beard_4\":0,\"face_3\":0,\"blush_1\":0,\"makeup_2\":0,\"mask_1\":0,\"moles_2\":0,\"blend\":0,\"bodyb_1\":-1,\"decals_2\":0,\"pants_1\":259,\"hair_color_1\":62,\"makeup_1\":0,\"eye_color\":0,\"lipstick_1\":0,\"makeup_4\":0,\"sex\":0,\"torso_1\":772,\"lipstick_4\":0,\"beard_1\":0,\"neck\":10,\"face_2\":0,\"bproof_2\":0,\"eyebrow_1\":10}}]}'),
(13, 'user_glasses', 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '{}'),
(14, 'user_helmet', 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '{}'),
(15, 'user_mask', 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '{}'),
(16, 'user_ears', 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(17, 'property', 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', '{\"dressing\":[{\"skin\":{\"age_1\":0,\"ears_2\":0,\"face_3\":0,\"mask_1\":169,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":2,\"chain_2\":0,\"eyebrows_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":0,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":14,\"sex\":1,\"blend_skin\":0,\"eyebrows_4\":0,\"arms_2\":0,\"torso_2\":0,\"blend\":0,\"nose_6\":0,\"shoes_2\":0,\"glasses_2\":2,\"bodyb_4\":0,\"sun_1\":0,\"mask_2\":13,\"eyebrow_1\":10,\"hair_2\":0,\"lipstick_3\":20,\"bracelets_1\":-1,\"watches_1\":-1,\"ears_1\":-1,\"nose_2\":0,\"torso_1\":829,\"blush_1\":0,\"chin_1\":0,\"eyebrows_6\":0,\"blemishes_1\":0,\"sun_2\":0,\"nose_5\":0,\"chest_1\":0,\"chimp_2\":10,\"beard_1\":0,\"beard_3\":0,\"bproof_1\":0,\"mom\":21,\"chin_13\":0,\"chin_4\":0,\"neck\":10,\"skin_3\":0,\"beard_2\":0,\"bracelets_2\":0,\"chimp_3\":10,\"jaw_1\":0,\"bags_2\":0,\"eyebrows_2\":0,\"cheeks_2\":0,\"lipstick_2\":10,\"pants_1\":260,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"lips\":10,\"blend_face\":0,\"hair_3\":0,\"blush_3\":0,\"beard_4\":0,\"dad\":0,\"moles_2\":0,\"helmet_2\":0,\"eye_squint\":0,\"makeup_3\":0,\"cheeks_1\":0,\"nose_3\":0,\"makeup_4\":0,\"eyebrows_3\":0,\"chimp_4\":10,\"skin_2\":0,\"hair_color_2\":0,\"bodyb_3\":-1,\"face_md_weight\":50,\"bags_1\":0,\"hair_1\":30,\"makeup_2\":10,\"cheeks_3\":0,\"nose_1\":6,\"chimp_1\":10,\"lip_thickness\":0,\"blush_2\":0,\"chest_3\":0,\"hair_color_1\":0,\"makeup_1\":0,\"nose_4\":0,\"tshirt_2\":0,\"shoes_1\":162,\"chain_1\":0,\"lipstick_1\":5,\"bproof_2\":0,\"bodyb_2\":0,\"glasses_1\":11,\"complexion_2\":0,\"arms\":4,\"lipstick_4\":0,\"eye_color\":10,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"skin\":1,\"face\":21},\"label\":\"EMS\"},{\"skin\":{\"hair_2\":0,\"ears_2\":0,\"face_3\":0,\"skin_2\":0,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":0,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":14,\"sex\":1,\"blend_skin\":0,\"eyebrows_4\":0,\"arms_2\":0,\"torso_2\":0,\"blend\":0,\"nose_6\":0,\"shoes_2\":0,\"glasses_2\":0,\"nose_4\":0,\"sun_1\":0,\"mask_2\":2,\"eyebrow_1\":10,\"bags_2\":0,\"lipstick_3\":20,\"blush_2\":0,\"moles_2\":0,\"watches_1\":-1,\"nose_2\":0,\"torso_1\":554,\"blush_1\":0,\"sun_2\":0,\"eyebrows_6\":0,\"blemishes_1\":0,\"chin_1\":0,\"bodyb_4\":0,\"skin\":1,\"chest_1\":0,\"beard_1\":0,\"chin_4\":0,\"bracelets_1\":-1,\"mom\":21,\"chin_13\":0,\"chimp_2\":10,\"neck\":10,\"beard_3\":0,\"bproof_1\":0,\"bracelets_2\":0,\"chimp_3\":10,\"jaw_1\":0,\"skin_3\":0,\"eyebrows_2\":0,\"cheeks_2\":0,\"lipstick_2\":10,\"ears_1\":-1,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"lips\":10,\"blend_face\":0,\"makeup_3\":0,\"blush_3\":0,\"makeup_4\":0,\"beard_2\":0,\"dad\":0,\"glasses_1\":55,\"eye_squint\":0,\"eyebrows_3\":0,\"cheeks_1\":0,\"nose_3\":0,\"hair_color_2\":0,\"mask_1\":169,\"chimp_4\":10,\"helmet_2\":0,\"beard_4\":0,\"pants_1\":245,\"face_md_weight\":50,\"age_1\":0,\"hair_1\":131,\"makeup_2\":10,\"cheeks_3\":0,\"nose_1\":6,\"chimp_1\":10,\"lip_thickness\":0,\"bodyb_3\":-1,\"chest_3\":0,\"bags_1\":0,\"lipstick_4\":0,\"chain_1\":0,\"makeup_1\":0,\"shoes_1\":256,\"eye_color\":10,\"lipstick_1\":5,\"bproof_2\":0,\"bodyb_2\":0,\"hair_color_1\":15,\"complexion_2\":0,\"arms\":0,\"nose_5\":0,\"tshirt_2\":0,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"hair_3\":0,\"face\":21},\"label\":\"fitowka\"}]}'),
(18, 'user_glasses', 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(19, 'user_helmet', 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(20, 'user_mask', 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(21, 'user_ears', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '{}'),
(22, 'property', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '{}'),
(23, 'user_glasses', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '{}'),
(24, 'user_helmet', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '{}'),
(25, 'user_mask', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '{}'),
(26, 'user_ears', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(27, 'property', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '{\"dressing\":[{\"label\":\"sigmazwiadowca\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":0,\"bodyb_2\":0,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"ears_1\":-1,\"moles_2\":0,\"face\":21,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"beard_2\":0,\"blend\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"makeup_3\":0,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"bags_1\":0,\"eye_squint\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"pants_2\":0,\"blend_face\":0,\"glasses_1\":5,\"ears_2\":0,\"hair_1\":80,\"skin_3\":0,\"cheeks_2\":0,\"eyebrows_4\":0,\"torso_1\":455,\"chimp_3\":10,\"chest_3\":0,\"blush_3\":0,\"glasses_2\":5,\"eyebrows_6\":0,\"mom\":21,\"blend_skin\":0,\"skin_2\":0,\"nose_3\":0,\"cheeks_3\":0,\"nose_5\":0,\"chin_13\":0,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":0,\"decals_1\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"eyebrows_5\":0,\"hair_color_1\":28,\"moles_1\":0,\"eyebrows_2\":0,\"shoes_2\":0,\"hair_color_2\":0,\"beard_3\":0,\"hair_2\":0,\"sun_2\":0,\"watches_2\":0,\"helmet_2\":13,\"bracelets_1\":-1,\"blush_2\":0,\"mask_2\":12,\"face_2\":0,\"torso_2\":0,\"lipstick_2\":0,\"makeup_1\":0,\"eyebrow_2\":10,\"eyebrow_1\":10,\"bracelets_2\":0,\"skin_md_weight\":50,\"shoes_1\":132,\"beard_4\":0,\"face_3\":0,\"mask_1\":169,\"helmet_1\":150,\"chin_4\":0,\"nose_4\":0,\"tshirt_2\":0,\"bodyb_1\":-1,\"decals_2\":0,\"pants_1\":168,\"skin\":0,\"makeup_4\":0,\"eye_color\":0,\"lipstick_1\":0,\"makeup_2\":0,\"sex\":0,\"arms\":17,\"lipstick_4\":0,\"bproof_1\":15,\"neck\":10,\"beard_1\":0,\"bproof_2\":0,\"blush_1\":0}},{\"label\":\"lspd\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":15,\"bodyb_2\":0,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"ears_1\":-1,\"nose_4\":0,\"face\":21,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"beard_2\":0,\"bracelets_2\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"makeup_3\":0,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"bags_1\":0,\"eye_squint\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"pants_2\":0,\"blend_face\":0,\"decals_1\":0,\"ears_2\":0,\"hair_1\":80,\"skin_3\":0,\"eyebrows_5\":0,\"eyebrows_4\":0,\"torso_1\":317,\"nose_5\":0,\"chin_13\":0,\"helmet_1\":46,\"cheeks_2\":0,\"beard_3\":0,\"mom\":21,\"shoes_2\":0,\"skin_2\":0,\"glasses_2\":5,\"cheeks_3\":0,\"blend\":0,\"skin\":0,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":0,\"nose_3\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"sun_2\":0,\"tshirt_2\":0,\"mask_1\":0,\"eyebrows_2\":0,\"eyebrow_2\":10,\"hair_color_2\":0,\"blend_skin\":0,\"watches_2\":0,\"chest_3\":0,\"hair_color_1\":28,\"helmet_2\":0,\"bracelets_1\":-1,\"blush_2\":0,\"mask_2\":0,\"eyebrow_1\":10,\"torso_2\":0,\"lipstick_2\":0,\"chimp_3\":10,\"blush_3\":0,\"eyebrows_6\":0,\"bproof_1\":0,\"skin_md_weight\":50,\"shoes_1\":25,\"beard_4\":0,\"face_3\":0,\"beard_1\":0,\"moles_2\":0,\"hair_2\":0,\"makeup_4\":0,\"face_2\":0,\"bodyb_1\":-1,\"decals_2\":0,\"pants_1\":126,\"glasses_1\":5,\"moles_1\":0,\"eye_color\":0,\"lipstick_1\":0,\"makeup_2\":0,\"sex\":0,\"arms\":0,\"lipstick_4\":0,\"makeup_1\":0,\"neck\":10,\"chin_4\":0,\"bproof_2\":0,\"blush_1\":0}},{\"label\":\"SWAT\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":15,\"bodyb_2\":0,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"ears_1\":-1,\"nose_4\":0,\"face\":0,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"glasses_2\":4,\"bracelets_2\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"makeup_3\":0,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"bags_1\":0,\"eye_squint\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"moles_1\":0,\"blend_face\":0,\"decals_1\":0,\"ears_2\":0,\"hair_1\":80,\"skin_3\":0,\"cheeks_2\":0,\"eyebrows_4\":0,\"skin\":0,\"blush_1\":0,\"chin_13\":0,\"blush_3\":0,\"eyebrow_1\":10,\"beard_3\":0,\"mom\":21,\"glasses_1\":25,\"skin_2\":0,\"hair_2\":0,\"pants_2\":0,\"cheeks_3\":0,\"blend_skin\":0,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":0,\"nose_3\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"nose_5\":0,\"tshirt_2\":0,\"shoes_2\":0,\"eyebrows_2\":0,\"skin_md_weight\":50,\"hair_color_2\":0,\"eyebrows_5\":0,\"chest_3\":0,\"blend\":0,\"watches_2\":0,\"helmet_2\":0,\"bracelets_1\":-1,\"makeup_1\":0,\"mask_2\":13,\"torso_2\":0,\"makeup_2\":0,\"lipstick_2\":0,\"sun_2\":0,\"eyebrow_2\":10,\"eyebrows_6\":0,\"chimp_3\":10,\"beard_2\":0,\"shoes_1\":25,\"beard_4\":0,\"face_3\":0,\"mask_1\":169,\"helmet_1\":150,\"chin_4\":0,\"blush_2\":0,\"moles_2\":0,\"bodyb_1\":-1,\"decals_2\":0,\"pants_1\":217,\"arms\":0,\"torso_1\":817,\"eye_color\":0,\"lipstick_1\":0,\"makeup_4\":0,\"sex\":0,\"face_2\":0,\"lipstick_4\":0,\"hair_color_1\":28,\"neck\":10,\"beard_1\":0,\"bproof_2\":0,\"bproof_1\":104}},{\"label\":\"EMS\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":15,\"chin_4\":0,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"ears_1\":-1,\"nose_4\":0,\"face\":0,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"beard_2\":0,\"bracelets_2\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"makeup_3\":0,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"bags_1\":0,\"eye_squint\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"pants_2\":0,\"blend_face\":0,\"decals_1\":0,\"ears_2\":0,\"hair_1\":152,\"skin_3\":0,\"cheeks_2\":0,\"eyebrows_4\":0,\"mask_2\":0,\"blush_1\":0,\"chin_13\":0,\"skin\":0,\"eyebrow_1\":10,\"eyebrows_6\":0,\"mom\":21,\"glasses_2\":0,\"skin_2\":0,\"beard_3\":0,\"blend_skin\":0,\"moles_1\":0,\"cheeks_3\":0,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":0,\"nose_3\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"hair_2\":0,\"hair_color_1\":0,\"glasses_1\":0,\"eyebrows_2\":0,\"nose_5\":0,\"hair_color_2\":0,\"shoes_2\":0,\"skin_md_weight\":50,\"eyebrows_5\":0,\"blend\":0,\"helmet_2\":0,\"bracelets_1\":-1,\"blush_2\":0,\"sun_2\":0,\"chest_3\":0,\"watches_2\":0,\"lipstick_2\":0,\"makeup_2\":0,\"torso_2\":2,\"eyebrow_2\":10,\"chimp_3\":10,\"bproof_1\":0,\"shoes_1\":25,\"beard_4\":0,\"face_3\":0,\"bproof_2\":0,\"blush_3\":0,\"tshirt_2\":0,\"moles_2\":0,\"arms\":0,\"bodyb_1\":-1,\"decals_2\":0,\"pants_1\":190,\"helmet_1\":-1,\"face_2\":0,\"eye_color\":0,\"lipstick_1\":0,\"makeup_4\":0,\"sex\":0,\"torso_1\":827,\"lipstick_4\":0,\"makeup_1\":0,\"neck\":10,\"beard_1\":0,\"mask_1\":0,\"bodyb_2\":0}},{\"label\":\"LSC\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":15,\"chin_4\":0,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"blush_1\":0,\"nose_4\":0,\"face\":0,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"glasses_2\":0,\"bags_1\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"makeup_3\":0,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"moles_1\":0,\"cheeks_2\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"pants_2\":4,\"blend_face\":0,\"decals_1\":0,\"ears_2\":0,\"hair_1\":152,\"skin_3\":0,\"torso_2\":0,\"eyebrows_4\":0,\"moles_2\":0,\"nose_3\":0,\"chin_13\":0,\"skin\":0,\"eyebrow_1\":10,\"beard_3\":0,\"mom\":21,\"bodyb_2\":0,\"skin_2\":0,\"blend_skin\":0,\"blush_3\":0,\"tshirt_2\":0,\"cheeks_3\":0,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":0,\"bproof_1\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"hair_2\":0,\"hair_color_1\":0,\"shoes_2\":0,\"eyebrows_2\":0,\"glasses_1\":0,\"hair_color_2\":0,\"nose_5\":0,\"chest_3\":0,\"skin_md_weight\":50,\"watches_2\":0,\"helmet_2\":0,\"eyebrows_5\":0,\"blush_2\":0,\"mask_2\":0,\"blend\":0,\"beard_1\":0,\"lipstick_2\":0,\"eye_squint\":0,\"chimp_3\":10,\"makeup_2\":0,\"ears_1\":-1,\"eyebrows_6\":0,\"shoes_1\":25,\"beard_4\":0,\"face_3\":0,\"bracelets_2\":0,\"bracelets_1\":-1,\"beard_2\":0,\"mask_1\":0,\"helmet_1\":-1,\"bodyb_1\":-1,\"decals_2\":0,\"pants_1\":266,\"makeup_1\":0,\"arms\":1,\"eye_color\":0,\"lipstick_1\":0,\"makeup_4\":0,\"sex\":0,\"torso_1\":832,\"lipstick_4\":0,\"face_2\":0,\"neck\":10,\"sun_2\":0,\"bproof_2\":0,\"eyebrow_2\":10}}]}'),
(28, 'user_glasses', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(29, 'user_helmet', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(30, 'user_mask', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '{}'),
(31, 'property', 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '{\"dressing\":[{\"label\":\"DRIP\",\"skin\":{\"chest_3\":0,\"sun_2\":0,\"helmet_2\":0,\"chimp_2\":10,\"mom\":21,\"eyebrows_3\":0,\"chimp_1\":10,\"cheeks_3\":0,\"nose_1\":0,\"blush_1\":0,\"arms_2\":0,\"bodyb_4\":0,\"eyebrow_1\":10,\"tshirt_2\":0,\"blush_3\":0,\"sex\":0,\"skin_md_weight\":50,\"chimp_3\":10,\"lip_thickness\":0,\"nose_3\":0,\"torso_2\":0,\"nose_6\":0,\"eyebrows_1\":0,\"makeup_4\":0,\"ears_1\":-1,\"chin_13\":0,\"shoes_2\":1,\"eyebrow_2\":10,\"jaw_2\":0,\"shoes_1\":254,\"helmet_1\":-1,\"bodyb_3\":-1,\"watches_2\":0,\"bags_1\":0,\"bproof_2\":0,\"chin_1\":0,\"complexion_1\":0,\"chain_1\":0,\"makeup_2\":0,\"chin_2\":0,\"bracelets_1\":-1,\"neck_thickness\":0,\"torso_1\":614,\"eyebrows_2\":0,\"mask_2\":1,\"skin\":3,\"decals_2\":0,\"complexion_2\":0,\"chest_1\":0,\"bags_2\":0,\"moles_1\":0,\"arms\":0,\"hair_3\":0,\"eye_squint\":0,\"blend_face\":0,\"glasses_2\":0,\"chain_2\":0,\"hair_color_2\":0,\"bracelets_2\":0,\"dad\":0,\"eyebrows_5\":0,\"face_2\":0,\"blend\":0,\"eyebrows_4\":0,\"bproof_1\":0,\"lipstick_4\":0,\"eye_color\":0,\"hair_1\":15,\"makeup_3\":0,\"eyebrows_6\":0,\"jaw_1\":0,\"watches_1\":-1,\"cheeks_1\":0,\"beard_3\":0,\"moles_2\":0,\"face\":0,\"mask_1\":276,\"face_md_weight\":50,\"blemishes_2\":0,\"bodyb_1\":-1,\"beard_4\":0,\"beard_2\":0,\"nose_5\":0,\"decals_1\":0,\"lips\":10,\"glasses_1\":0,\"age_2\":0,\"blush_2\":0,\"skin_3\":0,\"nose_4\":0,\"skin_2\":0,\"sun_1\":0,\"blemishes_1\":0,\"chimp_4\":10,\"neck\":10,\"pants_2\":0,\"pants_1\":222,\"beard_1\":0,\"bodyb_2\":0,\"lipstick_1\":0,\"chest_2\":0,\"ears_2\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"tshirt_1\":0,\"blend_skin\":0,\"nose_2\":0,\"face_3\":0,\"age_1\":0,\"lipstick_2\":0,\"chin_4\":0,\"hair_2\":0,\"hair_color_1\":0,\"makeup_1\":0}},{\"label\":\"FAMILIES\",\"skin\":{\"chest_3\":0,\"sun_2\":0,\"helmet_2\":0,\"chimp_2\":10,\"mom\":21,\"eyebrows_3\":0,\"chimp_1\":10,\"cheeks_3\":0,\"tshirt_1\":294,\"eyebrow_2\":10,\"arms_2\":0,\"bodyb_4\":0,\"torso_1\":695,\"tshirt_2\":1,\"blush_3\":0,\"sex\":0,\"skin_md_weight\":50,\"chimp_3\":10,\"lip_thickness\":0,\"nose_3\":0,\"torso_2\":4,\"nose_6\":0,\"eyebrows_1\":0,\"makeup_4\":0,\"age_1\":0,\"chin_13\":0,\"nose_1\":0,\"shoes_2\":1,\"jaw_2\":0,\"shoes_1\":254,\"eyebrows_4\":0,\"bodyb_3\":-1,\"helmet_1\":215,\"watches_2\":0,\"bproof_2\":0,\"bags_1\":0,\"complexion_1\":0,\"chain_1\":0,\"blush_1\":0,\"makeup_2\":0,\"eyebrow_1\":10,\"neck_thickness\":0,\"nose_5\":0,\"eyebrows_6\":0,\"mask_2\":5,\"skin\":3,\"decals_2\":0,\"complexion_2\":0,\"chest_1\":0,\"lips\":10,\"moles_1\":0,\"arms\":0,\"hair_3\":0,\"eye_squint\":0,\"blend_face\":0,\"glasses_2\":0,\"face_2\":0,\"chin_1\":0,\"bracelets_2\":0,\"hair_color_2\":0,\"eyebrows_5\":0,\"nose_4\":0,\"blend\":0,\"nose_2\":0,\"dad\":0,\"lipstick_4\":0,\"eye_color\":0,\"hair_1\":14,\"makeup_3\":0,\"hair_2\":0,\"lipstick_1\":0,\"watches_1\":-1,\"cheeks_1\":0,\"beard_3\":0,\"moles_2\":0,\"face\":0,\"mask_1\":244,\"face_md_weight\":50,\"blemishes_2\":0,\"bodyb_1\":-1,\"ears_1\":-1,\"beard_4\":0,\"jaw_1\":0,\"beard_2\":0,\"bags_2\":0,\"chin_4\":0,\"age_2\":0,\"chin_2\":0,\"skin_3\":0,\"lipstick_2\":0,\"skin_2\":0,\"sun_1\":0,\"blemishes_1\":0,\"chimp_4\":10,\"neck\":10,\"pants_2\":0,\"pants_1\":253,\"beard_1\":0,\"bodyb_2\":0,\"chain_2\":0,\"chest_2\":0,\"ears_2\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"eyebrows_2\":0,\"glasses_1\":0,\"blend_skin\":0,\"face_3\":0,\"bracelets_1\":-1,\"decals_1\":0,\"blush_2\":0,\"bproof_1\":0,\"hair_color_1\":0,\"makeup_1\":0}},{\"label\":\"FAMILIES 2\",\"skin\":{\"chest_3\":0,\"sun_2\":0,\"helmet_2\":0,\"chimp_2\":10,\"mom\":21,\"eyebrows_3\":0,\"eyebrows_4\":0,\"cheeks_3\":0,\"tshirt_1\":294,\"blush_1\":0,\"arms_2\":0,\"bodyb_4\":0,\"torso_1\":695,\"tshirt_2\":1,\"blush_3\":0,\"sex\":0,\"skin_md_weight\":50,\"chimp_3\":10,\"lip_thickness\":0,\"nose_3\":0,\"torso_2\":4,\"nose_6\":0,\"eyebrows_1\":0,\"makeup_4\":0,\"blend_skin\":0,\"chin_13\":0,\"complexion_2\":0,\"lipstick_1\":0,\"jaw_2\":0,\"shoes_1\":218,\"eyebrow_2\":10,\"bodyb_3\":-1,\"helmet_1\":-1,\"watches_2\":0,\"chin_1\":0,\"moles_1\":0,\"complexion_1\":0,\"chain_1\":272,\"ears_1\":-1,\"eyebrow_1\":10,\"neck_thickness\":0,\"eyebrows_6\":0,\"makeup_2\":0,\"nose_5\":0,\"mask_2\":0,\"skin\":3,\"chin_2\":0,\"chest_1\":0,\"beard_4\":0,\"bags_2\":0,\"lipstick_4\":0,\"arms\":0,\"hair_3\":0,\"eye_squint\":0,\"blend_face\":0,\"decals_1\":0,\"nose_2\":0,\"face_2\":0,\"bracelets_2\":0,\"chin_4\":0,\"eyebrows_5\":0,\"eyebrows_2\":0,\"blend\":0,\"makeup_3\":0,\"bproof_1\":0,\"dad\":0,\"eye_color\":0,\"hair_1\":14,\"lips\":10,\"jaw_1\":0,\"mask_1\":0,\"watches_1\":-1,\"cheeks_1\":0,\"beard_3\":0,\"moles_2\":0,\"face\":0,\"glasses_2\":0,\"face_md_weight\":50,\"blemishes_2\":0,\"beard_2\":0,\"decals_2\":0,\"nose_4\":0,\"bproof_2\":0,\"bracelets_1\":-1,\"bodyb_1\":-1,\"bags_1\":0,\"age_2\":0,\"hair_color_2\":0,\"skin_3\":0,\"lipstick_2\":0,\"skin_2\":0,\"sun_1\":0,\"blemishes_1\":0,\"chimp_4\":10,\"neck\":10,\"pants_2\":0,\"pants_1\":239,\"beard_1\":0,\"bodyb_2\":0,\"chain_2\":0,\"chest_2\":0,\"ears_2\":0,\"cheeks_2\":0,\"lipstick_3\":0,\"blush_2\":0,\"hair_2\":0,\"glasses_1\":0,\"face_3\":0,\"age_1\":0,\"nose_1\":0,\"shoes_2\":0,\"chimp_1\":10,\"hair_color_1\":0,\"makeup_1\":0}},{\"label\":\"LA\",\"skin\":{\"chest_3\":0,\"sun_2\":0,\"helmet_2\":0,\"chimp_2\":10,\"mom\":21,\"eyebrows_3\":0,\"chimp_1\":10,\"cheeks_3\":0,\"tshirt_1\":294,\"eyebrow_2\":10,\"chimp_3\":10,\"bodyb_4\":0,\"torso_1\":631,\"tshirt_2\":1,\"blush_3\":0,\"sex\":0,\"skin_md_weight\":50,\"hair_2\":0,\"lip_thickness\":0,\"nose_3\":14,\"torso_2\":5,\"nose_6\":0,\"eyebrows_1\":0,\"makeup_4\":0,\"shoes_2\":2,\"chin_13\":0,\"moles_1\":0,\"cheeks_2\":0,\"jaw_2\":0,\"shoes_1\":151,\"blend_face\":0,\"bodyb_3\":-1,\"bracelets_1\":-1,\"watches_2\":0,\"chin_1\":0,\"blush_1\":0,\"complexion_1\":0,\"chain_1\":251,\"chest_1\":0,\"eyebrows_6\":0,\"nose_4\":8,\"eyebrow_1\":10,\"neck_thickness\":0,\"glasses_1\":0,\"mask_2\":0,\"skin\":3,\"decals_2\":0,\"complexion_2\":0,\"makeup_2\":0,\"lips\":10,\"ears_1\":-1,\"arms\":0,\"hair_3\":0,\"eye_squint\":0,\"helmet_1\":-1,\"decals_1\":0,\"mask_1\":0,\"bproof_1\":0,\"bracelets_2\":0,\"hair_color_2\":0,\"eyebrows_5\":0,\"face_2\":0,\"blend\":0,\"jaw_1\":0,\"dad\":0,\"lipstick_4\":0,\"eye_color\":0,\"hair_1\":14,\"makeup_3\":0,\"nose_5\":0,\"chin_2\":0,\"watches_1\":-1,\"cheeks_1\":0,\"beard_3\":0,\"moles_2\":0,\"face\":0,\"beard_4\":0,\"face_md_weight\":50,\"blemishes_2\":0,\"beard_2\":0,\"bags_2\":0,\"glasses_2\":0,\"eyebrows_4\":0,\"bproof_2\":0,\"nose_1\":0,\"bags_1\":0,\"age_2\":0,\"age_1\":0,\"skin_3\":0,\"lipstick_2\":0,\"skin_2\":0,\"sun_1\":0,\"blemishes_1\":0,\"chimp_4\":10,\"neck\":10,\"pants_2\":0,\"pants_1\":239,\"beard_1\":0,\"bodyb_2\":0,\"chain_2\":0,\"chest_2\":0,\"blush_2\":0,\"blend_skin\":0,\"lipstick_3\":0,\"nose_2\":20,\"lipstick_1\":0,\"ears_2\":0,\"face_3\":0,\"eyebrows_2\":0,\"chin_4\":0,\"bodyb_1\":-1,\"arms_2\":0,\"hair_color_1\":0,\"makeup_1\":0}}]}'),
(32, 'user_glasses', 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '{}'),
(33, 'user_ears', 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '{}'),
(34, 'user_helmet', 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '{}'),
(35, 'user_mask', 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '{}'),
(36, 'user_ears', 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '{}'),
(37, 'property', 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '{\"dressing\":[{\"skin\":{\"hair_2\":0,\"ears_2\":0,\"face_3\":0,\"mask_1\":0,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":15,\"sex\":0,\"blend_skin\":0,\"eyebrows_4\":0,\"arms_2\":0,\"torso_2\":3,\"sun_2\":0,\"nose_6\":0,\"shoes_2\":0,\"glasses_2\":0,\"bodyb_4\":0,\"sun_1\":0,\"hair_color_1\":0,\"eyebrow_1\":20,\"bproof_2\":0,\"lipstick_3\":0,\"bracelets_1\":-1,\"eyebrows_3\":0,\"chimp_2\":10,\"nose_2\":5,\"torso_1\":348,\"blush_1\":0,\"beard_3\":0,\"eyebrows_6\":0,\"blemishes_1\":0,\"chest_1\":0,\"beard_4\":0,\"blend_face\":10,\"bproof_1\":0,\"beard_1\":28,\"chin_4\":0,\"skin_3\":0,\"mom\":21,\"chin_13\":0,\"beard_2\":10,\"neck\":10,\"blush_2\":0,\"dad\":0,\"bracelets_2\":0,\"chimp_3\":10,\"jaw_1\":0,\"watches_1\":-1,\"makeup_1\":57,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":118,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"lips\":10,\"bags_2\":0,\"makeup_3\":0,\"blush_3\":0,\"makeup_4\":38,\"bodyb_2\":0,\"mask_2\":0,\"helmet_2\":0,\"eye_squint\":0,\"chimp_1\":10,\"cheeks_1\":0,\"nose_3\":15,\"moles_2\":0,\"age_1\":0,\"chimp_4\":10,\"ears_1\":-1,\"skin_2\":3,\"bodyb_3\":-1,\"face_md_weight\":50,\"blend\":0,\"hair_1\":73,\"makeup_2\":10,\"cheeks_3\":0,\"nose_1\":0,\"eye_color\":21,\"lip_thickness\":0,\"chain_1\":0,\"chest_3\":0,\"hair_3\":0,\"bags_1\":0,\"nose_4\":15,\"tshirt_2\":0,\"shoes_1\":114,\"lipstick_4\":0,\"lipstick_1\":0,\"chin_1\":0,\"eyebrows_2\":0,\"glasses_1\":34,\"complexion_2\":0,\"arms\":26,\"nose_5\":0,\"hair_color_2\":0,\"neck_thickness\":0,\"moles_1\":17,\"complexion_1\":0,\"face_2\":0,\"skin\":14,\"face\":2},\"label\":\"mafia\"},{\"skin\":{\"hair_2\":0,\"ears_2\":0,\"face_3\":0,\"mask_1\":0,\"decals_1\":0,\"helmet_1\":175,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":15,\"sex\":0,\"blend_skin\":0,\"eyebrows_4\":0,\"hair_color_2\":0,\"bodyb_2\":0,\"blend\":0,\"nose_6\":0,\"shoes_2\":1,\"glasses_2\":0,\"nose_4\":15,\"sun_1\":0,\"hair_color_1\":0,\"eyebrow_1\":20,\"complexion_2\":0,\"lipstick_3\":0,\"cheeks_3\":0,\"moles_2\":0,\"ears_1\":-1,\"nose_2\":5,\"torso_1\":895,\"blush_1\":0,\"mask_2\":0,\"eyebrows_6\":0,\"blemishes_1\":0,\"bproof_2\":0,\"chest_1\":0,\"eyebrows_3\":0,\"beard_3\":0,\"beard_1\":28,\"blend_face\":10,\"bproof_1\":56,\"mom\":21,\"chin_13\":0,\"bodyb_3\":-1,\"neck\":10,\"skin_3\":0,\"beard_2\":10,\"bracelets_2\":0,\"chain_1\":86,\"jaw_1\":0,\"makeup_1\":57,\"eyebrows_2\":0,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":186,\"chest_2\":0,\"watches_1\":-1,\"watches_2\":0,\"lips\":10,\"bags_2\":0,\"chimp_2\":10,\"blush_3\":0,\"makeup_4\":38,\"dad\":0,\"sun_2\":0,\"arms_2\":0,\"eye_squint\":0,\"lip_thickness\":0,\"cheeks_1\":0,\"nose_3\":15,\"helmet_2\":2,\"nose_5\":0,\"chimp_4\":10,\"blemishes_2\":0,\"age_1\":0,\"bracelets_1\":-1,\"face_md_weight\":50,\"skin_2\":3,\"hair_1\":73,\"makeup_2\":10,\"chin_4\":0,\"nose_1\":0,\"eye_color\":21,\"tshirt_2\":0,\"chimp_3\":10,\"chest_3\":0,\"makeup_3\":0,\"torso_2\":0,\"blush_2\":0,\"skin\":14,\"shoes_1\":135,\"chimp_1\":10,\"lipstick_1\":0,\"chin_1\":0,\"bodyb_4\":0,\"glasses_1\":34,\"beard_4\":0,\"arms\":26,\"lipstick_4\":0,\"bags_1\":0,\"neck_thickness\":0,\"moles_1\":17,\"complexion_1\":0,\"face_2\":0,\"hair_3\":0,\"face\":2},\"label\":\"mechanic\"}]}'),
(38, 'user_helmet', 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '{}'),
(39, 'user_glasses', 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '{}'),
(40, 'user_mask', 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '{}'),
(41, 'user_ears', 'char1:636f6db328aeabc289967ff088473d12badf4d5f', '{}'),
(42, 'property', 'char1:636f6db328aeabc289967ff088473d12badf4d5f', '{}'),
(43, 'user_glasses', 'char1:636f6db328aeabc289967ff088473d12badf4d5f', '{}'),
(44, 'user_mask', 'char1:636f6db328aeabc289967ff088473d12badf4d5f', '{}'),
(45, 'user_helmet', 'char1:636f6db328aeabc289967ff088473d12badf4d5f', '{}'),
(46, 'property', 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{\"dressing\":[{\"label\":\"swat\",\"skin\":{\"lip_thickness\":0,\"blemishes_2\":0,\"chimp_1\":10,\"eyebrows_3\":0,\"tshirt_1\":15,\"eyebrow_1\":10,\"bodyb_3\":-1,\"sun_1\":0,\"bags_2\":0,\"chin_2\":0,\"blush_1\":0,\"nose_4\":15,\"face\":0,\"chimp_4\":10,\"arms_2\":0,\"chin_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"glasses_2\":0,\"bracelets_2\":0,\"jaw_2\":0,\"age_2\":0,\"jaw_1\":0,\"makeup_3\":0,\"lips\":10,\"bodyb_4\":0,\"dad\":0,\"chain_2\":0,\"hair_3\":0,\"nose_2\":0,\"lipstick_3\":0,\"makeup_2\":0,\"cheeks_2\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"age_1\":0,\"pants_2\":0,\"blend_face\":0,\"decals_1\":0,\"ears_2\":0,\"hair_1\":37,\"skin_3\":0,\"makeup_1\":0,\"eyebrows_4\":0,\"blend\":0,\"ears_1\":-1,\"chest_3\":0,\"skin\":0,\"eyebrows_5\":0,\"eyebrows_6\":0,\"mom\":21,\"beard_3\":0,\"skin_2\":0,\"torso_1\":817,\"nose_3\":10,\"cheeks_3\":0,\"nose_5\":6,\"chest_1\":0,\"complexion_1\":0,\"chain_1\":0,\"chimp_2\":10,\"blemishes_1\":0,\"nose_6\":11,\"beard_2\":0,\"nose_1\":0,\"cheeks_1\":0,\"face_md_weight\":50,\"chest_2\":0,\"pants_1\":217,\"face_2\":0,\"skin_md_weight\":50,\"eyebrows_2\":0,\"watches_2\":0,\"hair_color_2\":0,\"chin_13\":0,\"shoes_2\":0,\"beard_1\":0,\"bodyb_2\":0,\"helmet_2\":0,\"bracelets_1\":-1,\"blush_2\":0,\"mask_2\":0,\"bags_1\":0,\"torso_2\":0,\"lipstick_2\":0,\"eye_squint\":0,\"tshirt_2\":0,\"blend_skin\":0,\"chimp_3\":10,\"bproof_1\":93,\"shoes_1\":25,\"beard_4\":0,\"face_3\":0,\"eyebrow_2\":10,\"mask_1\":169,\"blush_3\":0,\"hair_2\":0,\"moles_2\":0,\"bodyb_1\":-1,\"decals_2\":0,\"moles_1\":0,\"arms\":6,\"glasses_1\":53,\"eye_color\":0,\"lipstick_1\":0,\"makeup_4\":0,\"sex\":0,\"hair_color_1\":0,\"lipstick_4\":0,\"sun_2\":0,\"neck\":10,\"helmet_1\":150,\"bproof_2\":0,\"chin_4\":0}}]}'),
(47, 'user_ears', 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(48, 'user_glasses', 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(49, 'user_helmet', 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(50, 'user_mask', 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(51, 'property', 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', '{}'),
(52, 'user_ears', 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', '{}'),
(53, 'user_glasses', 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', '{}'),
(54, 'user_helmet', 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', '{}'),
(55, 'user_mask', 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', '{}'),
(56, 'property', 'char1:464736841e79f93c754f65f47d219b81e7b0d50a', '{}'),
(57, 'user_ears', 'char1:464736841e79f93c754f65f47d219b81e7b0d50a', '{}'),
(58, 'user_glasses', 'char1:464736841e79f93c754f65f47d219b81e7b0d50a', '{}'),
(59, 'user_helmet', 'char1:464736841e79f93c754f65f47d219b81e7b0d50a', '{}'),
(60, 'user_mask', 'char1:464736841e79f93c754f65f47d219b81e7b0d50a', '{}'),
(61, 'property', 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(62, 'user_ears', 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(63, 'user_glasses', 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(64, 'user_mask', 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}'),
(65, 'user_helmet', 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{}');
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(66, 'property', 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '{\"dressing\":[{\"skin\":{\"age_1\":0,\"ears_2\":0,\"face_3\":0,\"mask_1\":0,\"decals_1\":0,\"eyebrows_3\":1,\"pants_2\":4,\"chain_2\":0,\"eyebrows_1\":2,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":15,\"sex\":0,\"blend_skin\":2,\"eyebrows_4\":0,\"hair_color_2\":0,\"bodyb_2\":0,\"blend\":0,\"nose_6\":6,\"shoes_2\":0,\"glasses_2\":0,\"nose_4\":7,\"sun_1\":0,\"mask_2\":0,\"eyebrow_1\":10,\"bodyb_3\":-1,\"lipstick_3\":0,\"hair_2\":0,\"moles_2\":0,\"blend_face\":0,\"nose_2\":7,\"torso_1\":348,\"blush_1\":0,\"ears_1\":41,\"glasses_1\":0,\"blemishes_1\":0,\"bproof_2\":0,\"chest_1\":0,\"helmet_1\":-1,\"chimp_2\":10,\"beard_1\":20,\"beard_3\":0,\"bproof_1\":0,\"mom\":21,\"chin_13\":0,\"chin_4\":0,\"neck\":10,\"skin_3\":0,\"beard_2\":10,\"bracelets_2\":0,\"blush_2\":0,\"jaw_1\":0,\"dad\":0,\"eyebrows_2\":10,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":60,\"chest_2\":0,\"watches_1\":-1,\"watches_2\":0,\"lips\":10,\"bags_2\":0,\"hair_3\":0,\"blush_3\":0,\"beard_4\":0,\"bracelets_1\":-1,\"helmet_2\":0,\"makeup_4\":0,\"eye_squint\":0,\"blemishes_2\":0,\"cheeks_1\":0,\"nose_3\":7,\"torso_2\":1,\"skin_2\":0,\"chimp_4\":10,\"makeup_3\":0,\"arms_2\":0,\"chimp_1\":10,\"face_md_weight\":50,\"makeup_1\":0,\"hair_1\":79,\"makeup_2\":0,\"cheeks_3\":0,\"nose_1\":0,\"eye_color\":8,\"lip_thickness\":0,\"sun_2\":0,\"chest_3\":0,\"skin\":14,\"bags_1\":0,\"tshirt_2\":0,\"lipstick_4\":0,\"shoes_1\":7,\"bodyb_4\":0,\"lipstick_1\":0,\"chin_1\":0,\"eyebrows_6\":0,\"hair_color_1\":62,\"chimp_3\":10,\"arms\":1,\"nose_5\":6,\"complexion_2\":0,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"chain_1\":0,\"face\":2},\"label\":\"777\"},{\"skin\":{\"hair_2\":0,\"ears_2\":0,\"face_3\":0,\"skin_2\":0,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":10,\"chain_2\":0,\"eyebrows_1\":2,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":15,\"sex\":0,\"blend_skin\":2,\"eyebrows_4\":0,\"hair_color_2\":0,\"bodyb_2\":0,\"blend\":0,\"nose_6\":6,\"shoes_2\":0,\"glasses_2\":0,\"bodyb_4\":0,\"sun_1\":0,\"mask_2\":0,\"eyebrow_1\":10,\"complexion_2\":0,\"lipstick_3\":0,\"moles_2\":0,\"arms_2\":0,\"chimp_2\":10,\"nose_2\":7,\"torso_1\":859,\"blush_1\":0,\"sun_2\":0,\"eyebrows_6\":0,\"blemishes_1\":0,\"bproof_2\":0,\"chest_1\":0,\"mask_1\":0,\"beard_3\":0,\"beard_1\":20,\"bproof_1\":0,\"chin_4\":0,\"mom\":21,\"chin_13\":0,\"skin_3\":0,\"neck\":10,\"beard_2\":10,\"ears_1\":41,\"bracelets_2\":0,\"chain_1\":0,\"jaw_1\":0,\"dad\":0,\"makeup_1\":0,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":207,\"chest_2\":0,\"watches_1\":-1,\"watches_2\":0,\"lips\":10,\"blend_face\":0,\"hair_3\":0,\"blush_3\":0,\"makeup_4\":0,\"torso_2\":11,\"bags_2\":0,\"helmet_2\":0,\"eye_squint\":0,\"beard_4\":0,\"cheeks_1\":0,\"nose_3\":7,\"blemishes_2\":0,\"age_1\":0,\"chimp_4\":10,\"bodyb_3\":-1,\"bags_1\":230,\"blush_2\":0,\"face_md_weight\":50,\"chimp_3\":10,\"hair_1\":79,\"makeup_2\":0,\"cheeks_3\":0,\"nose_1\":0,\"chimp_1\":10,\"lip_thickness\":0,\"eye_color\":8,\"chest_3\":0,\"nose_4\":7,\"tshirt_2\":0,\"eyebrows_3\":1,\"hair_color_1\":62,\"shoes_1\":234,\"lipstick_4\":0,\"lipstick_1\":0,\"chin_1\":0,\"makeup_3\":0,\"glasses_1\":70,\"eyebrows_2\":10,\"arms\":1,\"nose_5\":6,\"bracelets_1\":-1,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"skin\":14,\"face\":2},\"label\":\"69\"},{\"skin\":{\"age_1\":0,\"ears_2\":0,\"face_3\":0,\"skin_2\":0,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":2,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":15,\"sex\":0,\"blend_skin\":2,\"eyebrows_4\":0,\"hair_color_2\":0,\"bodyb_2\":0,\"blend\":0,\"nose_6\":6,\"shoes_2\":8,\"glasses_2\":0,\"nose_4\":7,\"sun_1\":0,\"mask_2\":0,\"eyebrow_1\":10,\"hair_2\":0,\"lipstick_3\":0,\"bracelets_1\":-1,\"watches_1\":-1,\"bags_2\":0,\"nose_2\":7,\"torso_1\":798,\"blush_1\":0,\"makeup_1\":0,\"glasses_1\":70,\"blemishes_1\":0,\"bproof_2\":0,\"chest_1\":0,\"ears_1\":41,\"mask_1\":0,\"beard_1\":20,\"beard_3\":0,\"bproof_1\":0,\"mom\":21,\"chin_13\":0,\"chin_4\":0,\"neck\":10,\"skin_3\":0,\"beard_2\":10,\"bracelets_2\":0,\"blush_2\":0,\"jaw_1\":0,\"dad\":0,\"eyebrows_2\":10,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":225,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"lips\":10,\"blend_face\":0,\"hair_3\":0,\"blush_3\":0,\"beard_4\":0,\"eyebrows_3\":1,\"eyebrows_6\":0,\"helmet_2\":0,\"eye_squint\":0,\"makeup_4\":0,\"cheeks_1\":0,\"moles_2\":0,\"chimp_2\":10,\"nose_3\":7,\"chimp_4\":10,\"bodyb_3\":-1,\"torso_2\":0,\"sun_2\":0,\"face_md_weight\":50,\"chain_1\":0,\"hair_1\":79,\"makeup_2\":0,\"cheeks_3\":0,\"nose_1\":0,\"chimp_1\":10,\"lip_thickness\":0,\"skin\":14,\"chest_3\":0,\"chimp_3\":10,\"bags_1\":0,\"tshirt_2\":0,\"bodyb_4\":0,\"shoes_1\":275,\"hair_color_1\":62,\"lipstick_1\":0,\"chin_1\":0,\"lipstick_4\":0,\"complexion_2\":0,\"eye_color\":8,\"arms\":0,\"nose_5\":6,\"makeup_3\":0,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"arms_2\":0,\"face\":2},\"label\":\"LSPD\"},{\"skin\":{\"age_1\":0,\"ears_2\":0,\"face_3\":0,\"mask_1\":0,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":2,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":15,\"sex\":0,\"blend_skin\":2,\"bracelets_1\":-1,\"hair_color_2\":0,\"torso_2\":0,\"blend\":0,\"nose_6\":6,\"shoes_2\":1,\"glasses_2\":0,\"bodyb_4\":0,\"sun_1\":0,\"hair_color_1\":62,\"eyebrow_1\":10,\"chin_1\":0,\"lipstick_3\":0,\"hair_2\":0,\"moles_2\":0,\"watches_1\":-1,\"nose_2\":7,\"torso_1\":569,\"blush_1\":0,\"ears_1\":41,\"glasses_1\":70,\"blemishes_1\":0,\"mask_2\":0,\"lipstick_4\":0,\"chest_1\":0,\"arms_2\":0,\"beard_1\":20,\"cheeks_3\":0,\"bproof_1\":0,\"mom\":21,\"chin_13\":0,\"bodyb_2\":0,\"neck\":10,\"skin_3\":0,\"beard_2\":10,\"bracelets_2\":0,\"blush_2\":0,\"jaw_1\":0,\"dad\":0,\"eyebrows_2\":10,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":259,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"lips\":10,\"blend_face\":0,\"hair_3\":0,\"blush_3\":0,\"beard_4\":0,\"bags_2\":0,\"makeup_4\":0,\"chimp_2\":10,\"eye_squint\":0,\"helmet_2\":0,\"cheeks_1\":0,\"nose_3\":7,\"complexion_2\":0,\"skin_2\":0,\"chimp_4\":10,\"chain_1\":291,\"bodyb_3\":-1,\"skin\":14,\"face_md_weight\":50,\"eyebrows_3\":1,\"hair_1\":79,\"makeup_2\":0,\"chin_4\":0,\"nose_1\":0,\"chimp_1\":10,\"lip_thickness\":0,\"sun_2\":0,\"chest_3\":0,\"chimp_3\":10,\"bags_1\":230,\"nose_4\":7,\"tshirt_2\":0,\"shoes_1\":273,\"makeup_1\":0,\"lipstick_1\":0,\"bproof_2\":0,\"eye_color\":8,\"eyebrows_6\":0,\"beard_3\":0,\"arms\":1,\"nose_5\":6,\"makeup_3\":0,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"eyebrows_4\":0,\"face\":2},\"label\":\"2115\"},{\"skin\":{\"hair_2\":0,\"ears_2\":0,\"face_3\":0,\"skin_2\":0,\"decals_1\":0,\"helmet_1\":-1,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":2,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"helmet_2\":0,\"sex\":0,\"blend_skin\":2,\"eyebrows_4\":0,\"hair_color_2\":0,\"torso_2\":0,\"blend\":0,\"nose_6\":6,\"shoes_2\":0,\"glasses_2\":0,\"nose_4\":7,\"sun_1\":0,\"hair_color_1\":62,\"eyebrow_1\":10,\"chimp_2\":10,\"lipstick_3\":0,\"tshirt_2\":0,\"tshirt_1\":15,\"moles_2\":0,\"nose_2\":7,\"torso_1\":809,\"blush_1\":0,\"watches_1\":-1,\"glasses_1\":70,\"blemishes_1\":0,\"ears_1\":41,\"chin_1\":0,\"chimp_3\":10,\"beard_4\":0,\"beard_1\":20,\"mask_2\":0,\"chest_1\":0,\"mom\":21,\"chin_13\":0,\"arms_2\":0,\"neck\":10,\"cheeks_3\":0,\"bproof_1\":0,\"bracelets_2\":0,\"blush_2\":0,\"jaw_1\":0,\"bags_1\":230,\"makeup_1\":0,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":194,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"lips\":10,\"bags_2\":0,\"hair_3\":0,\"blush_3\":0,\"makeup_4\":0,\"skin_3\":0,\"beard_2\":10,\"dad\":0,\"eye_squint\":0,\"bodyb_2\":0,\"cheeks_1\":0,\"nose_3\":7,\"mask_1\":0,\"complexion_2\":0,\"chimp_4\":10,\"chain_1\":0,\"bracelets_1\":-1,\"age_1\":0,\"face_md_weight\":50,\"eyebrows_3\":1,\"hair_1\":79,\"makeup_2\":0,\"chin_4\":0,\"nose_1\":0,\"eye_color\":8,\"lip_thickness\":0,\"bodyb_3\":-1,\"chest_3\":0,\"makeup_3\":0,\"bodyb_4\":0,\"eyebrows_2\":10,\"chimp_1\":10,\"shoes_1\":270,\"skin\":14,\"lipstick_1\":0,\"bproof_2\":0,\"nose_5\":6,\"eyebrows_6\":0,\"beard_3\":0,\"arms\":4,\"lipstick_4\":0,\"sun_2\":0,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"blend_face\":0,\"face\":2},\"label\":\"LSPD_2\"}]}'),
(67, 'user_ears', 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '{}'),
(68, 'user_glasses', 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '{}'),
(69, 'user_helmet', 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '{}'),
(70, 'user_mask', 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '{}'),
(71, 'property', 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', '{}'),
(72, 'user_ears', 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', '{}'),
(73, 'user_glasses', 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', '{}'),
(74, 'user_helmet', 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', '{}'),
(75, 'user_mask', 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', '{}'),
(76, 'property', 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d', '{}'),
(77, 'user_ears', 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d', '{}'),
(78, 'user_glasses', 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d', '{}'),
(79, 'user_helmet', 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d', '{}'),
(80, 'user_mask', 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d', '{}'),
(81, 'property', 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '{\"dressing\":[{\"skin\":{\"hair_2\":0,\"ears_2\":0,\"face_3\":0,\"mask_1\":0,\"decals_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"skin_md_weight\":50,\"age_2\":0,\"chin_2\":0,\"bodyb_1\":-1,\"eyebrows_5\":0,\"jaw_2\":0,\"tshirt_1\":0,\"sex\":0,\"blend_skin\":0,\"eyebrows_4\":0,\"hair_color_2\":0,\"bodyb_2\":0,\"sun_2\":0,\"nose_6\":0,\"shoes_2\":0,\"glasses_2\":0,\"nose_4\":0,\"sun_1\":0,\"hair_color_1\":0,\"eyebrow_1\":10,\"bracelets_1\":-1,\"lipstick_3\":0,\"lip_thickness\":0,\"lips\":10,\"moles_2\":0,\"nose_2\":0,\"torso_1\":0,\"blush_1\":0,\"watches_1\":-1,\"eyebrows_6\":0,\"blemishes_1\":0,\"chimp_2\":10,\"age_1\":0,\"ears_1\":-1,\"bproof_2\":0,\"beard_1\":0,\"chest_1\":0,\"torso_2\":0,\"mom\":21,\"chin_13\":0,\"beard_3\":0,\"neck\":10,\"beard_2\":0,\"chin_4\":0,\"bracelets_2\":0,\"blush_2\":0,\"jaw_1\":0,\"skin_3\":0,\"eyebrows_2\":0,\"cheeks_2\":0,\"lipstick_2\":0,\"pants_1\":0,\"chest_2\":0,\"blemishes_2\":0,\"watches_2\":0,\"bproof_1\":0,\"blend_face\":0,\"makeup_3\":0,\"blush_3\":0,\"makeup_4\":0,\"dad\":0,\"nose_5\":0,\"skin\":0,\"eye_squint\":0,\"helmet_2\":0,\"cheeks_1\":0,\"nose_3\":0,\"bags_2\":0,\"mask_2\":0,\"chimp_4\":10,\"beard_4\":0,\"skin_2\":0,\"bodyb_3\":-1,\"face_md_weight\":50,\"helmet_1\":-1,\"hair_1\":0,\"makeup_2\":0,\"cheeks_3\":0,\"nose_1\":0,\"chimp_1\":10,\"tshirt_2\":0,\"chain_1\":0,\"chest_3\":0,\"blend\":0,\"makeup_1\":0,\"bags_1\":0,\"arms_2\":0,\"shoes_1\":0,\"glasses_1\":0,\"lipstick_1\":0,\"chin_1\":0,\"eye_color\":0,\"bodyb_4\":0,\"complexion_2\":0,\"arms\":0,\"lipstick_4\":0,\"chimp_3\":10,\"neck_thickness\":0,\"moles_1\":0,\"complexion_1\":0,\"face_2\":0,\"hair_3\":0,\"face\":0},\"label\":\"pedal\"}]}'),
(82, 'user_glasses', 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '{}'),
(83, 'user_ears', 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '{}'),
(84, 'user_helmet', 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '{}'),
(85, 'user_mask', 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '{}'),
(86, 'property', 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '{}'),
(87, 'user_ears', 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '{}'),
(88, 'user_glasses', 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '{}'),
(89, 'user_helmet', 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '{}'),
(90, 'user_mask', 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `dojmdt_judgments`
--

CREATE TABLE `dojmdt_judgments` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `charname` varchar(255) NOT NULL,
  `fp` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `fee` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `dojmdt_kartoteka_notatki`
--

CREATE TABLE `dojmdt_kartoteka_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `notatka` longtext NOT NULL,
  `fp` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `dojmdt_notatki`
--

CREATE TABLE `dojmdt_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `notatka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `dojmdt_notatki`
--

INSERT INTO `dojmdt_notatki` (`id`, `identifier`, `notatka`) VALUES
(21, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', ''),
(22, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', ''),
(23, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', ''),
(24, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '');

-- --------------------------------------------------------

--
-- Table structure for table `dojmdt_ogloszenia`
--

CREATE TABLE `dojmdt_ogloszenia` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `ogloszenie` longtext NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `dojmdt_poszukiwani`
--

CREATE TABLE `dojmdt_poszukiwani` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `fp` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `dojmdt_raporty`
--

CREATE TABLE `dojmdt_raporty` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `raport` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emsmdt_history`
--

CREATE TABLE `emsmdt_history` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `patient` varchar(255) DEFAULT 'Brak',
  `doctor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'Brak',
  `reason` longtext DEFAULT NULL,
  `fee` int(11) DEFAULT 0,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emsmdt_karta_notatki`
--

CREATE TABLE `emsmdt_karta_notatki` (
  `id` int(11) NOT NULL,
  `identifier` int(11) NOT NULL,
  `notatka` longtext NOT NULL,
  `doctor` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emsmdt_notatki`
--

CREATE TABLE `emsmdt_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `notatka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emsmdt_ogloszenia`
--

CREATE TABLE `emsmdt_ogloszenia` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `ogloszenie` longtext NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emsmdt_raporty`
--

CREATE TABLE `emsmdt_raporty` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `raport` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emstablet_history`
--

CREATE TABLE `emstablet_history` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `patient` varchar(255) DEFAULT 'Brak',
  `doctor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'Brak',
  `reason` longtext DEFAULT NULL,
  `fee` int(11) DEFAULT 0,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emstablet_karta_notatki`
--

CREATE TABLE `emstablet_karta_notatki` (
  `id` int(11) NOT NULL,
  `identifier` int(11) NOT NULL,
  `notatka` longtext NOT NULL,
  `doctor` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emstablet_notatki`
--

CREATE TABLE `emstablet_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `notatka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emstablet_ogloszenia`
--

CREATE TABLE `emstablet_ogloszenia` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `ogloszenie` longtext NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `emstablet_raporty`
--

CREATE TABLE `emstablet_raporty` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `raport` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `gym_memberships`
--

CREATE TABLE `gym_memberships` (
  `owner` varchar(70) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gym_memberships`
--

INSERT INTO `gym_memberships` (`owner`, `name`, `time`) VALUES
('char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'plaza_gym', 1715236134),
('char1:f9c26edc4589062f2ca6c77463f8617f942f078a', 'plaza_gym', 1715263911);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('alive_chicken', 'Living chicken', 1, 0, 1),
('bandage', 'Bandage', 2, 0, 1),
('blowpipe', 'Blowtorch', 2, 0, 1),
('bread', 'Bread', 1, 0, 1),
('cannabis', 'Cannabis', 3, 0, 1),
('carokit', 'Body Kit', 3, 0, 1),
('carotool', 'Tools', 2, 0, 1),
('clothe', 'Cloth', 1, 0, 1),
('copper', 'Copper', 1, 0, 1),
('cutted_wood', 'Cut wood', 1, 0, 1),
('diamond', 'Diamond', 1, 0, 1),
('essence', 'Gas', 1, 0, 1),
('fabric', 'Fabric', 1, 0, 1),
('fish', 'Fish', 1, 0, 1),
('fixkit', 'Repair Kit', 3, 0, 1),
('fixtool', 'Repair Tools', 2, 0, 1),
('gazbottle', 'Gas Bottle', 2, 0, 1),
('gold', 'Gold', 1, 0, 1),
('iron', 'Iron', 1, 0, 1),
('marijuana', 'Marijuana', 2, 0, 1),
('medikit', 'Medikit', 2, 0, 1),
('packaged_chicken', 'Chicken fillet', 1, 0, 1),
('packaged_plank', 'Packaged wood', 1, 0, 1),
('petrol', 'Oil', 1, 0, 1),
('petrol_raffin', 'Processed oil', 1, 0, 1),
('phone', 'Phone', 1, 0, 1),
('radio', 'Radio', 1, 0, 1),
('slaughtered_chicken', 'Slaughtered chicken', 1, 0, 1),
('stone', 'Stone', 1, 0, 1),
('washed_stone', 'Washed stone', 1, 0, 1),
('water', 'Water', 1, 0, 1),
('wood', 'Wood', 1, 0, 1),
('wool', 'Wool', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance', 'EMS', 1),
('ballas', 'Ballas', 0),
('doj', 'Departament Of Justice', 1),
('kawiarnia', 'Uwucafe', 0),
('mechanic', 'Mechanic', 1),
('offambulance', 'ESX Poza służbą', 1),
('offmechanic', 'LSC Poza służbą', 1),
('offpolice', 'LSPD Poza służbą', 1),
('org1', 'Ballas', 0),
('police', 'LSPD', 1),
('rolnik', 'Rolnik', 0),
('unemployed', 'Unemployed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
(2, 'police', 0, 'recruit', 'Cadet', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(3, 'police', 1, 'officer', 'Police Officer I', 225, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(4, 'police', 2, 'officer', 'Police Officer II', 255, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(5, 'police', 3, 'officer', 'Police Officer III', 275, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(6, 'police', 4, 'officer', 'Sergeant I', 295, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(7, 'police', 5, 'sergeant', 'Sergeant II', 320, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(8, 'police', 7, 'sergeant', 'Lieutenant I', 345, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(9, 'police', 8, 'lieutenant ', 'Lieutenant II', 360, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(10, 'police', 9, 'lieutenant ', 'Captain I', 390, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(11, 'police', 10, 'captain', 'Captain II', 420, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(12, 'police', 11, 'captain', 'Captain III', 440, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(13, 'police', 12, 'boss', 'Commander', 460, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(14, 'police', 13, 'boss', 'Deputy Chief of Police', 480, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(15, 'police', 14, 'boss', 'Assistant Chief of Police', 520, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(16, 'police', 15, 'boss', 'Chief Of Police', 560, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(23, 'ambulance', 0, 'ambulance', 'Praktykant', 160, '{}', '{}'),
(24, 'ambulance', 1, 'ambulance', 'Stażysta', 185, '{}', '{}'),
(25, 'ambulance', 2, 'ambulance', 'Pielęgniarz ', 210, '{}', '{}'),
(26, 'ambulance', 3, 'ambulance', 'Pielęgniarz Specjalista', 245, '{}', '{}'),
(27, 'ambulance', 4, 'ambulance', 'Młodszy Ratownik ', 255, '{}', '{}'),
(28, 'ambulance', 5, 'ambulance', 'Ratownik ', 275, '{}', '{}'),
(29, 'ambulance', 6, 'ambulance', 'Ratownik Koordynator ', 310, '{}', '{}'),
(30, 'ambulance', 7, 'ambulance', 'Rezydent ', 325, '{}', '{}'),
(31, 'ambulance', 8, 'ambulance', 'Asystent Lekarza', 340, '{}', '{}'),
(32, 'ambulance', 9, 'ambulance', 'Lekarz ', 365, '{}', '{}'),
(33, 'ambulance', 10, 'ambulance', 'Lekarz Specjalista', 390, '{}', '{}'),
(34, 'ambulance', 11, 'ambulance', 'Chirurg ', 410, '{}', '{}'),
(35, 'ambulance', 12, 'ambulance', 'Chirurg Specjalista', 440, '{}', '{}'),
(36, 'ambulance', 13, 'ambulance', 'Asystent Doktora', 485, '{}', '{}'),
(37, 'offambulance', 0, 'ambulance', 'Praktykant', 0, '{}', '{}'),
(38, 'offambulance', 1, 'ambulance', 'Stażysta ', 0, '{}', '{}'),
(39, 'offambulance', 2, 'ambulance', 'Pielęgniarz ', 0, '{}', '{}'),
(40, 'offambulance', 3, 'ambulance', 'Pielęgniarz Specjalista \n', 0, '{}', '{]'),
(41, 'offambulance', 4, 'ambulance', 'Młodszy Ratownik \n', 0, '{}', '{}'),
(42, 'offambulance', 5, 'ambulance', 'Ratownik ', 0, '{}', '{}'),
(43, 'offambulance', 6, 'ambulance', 'Ratownik Koordynator', 0, '{}', '{}'),
(44, 'offambulance', 7, 'ambulance', 'Rezydent ', 0, '{}', '{}'),
(45, 'offambulance', 8, 'ambulance', 'Asystent Lekarza \n', 0, '{}', '{}'),
(46, 'offambulance', 9, 'ambulance', 'Lekarz ', 0, '{}', '{}'),
(47, 'offambulance', 10, 'ambulance', 'Lekarz Specjalista\n', 0, '{}', '{}'),
(48, 'offambulance', 11, 'ambulance', 'Chirurg ', 0, '{}', '{}'),
(49, 'offambulance', 12, 'ambulance', 'Chirurg Specjalista \n', 0, '{}', '{}'),
(50, 'offambulance', 13, 'boss', 'Asystent Doktora\n', 0, '{}', '{}'),
(126, 'offpolice', 0, 'recruit', 'Cadet', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(127, 'offpolice', 1, 'officer', 'Probie Trooper', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(128, 'offpolice', 2, 'officer', 'Trooper', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(129, 'offpolice', 3, 'officer', 'Senior Trooper', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(130, 'offpolice', 4, 'sergeant', 'Seargeant', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(131, 'offpolice', 5, 'sergeant', 'Senior Sergeant', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(132, 'offpolice', 6, 'sergeant', 'Staff Sergeant', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(133, 'offpolice', 7, 'sergeant', 'Lieutenant', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(134, 'offpolice', 8, 'sergeant', 'Staff Lieutenant', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(135, 'offpolice', 9, 'sergeant', 'Captain', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(136, 'offpolice', 10, 'lieutenant', 'Staff Captain', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(137, 'offpolice', 11, 'lieutenant', 'Commander', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(138, 'offpolice', 12, 'boss', 'Assistant Chief of Police', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(139, 'offpolice', 13, 'boss', 'Deputy Chief of Police', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(140, 'offpolice', 14, 'boss', 'Chief of Police', 0, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(312, 'mechanic', 1, 'novice', 'Nowicjusz', 180, '{}', '{}'),
(313, 'mechanic', 4, 'novice', 'Zawodowiec', 250, '{}', '{}'),
(314, 'mechanic', 5, 'experimente', 'Specjalista', 270, '{}', '{}'),
(315, 'mechanic', 7, 'chief', 'Zast. Szefa', 350, '{}', '{}'),
(316, 'mechanic', 8, 'boss', 'Szef', 400, '{}', '{}'),
(317, 'mechanic', 3, 'novice', 'Fachowiec', 220, '{}', '{}'),
(318, 'mechanic', 2, 'novice', 'Majster', 200, '{}', '{}'),
(319, 'mechanic', 6, 'experimente', 'Koordynator', 300, '{}', '{}'),
(320, 'offmechanic', 0, 'recrue', 'Rekrut', 0, '{}', '{}'),
(321, 'offmechanic', 1, 'novice', 'Nowicjusz', 0, '{}', '{}'),
(322, 'offmechanic', 4, 'novice', 'Zawodowiec', 0, '{}', '{}'),
(323, 'offmechanic', 5, 'experimente', 'Specjalista', 0, '{}', '{}'),
(324, 'offmechanic', 7, 'chief', 'Zast. Szefa', 0, '{}', '{}'),
(325, 'offmechanic', 8, 'boss', 'Szef', 0, '{}', '{}'),
(326, 'offmechanic', 3, 'novice', 'Fachowiec', 0, '{}', '{}'),
(327, 'offmechanic', 2, 'novice', 'Majster', 0, '{}', '{}'),
(328, 'offmechanic', 6, 'experimente', 'Koordynator', 0, '{}', '{}'),
(691, 'ambulance', 14, 'ambulance', 'Habilitowany ', 435, '{}', '{}'),
(692, 'ambulance', 15, 'boss', 'Zastępca Opiekuna', 435, '{}', '{}'),
(693, 'ambulance', 16, 'boss', 'Opiekun Oddziału', 440, '{}', '{}'),
(694, 'ambulance', 17, 'boss', 'Asystent Ordynatora', 455, '{}', '{}'),
(695, 'ambulance', 18, 'boss', 'Zastępca Ordynatora', 470, '{}', '{}'),
(696, 'ambulance', 19, 'boss', 'Ordynator Szpitala', 485, '{}', '{}'),
(697, 'ambulance', 20, 'boss', 'Dyrektor Szpitala', 500, '{}', '{}'),
(698, 'rolnik', 0, 'pracownik', 'Pracownik', 200, '{}', '{}'),
(699, 'doj', 0, 'recruit', 'Stażysta', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(700, 'doj', 1, 'officer', 'Adwokat', 225, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(701, 'doj', 2, 'boss', 'Sędzia', 255, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(702, 'doj', 3, 'boss', 'Prokurator Generalny', 275, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(703, 'doj', 4, 'boss', 'Gubernator', 295, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(704, 'org1', 0, 'recruit', 'BALLAS', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(705, 'org1', 1, 'officer', 'BALLAS', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(706, 'org1', 2, 'boss', 'OG BALLAS', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(707, 'ballas', 0, 'recruit', 'BALLAS', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(708, 'ballas', 1, 'officer', 'BALLAS', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(709, 'ballas', 2, 'boss', 'OG BALLAS', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(710, 'kawiarnia', 0, 'recruit', 'Stażysta', 180, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(711, 'kawiarnia', 1, 'officer', 'Pracownik', 225, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(712, 'kawiarnia', 2, 'officer', 'Menago', 255, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(713, 'kawiarnia', 3, 'boss', 'Szefito', 275, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(714, 'kawiarnia', 4, 'boss', 'Prezes', 295, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Boat License'),
('dmv', 'Driving Permit'),
('drive', 'Drivers License'),
('drive_bike', 'Motorcycle License'),
('drive_truck', 'Commercial Drivers License'),
('med', 'Ubezpieczenie Zdrowotne'),
('oc_insurance', 'OC'),
('police_heli', 'HELI'),
('police_moto', 'MOTO'),
('police_swat', 'SWAT'),
('weapon', 'Weapon License'),
('weed_processing', 'Weed Processing License');

-- --------------------------------------------------------

--
-- Table structure for table `lscmtablet_history`
--

CREATE TABLE `lscmtablet_history` (
  `id` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(50) DEFAULT 'Brak',
  `surname` varchar(50) DEFAULT 'Brak',
  `treatment` varchar(999) DEFAULT 'Brak',
  `price` varchar(50) DEFAULT 'Brak',
  `date` varchar(50) DEFAULT 'Brak',
  `doctor` varchar(50) DEFAULT 'Brak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lspdmdt_judgments`
--

CREATE TABLE `lspdmdt_judgments` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `charname` varchar(255) NOT NULL,
  `fp` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `fee` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lspdmdt_kartoteka_notatki`
--

CREATE TABLE `lspdmdt_kartoteka_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `notatka` longtext NOT NULL,
  `fp` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lspdmdt_notatki`
--

CREATE TABLE `lspdmdt_notatki` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `notatka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `lspdmdt_notatki`
--

INSERT INTO `lspdmdt_notatki` (`id`, `identifier`, `notatka`) VALUES
(21, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '');

-- --------------------------------------------------------

--
-- Table structure for table `lspdmdt_ogloszenia`
--

CREATE TABLE `lspdmdt_ogloszenia` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `ogloszenie` longtext NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lspdmdt_poszukiwani`
--

CREATE TABLE `lspdmdt_poszukiwani` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `fp` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lspdmdt_raporty`
--

CREATE TABLE `lspdmdt_raporty` (
  `id` int(11) NOT NULL,
  `fp` varchar(255) DEFAULT NULL,
  `raport` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multichars_slots`
--

CREATE TABLE `multichars_slots` (
  `identifier` varchar(60) NOT NULL,
  `slots` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `name` varchar(10) NOT NULL,
  `account` int(11) NOT NULL DEFAULT 0,
  `members_limit` int(11) DEFAULT NULL,
  `warehouse_slots` int(11) DEFAULT NULL,
  `warehouse_weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`name`, `account`, `members_limit`, `warehouse_slots`, `warehouse_weight`) VALUES
('ballas', 990001, 10, 51, 120000),
('bloods', 0, 10, 50, 50000),
('cartel', 82606, 128, 110, 174000),
('families', 1074496, 13, 55, 156000),
('lost', 770000, 34, 60, 238000),
('mafia', 100000, 30, 50, 85000),
('marabunta', 0, 10, 50, 50000),
('sinister', 780000, 140, 150, 86000),
('vagos', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('ballas', 990001, 10, 50, 120000),
('vagos', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 990001, 10, 50, 120000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('ballas', 990001, 10, 50, 120000),
('vagos', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 990001, 10, 50, 120000),
('vagos', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 990001, 10, 50, 120000),
('families', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('marabunta', 0, 10, 50, 50000),
('families', 0, 10, 50, 50000),
('sinister', 0, 10, 50, 50000),
('mafia', 0, 10, 50, 50000),
('lost', 0, 10, 50, 50000),
('cartel', 0, 10, 50, 50000),
('vagos', 0, 10, 50, 50000),
('ballas', 0, 10, 50, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `organizations_clothes`
--

CREATE TABLE `organizations_clothes` (
  `id` int(11) NOT NULL,
  `org` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations_clothes`
--

INSERT INTO `organizations_clothes` (`id`, `org`, `label`, `value`) VALUES
(21, 'families', 'tomek', '{\"chimp_3\":10,\"bags_2\":0,\"arms\":5,\"glasses_2\":20,\"hair_1\":138,\"hair_color_1\":0,\"lipstick_1\":0,\"jaw_2\":10,\"chimp_2\":10,\"eyebrows_4\":0,\"nose_3\":10,\"chain_2\":0,\"torso_2\":0,\"moles_1\":0,\"eyebrow_2\":10,\"bproof_2\":0,\"lips\":10,\"hair_3\":6,\"blend_face\":6,\"lipstick_3\":0,\"decals_2\":0,\"lipstick_4\":0,\"chest_3\":0,\"sun_1\":0,\"mask_2\":5,\"watches_1\":-1,\"nose_2\":10,\"skin\":3,\"sun_2\":0,\"tshirt_2\":0,\"chimp_1\":10,\"beard_2\":10,\"beard_4\":0,\"chain_1\":270,\"beard_3\":0,\"shoes_2\":2,\"hair_2\":0,\"cheeks_3\":10,\"cheeks_2\":10,\"face_2\":45,\"face_3\":7,\"beard_1\":8,\"glasses_1\":42,\"watches_2\":0,\"skin_3\":0,\"jaw_1\":10,\"eye_color\":22,\"makeup_2\":10,\"lipstick_2\":0,\"age_2\":0,\"bodyb_2\":0,\"chimp_4\":10,\"complexion_1\":0,\"chest_2\":0,\"blush_3\":0,\"helmet_2\":0,\"bracelets_2\":0,\"helmet_1\":208,\"shoes_1\":143,\"blend\":0,\"bproof_1\":0,\"eyebrows_3\":0,\"decals_1\":0,\"nose_6\":10,\"complexion_2\":0,\"mask_1\":279,\"blemishes_2\":0,\"eyebrows_2\":10,\"torso_1\":5,\"neck\":10,\"face\":21,\"ears_1\":-1,\"blend_skin\":0,\"chest_1\":0,\"bags_1\":227,\"eyebrow_1\":10,\"blush_2\":0,\"age_1\":0,\"makeup_4\":0,\"bracelets_1\":-1,\"eyebrows_1\":22,\"pants_2\":1,\"hair_color_2\":26,\"makeup_3\":0,\"makeup_1\":26,\"pants_1\":245,\"tshirt_1\":15,\"blush_1\":0,\"blemishes_1\":0,\"sex\":0,\"skin_2\":0,\"bodyb_1\":0,\"nose_1\":10,\"ears_2\":0,\"arms_2\":0,\"nose_5\":10,\"moles_2\":0,\"nose_4\":10,\"cheeks_1\":10}'),
(22, 'families', 'og', '{\"cheeks_2\":10,\"bags_2\":1,\"arms\":12,\"glasses_2\":0,\"hair_1\":176,\"hair_color_1\":0,\"blemishes_1\":0,\"jaw_2\":10,\"chimp_2\":10,\"eyebrows_4\":0,\"nose_3\":10,\"chain_2\":0,\"torso_2\":13,\"moles_1\":0,\"eyebrow_2\":10,\"bproof_2\":0,\"lips\":10,\"hair_3\":21,\"blend_face\":0,\"lipstick_3\":0,\"age_2\":0,\"lipstick_4\":0,\"pants_1\":189,\"sun_1\":0,\"mask_2\":0,\"watches_1\":-1,\"nose_2\":10,\"skin\":3,\"sun_2\":0,\"tshirt_2\":0,\"hair_2\":0,\"beard_2\":0,\"beard_4\":0,\"bodyb_2\":0,\"beard_3\":0,\"shoes_2\":2,\"chest_1\":0,\"helmet_1\":207,\"decals_2\":0,\"eyebrows_2\":0,\"watches_2\":0,\"skin_2\":0,\"blush_1\":0,\"cheeks_3\":10,\"skin_3\":0,\"face_3\":0,\"eye_color\":0,\"makeup_2\":0,\"lipstick_2\":0,\"blush_3\":0,\"chest_2\":0,\"chimp_4\":10,\"complexion_1\":0,\"sex\":0,\"eyebrows_3\":0,\"helmet_2\":0,\"eyebrows_1\":0,\"chain_1\":0,\"eyebrow_1\":10,\"jaw_1\":10,\"bproof_1\":0,\"face_2\":0,\"decals_1\":0,\"hair_color_2\":0,\"glasses_1\":42,\"mask_1\":264,\"blemishes_2\":0,\"nose_1\":10,\"torso_1\":473,\"neck\":10,\"face\":0,\"ears_1\":-1,\"blend_skin\":0,\"bracelets_2\":0,\"shoes_1\":243,\"bags_1\":219,\"beard_1\":0,\"age_1\":0,\"makeup_4\":0,\"lipstick_1\":0,\"complexion_2\":0,\"pants_2\":0,\"tshirt_1\":15,\"makeup_3\":0,\"makeup_1\":0,\"blush_2\":0,\"chest_3\":0,\"bracelets_1\":-1,\"chimp_1\":10,\"chimp_3\":10,\"blend\":0,\"bodyb_1\":0,\"nose_6\":10,\"ears_2\":0,\"arms_2\":0,\"nose_5\":10,\"moles_2\":0,\"nose_4\":10,\"cheeks_1\":10}'),
(25, 'families', 'nie groch', '{\"arms\":12,\"bags_2\":0,\"watches_1\":-1,\"chain_1\":197,\"chimp_3\":10,\"glasses_2\":0,\"blend\":0,\"blemishes_1\":0,\"chimp_1\":10,\"nose_1\":10,\"eyebrows_4\":0,\"complexion_2\":0,\"eyebrow_2\":10,\"sex\":0,\"face_2\":0,\"tshirt_2\":0,\"chest_2\":0,\"beard_4\":0,\"jaw_2\":10,\"chimp_4\":10,\"beard_3\":0,\"blush_1\":0,\"chest_3\":0,\"complexion_1\":0,\"skin_3\":0,\"jaw_1\":10,\"hair_color_2\":0,\"lipstick_1\":0,\"age_2\":0,\"eyebrows_1\":0,\"watches_2\":0,\"helmet_1\":-1,\"cheeks_3\":10,\"chain_2\":0,\"skin\":3,\"cheeks_2\":10,\"face\":0,\"bproof_1\":0,\"hair_2\":0,\"blend_skin\":0,\"ears_1\":-1,\"shoes_1\":215,\"bags_1\":0,\"bodyb_1\":0,\"tshirt_1\":15,\"bodyb_2\":0,\"torso_2\":1,\"pants_1\":259,\"beard_2\":0,\"ears_2\":0,\"lipstick_2\":0,\"mask_2\":0,\"nose_5\":10,\"beard_1\":0,\"eyebrow_1\":10,\"eye_color\":0,\"nose_3\":10,\"blend_face\":0,\"lips\":10,\"hair_color_1\":0,\"cheeks_1\":10,\"moles_2\":0,\"mask_1\":264,\"face_3\":0,\"eyebrows_3\":0,\"helmet_2\":0,\"sun_2\":0,\"skin_2\":0,\"decals_2\":0,\"hair_1\":176,\"sun_1\":0,\"blemishes_2\":0,\"nose_6\":10,\"arms_2\":0,\"eyebrows_2\":0,\"chimp_2\":10,\"decals_1\":0,\"blush_2\":0,\"neck\":10,\"lipstick_3\":0,\"hair_3\":21,\"pants_2\":5,\"torso_1\":670,\"nose_2\":10,\"glasses_1\":42,\"chest_1\":0,\"nose_4\":10,\"bracelets_2\":0,\"makeup_3\":0,\"age_1\":0,\"makeup_1\":0,\"bracelets_1\":-1,\"lipstick_4\":0,\"makeup_4\":0,\"makeup_2\":0,\"shoes_2\":0,\"bproof_2\":0,\"moles_1\":0,\"blush_3\":0}'),
(27, 'families', 'skyden super ficik', '{\"complexion_2\":0,\"ears_1\":-1,\"torso_2\":10,\"sex\":0,\"helmet_2\":0,\"blemishes_1\":0,\"complexion_1\":0,\"eyebrows_1\":7,\"blush_1\":0,\"mask_1\":262,\"neck\":10,\"age_1\":0,\"shoes_1\":162,\"jaw_2\":10,\"tshirt_1\":15,\"shoes_2\":0,\"makeup_4\":0,\"makeup_1\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"bracelets_2\":0,\"chest_1\":0,\"nose_1\":10,\"beard_1\":2,\"decals_2\":0,\"eyebrow_2\":10,\"pants_2\":1,\"tshirt_2\":0,\"face_3\":0,\"blend_face\":3,\"chimp_1\":10,\"chimp_2\":10,\"glasses_1\":42,\"blemishes_2\":0,\"bags_2\":0,\"beard_4\":34,\"watches_2\":0,\"blend\":2,\"nose_3\":10,\"chimp_3\":10,\"cheeks_2\":10,\"skin_2\":0,\"beard_2\":3,\"cheeks_3\":10,\"watches_1\":-1,\"age_2\":0,\"lipstick_2\":0,\"torso_1\":485,\"blend_skin\":1,\"blush_2\":0,\"eyebrows_3\":14,\"lipstick_1\":0,\"chest_3\":0,\"arms\":28,\"sun_2\":0,\"cheeks_1\":10,\"skin\":35,\"moles_1\":0,\"makeup_3\":0,\"moles_2\":0,\"blush_3\":0,\"bracelets_1\":-1,\"decals_1\":0,\"bodyb_1\":0,\"nose_5\":10,\"bproof_2\":0,\"eyebrows_2\":10,\"nose_4\":10,\"makeup_2\":0,\"hair_1\":107,\"face_2\":45,\"chain_1\":0,\"eye_color\":14,\"ears_2\":0,\"skin_3\":0,\"glasses_2\":0,\"mask_2\":3,\"bodyb_2\":1,\"chimp_4\":10,\"face\":11,\"jaw_1\":10,\"eyebrow_1\":10,\"lipstick_3\":0,\"arms_2\":0,\"hair_3\":7,\"pants_1\":108,\"lips\":10,\"chest_2\":0,\"sun_1\":0,\"beard_3\":51,\"nose_2\":10,\"hair_color_2\":20,\"helmet_1\":-1,\"chain_2\":0,\"bags_1\":0,\"bproof_1\":0,\"hair_2\":0,\"hair_color_1\":44,\"nose_6\":10}'),
(39, 'cartel', 'TechFleka #odbijanie konwoju', '{\"pants_2\":1,\"eyebrows_3\":0,\"mask_1\":126,\"moles_1\":0,\"shoes_2\":0,\"lipstick_1\":0,\"lipstick_3\":0,\"jaw_1\":10,\"torso_1\":667,\"helmet_1\":101,\"bags_2\":0,\"nose_1\":10,\"ears_1\":-1,\"decals_2\":0,\"arms\":46,\"neck\":10,\"nose_4\":10,\"bracelets_2\":0,\"bracelets_1\":-1,\"blush_2\":0,\"blend_skin\":0,\"sun_2\":0,\"torso_2\":1,\"decals_1\":0,\"makeup_4\":0,\"eye_color\":0,\"chain_2\":0,\"bodyb_2\":0,\"beard_3\":0,\"pants_1\":240,\"bodyb_1\":0,\"chimp_2\":10,\"makeup_2\":0,\"hair_color_2\":0,\"skin_2\":0,\"hair_color_1\":0,\"beard_2\":0,\"shoes_1\":143,\"watches_2\":0,\"hair_2\":0,\"arms_2\":0,\"age_1\":0,\"glasses_2\":0,\"jaw_2\":10,\"lipstick_2\":0,\"mask_2\":0,\"eyebrow_1\":10,\"tshirt_2\":0,\"makeup_3\":0,\"blush_1\":0,\"eyebrows_2\":0,\"nose_2\":10,\"bproof_1\":0,\"cheeks_2\":10,\"moles_2\":0,\"chain_1\":270,\"glasses_1\":15,\"face_2\":6,\"nose_5\":10,\"skin\":24,\"watches_1\":-1,\"nose_6\":10,\"complexion_2\":0,\"chest_3\":0,\"tshirt_1\":57,\"chimp_1\":10,\"complexion_1\":0,\"cheeks_1\":10,\"cheeks_3\":10,\"bproof_2\":0,\"eyebrows_1\":0,\"nose_3\":10,\"beard_1\":0,\"beard_4\":0,\"blend_face\":0,\"blemishes_1\":0,\"blemishes_2\":0,\"skin_3\":0,\"lipstick_4\":0,\"eyebrow_2\":10,\"ears_2\":0,\"helmet_2\":0,\"sex\":0,\"sun_1\":0,\"chimp_4\":10,\"blend\":0,\"face\":24,\"blush_3\":0,\"chest_2\":0,\"hair_3\":0,\"eyebrows_4\":0,\"chimp_3\":10,\"lips\":10,\"age_2\":0,\"face_3\":3,\"chest_1\":0,\"hair_1\":196,\"makeup_1\":0,\"bags_1\":198}'),
(56, 'mafia', 'Specjalna akcja', '{\"makeup_1\":0,\"bracelets_2\":0,\"sun_2\":0,\"nose_3\":10,\"skin_2\":0,\"lipstick_1\":0,\"beard_4\":0,\"cheeks_1\":10,\"hair_color_2\":11,\"nose_2\":10,\"chimp_4\":10,\"lipstick_2\":0,\"age_2\":0,\"sex\":0,\"makeup_3\":0,\"ears_1\":-1,\"pants_2\":0,\"cheeks_2\":10,\"shoes_1\":24,\"bodyb_1\":0,\"nose_5\":10,\"moles_1\":3,\"age_1\":0,\"chimp_1\":10,\"tshirt_1\":15,\"face\":0,\"beard_3\":0,\"shoes_2\":0,\"lipstick_4\":0,\"complexion_1\":0,\"torso_1\":324,\"decals_2\":0,\"helmet_1\":-1,\"glasses_1\":0,\"blemishes_2\":0,\"beard_1\":3,\"mask_2\":0,\"jaw_1\":10,\"nose_4\":10,\"mask_1\":126,\"eyebrows_4\":0,\"chimp_3\":10,\"makeup_4\":0,\"ears_2\":0,\"chimp_2\":10,\"blend_skin\":0,\"complexion_2\":0,\"bracelets_1\":-1,\"bproof_2\":0,\"skin_3\":0,\"chain_1\":0,\"bproof_1\":98,\"lipstick_3\":0,\"nose_1\":10,\"chain_2\":0,\"chest_1\":0,\"sun_1\":0,\"decals_1\":0,\"eye_color\":14,\"eyebrows_3\":0,\"glasses_2\":0,\"eyebrows_1\":9,\"blush_2\":0,\"eyebrow_1\":10,\"face_3\":0,\"lips\":10,\"hair_1\":87,\"face_2\":0,\"beard_2\":7,\"tshirt_2\":0,\"blush_1\":0,\"cheeks_3\":10,\"makeup_2\":0,\"hair_2\":0,\"watches_1\":-1,\"eyebrow_2\":10,\"blend\":0,\"neck\":10,\"eyebrows_2\":6,\"bags_2\":0,\"bags_1\":0,\"bodyb_2\":0,\"helmet_2\":0,\"pants_1\":34,\"arms_1\":1,\"hair_color_1\":20,\"blush_3\":0,\"torso_2\":1,\"blend_face\":0,\"jaw_2\":10,\"chest_2\":0,\"moles_2\":4,\"skin\":8,\"hair_3\":1,\"arms\":147,\"arms_2\":0,\"watches_2\":0,\"chest_3\":0,\"blemishes_1\":0,\"nose_6\":10}'),
(57, 'mafia', 'Elegancko', '{\"lipstick_4\":0,\"complexion_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"skin\":8,\"neck\":10,\"sex\":0,\"nose_1\":10,\"age_2\":0,\"bracelets_2\":0,\"cheeks_3\":10,\"lips\":10,\"tshirt_1\":26,\"face_3\":0,\"nose_3\":10,\"bproof_1\":0,\"ears_2\":0,\"cheeks_1\":10,\"pants_1\":24,\"chimp_4\":10,\"blemishes_1\":0,\"sun_2\":0,\"torso_2\":2,\"face_2\":0,\"blemishes_2\":0,\"arms_2\":0,\"tshirt_2\":12,\"helmet_1\":169,\"makeup_4\":0,\"helmet_2\":2,\"blush_3\":0,\"nose_2\":10,\"nose_5\":10,\"hair_3\":1,\"eyebrows_2\":6,\"bodyb_2\":0,\"lipstick_3\":0,\"jaw_1\":10,\"ears_1\":-1,\"chimp_2\":10,\"glasses_2\":5,\"hair_color_1\":20,\"nose_6\":10,\"shoes_1\":10,\"eyebrows_3\":0,\"makeup_2\":0,\"chest_2\":0,\"hair_1\":87,\"blush_1\":0,\"chest_1\":0,\"arms\":46,\"complexion_2\":0,\"decals_1\":0,\"blush_2\":0,\"bodyb_1\":0,\"chest_3\":0,\"age_1\":0,\"torso_1\":72,\"moles_2\":4,\"sun_1\":0,\"makeup_1\":0,\"decals_2\":0,\"hair_2\":0,\"jaw_2\":10,\"blend_skin\":0,\"chimp_3\":10,\"shoes_2\":0,\"eyebrow_2\":10,\"skin_3\":0,\"beard_3\":0,\"bproof_2\":0,\"watches_2\":0,\"blend\":0,\"hair_color_2\":11,\"chain_1\":206,\"eyebrows_1\":9,\"mask_1\":169,\"cheeks_2\":10,\"bracelets_1\":-1,\"glasses_1\":5,\"arms_1\":1,\"watches_1\":-1,\"chimp_1\":10,\"beard_2\":7,\"eyebrow_1\":10,\"face\":0,\"chain_2\":0,\"pants_2\":0,\"bags_2\":0,\"blend_face\":0,\"mask_2\":13,\"eye_color\":14,\"nose_4\":10,\"makeup_3\":0,\"beard_1\":3,\"skin_2\":0,\"eyebrows_4\":0,\"lipstick_1\":0,\"moles_1\":3,\"bags_1\":0}'),
(58, 'mafia', 'Akcja lekka', '{\"lipstick_4\":0,\"complexion_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"skin\":8,\"neck\":10,\"sex\":0,\"nose_1\":10,\"age_2\":0,\"bracelets_2\":0,\"cheeks_3\":10,\"lips\":10,\"tshirt_1\":15,\"face_3\":0,\"nose_3\":10,\"bproof_1\":98,\"ears_2\":0,\"cheeks_1\":10,\"pants_1\":123,\"chimp_4\":10,\"blemishes_1\":0,\"sun_2\":0,\"torso_2\":3,\"face_2\":0,\"blemishes_2\":0,\"arms_2\":0,\"tshirt_2\":0,\"helmet_1\":142,\"makeup_4\":0,\"helmet_2\":0,\"blush_3\":0,\"nose_2\":10,\"nose_5\":10,\"hair_3\":1,\"eyebrows_2\":6,\"bodyb_2\":0,\"lipstick_3\":0,\"jaw_1\":10,\"ears_1\":-1,\"chimp_2\":10,\"glasses_2\":6,\"hair_color_1\":20,\"nose_6\":10,\"shoes_1\":25,\"eyebrows_3\":0,\"makeup_2\":0,\"chest_2\":0,\"hair_1\":87,\"blush_1\":0,\"chest_1\":0,\"arms\":146,\"complexion_2\":0,\"decals_1\":0,\"blush_2\":0,\"bodyb_1\":0,\"chest_3\":0,\"age_1\":0,\"torso_1\":349,\"moles_2\":4,\"sun_1\":0,\"makeup_1\":0,\"decals_2\":0,\"hair_2\":0,\"jaw_2\":10,\"blend_skin\":0,\"chimp_3\":10,\"shoes_2\":0,\"eyebrow_2\":10,\"skin_3\":0,\"beard_3\":0,\"bproof_2\":0,\"watches_2\":0,\"blend\":0,\"hair_color_2\":11,\"chain_1\":251,\"eyebrows_1\":9,\"mask_1\":104,\"cheeks_2\":10,\"bracelets_1\":-1,\"glasses_1\":5,\"arms_1\":1,\"watches_1\":-1,\"chimp_1\":10,\"beard_2\":7,\"eyebrow_1\":10,\"face\":0,\"chain_2\":0,\"pants_2\":0,\"bags_2\":0,\"blend_face\":0,\"mask_2\":25,\"eye_color\":14,\"nose_4\":10,\"makeup_3\":0,\"beard_1\":3,\"skin_2\":0,\"eyebrows_4\":0,\"lipstick_1\":0,\"moles_1\":3,\"bags_1\":0}'),
(78, 'lost', 'Lost Rekrut', '{\"eyebrows_2\":0,\"watches_1\":-1,\"bags_2\":0,\"decals_1\":0,\"beard_3\":29,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"nose_3\":10,\"pants_2\":2,\"helmet_2\":0,\"skin\":3,\"face_3\":0,\"lipstick_1\":0,\"lips\":10,\"tshirt_2\":0,\"mask_2\":13,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"bags_1\":0,\"blemishes_2\":0,\"ears_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"makeup_2\":0,\"blend_face\":0,\"chimp_3\":10,\"nose_5\":10,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":14,\"arms\":42,\"skin_3\":0,\"hair_2\":0,\"chest_3\":0,\"bodyb_2\":0,\"complexion_2\":0,\"arms_1\":1,\"jaw_1\":10,\"torso_1\":257,\"cheeks_3\":10,\"shoes_2\":0,\"glasses_1\":0,\"chain_2\":0,\"eye_color\":0,\"chest_2\":0,\"lipstick_2\":0,\"face_2\":0,\"blend\":0,\"complexion_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"ears_1\":-1,\"blend_skin\":0,\"bproof_2\":0,\"eyebrows_1\":0,\"eyebrows_3\":0,\"beard_2\":0,\"tshirt_1\":285,\"chimp_2\":10,\"beard_1\":0,\"lipstick_4\":0,\"blemishes_1\":0,\"eyebrow_2\":10,\"age_1\":0,\"blush_2\":0,\"sex\":0,\"shoes_1\":25,\"hair_1\":112,\"makeup_1\":0,\"face\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"bracelets_1\":-1,\"neck\":10,\"bodyb_1\":0,\"skin_2\":0,\"mask_1\":169,\"blush_1\":0,\"hair_color_2\":0,\"nose_6\":10,\"age_2\":0,\"pants_1\":3,\"torso_2\":0,\"cheeks_2\":10,\"chimp_4\":10,\"moles_2\":0,\"eyebrow_1\":10,\"chain_1\":0,\"nose_4\":10,\"sun_1\":0,\"blush_3\":0}'),
(79, 'lost', 'Lost Prospect', '{\"eyebrows_2\":0,\"watches_1\":-1,\"bags_2\":0,\"decals_1\":0,\"beard_3\":29,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"nose_3\":10,\"pants_2\":1,\"helmet_2\":0,\"skin\":3,\"face_3\":0,\"lipstick_1\":0,\"lips\":10,\"tshirt_2\":0,\"mask_2\":13,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"bags_1\":0,\"blemishes_2\":0,\"ears_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"makeup_2\":0,\"blend_face\":0,\"chimp_3\":10,\"nose_5\":10,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":14,\"arms\":12,\"skin_3\":0,\"hair_2\":0,\"chest_3\":0,\"bodyb_2\":0,\"complexion_2\":0,\"arms_1\":1,\"jaw_1\":10,\"torso_1\":650,\"cheeks_3\":10,\"shoes_2\":0,\"glasses_1\":0,\"chain_2\":0,\"eye_color\":0,\"chest_2\":0,\"lipstick_2\":0,\"face_2\":0,\"blend\":0,\"complexion_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"ears_1\":-1,\"blend_skin\":0,\"bproof_2\":0,\"eyebrows_1\":0,\"eyebrows_3\":0,\"beard_2\":0,\"tshirt_1\":285,\"chimp_2\":10,\"beard_1\":0,\"lipstick_4\":0,\"blemishes_1\":0,\"eyebrow_2\":10,\"age_1\":0,\"blush_2\":0,\"sex\":0,\"shoes_1\":27,\"hair_1\":112,\"makeup_1\":0,\"face\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"bracelets_1\":-1,\"neck\":10,\"bodyb_1\":0,\"skin_2\":0,\"mask_1\":169,\"blush_1\":0,\"hair_color_2\":0,\"nose_6\":10,\"age_2\":0,\"pants_1\":43,\"torso_2\":0,\"cheeks_2\":10,\"chimp_4\":10,\"moles_2\":0,\"eyebrow_1\":10,\"chain_1\":0,\"nose_4\":10,\"sun_1\":0,\"blush_3\":0}'),
(80, 'mafia', 'syndykat vs triada', '{\"eyebrows_2\":10,\"jaw_1\":10,\"bags_2\":0,\"decals_1\":0,\"chest_3\":0,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":11,\"nose_3\":10,\"pants_2\":0,\"helmet_2\":0,\"skin\":8,\"bracelets_1\":-1,\"lipstick_1\":0,\"lips\":20,\"tshirt_2\":0,\"mask_2\":25,\"bracelets_2\":0,\"makeup_3\":0,\"blush_1\":0,\"blemishes_1\":0,\"blemishes_2\":0,\"ears_2\":0,\"makeup_4\":0,\"bproof_1\":98,\"arms_2\":0,\"makeup_2\":0,\"blend_face\":0,\"chimp_3\":10,\"mask_1\":104,\"watches_2\":0,\"nose_1\":1,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":6,\"beard_4\":0,\"hair_color_1\":8,\"arms\":146,\"skin_3\":0,\"beard_3\":0,\"face\":0,\"chest_2\":0,\"blush_3\":0,\"cheeks_3\":18,\"lipstick_4\":0,\"beard_2\":10,\"eye_color\":0,\"eyebrows_3\":0,\"glasses_1\":5,\"hair_1\":46,\"makeup_1\":0,\"blush_2\":0,\"lipstick_2\":0,\"face_2\":0,\"bproof_2\":0,\"complexion_1\":0,\"bodyb_2\":0,\"lipstick_3\":0,\"helmet_1\":175,\"ears_1\":-1,\"blend_skin\":0,\"torso_1\":336,\"eyebrows_1\":1,\"chest_1\":0,\"age_2\":0,\"tshirt_1\":252,\"chimp_2\":10,\"shoes_1\":25,\"watches_1\":-1,\"chain_2\":0,\"blend\":0,\"age_1\":0,\"nose_5\":10,\"sex\":0,\"beard_1\":8,\"complexion_2\":0,\"bodyb_1\":0,\"decals_2\":0,\"chimp_1\":3,\"eyebrows_4\":0,\"jaw_2\":4,\"shoes_2\":0,\"neck\":10,\"sun_1\":0,\"skin_2\":0,\"eyebrow_2\":10,\"arms_1\":1,\"hair_color_2\":0,\"nose_6\":10,\"chimp_4\":10,\"pants_1\":114,\"torso_2\":3,\"cheeks_2\":10,\"bags_1\":0,\"moles_2\":0,\"eyebrow_1\":10,\"chain_1\":246,\"nose_4\":10,\"hair_2\":0,\"face_3\":0}'),
(81, 'lost', 'Lost Member', '{\"eyebrows_2\":0,\"watches_1\":-1,\"bags_2\":0,\"decals_1\":0,\"beard_3\":29,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"nose_3\":10,\"pants_2\":0,\"helmet_2\":0,\"skin\":3,\"face_3\":0,\"lipstick_1\":0,\"lips\":10,\"tshirt_2\":0,\"mask_2\":13,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"bags_1\":0,\"blemishes_2\":0,\"ears_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"makeup_2\":0,\"blend_face\":0,\"chimp_3\":10,\"nose_5\":10,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":14,\"arms\":15,\"skin_3\":0,\"hair_2\":0,\"chest_3\":0,\"bodyb_2\":0,\"complexion_2\":0,\"arms_1\":1,\"jaw_1\":10,\"torso_1\":366,\"cheeks_3\":10,\"shoes_2\":0,\"glasses_1\":0,\"chain_2\":0,\"eye_color\":0,\"chest_2\":0,\"lipstick_2\":0,\"face_2\":0,\"blend\":0,\"complexion_1\":0,\"decals_2\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"ears_1\":-1,\"blend_skin\":0,\"bproof_2\":0,\"eyebrows_1\":0,\"eyebrows_3\":0,\"beard_2\":0,\"tshirt_1\":38,\"chimp_2\":10,\"beard_1\":0,\"lipstick_4\":0,\"blemishes_1\":0,\"eyebrow_2\":10,\"age_1\":0,\"blush_2\":0,\"sex\":0,\"shoes_1\":25,\"hair_1\":112,\"makeup_1\":0,\"face\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"bracelets_1\":-1,\"neck\":10,\"bodyb_1\":0,\"skin_2\":0,\"mask_1\":169,\"blush_1\":0,\"hair_color_2\":0,\"nose_6\":10,\"age_2\":0,\"pants_1\":31,\"torso_2\":0,\"cheeks_2\":10,\"chimp_4\":10,\"moles_2\":0,\"eyebrow_1\":10,\"chain_1\":0,\"nose_4\":10,\"sun_1\":0,\"blush_3\":0}'),
(82, 'lost', 'Lost St.Member', '{\"hair_2\":0,\"blush_3\":0,\"bags_2\":0,\"decals_1\":0,\"chest_3\":0,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"nose_3\":10,\"pants_2\":0,\"helmet_2\":0,\"skin\":19,\"bracelets_1\":-1,\"lipstick_1\":0,\"lips\":10,\"tshirt_2\":0,\"mask_2\":13,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"bags_1\":0,\"blemishes_2\":0,\"age_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"face\":0,\"blend_face\":0,\"chimp_3\":10,\"chimp_4\":10,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":0,\"arms\":15,\"skin_3\":0,\"ears_2\":0,\"shoes_1\":25,\"chest_2\":0,\"blemishes_1\":0,\"blush_2\":0,\"watches_1\":-1,\"beard_3\":0,\"cheeks_3\":10,\"makeup_1\":0,\"glasses_1\":0,\"arms_1\":1,\"blush_1\":0,\"bodyb_2\":0,\"lipstick_2\":0,\"face_2\":0,\"bproof_2\":0,\"complexion_1\":0,\"makeup_2\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"ears_1\":-1,\"blend_skin\":0,\"blend\":0,\"eyebrows_1\":0,\"eye_color\":0,\"beard_2\":10,\"tshirt_1\":38,\"chimp_2\":10,\"beard_1\":8,\"lipstick_4\":0,\"decals_2\":0,\"sun_1\":0,\"age_1\":0,\"jaw_1\":10,\"sex\":0,\"torso_1\":366,\"chain_2\":0,\"bodyb_1\":0,\"shoes_2\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"face_3\":0,\"neck\":10,\"nose_5\":10,\"eyebrows_3\":0,\"skin_2\":0,\"mask_1\":169,\"hair_color_2\":0,\"nose_6\":10,\"hair_1\":24,\"pants_1\":31,\"torso_2\":1,\"cheeks_2\":10,\"eyebrow_2\":10,\"moles_2\":0,\"eyebrow_1\":10,\"chain_1\":0,\"nose_4\":10,\"eyebrows_2\":0,\"complexion_2\":0}'),
(83, 'lost', 'Lost Lieutenant', '{\"hair_2\":0,\"blush_3\":0,\"bags_2\":0,\"decals_1\":0,\"chest_3\":0,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"nose_3\":10,\"pants_2\":1,\"helmet_2\":0,\"skin\":19,\"bracelets_1\":-1,\"lipstick_1\":0,\"lips\":10,\"tshirt_2\":2,\"mask_2\":0,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"bags_1\":0,\"blemishes_2\":0,\"age_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"face\":0,\"blend_face\":0,\"chimp_3\":10,\"chimp_4\":10,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":0,\"arms\":14,\"skin_3\":0,\"ears_2\":0,\"shoes_1\":25,\"chest_2\":0,\"blemishes_1\":0,\"blush_2\":0,\"watches_1\":-1,\"beard_3\":0,\"cheeks_3\":10,\"makeup_1\":0,\"glasses_1\":0,\"arms_1\":1,\"blush_1\":0,\"bodyb_2\":0,\"lipstick_2\":0,\"face_2\":0,\"bproof_2\":0,\"complexion_1\":0,\"makeup_2\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"ears_1\":-1,\"blend_skin\":0,\"blend\":0,\"eyebrows_1\":0,\"eye_color\":0,\"beard_2\":10,\"tshirt_1\":0,\"chimp_2\":10,\"beard_1\":8,\"lipstick_4\":0,\"decals_2\":0,\"sun_1\":0,\"age_1\":0,\"jaw_1\":10,\"sex\":0,\"torso_1\":403,\"chain_2\":0,\"bodyb_1\":0,\"shoes_2\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"face_3\":0,\"neck\":10,\"nose_5\":10,\"eyebrows_3\":0,\"skin_2\":0,\"mask_1\":0,\"hair_color_2\":0,\"nose_6\":10,\"hair_1\":24,\"pants_1\":52,\"torso_2\":0,\"cheeks_2\":10,\"eyebrow_2\":10,\"moles_2\":0,\"eyebrow_1\":10,\"chain_1\":0,\"nose_4\":10,\"eyebrows_2\":0,\"complexion_2\":0}'),
(84, 'lost', 'Lost Road Captain', '{\"eyebrows_2\":0,\"sun_1\":0,\"bags_2\":0,\"decals_1\":0,\"chest_3\":0,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"beard_2\":10,\"pants_2\":0,\"helmet_2\":0,\"skin\":19,\"decals_2\":0,\"lipstick_1\":0,\"complexion_2\":0,\"tshirt_2\":4,\"mask_2\":0,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"blemishes_1\":0,\"blemishes_2\":0,\"ears_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"makeup_2\":0,\"blend_face\":0,\"chimp_3\":10,\"lipstick_4\":0,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":0,\"arms\":42,\"skin_3\":0,\"hair_2\":0,\"nose_5\":10,\"chest_2\":0,\"nose_3\":10,\"chain_1\":0,\"blush_3\":0,\"bracelets_1\":-1,\"cheeks_3\":10,\"face\":0,\"glasses_1\":0,\"hair_1\":24,\"beard_1\":8,\"jaw_1\":10,\"lipstick_2\":0,\"face_2\":0,\"bproof_2\":0,\"complexion_1\":0,\"bags_1\":0,\"lipstick_3\":0,\"torso_1\":338,\"ears_1\":-1,\"blend_skin\":0,\"arms_1\":1,\"eyebrows_1\":0,\"blush_1\":0,\"bodyb_2\":0,\"tshirt_1\":0,\"chimp_2\":10,\"shoes_1\":14,\"lips\":10,\"bodyb_1\":0,\"mask_1\":0,\"age_1\":0,\"shoes_2\":0,\"sex\":0,\"helmet_1\":-1,\"blend\":0,\"makeup_1\":0,\"face_3\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"eyebrow_2\":10,\"neck\":10,\"chimp_4\":10,\"skin_2\":0,\"chain_2\":0,\"age_2\":0,\"hair_color_2\":0,\"nose_6\":10,\"eyebrows_3\":0,\"pants_1\":63,\"torso_2\":2,\"cheeks_2\":10,\"eye_color\":0,\"moles_2\":0,\"eyebrow_1\":10,\"blush_2\":0,\"nose_4\":10,\"beard_3\":0,\"watches_1\":-1}'),
(85, 'lost', 'Lost Treasurer', '{\"eyebrows_2\":0,\"sun_1\":0,\"bags_2\":0,\"decals_1\":0,\"chest_3\":0,\"hair_3\":0,\"cheeks_1\":10,\"nose_2\":10,\"beard_2\":10,\"pants_2\":0,\"helmet_2\":0,\"skin\":19,\"decals_2\":0,\"lipstick_1\":0,\"complexion_2\":0,\"tshirt_2\":0,\"mask_2\":13,\"bracelets_2\":0,\"makeup_3\":0,\"chest_1\":0,\"blemishes_1\":0,\"blemishes_2\":0,\"ears_2\":0,\"makeup_4\":0,\"bproof_1\":0,\"arms_2\":0,\"makeup_2\":0,\"blend_face\":0,\"chimp_3\":10,\"lipstick_4\":0,\"watches_2\":0,\"nose_1\":10,\"moles_1\":0,\"sun_2\":0,\"glasses_2\":0,\"beard_4\":0,\"hair_color_1\":0,\"arms\":42,\"skin_3\":0,\"hair_2\":0,\"nose_5\":10,\"chest_2\":0,\"nose_3\":10,\"chain_1\":0,\"blush_3\":0,\"bracelets_1\":-1,\"cheeks_3\":10,\"face\":0,\"glasses_1\":0,\"hair_1\":24,\"beard_1\":8,\"jaw_1\":10,\"lipstick_2\":0,\"face_2\":0,\"bproof_2\":0,\"complexion_1\":0,\"bags_1\":0,\"lipstick_3\":0,\"torso_1\":328,\"ears_1\":-1,\"blend_skin\":0,\"arms_1\":1,\"eyebrows_1\":0,\"blush_1\":0,\"bodyb_2\":0,\"tshirt_1\":285,\"chimp_2\":10,\"shoes_1\":25,\"lips\":10,\"bodyb_1\":0,\"mask_1\":169,\"age_1\":0,\"shoes_2\":0,\"sex\":0,\"helmet_1\":-1,\"blend\":0,\"makeup_1\":0,\"face_3\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"jaw_2\":10,\"eyebrow_2\":10,\"neck\":10,\"chimp_4\":10,\"skin_2\":0,\"chain_2\":0,\"age_2\":0,\"hair_color_2\":0,\"nose_6\":10,\"eyebrows_3\":0,\"pants_1\":1,\"torso_2\":0,\"cheeks_2\":10,\"eye_color\":0,\"moles_2\":0,\"eyebrow_1\":10,\"blush_2\":0,\"nose_4\":10,\"beard_3\":0,\"watches_1\":-1}'),
(86, 'lost', 'Lost Secretary', '{\"chest_2\":0,\"chimp_4\":10,\"bracelets_1\":-1,\"blend_face\":0,\"chimp_1\":10,\"decals_2\":0,\"hair_2\":0,\"bags_2\":0,\"jaw_1\":10,\"blemishes_2\":0,\"bracelets_2\":0,\"decals_1\":0,\"chest_3\":0,\"nose_5\":10,\"arms_1\":1,\"face_2\":0,\"nose_3\":10,\"chain_2\":0,\"tshirt_1\":285,\"bproof_1\":0,\"glasses_1\":0,\"nose_2\":10,\"shoes_2\":0,\"blush_2\":0,\"skin_2\":0,\"sex\":0,\"hair_3\":0,\"blush_3\":0,\"nose_1\":10,\"beard_4\":0,\"ears_2\":0,\"moles_1\":0,\"lips\":10,\"tshirt_2\":0,\"chest_1\":0,\"pants_1\":4,\"lipstick_2\":0,\"cheeks_3\":10,\"blend_skin\":0,\"pants_2\":0,\"eyebrow_1\":10,\"lipstick_3\":0,\"torso_1\":522,\"skin\":19,\"lipstick_1\":0,\"bodyb_2\":0,\"mask_1\":169,\"eyebrows_3\":0,\"torso_2\":0,\"jaw_2\":10,\"helmet_2\":0,\"nose_6\":10,\"arms\":42,\"hair_color_1\":0,\"neck\":10,\"glasses_2\":0,\"bproof_2\":0,\"cheeks_2\":10,\"beard_1\":8,\"moles_2\":0,\"lipstick_4\":0,\"makeup_1\":0,\"mask_2\":13,\"complexion_1\":0,\"bodyb_1\":0,\"eyebrows_2\":0,\"eye_color\":0,\"skin_3\":0,\"hair_1\":24,\"eyebrow_2\":10,\"sun_2\":0,\"cheeks_1\":10,\"helmet_1\":-1,\"blemishes_1\":0,\"shoes_1\":25,\"watches_1\":-1,\"complexion_2\":0,\"age_1\":0,\"nose_4\":10,\"age_2\":0,\"arms_2\":0,\"sun_1\":0,\"watches_2\":0,\"beard_2\":10,\"hair_color_2\":0,\"makeup_4\":0,\"ears_1\":-1,\"face\":0,\"beard_3\":0,\"eyebrows_4\":0,\"makeup_3\":0,\"makeup_2\":0,\"bags_1\":0,\"chimp_3\":10,\"eyebrows_1\":0,\"chimp_2\":10,\"face_3\":0,\"blend\":0,\"chain_1\":0,\"blush_1\":0}'),
(89, 'lost', 'Lost V-President', '{\"makeup_4\":0,\"hair_color_1\":0,\"moles_1\":0,\"nose_5\":10,\"blend_face\":8,\"chimp_2\":10,\"skin_2\":0,\"beard_3\":0,\"age_2\":0,\"helmet_2\":0,\"sun_2\":0,\"torso_2\":0,\"face_3\":14,\"chimp_1\":10,\"skin_3\":0,\"ears_1\":-1,\"watches_1\":-1,\"lipstick_1\":0,\"ears_2\":0,\"pants_2\":0,\"neck\":10,\"blend_skin\":3,\"sex\":0,\"shoes_1\":25,\"bracelets_2\":0,\"arms_1\":1,\"glasses_1\":0,\"blush_1\":0,\"blend\":0,\"cheeks_1\":10,\"cheeks_2\":10,\"eyebrows_2\":10,\"chest_2\":0,\"hair_color_2\":1,\"eyebrow_2\":13,\"complexion_2\":0,\"chimp_4\":10,\"bodyb_1\":0,\"shoes_2\":0,\"arms_2\":0,\"makeup_1\":0,\"eye_color\":0,\"torso_1\":226,\"jaw_1\":0,\"tshirt_1\":285,\"nose_3\":10,\"lipstick_2\":0,\"hair_2\":0,\"nose_6\":10,\"skin\":37,\"face\":5,\"lipstick_4\":0,\"chest_3\":0,\"eyebrow_1\":19,\"hair_1\":0,\"chimp_3\":10,\"cheeks_3\":10,\"sun_1\":0,\"bproof_2\":0,\"age_1\":0,\"lipstick_3\":0,\"blemishes_1\":0,\"bags_1\":119,\"beard_1\":16,\"decals_1\":0,\"makeup_2\":0,\"lips\":10,\"beard_4\":0,\"makeup_3\":0,\"blush_2\":0,\"hair_3\":1,\"chain_1\":0,\"complexion_1\":0,\"glasses_2\":0,\"beard_2\":10,\"nose_2\":10,\"bodyb_2\":0,\"blush_3\":0,\"arms\":41,\"tshirt_2\":0,\"bracelets_1\":-1,\"decals_2\":0,\"blemishes_2\":0,\"jaw_2\":10,\"mask_1\":169,\"eyebrows_1\":0,\"chest_1\":0,\"chain_2\":0,\"nose_1\":12,\"eyebrows_3\":1,\"bproof_1\":0,\"nose_4\":10,\"helmet_1\":-1,\"bags_2\":2,\"face_2\":12,\"watches_2\":0,\"moles_2\":0,\"mask_2\":13,\"pants_1\":4,\"eyebrows_4\":4}'),
(90, 'lost', 'Lost President', '{\"makeup_4\":0,\"hair_color_1\":0,\"moles_1\":0,\"nose_5\":10,\"blend_face\":0,\"hair_2\":0,\"skin_2\":0,\"beard_3\":0,\"chain_2\":0,\"blend_skin\":0,\"sun_2\":0,\"lipstick_3\":0,\"shoes_2\":0,\"chimp_1\":10,\"skin_3\":0,\"ears_1\":-1,\"watches_1\":-1,\"lipstick_1\":0,\"ears_2\":0,\"pants_2\":0,\"neck\":10,\"bags_1\":119,\"sex\":0,\"shoes_1\":51,\"tshirt_2\":0,\"arms_1\":1,\"glasses_1\":0,\"blush_1\":0,\"beard_2\":10,\"chain_1\":0,\"cheeks_2\":10,\"decals_1\":0,\"torso_2\":0,\"hair_color_2\":0,\"eyebrow_2\":10,\"complexion_2\":0,\"chimp_4\":10,\"bodyb_1\":0,\"eye_color\":0,\"lips\":10,\"makeup_1\":0,\"decals_2\":0,\"helmet_2\":0,\"chimp_2\":10,\"eyebrows_2\":0,\"chimp_3\":10,\"nose_4\":10,\"eyebrows_1\":0,\"nose_6\":10,\"skin\":19,\"face\":0,\"bags_2\":1,\"nose_3\":10,\"lipstick_2\":0,\"hair_1\":24,\"jaw_1\":10,\"cheeks_3\":10,\"age_1\":0,\"moles_2\":0,\"cheeks_1\":10,\"sun_1\":0,\"blend\":0,\"jaw_2\":10,\"blemishes_1\":0,\"bproof_2\":0,\"makeup_2\":0,\"age_2\":0,\"beard_4\":0,\"makeup_3\":0,\"tshirt_1\":0,\"chest_2\":0,\"chest_3\":0,\"eyebrow_1\":10,\"glasses_2\":0,\"bodyb_2\":0,\"nose_2\":10,\"hair_3\":0,\"blush_3\":0,\"blush_2\":0,\"beard_1\":8,\"face_2\":0,\"lipstick_4\":0,\"blemishes_2\":0,\"bracelets_2\":0,\"mask_1\":169,\"complexion_1\":0,\"chest_1\":0,\"arms\":19,\"nose_1\":10,\"eyebrows_3\":0,\"bproof_1\":0,\"bracelets_1\":-1,\"helmet_1\":-1,\"torso_1\":346,\"face_3\":0,\"watches_2\":0,\"arms_2\":0,\"mask_2\":13,\"pants_1\":8,\"eyebrows_4\":0}'),
(91, 'lost', 'Lost Sgt At Arms', '{\"makeup_4\":0,\"hair_color_1\":0,\"moles_1\":0,\"nose_5\":10,\"blend_face\":0,\"hair_2\":0,\"skin_2\":0,\"beard_3\":0,\"age_1\":0,\"helmet_2\":0,\"sun_2\":0,\"torso_2\":0,\"shoes_2\":0,\"chimp_1\":10,\"skin_3\":0,\"ears_1\":-1,\"watches_1\":-1,\"lipstick_1\":0,\"ears_2\":0,\"pants_2\":0,\"neck\":10,\"arms\":19,\"sex\":0,\"shoes_1\":51,\"eyebrows_2\":0,\"arms_1\":1,\"glasses_1\":0,\"beard_1\":8,\"beard_2\":10,\"chain_1\":0,\"cheeks_2\":10,\"decals_1\":0,\"nose_3\":10,\"hair_color_2\":0,\"eyebrow_2\":10,\"complexion_2\":0,\"chimp_4\":10,\"bodyb_1\":0,\"bproof_2\":0,\"chimp_2\":10,\"makeup_1\":0,\"chimp_3\":10,\"blend_skin\":0,\"blush_1\":0,\"lips\":10,\"lipstick_3\":0,\"cheeks_1\":10,\"blush_2\":0,\"nose_6\":10,\"skin\":19,\"face\":0,\"chest_3\":0,\"moles_2\":0,\"eyebrow_1\":10,\"hair_1\":24,\"jaw_1\":10,\"cheeks_3\":10,\"face_3\":0,\"tshirt_2\":0,\"sun_1\":0,\"chain_2\":0,\"eyebrows_1\":0,\"bags_1\":0,\"tshirt_1\":103,\"blemishes_1\":0,\"makeup_2\":0,\"face_2\":0,\"beard_4\":0,\"makeup_3\":0,\"lipstick_4\":0,\"hair_3\":0,\"lipstick_2\":0,\"complexion_1\":0,\"glasses_2\":0,\"age_2\":0,\"nose_2\":10,\"blend\":0,\"blush_3\":0,\"bracelets_1\":-1,\"nose_4\":10,\"bodyb_2\":0,\"bracelets_2\":0,\"blemishes_2\":0,\"bags_2\":0,\"mask_1\":169,\"eye_color\":0,\"chest_1\":0,\"jaw_2\":10,\"nose_1\":10,\"eyebrows_3\":0,\"bproof_1\":0,\"chest_2\":0,\"helmet_1\":-1,\"torso_1\":360,\"decals_2\":0,\"watches_2\":0,\"arms_2\":0,\"mask_2\":13,\"pants_1\":1,\"eyebrows_4\":0}'),
(93, 'cartel', 'Classic', '{\"sun_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"tshirt_2\":0,\"blend_face\":0,\"eye_color\":0,\"glasses_2\":0,\"nose_5\":10,\"skin\":9,\"pants_2\":1,\"decals_1\":0,\"helmet_1\":-1,\"glasses_1\":8,\"eyebrow_1\":10,\"makeup_3\":0,\"jaw_1\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":8,\"mask_1\":185,\"chain_1\":270,\"shoes_1\":126,\"chimp_4\":10,\"makeup_1\":0,\"cheeks_1\":10,\"blend_skin\":0,\"blemishes_1\":0,\"chest_3\":0,\"arms_2\":0,\"ears_2\":0,\"bags_2\":0,\"nose_1\":10,\"face_2\":0,\"beard_1\":0,\"bracelets_2\":0,\"blend\":0,\"nose_6\":10,\"skin_3\":0,\"blush_1\":0,\"chimp_2\":10,\"bproof_1\":28,\"moles_1\":0,\"sun_2\":0,\"age_2\":0,\"hair_color_1\":61,\"jaw_2\":10,\"cheeks_3\":10,\"arms\":80,\"sex\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"chain_2\":0,\"chest_2\":0,\"nose_3\":10,\"torso_2\":0,\"neck\":10,\"lips\":10,\"age_1\":0,\"watches_2\":0,\"face\":45,\"bags_1\":0,\"hair_3\":0,\"beard_4\":0,\"skin_2\":0,\"complexion_2\":0,\"cheeks_2\":10,\"makeup_4\":0,\"hair_1\":24,\"shoes_2\":3,\"chest_1\":0,\"beard_3\":0,\"beard_2\":0,\"eyebrows_2\":10,\"bracelets_1\":-1,\"hair_color_2\":0,\"chimp_1\":10,\"chimp_3\":10,\"mask_2\":0,\"blush_3\":0,\"torso_1\":292,\"eyebrows_4\":0,\"blush_2\":0,\"ears_1\":-1,\"lipstick_4\":0,\"lipstick_1\":0,\"nose_4\":10,\" arms_2\":0,\"complexion_1\":0,\"helmet_2\":0,\"moles_2\":0,\"tshirt_1\":60,\"pants_1\":26,\"hair_2\":0,\"face_3\":0,\"blemishes_2\":0,\"nose_2\":10,\"lipstick_2\":0,\"eyebrows_1\":5}'),
(94, 'cartel', 'Zarząd', '{\"sun_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"tshirt_2\":3,\"blend_face\":0,\"eye_color\":0,\"glasses_2\":4,\"nose_5\":10,\"skin\":9,\"pants_2\":1,\"decals_1\":0,\"helmet_1\":-1,\"glasses_1\":5,\"eyebrow_1\":10,\"makeup_3\":0,\"jaw_1\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"mask_1\":169,\"chain_1\":170,\"shoes_1\":136,\"chimp_4\":10,\"makeup_1\":0,\"cheeks_1\":10,\"blend_skin\":0,\"blemishes_1\":0,\"chest_3\":0,\"arms_2\":0,\"ears_2\":0,\"bags_2\":0,\"nose_1\":10,\"face_2\":0,\"beard_1\":0,\"bracelets_2\":0,\"blend\":0,\"nose_6\":10,\"skin_3\":0,\"blush_1\":0,\"chimp_2\":10,\"bproof_1\":0,\"moles_1\":0,\"sun_2\":0,\"age_2\":0,\"hair_color_1\":61,\"jaw_2\":10,\"cheeks_3\":10,\"arms\":20,\"sex\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"chain_2\":0,\"chest_2\":0,\"nose_3\":10,\"torso_2\":2,\"neck\":10,\"lips\":10,\"age_1\":0,\"watches_2\":0,\"face\":45,\"bags_1\":0,\"hair_3\":0,\"beard_4\":0,\"skin_2\":0,\"complexion_2\":0,\"cheeks_2\":10,\"makeup_4\":0,\"hair_1\":24,\"shoes_2\":0,\"chest_1\":0,\"beard_3\":0,\"beard_2\":0,\"eyebrows_2\":10,\"bracelets_1\":-1,\"hair_color_2\":0,\"chimp_1\":10,\"chimp_3\":10,\"mask_2\":13,\"blush_3\":0,\"torso_1\":142,\"eyebrows_4\":0,\"blush_2\":0,\"ears_1\":-1,\"lipstick_4\":0,\"lipstick_1\":0,\"nose_4\":10,\" arms_2\":0,\"complexion_1\":0,\"helmet_2\":0,\"moles_2\":0,\"tshirt_1\":160,\"pants_1\":139,\"hair_2\":0,\"face_3\":0,\"blemishes_2\":0,\"nose_2\":10,\"lipstick_2\":0,\"eyebrows_1\":5}'),
(95, 'cartel', 'Classic2', '{\"sun_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"tshirt_2\":3,\"blend_face\":0,\"eye_color\":0,\"glasses_2\":0,\"nose_5\":10,\"skin\":9,\"pants_2\":1,\"decals_1\":0,\"moles_2\":0,\"glasses_1\":8,\"eyebrow_1\":10,\"makeup_3\":0,\"face_3\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"mask_1\":174,\"chain_1\":0,\"shoes_1\":159,\"beard_2\":0,\"makeup_1\":0,\"cheeks_1\":10,\"blend_skin\":0,\"blemishes_1\":0,\"chest_3\":0,\"arms_2\":0,\"ears_2\":0,\"bags_2\":0,\"nose_1\":10,\"face_2\":0,\"beard_1\":0,\"bracelets_2\":0,\"blend\":0,\"nose_6\":10,\"skin_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"chimp_4\":10,\"hair_1\":24,\"sun_2\":0,\"beard_3\":0,\"hair_color_1\":61,\"blush_3\":0,\"cheeks_3\":10,\"arms\":80,\"sex\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"eyebrows_1\":5,\"chest_2\":0,\"nose_3\":10,\"makeup_4\":0,\"moles_1\":0,\"torso_2\":3,\"age_2\":0,\"eyebrows_2\":10,\"helmet_2\":11,\"bags_1\":86,\"hair_3\":0,\"helmet_1\":131,\"skin_2\":0,\"complexion_2\":0,\"lips\":10,\"jaw_2\":10,\"neck\":10,\"shoes_2\":2,\"chest_1\":0,\"blush_1\":0,\"tshirt_1\":131,\"chimp_3\":10,\"chain_2\":0,\"hair_color_2\":0,\"chimp_1\":10,\"pants_1\":26,\"hair_2\":0,\"ears_1\":-1,\"torso_1\":384,\"eyebrows_4\":0,\"blush_2\":0,\"beard_4\":0,\"lipstick_4\":0,\"lipstick_1\":0,\"nose_4\":10,\" arms_2\":0,\"complexion_1\":0,\"face\":45,\"age_1\":0,\"bproof_1\":0,\"jaw_1\":0,\"mask_2\":6,\"bracelets_1\":-1,\"blemishes_2\":0,\"nose_2\":10,\"lipstick_2\":0,\"watches_2\":0}'),
(96, 'cartel', 'Classic 4', '{\"sun_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"tshirt_2\":0,\"blend_face\":0,\"eye_color\":0,\"glasses_2\":0,\"nose_5\":10,\"skin\":9,\"pants_2\":1,\"decals_1\":0,\"moles_2\":0,\"glasses_1\":8,\"eyebrow_1\":10,\"makeup_3\":0,\"face_3\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"mask_1\":169,\"chain_1\":267,\"shoes_1\":159,\"beard_2\":0,\"makeup_1\":0,\"cheeks_1\":10,\"blend_skin\":0,\"blemishes_1\":0,\"chest_3\":0,\"arms_2\":0,\"ears_2\":0,\"bags_2\":0,\"nose_1\":10,\"face_2\":0,\"beard_1\":0,\"bracelets_2\":0,\"blend\":0,\"nose_6\":10,\"skin_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"chimp_4\":10,\"hair_1\":24,\"sun_2\":0,\"beard_3\":0,\"hair_color_1\":61,\"blush_3\":0,\"cheeks_3\":10,\"arms\":80,\"sex\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"eyebrows_1\":5,\"chest_2\":0,\"nose_3\":10,\"makeup_4\":0,\"moles_1\":0,\"torso_2\":0,\"age_2\":0,\"eyebrows_2\":10,\"helmet_2\":0,\"bags_1\":0,\"hair_3\":0,\"helmet_1\":-1,\"skin_2\":0,\"complexion_2\":0,\"lips\":10,\"jaw_2\":10,\"neck\":10,\"shoes_2\":2,\"chest_1\":0,\"blush_1\":0,\"tshirt_1\":15,\"chimp_3\":10,\"chain_2\":0,\"hair_color_2\":0,\"chimp_1\":10,\"pants_1\":26,\"hair_2\":0,\"ears_1\":-1,\"torso_1\":292,\"eyebrows_4\":0,\"blush_2\":0,\"beard_4\":0,\"lipstick_4\":0,\"lipstick_1\":0,\"nose_4\":10,\" arms_2\":0,\"complexion_1\":0,\"face\":45,\"age_1\":0,\"bproof_1\":0,\"jaw_1\":0,\"mask_2\":2,\"bracelets_1\":-1,\"blemishes_2\":0,\"nose_2\":10,\"lipstick_2\":0,\"watches_2\":0}'),
(97, 'cartel', 'Cllasic 3', '{\"sun_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"tshirt_2\":3,\"blend_face\":0,\"eye_color\":0,\"glasses_2\":0,\"nose_5\":10,\"skin\":9,\"pants_2\":1,\"decals_1\":0,\"moles_2\":0,\"glasses_1\":8,\"eyebrow_1\":10,\"makeup_3\":0,\"face_3\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"mask_1\":257,\"chain_1\":0,\"shoes_1\":159,\"beard_2\":0,\"makeup_1\":0,\"cheeks_1\":10,\"blend_skin\":0,\"blemishes_1\":0,\"chest_3\":0,\"arms_2\":0,\"ears_2\":0,\"bags_2\":0,\"nose_1\":10,\"face_2\":0,\"beard_1\":0,\"bracelets_2\":0,\"blend\":0,\"nose_6\":10,\"skin_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"chimp_4\":10,\"hair_1\":24,\"sun_2\":0,\"beard_3\":0,\"hair_color_1\":61,\"blush_3\":0,\"cheeks_3\":10,\"arms\":80,\"sex\":0,\"lipstick_3\":0,\"bodyb_2\":0,\"eyebrows_1\":5,\"chest_2\":0,\"nose_3\":10,\"makeup_4\":0,\"moles_1\":0,\"torso_2\":13,\"age_2\":0,\"eyebrows_2\":10,\"helmet_2\":0,\"bags_1\":0,\"hair_3\":0,\"helmet_1\":-1,\"skin_2\":0,\"complexion_2\":0,\"lips\":10,\"jaw_2\":10,\"neck\":10,\"shoes_2\":2,\"chest_1\":0,\"blush_1\":0,\"tshirt_1\":131,\"chimp_3\":10,\"chain_2\":0,\"hair_color_2\":0,\"chimp_1\":10,\"pants_1\":26,\"hair_2\":0,\"ears_1\":-1,\"torso_1\":386,\"eyebrows_4\":0,\"blush_2\":0,\"beard_4\":0,\"lipstick_4\":0,\"lipstick_1\":0,\"nose_4\":10,\" arms_2\":0,\"complexion_1\":0,\"face\":45,\"age_1\":0,\"bproof_1\":0,\"jaw_1\":0,\"mask_2\":4,\"bracelets_1\":-1,\"blemishes_2\":0,\"nose_2\":10,\"lipstick_2\":0,\"watches_2\":0}'),
(99, 'mafia', 'Okrągły stół', '{\"sun_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"eyebrow_2\":10,\"lips\":10,\"blend_face\":0,\"eye_color\":0,\"glasses_2\":6,\"nose_5\":10,\"skin\":23,\"pants_2\":0,\"decals_1\":0,\"helmet_1\":142,\"glasses_1\":5,\"eyebrow_1\":10,\"makeup_3\":0,\"face_3\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"hair_2\":0,\"beard_3\":0,\"mask_1\":35,\"moles_1\":0,\"shoes_1\":10,\"beard_2\":10,\"makeup_1\":0,\"cheeks_1\":10,\"blend_skin\":0,\"blemishes_1\":0,\"chest_3\":0,\"arms_2\":0,\"ears_2\":0,\"bags_2\":0,\"nose_1\":10,\"mask_2\":0,\"beard_1\":8,\"bracelets_2\":0,\"blend\":0,\"nose_6\":10,\"skin_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"beard_4\":0,\"age_2\":0,\"sun_2\":0,\"hair_3\":0,\"hair_color_1\":0,\"neck\":10,\"cheeks_3\":10,\"arms\":159,\"jaw_1\":10,\"lipstick_3\":0,\"bodyb_2\":0,\"watches_2\":0,\"arms_1\":1,\"nose_3\":10,\"blush_1\":0,\"bproof_1\":0,\"tshirt_2\":0,\"age_1\":0,\"chest_2\":0,\"face\":0,\"bags_1\":82,\"torso_2\":0,\"chain_1\":26,\"skin_2\":0,\"complexion_2\":0,\"chimp_4\":10,\"makeup_4\":0,\"hair_1\":9,\"shoes_2\":0,\"chest_1\":0,\"makeup_2\":0,\"jaw_2\":10,\"face_2\":0,\"bracelets_1\":-1,\"hair_color_2\":0,\"chimp_1\":10,\"pants_1\":24,\"helmet_2\":0,\"blush_3\":0,\"torso_1\":295,\"eyebrows_4\":0,\"blush_2\":0,\"eyebrows_1\":0,\"lipstick_4\":0,\"lipstick_1\":0,\"nose_4\":10,\"tshirt_1\":35,\"complexion_1\":0,\"moles_2\":0,\"chain_2\":1,\"ears_1\":-1,\"eyebrows_2\":0,\"chimp_3\":10,\"sex\":0,\"blemishes_2\":0,\"nose_2\":10,\"lipstick_2\":0,\"bproof_2\":0}'),
(101, 'lost', 'Lost President Galowy', '{\"arms\":19,\"nose_4\":10,\"eye_color\":0,\"blend\":0,\"hair_1\":24,\"watches_1\":-1,\"bproof_2\":0,\"nose_3\":10,\"ears_1\":-1,\"face_3\":0,\"lipstick_1\":0,\"face_2\":0,\"sex\":0,\"chain_2\":0,\"pants_2\":4,\"blush_1\":0,\"jaw_2\":10,\"bags_2\":1,\"arms_2\":0,\"jaw_1\":10,\"lips\":10,\"chain_1\":0,\"mask_1\":169,\"pants_1\":22,\"eyebrows_2\":0,\"decals_1\":0,\"sun_2\":0,\"age_1\":0,\"decals_2\":0,\"blemishes_2\":0,\"moles_2\":0,\"blush_3\":0,\"lipstick_4\":0,\"glasses_2\":0,\"shoes_2\":0,\"nose_1\":10,\"nose_6\":10,\"bracelets_1\":-1,\"blush_2\":0,\"skin_2\":0,\"tshirt_1\":285,\"hair_2\":0,\"tshirt_2\":0,\"nose_2\":10,\"hair_color_1\":0,\"helmet_1\":-1,\"eyebrows_4\":0,\"hair_3\":0,\"face\":0,\"torso_1\":348,\"hair_color_2\":0,\"watches_2\":0,\"arms_1\":1,\"lipstick_2\":0,\"torso_2\":0,\"blend_skin\":0,\"chimp_3\":10,\"beard_3\":0,\"cheeks_3\":10,\"makeup_1\":0,\"bodyb_2\":0,\"makeup_3\":0,\"blend_face\":0,\"chimp_1\":10,\"beard_1\":8,\"makeup_2\":0,\"nose_5\":10,\"chest_3\":0,\"lipstick_3\":0,\"sun_1\":0,\"age_2\":0,\"bags_1\":119,\"eyebrows_1\":0,\"bracelets_2\":0,\"moles_1\":0,\"shoes_1\":21,\"bproof_1\":0,\"bodyb_1\":0,\"mask_2\":13,\"eyebrows_3\":0,\"cheeks_1\":10,\"complexion_2\":0,\"skin_3\":0,\"beard_2\":10,\"glasses_1\":0,\"chimp_2\":10,\"chimp_4\":10,\"ears_2\":0,\"neck\":10,\"skin\":19,\"makeup_4\":0,\"cheeks_2\":10,\"helmet_2\":0,\"chest_2\":0,\"beard_4\":0,\"eyebrow_1\":10,\"eyebrow_2\":10,\"blemishes_1\":0,\"chest_1\":0,\"complexion_1\":0}'),
(107, 'lost', 'Lost Vice President Galowy', '{\"hair_color_1\":0,\"ears_1\":-1,\"tshirt_1\":285,\"jaw_1\":0,\"blemishes_2\":0,\"makeup_4\":0,\"eye_color\":0,\"eyebrow_1\":19,\"ears_2\":0,\"beard_3\":0,\"glasses_2\":0,\"jaw_2\":10,\"chimp_1\":10,\"age_1\":0,\"neck\":10,\"tshirt_2\":0,\"skin_2\":0,\"watches_2\":0,\"glasses_1\":0,\"nose_4\":10,\"face_3\":14,\"cheeks_3\":10,\"mask_1\":169,\"blemishes_1\":0,\"sun_2\":0,\"eyebrows_1\":0,\"face_2\":12,\"beard_2\":10,\"lipstick_1\":0,\"mask_2\":13,\"makeup_1\":0,\"blend\":0,\"arms_2\":0,\"chimp_4\":10,\"bproof_2\":0,\"decals_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"bracelets_2\":0,\"chest_2\":0,\"moles_1\":0,\"nose_1\":12,\"torso_1\":348,\"blush_3\":0,\"makeup_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"cheeks_2\":10,\"lipstick_4\":0,\"blush_2\":0,\"pants_2\":9,\"blend_skin\":3,\"bodyb_2\":0,\"age_2\":0,\"nose_5\":10,\"eyebrows_2\":10,\"hair_1\":0,\"bodyb_1\":0,\"complexion_2\":0,\"complexion_1\":0,\"eyebrows_4\":4,\"shoes_1\":21,\"makeup_2\":0,\"sun_1\":0,\"beard_4\":0,\"lipstick_2\":0,\"torso_2\":0,\"blend_face\":8,\"lips\":10,\"chimp_2\":10,\"decals_1\":0,\"bracelets_1\":-1,\"chest_3\":0,\"skin_3\":0,\"face\":5,\"blush_1\":0,\"moles_2\":0,\"watches_1\":-1,\"arms\":19,\"skin\":37,\"nose_6\":10,\"nose_3\":10,\"hair_color_2\":1,\"eyebrow_2\":13,\"bags_2\":2,\"arms_1\":1,\"chain_2\":0,\"bproof_1\":0,\"helmet_2\":0,\"hair_3\":1,\"beard_1\":16,\"eyebrows_3\":1,\"nose_2\":10,\"bags_1\":119,\"cheeks_1\":10,\"chimp_3\":10,\"chain_1\":0,\"sex\":0,\"hair_2\":0,\"pants_1\":22}'),
(108, 'marabunta', 'KOSZULKA', '{\"shoes_2\":0,\"blemishes_1\":0,\"blush_2\":0,\"mask_1\":111,\"arms\":0,\"helmet_2\":0,\"glasses_2\":0,\"face\":0,\"bracelets_1\":-1,\"age_2\":0,\"chimp_3\":10,\"bags_2\":0,\"bags_1\":0,\"eyebrow_2\":10,\"face_3\":0,\"blend_face\":0,\"chain_1\":0,\"decals_2\":0,\"face_2\":0,\"tshirt_1\":15,\"beard_1\":6,\"hair_2\":0,\"eyebrows_3\":0,\"cheeks_1\":10,\"torso_2\":3,\"helmet_1\":-1,\"skin_3\":0,\"moles_2\":0,\"watches_1\":4,\"arms_2\":0,\"watches_2\":0,\"sex\":0,\"complexion_2\":0,\"eyebrow_1\":10,\"bproof_2\":0,\"lipstick_2\":0,\"nose_2\":10,\"chimp_1\":10,\"blend\":0,\"blemishes_2\":0,\"glasses_1\":0,\"chain_2\":0,\"eyebrows_1\":0,\"bodyb_2\":0,\"sun_2\":0,\"makeup_1\":0,\"bodyb_1\":0,\"cheeks_3\":10,\"complexion_1\":0,\"skin\":0,\"pants_2\":0,\"sun_1\":0,\"makeup_4\":0,\"hair_1\":73,\"bproof_1\":0,\"jaw_2\":10,\"beard_3\":0,\"lipstick_3\":0,\"mask_2\":15,\"beard_2\":10,\"nose_1\":10,\"hair_3\":0,\"moles_1\":0,\"eye_color\":0,\"ears_1\":2,\" arms_2\":0,\"hair_color_1\":4,\"lipstick_4\":0,\"neck\":10,\"nose_6\":10,\"nose_5\":10,\"bracelets_2\":0,\"hair_color_2\":0,\"tshirt_2\":0,\"nose_3\":10,\"eyebrows_2\":0,\"age_1\":0,\"ears_2\":0,\"chimp_4\":10,\"shoes_1\":8,\"blend_skin\":0,\"chest_2\":0,\"jaw_1\":10,\"skin_2\":0,\"torso_1\":669,\"chest_3\":0,\"pants_1\":62,\"blush_3\":0,\"blush_1\":0,\"beard_4\":0,\"lipstick_1\":0,\"cheeks_2\":10,\"nose_4\":10,\"makeup_2\":0,\"decals_1\":0,\"eyebrows_4\":0,\"chest_1\":0,\"makeup_3\":0,\"chimp_2\":10,\"lips\":10}'),
(110, 'cartel', 'CRY BABY', '{\"blend\":0,\"age_1\":0,\"glasses_2\":0,\"beard_1\":7,\"bproof_1\":0,\"bags_2\":0,\"blush_2\":0,\"lipstick_2\":0,\"chimp_1\":10,\"eyebrow_1\":10,\"complexion_1\":0,\"blush_1\":0,\"makeup_4\":0,\"chimp_2\":10,\"watches_1\":-1,\"bracelets_2\":0,\"makeup_1\":0,\"decals_2\":0,\"eyebrows_1\":0,\"pants_2\":0,\"bodyb_1\":0,\"skin_3\":0,\"cheeks_3\":10,\"shoes_2\":3,\" arms_2\":0,\"watches_2\":0,\"hair_2\":0,\"sun_2\":0,\"hair_color_2\":0,\"chest_3\":0,\"nose_2\":10,\"makeup_2\":0,\"bracelets_1\":-1,\"pants_1\":259,\"hair_color_1\":0,\"cheeks_1\":10,\"nose_5\":10,\"lipstick_1\":0,\"shoes_1\":126,\"chimp_3\":10,\"face\":0,\"lipstick_3\":0,\"chain_2\":0,\"mask_2\":13,\"glasses_1\":16,\"blemishes_1\":0,\"beard_2\":9,\"helmet_2\":0,\"eye_color\":0,\"torso_2\":16,\"eyebrows_2\":0,\"chest_1\":0,\"beard_3\":0,\"cheeks_2\":10,\"chain_1\":0,\"makeup_3\":0,\"blend_skin\":0,\"beard_4\":0,\"arms\":4,\"eyebrows_4\":0,\"jaw_1\":10,\"blemishes_2\":0,\"sex\":0,\"sun_1\":0,\"neck\":10,\"skin\":14,\"moles_1\":0,\"chest_2\":0,\"age_2\":0,\"nose_6\":10,\"eyebrow_2\":10,\"hair_3\":0,\"eyebrows_3\":0,\"bproof_2\":0,\"tshirt_1\":15,\"complexion_2\":0,\"lipstick_4\":0,\"lips\":10,\"arms_2\":0,\"jaw_2\":10,\"hair_1\":1,\"moles_2\":0,\"skin_2\":0,\"face_3\":0,\"nose_3\":10,\"tshirt_2\":0,\"decals_1\":0,\"nose_4\":10,\"torso_1\":244,\"chimp_4\":10,\"mask_1\":292,\"ears_1\":-1,\"nose_1\":10,\"bodyb_2\":0,\"blush_3\":0,\"ears_2\":0,\"blend_face\":0,\"bags_1\":0,\"helmet_1\":121,\"face_2\":0}'),
(120, 'vagos', 'Vagos 1', '{\"helmet_1\":143,\"makeup_1\":0,\"sun_1\":0,\"eyebrow_1\":19,\"chain_1\":87,\"torso_1\":339,\"beard_4\":0,\"watches_1\":-1,\"blush_3\":0,\"bags_2\":0,\"shoes_1\":139,\"hair_3\":1,\"mask_2\":5,\"nose_5\":10,\"moles_1\":0,\"hair_2\":0,\"watches_2\":0,\"jaw_2\":10,\"makeup_4\":0,\"nose_2\":10,\"jaw_1\":0,\"eyebrows_2\":10,\"makeup_2\":0,\"beard_2\":10,\"eyebrow_2\":13,\"moles_2\":0,\"bproof_1\":0,\"complexion_1\":0,\"eyebrows_1\":0,\"chimp_4\":10,\"lipstick_4\":0,\"sun_2\":0,\"pants_2\":0,\"pants_1\":15,\"face_2\":12,\"arms_2\":0,\"mask_1\":233,\"eyebrows_4\":4,\"lipstick_1\":0,\"face\":5,\"hair_1\":1,\"arms\":55,\"hair_color_2\":1,\"bracelets_1\":-1,\"bproof_2\":0,\"beard_1\":16,\"age_2\":0,\"torso_2\":8,\"blush_1\":0,\"skin_3\":0,\"chimp_1\":10,\"sex\":0,\"lipstick_3\":0,\"chain_2\":0,\"age_1\":0,\"face_3\":14,\"shoes_2\":0,\"tshirt_1\":23,\"skin\":37,\"cheeks_3\":10,\"ears_1\":-1,\"chimp_2\":10,\"cheeks_1\":10,\"hair_color_1\":1,\"eyebrows_3\":1,\"ears_2\":0,\"chest_1\":0,\"blemishes_1\":0,\"neck\":10,\"nose_1\":12,\"lipstick_2\":0,\"tshirt_2\":0,\"complexion_2\":0,\"chest_3\":0,\"skin_2\":0,\"glasses_1\":8,\"glasses_2\":2,\"makeup_3\":0,\"decals_1\":0,\"nose_4\":10,\"nose_6\":10,\"bodyb_1\":0,\"beard_3\":0,\"nose_3\":10,\"blend\":0,\"blush_2\":0,\"helmet_2\":0,\"eye_color\":0,\"bracelets_2\":0,\"decals_2\":0,\"bodyb_2\":0,\"lips\":10,\"blend_face\":8,\"blemishes_2\":0,\"cheeks_2\":10,\"chimp_3\":10,\"arms_1\":1,\"chest_2\":0,\"bags_1\":0,\"blend_skin\":3}'),
(124, 'bloods', 'Bloods-spotkania', '{\"cheeks_3\":10,\"makeup_4\":0,\"decals_1\":0,\"arms\":19,\"face_3\":0,\"skin_2\":0,\"eye_color\":0,\"nose_2\":10,\"chest_1\":0,\"glasses_1\":0,\"lipstick_1\":0,\"bracelets_1\":-1,\"blend_face\":0,\"makeup_1\":0,\"age_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"shoes_1\":51,\"bags_2\":0,\"skin_3\":0,\"beard_1\":8,\"bodyb_1\":0,\"blush_1\":0,\"chimp_1\":10,\"eyebrow_1\":10,\"neck\":10,\"torso_2\":10,\"hair_color_1\":0,\"hair_3\":0,\"eyebrows_2\":0,\"blush_3\":0,\"chimp_3\":10,\"eyebrows_1\":0,\"face\":0,\"hair_2\":0,\"blend\":0,\"mask_1\":234,\"tshirt_1\":75,\"mask_2\":3,\"ears_1\":-1,\"pants_1\":10,\"sex\":0,\"blend_skin\":0,\"bproof_1\":0,\"hair_color_2\":0,\"lipstick_3\":0,\"eyebrow_2\":10,\"jaw_1\":10,\"skin\":19,\"beard_4\":0,\"helmet_2\":0,\"lips\":10,\"chest_3\":0,\"moles_1\":0,\"ears_2\":0,\"cheeks_1\":10,\"beard_3\":0,\"moles_2\":0,\"nose_3\":10,\"complexion_1\":0,\"decals_2\":0,\"watches_2\":0,\"nose_4\":10,\"eyebrows_4\":0,\"bproof_2\":0,\"hair_1\":172,\"lipstick_4\":0,\"complexion_2\":0,\"nose_1\":10,\"makeup_2\":0,\"bodyb_2\":0,\"pants_2\":4,\"blemishes_1\":0,\"chimp_4\":10,\"bracelets_2\":0,\"chain_2\":0,\"arms_2\":0,\"blush_2\":0,\"glasses_2\":0,\"helmet_1\":-1,\"beard_2\":10,\"makeup_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"bags_1\":0,\"nose_6\":10,\"sun_2\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"torso_1\":339,\"shoes_2\":0,\"sun_1\":0,\"blemishes_2\":0,\"age_1\":0,\"face_2\":0,\"tshirt_2\":1,\"chest_2\":0,\"jaw_2\":10,\"nose_5\":10,\"arms_1\":1}'),
(125, 'bloods', 'B1', '{\"cheeks_3\":10,\"makeup_4\":0,\"decals_1\":0,\"arms\":19,\"face_3\":0,\"skin_2\":0,\"eye_color\":0,\"nose_2\":10,\"chest_1\":0,\"glasses_1\":0,\"lipstick_1\":0,\"bracelets_1\":-1,\"blend_face\":0,\"makeup_1\":0,\"age_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"shoes_1\":7,\"bags_2\":0,\"skin_3\":0,\"beard_1\":8,\"bodyb_1\":0,\"blush_1\":0,\"chimp_1\":10,\"eyebrow_1\":10,\"neck\":10,\"torso_2\":2,\"hair_color_1\":0,\"hair_3\":0,\"eyebrows_2\":0,\"blush_3\":0,\"chimp_3\":10,\"eyebrows_1\":0,\"face\":0,\"hair_2\":0,\"blend\":0,\"mask_1\":234,\"tshirt_1\":23,\"mask_2\":3,\"ears_1\":-1,\"pants_1\":72,\"sex\":0,\"blend_skin\":0,\"bproof_1\":0,\"hair_color_2\":0,\"lipstick_3\":0,\"eyebrow_2\":10,\"jaw_1\":10,\"skin\":19,\"beard_4\":0,\"helmet_2\":0,\"lips\":10,\"chest_3\":0,\"moles_1\":0,\"ears_2\":0,\"cheeks_1\":10,\"beard_3\":0,\"moles_2\":0,\"nose_3\":10,\"complexion_1\":0,\"decals_2\":0,\"watches_2\":0,\"nose_4\":10,\"eyebrows_4\":0,\"bproof_2\":0,\"hair_1\":172,\"lipstick_4\":0,\"complexion_2\":0,\"nose_1\":10,\"makeup_2\":0,\"bodyb_2\":0,\"pants_2\":0,\"blemishes_1\":0,\"chimp_4\":10,\"bracelets_2\":0,\"chain_2\":0,\"arms_2\":0,\"blush_2\":0,\"glasses_2\":0,\"helmet_1\":-1,\"beard_2\":10,\"makeup_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"bags_1\":0,\"nose_6\":10,\"sun_2\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"torso_1\":387,\"shoes_2\":0,\"sun_1\":0,\"blemishes_2\":0,\"age_1\":0,\"face_2\":0,\"tshirt_2\":1,\"chest_2\":0,\"jaw_2\":10,\"nose_5\":10,\"arms_1\":1}');
INSERT INTO `organizations_clothes` (`id`, `org`, `label`, `value`) VALUES
(126, 'bloods', 'B2', '{\"cheeks_3\":10,\"makeup_4\":0,\"decals_1\":0,\"arms\":23,\"face_3\":0,\"skin_2\":0,\"eye_color\":0,\"nose_2\":10,\"chest_1\":0,\"glasses_1\":0,\"lipstick_1\":0,\"bracelets_1\":-1,\"blend_face\":0,\"makeup_1\":0,\"age_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"shoes_1\":7,\"bags_2\":0,\"skin_3\":0,\"beard_1\":8,\"bodyb_1\":0,\"blush_1\":0,\"chimp_1\":10,\"eyebrow_1\":10,\"neck\":10,\"torso_2\":8,\"hair_color_1\":0,\"hair_3\":0,\"eyebrows_2\":0,\"blush_3\":0,\"chimp_3\":10,\"eyebrows_1\":0,\"face\":0,\"hair_2\":0,\"blend\":0,\"mask_1\":234,\"tshirt_1\":285,\"mask_2\":3,\"ears_1\":-1,\"pants_1\":72,\"sex\":0,\"blend_skin\":0,\"bproof_1\":0,\"hair_color_2\":0,\"lipstick_3\":0,\"eyebrow_2\":10,\"jaw_1\":10,\"skin\":19,\"beard_4\":0,\"helmet_2\":0,\"lips\":10,\"chest_3\":0,\"moles_1\":0,\"ears_2\":0,\"cheeks_1\":10,\"beard_3\":0,\"moles_2\":0,\"nose_3\":10,\"complexion_1\":0,\"decals_2\":0,\"watches_2\":0,\"nose_4\":10,\"eyebrows_4\":0,\"bproof_2\":0,\"hair_1\":172,\"lipstick_4\":0,\"complexion_2\":0,\"nose_1\":10,\"makeup_2\":0,\"bodyb_2\":0,\"pants_2\":0,\"blemishes_1\":0,\"chimp_4\":10,\"bracelets_2\":0,\"chain_2\":0,\"arms_2\":0,\"blush_2\":0,\"glasses_2\":0,\"helmet_1\":-1,\"beard_2\":10,\"makeup_3\":0,\"cheeks_2\":10,\"chimp_2\":10,\"bags_1\":0,\"nose_6\":10,\"sun_2\":0,\"watches_1\":-1,\"eyebrows_3\":0,\"torso_1\":413,\"shoes_2\":0,\"sun_1\":0,\"blemishes_2\":0,\"age_1\":0,\"face_2\":0,\"tshirt_2\":0,\"chest_2\":0,\"jaw_2\":10,\"nose_5\":10,\"arms_1\":1}'),
(130, 'sinister', 'Taki cywilny w sumie#1', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":346,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":223,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":8,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":4,\"tshirt_2\":0,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":0,\"mask_2\":3,\"helmet_2\":0,\"nose_5\":10,\"arms\":92,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":142,\"bags_1\":125,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":15,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(132, 'sinister', 'Narkotyki#01', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":62,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":519,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":259,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":5,\"tshirt_2\":0,\"bags_2\":7,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":0,\"helmet_2\":0,\"nose_5\":10,\"arms\":85,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":143,\"bags_1\":198,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":0,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(137, 'sinister', 'Sportowy #1', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":611,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":236,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":7,\"tshirt_2\":2,\"bags_2\":19,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":0,\"mask_2\":13,\"helmet_2\":0,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":142,\"bags_1\":87,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":0,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(138, 'sinister', 'Zarząd#1', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":24,\"shoes_1\":21,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":139,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":24,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":0,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":223,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":1,\"tshirt_2\":0,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":178,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":24,\"helmet_2\":6,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":2,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":13,\"bags_1\":0,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":4,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(139, 'sinister', 'Interesy/Okrągły', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":24,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":139,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":24,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":1,\"tshirt_2\":0,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":178,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":170,\"mask_2\":24,\"helmet_2\":6,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":2,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":13,\"bags_1\":0,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":4,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(140, 'sinister', 'Interesy/Okrągły#2', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":32,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":24,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":4,\"tshirt_2\":4,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":35,\"mask_2\":13,\"helmet_2\":6,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":32,\"nose_4\":10,\"helmet_1\":13,\"bags_1\":0,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":4,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(143, 'sinister', 'Konwóje#2', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":377,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":236,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":91,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":13,\"tshirt_2\":0,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":0,\"helmet_2\":6,\"nose_5\":10,\"arms\":85,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":13,\"bags_1\":198,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":0,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(144, 'sinister', 'Narkotyki#3', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":1,\"hair_3\":5,\"glasses_1\":5,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":505,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":259,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":19,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":4,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":271,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":2,\"tshirt_2\":0,\"bags_2\":10,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":279,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":2,\"helmet_2\":0,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":41,\"nose_4\":10,\"helmet_1\":198,\"bags_1\":200,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":0,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(145, 'sinister', 'Eleganc#1', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":613,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":24,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":48,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":104,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":253,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":23,\"tshirt_2\":0,\"bags_2\":4,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":13,\"helmet_2\":0,\"nose_5\":10,\"arms\":88,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":30,\"bags_1\":200,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":4,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(146, 'sinister', 'Akcja desantacja przeciwników z pd #1', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":575,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":236,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":91,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":11,\"tshirt_2\":0,\"bags_2\":7,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":0,\"helmet_2\":0,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":142,\"bags_1\":198,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":0,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(147, 'sinister', 'Taki cywilny w sumie#2', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":707,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":240,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":270,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":4,\"tshirt_2\":0,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":13,\"helmet_2\":0,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":-1,\"bags_1\":122,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":0,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(148, 'sinister', 'SMERFIKA-NIE-RUSZAC', '{\"skin\":8,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":3,\"glasses_1\":63,\"chest_2\":0,\"hair_color_2\":38,\"bags_2\":0,\"cheeks_3\":10,\"chimp_1\":10,\"pants_2\":4,\"blush_2\":0,\"decals_2\":0,\"makeup_3\":0,\"bracelets_1\":-1,\"beard_1\":12,\"pants_1\":24,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":3,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"nose_2\":10,\"skin_3\":0,\"eyebrows_4\":0,\"beard_2\":10,\"blend\":0,\"lipstick_2\":0,\"chest_1\":0,\" arms_2\":0,\"hair_2\":0,\"complexion_2\":0,\"eye_color\":0,\"nose_5\":10,\"eyebrows_1\":12,\"watches_1\":-1,\"mask_1\":169,\"chimp_3\":10,\"age_2\":0,\"moles_2\":0,\"eyebrows_3\":0,\"blemishes_2\":0,\"lips\":10,\"lipstick_4\":0,\"eyebrow_2\":10,\"shoes_1\":143,\"makeup_1\":0,\"watches_2\":0,\"arms\":93,\"ears_2\":0,\"beard_3\":0,\"bodyb_1\":0,\"eyebrows_2\":10,\"cheeks_2\":10,\"blend_face\":0,\"jaw_1\":0,\"face_2\":0,\"sun_1\":0,\"helmet_2\":6,\"nose_1\":10,\"bracelets_2\":0,\"tshirt_1\":159,\"mask_2\":13,\"chain_2\":0,\"bproof_2\":0,\"nose_6\":10,\"chimp_4\":10,\"beard_4\":0,\"glasses_2\":0,\"blush_1\":0,\"face\":0,\"cheeks_1\":10,\"bproof_1\":0,\"makeup_4\":0,\"moles_1\":0,\"sun_2\":0,\"sex\":0,\"torso_2\":0,\"makeup_2\":0,\"decals_1\":0,\"lipstick_3\":0,\"face_3\":0,\"jaw_2\":10,\"torso_1\":633,\"helmet_1\":13,\"bags_1\":0,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":39,\"hair_color_1\":36,\"chimp_2\":10,\"nose_4\":10,\"ears_1\":32,\"nose_3\":10,\"blend_skin\":0,\"neck\":10,\"chain_1\":270,\"blush_3\":0,\"tshirt_2\":15}'),
(149, 'sinister', 'Interesy/Okrągły#3', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":21,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":192,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":24,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":0,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":26,\"blemishes_2\":0,\"chain_2\":2,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":11,\"tshirt_2\":4,\"bags_2\":0,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":169,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":33,\"mask_2\":13,\"helmet_2\":6,\"nose_5\":10,\"arms\":93,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":32,\"nose_4\":10,\"helmet_1\":13,\"bags_1\":0,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":4,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(151, 'sinister', 'Cywilno/Akcjowy#001', '{\"skin\":8,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":3,\"glasses_1\":5,\"chest_2\":0,\"hair_color_2\":38,\"bags_2\":6,\"cheeks_3\":10,\"chimp_1\":10,\"pants_2\":3,\"blush_2\":0,\"decals_2\":0,\"makeup_3\":0,\"bracelets_1\":-1,\"beard_1\":12,\"pants_1\":204,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":0,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"nose_2\":10,\"skin_3\":0,\"eyebrows_4\":0,\"beard_2\":10,\"blend\":0,\"lipstick_2\":0,\"chest_1\":0,\" arms_2\":0,\"hair_2\":0,\"complexion_2\":0,\"eye_color\":0,\"nose_5\":10,\"eyebrows_1\":12,\"watches_1\":4,\"mask_1\":169,\"chimp_3\":10,\"age_2\":0,\"moles_2\":0,\"eyebrows_3\":0,\"blemishes_2\":0,\"lips\":10,\"lipstick_4\":0,\"eyebrow_2\":10,\"shoes_1\":211,\"makeup_1\":0,\"watches_2\":0,\"arms\":36,\"ears_2\":0,\"beard_3\":0,\"bodyb_1\":0,\"eyebrows_2\":10,\"cheeks_2\":10,\"blend_face\":0,\"jaw_1\":0,\"face_2\":0,\"sun_1\":0,\"helmet_2\":0,\"nose_1\":10,\"bracelets_2\":0,\"tshirt_1\":15,\"mask_2\":13,\"chain_2\":0,\"bproof_2\":0,\"nose_6\":10,\"chimp_4\":10,\"beard_4\":0,\"glasses_2\":0,\"blush_1\":0,\"face\":0,\"cheeks_1\":10,\"bproof_1\":116,\"makeup_4\":0,\"moles_1\":0,\"sun_2\":0,\"sex\":0,\"torso_2\":10,\"makeup_2\":0,\"decals_1\":0,\"lipstick_3\":0,\"face_3\":0,\"jaw_2\":10,\"torso_1\":642,\"helmet_1\":192,\"bags_1\":200,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":39,\"hair_color_1\":36,\"chimp_2\":10,\"nose_4\":10,\"ears_1\":41,\"nose_3\":10,\"blend_skin\":0,\"neck\":10,\"chain_1\":168,\"blush_3\":0,\"tshirt_2\":0}'),
(152, 'sinister', 'Dziadu Brazilian nie ruchac znaczy ruszac', '{\"skin\":4,\"bodyb_2\":0,\"arms_2\":0,\"hair_3\":5,\"glasses_1\":63,\"shoes_1\":143,\"cheeks_2\":10,\"bodyb_1\":0,\"torso_1\":496,\"chimp_1\":10,\"face_2\":0,\"blush_2\":0,\"blend\":0,\"makeup_3\":46,\"bracelets_1\":-1,\"beard_1\":8,\"pants_1\":196,\"eyebrow_1\":10,\"blemishes_1\":0,\"shoes_2\":2,\"skin_2\":0,\"complexion_1\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"skin_3\":0,\"watches_1\":-1,\"complexion_2\":0,\"eyebrows_1\":0,\"lipstick_2\":0,\"blush_1\":0,\" arms_2\":0,\"hair_2\":0,\"moles_2\":0,\"eye_color\":30,\"nose_2\":10,\"beard_3\":0,\"nose_3\":10,\"bproof_1\":0,\"chimp_3\":10,\"age_2\":0,\"jaw_2\":10,\"chain_1\":287,\"blemishes_2\":0,\"chain_2\":0,\"eyebrows_2\":10,\"beard_4\":0,\"cheeks_3\":10,\"makeup_1\":42,\"watches_2\":0,\"face\":45,\"sun_2\":0,\"ears_2\":0,\"torso_2\":4,\"tshirt_2\":0,\"bags_2\":1,\"blend_face\":0,\"jaw_1\":10,\"decals_2\":0,\"sun_1\":0,\"mask_1\":179,\"nose_1\":10,\"face_3\":0,\"tshirt_1\":15,\"mask_2\":2,\"helmet_2\":0,\"nose_5\":10,\"arms\":92,\"chimp_4\":10,\"beard_2\":6,\"glasses_2\":0,\"moles_1\":0,\"nose_6\":10,\"cheeks_1\":10,\"eyebrow_2\":10,\"eyebrows_4\":0,\"hair_color_2\":35,\"lipstick_4\":0,\"sex\":0,\"eyebrows_3\":0,\"makeup_2\":0,\"bproof_2\":0,\"lipstick_3\":0,\"chest_1\":0,\"ears_1\":-1,\"nose_4\":10,\"helmet_1\":152,\"bags_1\":125,\"arms_1\":1,\"chest_3\":0,\"age_1\":0,\"hair_1\":38,\"hair_color_1\":61,\"chimp_2\":10,\"pants_2\":1,\"makeup_4\":46,\"lips\":10,\"blend_skin\":0,\"neck\":10,\"decals_1\":0,\"blush_3\":0,\"chest_2\":0}'),
(153, 'cartel', 'XDDDD', '{\"nose_2\":10,\"mask_2\":0,\"jaw_1\":0,\"sun_1\":0,\"bodyb_2\":0,\"arms_2\":0,\"bracelets_1\":-1,\"helmet_1\":-1,\"chimp_3\":10,\"lipstick_3\":0,\"chimp_2\":10,\"bracelets_2\":0,\"lipstick_1\":0,\"neck\":10,\"hair_2\":0,\"eyebrow_1\":10,\"chimp_4\":10,\"blend_skin\":0,\"chest_1\":0,\"eyebrow_2\":10,\"hair_color_1\":63,\"ears_2\":0,\"face\":0,\"age_2\":0,\"blemishes_2\":0,\"beard_1\":0,\"blend\":0,\"blush_3\":0,\"cheeks_3\":10,\"chest_2\":0,\"face_3\":0,\"sex\":0,\"tshirt_2\":0,\"skin_2\":0,\"nose_4\":10,\"torso_1\":15,\"beard_4\":0,\"arms\":15,\"blush_1\":0,\"makeup_3\":0,\"chimp_1\":10,\"beard_2\":0,\"age_1\":0,\"beard_3\":0,\"eyebrows_1\":5,\"lipstick_4\":0,\"pants_2\":1,\"face_2\":0,\"helmet_2\":0,\"bags_2\":0,\"nose_5\":10,\"blend_face\":0,\"blush_2\":0,\"decals_2\":0,\"watches_1\":-1,\"makeup_1\":0,\"makeup_2\":0,\"chain_2\":0,\"chest_3\":0,\"eyebrows_2\":10,\"chain_1\":170,\"skin_3\":0,\"skin\":35,\"complexion_2\":0,\" arms_2\":0,\"eyebrows_4\":0,\"cheeks_2\":10,\"hair_3\":0,\"moles_1\":0,\"pants_1\":139,\"moles_2\":0,\"bodyb_1\":0,\"cheeks_1\":10,\"lipstick_2\":0,\"makeup_4\":0,\"blemishes_1\":0,\"decals_1\":0,\"hair_color_2\":0,\"torso_2\":0,\"mask_1\":169,\"eyebrows_3\":0,\"jaw_2\":10,\"watches_2\":0,\"lips\":10,\"nose_1\":10,\"bproof_1\":0,\"complexion_1\":0,\"nose_6\":10,\"bproof_2\":0,\"nose_3\":10,\"bags_1\":147,\"glasses_1\":5,\"sun_2\":0,\"glasses_2\":4,\"shoes_2\":0,\"hair_1\":39,\"eye_color\":0,\"shoes_1\":136,\"ears_1\":-1,\"tshirt_1\":15}'),
(154, 'cartel', 'Zima', '{\"blend_face\":0,\"mask_2\":2,\"nose_1\":10,\"bracelets_2\":0,\"chest_2\":0,\"face\":22,\"chest_3\":0,\"lips\":10,\"bproof_1\":0,\"blemishes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"glasses_1\":5,\"eyebrow_2\":10,\"lipstick_3\":0,\"complexion_1\":0,\"decals_1\":0,\"pants_1\":205,\"hair_3\":0,\"makeup_1\":0,\"chimp_2\":10,\"chest_1\":0,\"torso_2\":14,\"nose_5\":10,\"bproof_2\":0,\"shoes_1\":200,\"eyebrow_1\":10,\"glasses_2\":5,\"beard_1\":0,\"age_1\":0,\"sun_1\":0,\"cheeks_3\":10,\"eyebrows_2\":10,\"eye_color\":0,\"jaw_2\":10,\"lipstick_2\":0,\"nose_2\":10,\"cheeks_2\":10,\"bodyb_1\":0,\"arms\":179,\"skin\":15,\"mask_1\":169,\"eyebrows_1\":5,\"blend_skin\":0,\"face_2\":0,\"blend\":0,\"bags_2\":0,\"makeup_2\":0,\"sex\":0,\"chain_1\":0,\"chain_2\":0,\"ears_1\":-1,\"moles_2\":0,\"sun_2\":0,\"decals_2\":0,\"torso_1\":167,\"chimp_1\":10,\"watches_2\":0,\"bracelets_1\":-1,\"pants_2\":0,\"tshirt_1\":21,\"beard_4\":0,\"shoes_2\":0,\"blush_2\":0,\"tshirt_2\":4,\"bags_1\":0,\"hair_2\":0,\"hair_1\":81,\"age_2\":0,\"nose_6\":10,\" arms_2\":0,\"helmet_2\":3,\"face_3\":0,\"moles_1\":0,\"makeup_4\":0,\"chimp_4\":10,\"eyebrows_3\":0,\"watches_1\":-1,\"hair_color_1\":17,\"complexion_2\":0,\"hair_color_2\":0,\"beard_3\":0,\"bodyb_2\":0,\"skin_2\":0,\"jaw_1\":0,\"cheeks_1\":10,\"lipstick_1\":0,\"beard_2\":0,\"chimp_3\":10,\"blush_3\":0,\"nose_3\":10,\"blush_1\":0,\"skin_3\":0,\"neck\":10,\"makeup_3\":0,\"nose_4\":10,\"arms_2\":0,\"helmet_1\":13,\"blemishes_1\":0,\"ears_2\":0}'),
(156, 'cartel', 'Zima 2 [better]', '{\"blend_face\":0,\"mask_2\":2,\"nose_1\":10,\"bracelets_2\":0,\"chest_2\":0,\"face\":22,\"chest_3\":0,\"lips\":10,\"bproof_1\":0,\"blemishes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"glasses_1\":5,\"eyebrow_2\":10,\"lipstick_3\":0,\"complexion_1\":0,\"decals_1\":0,\"pants_1\":98,\"hair_3\":0,\"makeup_1\":0,\"chimp_2\":10,\"chest_1\":0,\"torso_2\":14,\"nose_5\":10,\"bproof_2\":0,\"shoes_1\":200,\"eyebrow_1\":10,\"glasses_2\":5,\"beard_1\":0,\"age_1\":0,\"sun_1\":0,\"cheeks_3\":10,\"eyebrows_2\":10,\"eye_color\":0,\"jaw_2\":10,\"lipstick_2\":0,\"nose_2\":10,\"cheeks_2\":10,\"bodyb_1\":0,\"arms\":179,\"skin\":15,\"mask_1\":169,\"eyebrows_1\":5,\"blend_skin\":0,\"face_2\":0,\"blend\":0,\"bags_2\":0,\"makeup_2\":0,\"sex\":0,\"chain_1\":0,\"chain_2\":0,\"ears_1\":-1,\"moles_2\":0,\"sun_2\":0,\"decals_2\":0,\"torso_1\":167,\"chimp_1\":10,\"watches_2\":0,\"bracelets_1\":-1,\"pants_2\":0,\"tshirt_1\":237,\"beard_4\":0,\"shoes_2\":0,\"blush_2\":0,\"tshirt_2\":1,\"bags_1\":0,\"hair_2\":0,\"hair_1\":81,\"age_2\":0,\"nose_6\":10,\" arms_2\":0,\"helmet_2\":3,\"face_3\":0,\"moles_1\":0,\"makeup_4\":0,\"chimp_4\":10,\"eyebrows_3\":0,\"watches_1\":-1,\"hair_color_1\":17,\"complexion_2\":0,\"hair_color_2\":0,\"beard_3\":0,\"bodyb_2\":0,\"skin_2\":0,\"jaw_1\":0,\"cheeks_1\":10,\"lipstick_1\":0,\"beard_2\":0,\"chimp_3\":10,\"blush_3\":0,\"nose_3\":10,\"blush_1\":0,\"skin_3\":0,\"neck\":10,\"makeup_3\":0,\"nose_4\":10,\"arms_2\":0,\"helmet_1\":13,\"blemishes_1\":0,\"ears_2\":0}'),
(157, 'cartel', 'ZIMA', '{\"blend_face\":0,\"mask_2\":2,\"nose_1\":10,\"bracelets_2\":0,\"chest_2\":0,\"face\":0,\"chest_3\":0,\"lips\":10,\"bproof_1\":0,\"blemishes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"glasses_1\":8,\"eyebrow_2\":10,\"lipstick_3\":0,\"complexion_1\":0,\"decals_1\":0,\"nose_3\":10,\"hair_3\":70,\"skin_2\":0,\"chimp_2\":10,\"chest_1\":0,\"torso_2\":14,\"nose_4\":10,\"ears_2\":0,\"blush_3\":0,\"eyebrow_1\":10,\"face_3\":0,\"beard_1\":0,\"bags_2\":0,\"sun_1\":0,\"shoes_1\":163,\"tshirt_2\":1,\"sex\":0,\"jaw_2\":10,\"nose_2\":10,\"chimp_1\":10,\"nose_5\":10,\"bodyb_1\":0,\"arms\":204,\"skin\":2,\"mask_1\":169,\"eyebrows_2\":10,\"blend_skin\":0,\"nose_6\":10,\"blend\":0,\"beard_2\":0,\"makeup_2\":0,\"watches_1\":-1,\"chain_1\":0,\"chain_2\":0,\"cheeks_2\":10,\"bracelets_1\":-1,\"makeup_3\":36,\"lipstick_2\":0,\"torso_1\":167,\"eyebrows_3\":0,\"watches_2\":0,\"hair_color_1\":29,\"pants_2\":9,\"tshirt_1\":237,\"skin_3\":0,\"shoes_2\":4,\"blush_2\":0,\"pants_1\":142,\"bags_1\":0,\"hair_2\":0,\"hair_1\":201,\"face_2\":1,\"makeup_4\":15,\"bproof_2\":0,\"helmet_2\":3,\"decals_2\":0,\"moles_1\":0,\"eye_color\":2,\"chimp_4\":10,\"moles_2\":0,\"bodyb_2\":0,\"glasses_2\":0,\"complexion_2\":0,\"hair_color_2\":28,\"beard_3\":0,\"arms_2\":0,\"cheeks_3\":10,\"jaw_1\":10,\"cheeks_1\":10,\"ears_1\":-1,\"lipstick_1\":0,\"chimp_3\":10,\" arms_2\":0,\"age_1\":0,\"blush_1\":0,\"beard_4\":0,\"neck\":10,\"sun_2\":0,\"makeup_1\":0,\"age_2\":0,\"helmet_1\":13,\"blemishes_1\":0,\"eyebrows_1\":22}'),
(158, 'cartel', 'Zima 3', '{\"blend_face\":0,\"mask_2\":2,\"nose_1\":10,\"bracelets_2\":0,\"chest_2\":0,\"face\":22,\"chest_3\":0,\"lips\":10,\"bproof_1\":0,\"blemishes_2\":0,\"lipstick_4\":0,\"eyebrows_4\":0,\"glasses_1\":5,\"eyebrow_2\":10,\"lipstick_3\":0,\"complexion_1\":0,\"decals_1\":0,\"pants_1\":210,\"hair_3\":0,\"makeup_1\":0,\"chimp_2\":10,\"chest_1\":0,\"torso_2\":14,\"nose_5\":10,\"bproof_2\":0,\"shoes_1\":200,\"eyebrow_1\":10,\"glasses_2\":5,\"beard_1\":0,\"age_1\":0,\"sun_1\":0,\"cheeks_3\":10,\"eyebrows_2\":10,\"eye_color\":0,\"jaw_2\":10,\"lipstick_2\":0,\"nose_2\":10,\"cheeks_2\":10,\"bodyb_1\":0,\"arms\":179,\"skin\":15,\"mask_1\":169,\"eyebrows_1\":5,\"blend_skin\":0,\"face_2\":0,\"blend\":0,\"bags_2\":0,\"makeup_2\":0,\"sex\":0,\"chain_1\":0,\"chain_2\":0,\"ears_1\":-1,\"moles_2\":0,\"sun_2\":0,\"decals_2\":0,\"torso_1\":167,\"chimp_1\":10,\"watches_2\":0,\"bracelets_1\":-1,\"pants_2\":0,\"tshirt_1\":237,\"beard_4\":0,\"shoes_2\":0,\"blush_2\":0,\"tshirt_2\":1,\"bags_1\":0,\"hair_2\":0,\"hair_1\":81,\"age_2\":0,\"nose_6\":10,\" arms_2\":0,\"helmet_2\":3,\"face_3\":0,\"moles_1\":0,\"makeup_4\":0,\"chimp_4\":10,\"eyebrows_3\":0,\"watches_1\":-1,\"hair_color_1\":17,\"complexion_2\":0,\"hair_color_2\":0,\"beard_3\":0,\"bodyb_2\":0,\"skin_2\":0,\"jaw_1\":0,\"cheeks_1\":10,\"lipstick_1\":0,\"beard_2\":0,\"chimp_3\":10,\"blush_3\":0,\"nose_3\":10,\"blush_1\":0,\"skin_3\":0,\"neck\":10,\"makeup_3\":0,\"nose_4\":10,\"arms_2\":0,\"helmet_1\":13,\"blemishes_1\":0,\"ears_2\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `organizations_logs`
--

CREATE TABLE `organizations_logs` (
  `id` int(11) NOT NULL,
  `org` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations_notes`
--

CREATE TABLE `organizations_notes` (
  `id` int(11) NOT NULL,
  `org` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations_notes`
--

INSERT INTO `organizations_notes` (`id`, `org`, `text`) VALUES
(0, 'ballas', 'debile'),
(21, 'families', 'jebac niggerów'),
(22, 'cartel', 'fajnie by było jakby ktos sprzedał te 700paczek kokainy z magazynu komus za 500k'),
(23, 'cartel', 'fajnie by było jakby ktos sprzedał te 700paczek kokainy z magazynu komus za 500k'),
(24, 'mafia', 'Do ostrzału Wiewiórka za zdradę, Kosa z Cartelem, jesteśmy poszukiwani przez policję'),
(25, 'mafia', 'Mamy dobre stosunki z Czerwonymi, w sobotę o godzinie 21 okrągły stół\n'),
(26, 'mafia', 'okrągły stół przeniesnony na 19 w sobote \n'),
(27, 'mafia', 'Wiewiór nie zdradził nas, wszystko zostało dogadane\n'),
(28, 'mafia', 'Uprawnienia dla rang:\n⚫ 👑・Capo  - Szef\n・Uprawnienia  ✅ \n・Zatrudnienia  ✅\n・Wyrzucenia  ✅\n・Ulepszenia  ✅\n・Notatki  ✅\n・Sejf  ✅\n・Magazyn  ✅\n・Garderoba  ✅\n・Dodawanie Ubrań  ✅\n・Usuwanie Ubrań  ✅ \n⚫ 💸・Boss   - Pod szef (prawa ręka szefa)\n・Uprawnienia  ✅ \n・Zatrudnienia  ✅\n・Wyrzucenia  ✅\n・Ulepszenia  ✅\n・Notatki  ✅\n・Sejf  ✅\n・Magazyn  ✅\n・Garderoba  ✅\n・Dodawanie Ubrań  ✅\n・Usuwanie Ubrań  ✅ \n⚫ 🤝・Under Boss   - Zastępca Szefa\n・Uprawnienia  ✅ \n・Zatrudnienia  ✅\n・Wyrzucenia  ✅\n・Ulepszenia  ✅\n・Notatki  ✅\n・Sejf  ✅\n・Mag'),
(29, 'mafia', 'Poszukujemy starego kartelu, poruszaja sie w czarnych pojazdach ostatnio widziani w czarnym brabusie. Dnia 30.09.2023 zostala przez nich porwana Martine Smith czyli czlonkini mafii gdy znalazlem ja miala wiele ran postrzalowych wygladala tak jakby ja ciagle napierdalali. Gdy bedziecie mieli ich to z automatu info na radiu/aplikacji. ~ Dziadu'),
(30, 'lost', 'Alexander Smith - pracuje na vanili w plaszczu chodzi czarnym'),
(31, 'mafia', 'Akcja pod pseudonimem \"KONGO\" 17:30 farma Onili'),
(33, 'lost', 'Peater Wilson - pracuje na medykach , trzeba go porwać ( nie porywamy podczas gdy jest na śłużbie)'),
(35, 'cartel', 'kto do huja zajbał 500tys z sejfu\n'),
(36, 'mafia', 'dd'),
(37, 'sinister', 'Pomagajcie vagosom w wojnie z families'),
(38, 'families', '');

-- --------------------------------------------------------

--
-- Table structure for table `outfits`
--

CREATE TABLE `outfits` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `name` longtext DEFAULT NULL,
  `ped` longtext DEFAULT NULL,
  `components` longtext DEFAULT NULL,
  `props` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `outfits`
--

INSERT INTO `outfits` (`id`, `identifier`, `name`, `ped`, `components`, `props`) VALUES
(1, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'weq', '\"mp_m_freemode_01\"', '[{\"texture\":0,\"drawable\":0,\"component_id\":0},{\"texture\":0,\"drawable\":0,\"component_id\":1},{\"texture\":0,\"drawable\":0,\"component_id\":2},{\"texture\":0,\"drawable\":0,\"component_id\":3},{\"texture\":0,\"drawable\":159,\"component_id\":4},{\"texture\":0,\"drawable\":0,\"component_id\":5},{\"texture\":0,\"drawable\":25,\"component_id\":6},{\"texture\":0,\"drawable\":0,\"component_id\":7},{\"texture\":0,\"drawable\":15,\"component_id\":8},{\"texture\":0,\"drawable\":0,\"component_id\":9},{\"texture\":0,\"drawable\":0,\"component_id\":10},{\"texture\":1,\"drawable\":414,\"component_id\":11}]', '[{\"prop_id\":0,\"drawable\":184,\"texture\":1},{\"prop_id\":1,\"drawable\":0,\"texture\":0},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}]'),
(2, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'wqee', '\"mp_m_freemode_01\"', '[{\"texture\":0,\"drawable\":0,\"component_id\":0},{\"texture\":0,\"drawable\":0,\"component_id\":1},{\"texture\":0,\"drawable\":0,\"component_id\":2},{\"texture\":0,\"drawable\":0,\"component_id\":3},{\"texture\":0,\"drawable\":170,\"component_id\":4},{\"texture\":0,\"drawable\":0,\"component_id\":5},{\"texture\":0,\"drawable\":30,\"component_id\":6},{\"texture\":0,\"drawable\":0,\"component_id\":7},{\"texture\":0,\"drawable\":15,\"component_id\":8},{\"texture\":0,\"drawable\":1,\"component_id\":9},{\"texture\":0,\"drawable\":0,\"component_id\":10},{\"texture\":0,\"drawable\":423,\"component_id\":11}]', '[{\"prop_id\":0,\"drawable\":184,\"texture\":1},{\"prop_id\":1,\"drawable\":0,\"texture\":0},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}]');

-- --------------------------------------------------------

--
-- Table structure for table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `id` int(11) DEFAULT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `owner_type` int(11) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `trunk` longtext DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `vehicleid` int(11) DEFAULT NULL,
  `last_garage` varchar(40) DEFAULT 'legion',
  `garage` varchar(40) DEFAULT NULL,
  `carseller` int(11) DEFAULT 0,
  `vin` varchar(17) NOT NULL,
  `ssn` int(11) NOT NULL,
  `cossn` int(11) DEFAULT NULL,
  `co_owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`id`, `owner`, `plate`, `vehicle`, `state`, `owner_type`, `type`, `job`, `stored`, `trunk`, `glovebox`, `vehicleid`, `last_garage`, `garage`, `carseller`, `vin`, `ssn`, `cossn`, `co_owner`) VALUES
(NULL, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', '8WB866EO', '{\"modEngineBlock\":-1,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"model\":-538121837,\"tyreSmokeColor\":[255,255,255],\"modEngine\":-1,\"plate\":\"8WB866EO\",\"modFender\":-1,\"modRightFender\":-1,\"pearlescentColor\":112,\"fuelLevel\":65.0,\"modDoorR\":-1,\"modAPlate\":-1,\"modRearBumper\":-1,\"modLivery\":-1,\"tankHealth\":1000.0,\"modLightbar\":-1,\"modDashboard\":-1,\"modPlateHolder\":-1,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"modRoof\":-1,\"modTank\":-1,\"modGrille\":-1,\"modAirFilter\":-1,\"wheelColor\":0,\"modShifterLeavers\":-1,\"modExhaust\":-1,\"modFrame\":-1,\"modStruts\":-1,\"modTrunk\":-1,\"color1\":112,\"modHorns\":-1,\"modAerials\":-1,\"modVanityPlate\":-1,\"modOrnaments\":-1,\"windowsBroken\":{\"7\":false,\"0\":false,\"5\":false,\"6\":false,\"3\":false,\"4\":false,\"1\":false,\"2\":false},\"bodyHealth\":1000.0,\"modSideSkirt\":-1,\"extras\":{\"7\":false,\"5\":false,\"6\":false,\"10\":false,\"2\":1},\"modFrontBumper\":-1,\"modFrontWheels\":-1,\"modSpeakers\":-1,\"wheels\":0,\"modTurbo\":false,\"doorsBroken\":{\"0\":false,\"5\":false,\"6\":false,\"3\":false,\"4\":false,\"1\":false,\"2\":false},\"modTrimA\":-1,\"color2\":27,\"modTrimB\":-1,\"modBackWheels\":-1,\"engineHealth\":1000.0,\"modSmokeEnabled\":1,\"modDial\":-1,\"modSteeringWheel\":-1,\"modTransmission\":-1,\"modHood\":-1,\"plateIndex\":1,\"neonColor\":[255,255,255],\"modBrakes\":-1,\"modHydrolic\":-1,\"xenonColor\":255,\"modArchCover\":-1,\"modArmor\":-1,\"modXenon\":false,\"dirtLevel\":0.1,\"modSeats\":-1,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"windowTint\":-1}', 0, 1, 'car', NULL, 0, NULL, NULL, 6, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '4ET958PH', '{\"modLivery\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"modBrakes\":2,\"wheelColor\":0,\"modTrimA\":-1,\"modTrunk\":-1,\"modAPlate\":-1,\"modStruts\":-1,\"modAerials\":-1,\"bodyHealth\":1000.0,\"modTransmission\":2,\"modHydrolic\":-1,\"modEngine\":3,\"modTank\":-1,\"tyreSmokeColor\":[255,255,255],\"modSpeakers\":-1,\"wheels\":0,\"modSuspension\":3,\"modRoof\":-1,\"modGrille\":-1,\"plate\":\"4ET958PH\",\"modFrame\":-1,\"dirtLevel\":3.0,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modTurbo\":1,\"modAirFilter\":-1,\"doorsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false},\"modSpoilers\":-1,\"modSeats\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":64.9,\"tankHealth\":1000.0,\"modTrimB\":-1,\"modFender\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modXenon\":false,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"neonColor\":[255,0,255],\"modDashboard\":-1,\"pearlescentColor\":0,\"modDoorR\":-1,\"modDial\":-1,\"model\":-538121837,\"windowTint\":1,\"modRightFender\":-1,\"color2\":0,\"modExhaust\":-1,\"xenonColor\":0,\"modSideSkirt\":-1,\"modRearBumper\":-1,\"windowsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false,\"7\":false},\"extras\":{\"5\":false,\"2\":false,\"7\":1,\"6\":false,\"10\":false},\"modPlateHolder\":-1,\"modHorns\":-1,\"tyreBurst\":{\"0\":false,\"1\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"plateIndex\":1,\"color1\":0,\"modFrontWheels\":-1,\"modLightbar\":-1,\"modArmor\":4,\"modSmokeEnabled\":1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '2IW279OX', '{\"modSteeringWheel\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":29,\"modFrontWheels\":-1,\"modDoorSpeaker\":-1,\"windowsBroken\":{\"1\":false,\"2\":false,\"7\":true,\"0\":true,\"5\":true,\"6\":false,\"3\":true,\"4\":false},\"windowTint\":3,\"modSmokeEnabled\":1,\"modRoof\":-1,\"xenonColor\":0,\"modHorns\":-1,\"modAerials\":-1,\"modEngine\":-1,\"tyreSmokeColor\":[255,255,255],\"modAPlate\":-1,\"modBackWheels\":-1,\"tankHealth\":1000.0,\"wheels\":0,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"tyreBurst\":{\"1\":false,\"5\":false,\"0\":false,\"4\":false},\"modSpoilers\":-1,\"dirtLevel\":2.1,\"modAirFilter\":-1,\"modEngineBlock\":-1,\"modHydrolic\":-1,\"wheelColor\":31,\"modLightbar\":-1,\"modSuspension\":3,\"plateIndex\":0,\"doorsBroken\":{\"1\":false,\"2\":false,\"0\":false,\"5\":1,\"6\":false,\"3\":1,\"4\":1},\"modStruts\":-1,\"modBrakes\":-1,\"engineHealth\":1000.0,\"modShifterLeavers\":-1,\"modOrnaments\":-1,\"modTurbo\":false,\"modSpeakers\":-1,\"modFrame\":-1,\"modHood\":-1,\"color1\":31,\"neonColor\":[255,0,255],\"modXenon\":false,\"modGrille\":-1,\"modPlateHolder\":-1,\"color2\":29,\"modTrimB\":-1,\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRightFender\":-1,\"modTank\":-1,\"modLivery\":-1,\"plate\":\"2IW279OX\",\"model\":-538121837,\"modSeats\":-1,\"modTrimA\":-1,\"modTransmission\":-1,\"modArmor\":-1,\"modDial\":-1,\"modTrunk\":-1,\"extras\":{\"10\":false,\"7\":1,\"5\":1,\"6\":false,\"2\":false},\"modArchCover\":-1,\"modExhaust\":-1,\"modFender\":-1,\"bodyHealth\":1000.0,\"modDashboard\":-1,\"modDoorR\":-1,\"fuelLevel\":64.9}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'HWDP', '{\"modSpoilers\":-1,\"wheelColor\":0,\"modSmokeEnabled\":1,\"wheels\":3,\"modSuspension\":-1,\"tankHealth\":1000.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":0,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"dirtLevel\":5.0,\"modBrakes\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modEngine\":-1,\"plateIndex\":4,\"modAPlate\":-1,\"extras\":{\"10\":1,\"11\":1,\"12\":1,\"9\":false},\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modPlateHolder\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modDoorR\":-1,\"modLightbar\":-1,\"plate\":\"HWDP\",\"modDial\":-1,\"modArchCover\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"modFrame\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":-1083357304,\"xenonColor\":255,\"modTurbo\":false,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modAerials\":-1,\"modStruts\":-1,\"modTransmission\":-1,\"bodyHealth\":1000.0,\"fuelLevel\":100.0,\"neonColor\":[255,0,255],\"modBackWheels\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'JEBACPIS', '{\"modSpoilers\":-1,\"wheelColor\":0,\"modSmokeEnabled\":1,\"wheels\":3,\"modSuspension\":1,\"tankHealth\":1000.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":0,\"modHood\":-1,\"modRightFender\":0,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"dirtLevel\":0.2,\"modBrakes\":2,\"modHorns\":-1,\"modTrimA\":-1,\"modEngine\":3,\"plateIndex\":1,\"modAPlate\":-1,\"extras\":{\"10\":1,\"11\":1,\"12\":1,\"9\":false},\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":0,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modPlateHolder\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modDoorR\":-1,\"modLightbar\":-1,\"plate\":\"JEBACPIS\",\"modDial\":-1,\"modArchCover\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"modFrame\":0,\"modSideSkirt\":-1,\"modLivery\":0,\"model\":-1083357304,\"xenonColor\":0,\"modTurbo\":1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modAerials\":-1,\"modStruts\":-1,\"modTransmission\":2,\"bodyHealth\":1000.0,\"fuelLevel\":99.8,\"neonColor\":[255,0,255],\"modBackWheels\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '2137', '{\"modSpoilers\":-1,\"wheelColor\":0,\"modLightbar\":-1,\"wheels\":3,\"modSuspension\":-1,\"fuelLevel\":100.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":0,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":true,\"6\":true,\"1\":true,\"0\":false,\"3\":false,\"2\":false},\"modBrakes\":-1,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modAPlate\":-1,\"extras\":{\"10\":1,\"11\":1,\"12\":1,\"9\":false},\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":255,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":0,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":-1083357304,\"modFrame\":-1,\"modTurbo\":false,\"plate\":\"2137\",\"neonColor\":[255,0,255],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":6.9,\"plateIndex\":4,\"tankHealth\":1000.0,\"modArchCover\":-1,\"modTransmission\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'PORNO', '{\"modEngineBlock\":-1,\"neonColor\":[255,0,255],\"model\":1755697647,\"engineHealth\":1000.0,\"modEngine\":-1,\"plate\":\"PORNO\",\"modFender\":-1,\"modRightFender\":-1,\"pearlescentColor\":111,\"fuelLevel\":60.0,\"modDoorR\":-1,\"modAPlate\":-1,\"modRearBumper\":-1,\"modLivery\":-1,\"tankHealth\":1000.0,\"modLightbar\":-1,\"modDashboard\":-1,\"modPlateHolder\":-1,\"neonEnabled\":[false,false,false,false],\"modSuspension\":-1,\"modRoof\":-1,\"modTank\":-1,\"modGrille\":-1,\"modAirFilter\":-1,\"dirtLevel\":3.0,\"modShifterLeavers\":-1,\"modTurbo\":false,\"modFrame\":-1,\"modStruts\":-1,\"modTrunk\":-1,\"color1\":112,\"modHorns\":-1,\"modAerials\":-1,\"modVanityPlate\":-1,\"color2\":0,\"windowsBroken\":{\"7\":false,\"0\":false,\"5\":true,\"6\":false,\"3\":false,\"4\":true,\"1\":false,\"2\":false},\"bodyHealth\":1000.0,\"modSideSkirt\":-1,\"extras\":[],\"modSpeakers\":-1,\"modFrontWheels\":-1,\"wheels\":7,\"modExhaust\":-1,\"modSeats\":-1,\"modOrnaments\":-1,\"modFrontBumper\":-1,\"modTransmission\":-1,\"modTrimB\":-1,\"modBackWheels\":-1,\"windowTint\":-1,\"doorsBroken\":{\"0\":false,\"3\":false,\"4\":false,\"1\":false,\"2\":false},\"modDial\":-1,\"modSteeringWheel\":-1,\"modTrimA\":-1,\"modHood\":-1,\"wheelColor\":88,\"modArchCover\":-1,\"modBrakes\":-1,\"modHydrolic\":-1,\"modSmokeEnabled\":1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modXenon\":false,\"xenonColor\":255,\"tyreBurst\":{\"4\":false,\"0\":false,\"1\":false,\"5\":false},\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"plateIndex\":0}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '314NORI', '{\"modSpoilers\":-1,\"wheelColor\":0,\"modLightbar\":-1,\"wheels\":0,\"modSuspension\":3,\"fuelLevel\":57.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":0,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":true,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modBrakes\":2,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":3,\"bodyHealth\":896.2,\"modAPlate\":-1,\"extras\":{\"5\":1,\"7\":false,\"6\":false,\"10\":false,\"2\":false},\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":933.1,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":255,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":27,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":4,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":-538121837,\"modFrame\":-1,\"modTurbo\":1,\"plate\":\"314NORI\",\"neonColor\":[255,0,255],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":1.9,\"plateIndex\":3,\"tankHealth\":967.6,\"modArchCover\":-1,\"modTransmission\":2}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '7MQ467KS', '{\"modSpoilers\":-1,\"wheelColor\":0,\"modLightbar\":-1,\"wheels\":0,\"modSuspension\":3,\"fuelLevel\":65.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":0,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":true,\"3\":false,\"2\":false},\"modBrakes\":2,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":3,\"bodyHealth\":1000.0,\"modAPlate\":-1,\"extras\":{\"5\":false,\"7\":false,\"6\":false,\"10\":1,\"2\":false},\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":2,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":0,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":27,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":-538121837,\"modFrame\":-1,\"modTurbo\":1,\"plate\":\"7MQ467KS\",\"neonColor\":[0,0,0],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":0.0,\"plateIndex\":2,\"tankHealth\":1000.0,\"modArchCover\":-1,\"modTransmission\":2}', 0, 1, 'car', NULL, 0, NULL, NULL, 56, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '1CX176SF', '{\"modBackWheels\":-1,\"modEngine\":3,\"neonColor\":[0,0,0],\"modAerials\":-1,\"modTrimB\":-1,\"modDoorR\":-1,\"modBrakes\":2,\"modGrille\":-1,\"wheelColor\":0,\"modHydrolic\":-1,\"dirtLevel\":0.4,\"modSeats\":-1,\"modSmokeEnabled\":1,\"modLightbar\":-1,\"modVanityPlate\":-1,\"wheels\":0,\"modSteeringWheel\":-1,\"modHorns\":-1,\"plate\":\"1CX176SF\",\"modRightFender\":-1,\"color2\":27,\"modFrontBumper\":-1,\"model\":-538121837,\"modExhaust\":-1,\"modArmor\":-1,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"color1\":149,\"modEngineBlock\":-1,\"modDashboard\":-1,\"doorsBroken\":{\"2\":false,\"1\":false,\"0\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false},\"modSpeakers\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"modOrnaments\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modStruts\":-1,\"modSpoilers\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modRoof\":-1,\"modFrontWheels\":-1,\"tyreSmokeColor\":[255,255,255],\"modLivery\":-1,\"modTurbo\":1,\"modXenon\":false,\"modTransmission\":2,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"windowsBroken\":{\"2\":false,\"1\":false,\"0\":true,\"7\":true,\"6\":true,\"5\":true,\"4\":false,\"3\":true},\"modTrunk\":-1,\"windowTint\":2,\"modFender\":-1,\"extras\":{\"2\":1,\"7\":false,\"6\":false,\"5\":false,\"10\":1},\"pearlescentColor\":111,\"plateIndex\":1,\"bodyHealth\":1000.0,\"modTank\":-1,\"xenonColor\":0,\"tyreBurst\":{\"0\":false,\"5\":false,\"4\":false,\"1\":false},\"tankHealth\":1000.0,\"modSuspension\":3,\"modTrimA\":-1,\"neonEnabled\":[false,false,false,false],\"modDoorSpeaker\":-1,\"modArchCover\":-1,\"fuelLevel\":63.5}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'OKI2123', '{\"modTrunk\":-1,\"windowsBroken\":{\"5\":true,\"6\":false,\"7\":false,\"0\":false,\"1\":false,\"2\":false,\"3\":false,\"4\":true},\"modAPlate\":-1,\"modTurbo\":false,\"modRearBumper\":-1,\"modTrimA\":-1,\"modStruts\":-1,\"modEngineBlock\":-1,\"modFrame\":-1,\"wheels\":1,\"xenonColor\":255,\"modHydrolic\":-1,\"modTank\":-1,\"modXenon\":false,\"modSpeakers\":-1,\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"modEngine\":-1,\"modGrille\":-1,\"modPlateHolder\":-1,\"modVanityPlate\":-1,\"modFender\":-1,\"modFrontWheels\":-1,\"modTransmission\":-1,\"color2\":0,\"modFrontBumper\":-1,\"modSuspension\":-1,\"modHood\":-1,\"tankHealth\":1000.0,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modAerials\":-1,\"neonColor\":[255,0,255],\"modArchCover\":-1,\"modRoof\":-1,\"dirtLevel\":4.0,\"plate\":\"OKI2123\",\"modLivery\":-1,\"modSideSkirt\":-1,\"modDoorR\":-1,\"color1\":75,\"plateIndex\":4,\"modHorns\":-1,\"modDial\":-1,\"fuelLevel\":65.0,\"modBackWheels\":-1,\"modLightbar\":-1,\"windowTint\":-1,\"pearlescentColor\":157,\"modDashboard\":-1,\"modArmor\":-1,\"model\":-1973172295,\"modSmokeEnabled\":false,\"modSpoilers\":-1,\"tyreBurst\":{\"1\":false,\"5\":false,\"0\":false,\"4\":false},\"modOrnaments\":-1,\"modBrakes\":-1,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"modRightFender\":-1,\"bodyHealth\":1000.0,\"modExhaust\":-1,\"modSteeringWheel\":-1,\"modDoorSpeaker\":-1,\"doorsBroken\":{\"5\":false,\"6\":false,\"0\":false,\"1\":false,\"2\":false,\"3\":false,\"4\":false},\"extras\":{\"1\":1},\"modTrimB\":-1}', 0, 1, 'car', NULL, 0, NULL, NULL, 56, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'OKI123', '{\"modSpoilers\":-1,\"wheelColor\":158,\"modLightbar\":-1,\"wheels\":7,\"modSuspension\":-1,\"fuelLevel\":64.5,\"modTank\":-1,\"doorsBroken\":{\"1\":false,\"0\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":12,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":18,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":true,\"4\":true,\"7\":true,\"6\":true,\"1\":false,\"0\":false,\"3\":true,\"2\":true},\"modBrakes\":-1,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"bodyHealth\":979.0,\"modAPlate\":-1,\"extras\":[],\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":255,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":12,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":-638562243,\"modFrame\":-1,\"modTurbo\":false,\"plate\":\"OKI123\",\"neonColor\":[255,0,255],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":8.0,\"plateIndex\":0,\"tankHealth\":1000.0,\"modArchCover\":-1,\"modTransmission\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', 'QWRT21', '{\"modLivery\":0,\"modFrontBumper\":-1,\"windowTint\":1,\"modBrakes\":2,\"model\":-1083357304,\"modTrimA\":-1,\"modTrunk\":-1,\"modAPlate\":-1,\"modStruts\":-1,\"modAerials\":0,\"bodyHealth\":1000.0,\"modTransmission\":2,\"modHydrolic\":-1,\"modEngine\":3,\"modTank\":-1,\"tyreSmokeColor\":[255,255,255],\"modSpeakers\":-1,\"wheels\":3,\"modSuspension\":1,\"modRoof\":9,\"modGrille\":-1,\"plate\":\"QWRT21\",\"modFrame\":0,\"dirtLevel\":0.9,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modTurbo\":1,\"modAirFilter\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modSeats\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"modDial\":-1,\"fuelLevel\":99.8,\"tankHealth\":1000.0,\"modTrimB\":-1,\"modFender\":2,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modXenon\":1,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"neonColor\":[255,0,255],\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":0,\"modDoorR\":-1,\"tyreBurst\":{\"4\":false,\"5\":false,\"0\":false,\"1\":false},\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"doorsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false,\"7\":false},\"color2\":0,\"modExhaust\":-1,\"wheelColor\":0,\"extras\":{\"12\":1,\"9\":1,\"11\":1,\"10\":1},\"modRearBumper\":-1,\"windowsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false,\"7\":false},\"modHood\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"modRightFender\":0,\"xenonColor\":1,\"plateIndex\":1,\"color1\":0,\"modFrontWheels\":-1,\"modLightbar\":-1,\"modArmor\":-1,\"modSmokeEnabled\":1}', 1, 1, 'car', NULL, 0, NULL, '[{\"slot\":2,\"name\":\"cola\",\"count\":1}]', NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '6VH410UC', '{\"modLivery\":-1,\"modFrontBumper\":-1,\"windowTint\":1,\"modBrakes\":2,\"model\":-538121837,\"modTrimA\":-1,\"modTrunk\":-1,\"modAPlate\":-1,\"modStruts\":-1,\"modAerials\":-1,\"bodyHealth\":980.1,\"modTransmission\":2,\"modHydrolic\":-1,\"modEngine\":3,\"modTank\":-1,\"tyreSmokeColor\":[255,255,255],\"modSpeakers\":-1,\"wheels\":0,\"modSuspension\":3,\"modRoof\":-1,\"modGrille\":-1,\"plate\":\"6VH410UC\",\"modFrame\":-1,\"dirtLevel\":15.0,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modTurbo\":1,\"modAirFilter\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modSeats\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"modDial\":-1,\"fuelLevel\":47.7,\"tankHealth\":990.3,\"modTrimB\":-1,\"modFender\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modXenon\":false,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"neonColor\":[153,0,153],\"neonEnabled\":[1,1,1,1],\"pearlescentColor\":112,\"modDoorR\":-1,\"tyreBurst\":{\"4\":false,\"5\":false,\"0\":false,\"1\":false},\"modVanityPlate\":-1,\"modPlateHolder\":-1,\"doorsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false},\"color2\":148,\"modExhaust\":-1,\"wheelColor\":0,\"extras\":{\"5\":false,\"2\":1,\"7\":1,\"6\":1,\"10\":1},\"modRearBumper\":-1,\"windowsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":true,\"1\":false,\"6\":false,\"7\":false},\"modHood\":-1,\"modDashboard\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"xenonColor\":0,\"plateIndex\":1,\"color1\":149,\"modFrontWheels\":-1,\"modLightbar\":-1,\"modArmor\":-1,\"modSmokeEnabled\":1}', 1, 1, 'car', NULL, 0, NULL, '[{\"count\":1,\"name\":\"handcuffs\",\"slot\":1},{\"count\":1,\"name\":\"armour\",\"slot\":2},{\"count\":1,\"metadata\":{\"serial\":\"771563IIE677794\",\"registered\":\"Kylian Lee\",\"ammo\":0,\"components\":[],\"durability\":100},\"name\":\"WEAPON_HEAVYPISTOL\",\"slot\":5},{\"count\":1,\"name\":\"ammo-rifle\",\"slot\":9}]', NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'ELO21', '{\"modSpoilers\":-1,\"wheelColor\":1,\"modSmokeEnabled\":1,\"wheels\":3,\"modSuspension\":3,\"tankHealth\":1000.0,\"modTank\":-1,\"doorsBroken\":{\"4\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":153,\"modHood\":9,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":1,\"modTrimB\":-1,\"modFender\":2,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":6,\"modDashboard\":-1,\"modGrille\":8,\"modEngineBlock\":-1,\"dirtLevel\":12.0,\"modBrakes\":2,\"modHorns\":57,\"modTrimA\":-1,\"modEngine\":3,\"plateIndex\":1,\"modAPlate\":-1,\"extras\":[],\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"modFrontBumper\":2,\"modRearBumper\":2,\"windowTint\":4,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":1,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modPlateHolder\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modDoorR\":-1,\"modLightbar\":-1,\"plate\":\"ELO21\",\"modDial\":-1,\"modArchCover\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"modFrame\":2,\"modSideSkirt\":-1,\"modLivery\":39,\"model\":433954513,\"xenonColor\":1,\"modTurbo\":1,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modAerials\":-1,\"modStruts\":-1,\"modTransmission\":2,\"bodyHealth\":1000.0,\"fuelLevel\":77.8,\"neonColor\":[255,0,255],\"modBackWheels\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'OK3424', '{\"modSpoilers\":-1,\"wheelColor\":21,\"modLightbar\":-1,\"wheels\":7,\"modSuspension\":-1,\"fuelLevel\":65.0,\"modTank\":-1,\"doorsBroken\":{\"4\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":16,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":144,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":true,\"4\":true,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":true,\"2\":true},\"modBrakes\":-1,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modAPlate\":-1,\"extras\":[],\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":255,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":143,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":960812448,\"modFrame\":-1,\"modTurbo\":false,\"plate\":\"OK3424\",\"neonColor\":[255,0,255],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":2.0,\"plateIndex\":0,\"tankHealth\":1000.0,\"modArchCover\":-1,\"modTransmission\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'OK3124', '{\"wheels\":1,\"modStruts\":-1,\"plate\":\"OK3124\",\"modPlateHolder\":-1,\"modTurbo\":false,\"color1\":2,\"modSuspension\":-1,\"wheelColor\":156,\"modLightbar\":-1,\"tankHealth\":1000.0,\"windowTint\":-1,\"xenonColor\":255,\"modAerials\":-1,\"windowsBroken\":{\"3\":false,\"4\":true,\"5\":true,\"6\":false,\"7\":false,\"0\":false,\"1\":false,\"2\":false},\"modShifterLeavers\":-1,\"modEngineBlock\":-1,\"modBrakes\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modTrimB\":-1,\"modDoorR\":-1,\"modArmor\":-1,\"modAirFilter\":-1,\"modSpeakers\":-1,\"modSpoilers\":-1,\"modSmokeEnabled\":1,\"modDashboard\":-1,\"pearlescentColor\":134,\"modHood\":-1,\"color2\":0,\"engineHealth\":1000.0,\"neonColor\":[255,0,255],\"modEngine\":-1,\"modSteeringWheel\":-1,\"bodyHealth\":1000.0,\"tyreBurst\":{\"5\":false,\"4\":false,\"1\":false,\"0\":false},\"modSeats\":-1,\"doorsBroken\":{\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"0\":false,\"1\":false,\"2\":false},\"modAPlate\":-1,\"modDial\":-1,\"modDoorSpeaker\":-1,\"model\":-1973172295,\"modRightFender\":-1,\"modHydrolic\":-1,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"plateIndex\":4,\"modTank\":-1,\"modVanityPlate\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"modLivery\":-1,\"modRoof\":-1,\"fuelLevel\":65.0,\"modFender\":-1,\"modExhaust\":-1,\"tyreSmokeColor\":[255,255,255],\"modTrunk\":-1,\"modOrnaments\":-1,\"extras\":{\"1\":1},\"modTrimA\":-1,\"modSideSkirt\":-1,\"modFrontBumper\":-1,\"modTransmission\":-1,\"modArchCover\":-1,\"modXenon\":false,\"dirtLevel\":8.0,\"modHorns\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'OK212', '{\"modSpoilers\":-1,\"wheelColor\":0,\"modLightbar\":-1,\"wheels\":3,\"modSuspension\":-1,\"fuelLevel\":80.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":6,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":4,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modBrakes\":-1,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"bodyHealth\":1000.0,\"modAPlate\":-1,\"extras\":[],\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":255,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":30,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":83136452,\"modFrame\":-1,\"modTurbo\":false,\"plate\":\"OK212\",\"neonColor\":[255,0,255],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":7.0,\"plateIndex\":0,\"tankHealth\":1000.0,\"modArchCover\":-1,\"modTransmission\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'SWAT', '{\"modBackWheels\":-1,\"modEngine\":-1,\"neonColor\":[255,0,255],\"modShifterLeavers\":-1,\"modTrimB\":-1,\"modDoorR\":-1,\"modBrakes\":-1,\"modGrille\":-1,\"wheelColor\":156,\"modHydrolic\":-1,\"dirtLevel\":1.0,\"modSeats\":-1,\"modSmokeEnabled\":1,\"modLightbar\":-1,\"modVanityPlate\":-1,\"wheels\":0,\"modSteeringWheel\":-1,\"modHorns\":-1,\"plate\":\"SWAT\",\"modRightFender\":-1,\"color2\":1,\"modFrontBumper\":-1,\"model\":1127131465,\"modExhaust\":-1,\"modArmor\":-1,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"color1\":1,\"modEngineBlock\":-1,\"modDashboard\":-1,\"doorsBroken\":{\"2\":false,\"1\":false,\"0\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false},\"modSpeakers\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"modOrnaments\":-1,\"modRearBumper\":-1,\"modHood\":-1,\"modTank\":-1,\"tankHealth\":999.3,\"modDial\":-1,\"engineHealth\":990.7,\"modRoof\":-1,\"modFrontWheels\":-1,\"tyreSmokeColor\":[255,255,255],\"modLivery\":-1,\"modTurbo\":false,\"modAerials\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"modSuspension\":-1,\"windowsBroken\":{\"2\":false,\"1\":false,\"0\":false,\"7\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false},\"plateIndex\":4,\"windowTint\":-1,\"modFender\":-1,\"extras\":{\"12\":false},\"fuelLevel\":97.9,\"modTrunk\":-1,\"xenonColor\":255,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":3,\"tyreBurst\":{\"5\":false,\"1\":false,\"4\":false,\"0\":false},\"modXenon\":false,\"modStruts\":-1,\"modTrimA\":-1,\"modSpoilers\":-1,\"modDoorSpeaker\":-1,\"modArchCover\":-1,\"bodyHealth\":993.8}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'SWAT1', '{\"modSpoilers\":-1,\"wheelColor\":156,\"modLightbar\":-1,\"wheels\":0,\"modSuspension\":-1,\"fuelLevel\":62.8,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":1,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":3,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modBrakes\":-1,\"modHorns\":-1,\"modBackWheels\":-1,\"modEngine\":-1,\"bodyHealth\":961.5,\"modAPlate\":-1,\"extras\":{\"12\":false},\"tyreBurst\":{\"1\":false,\"4\":false,\"0\":false,\"5\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":942.2,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":1,\"xenonColor\":255,\"modPlateHolder\":-1,\"modDoorR\":-1,\"color2\":1,\"modFrontWheels\":-1,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modArmor\":-1,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":1127131465,\"modFrame\":-1,\"modTurbo\":false,\"plate\":\"SWAT1\",\"neonColor\":[255,0,255],\"modAerials\":-1,\"modStruts\":-1,\"dirtLevel\":9.7,\"plateIndex\":4,\"tankHealth\":996.1,\"modArchCover\":-1,\"modTransmission\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'SWAT4', '{\"modSpoilers\":-1,\"wheelColor\":156,\"modSmokeEnabled\":1,\"wheels\":0,\"modSuspension\":-1,\"tankHealth\":1000.0,\"modTank\":-1,\"doorsBroken\":{\"5\":false,\"4\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modRoof\":-1,\"modOrnaments\":-1,\"modTrunk\":-1,\"color1\":1,\"modHood\":-1,\"modRightFender\":-1,\"modHydrolic\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"modFender\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"pearlescentColor\":3,\"modDashboard\":-1,\"modGrille\":-1,\"modEngineBlock\":-1,\"dirtLevel\":0.0,\"modBrakes\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modEngine\":-1,\"plateIndex\":4,\"modAPlate\":-1,\"extras\":{\"12\":false},\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modSteeringWheel\":-1,\"modXenon\":false,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"modPlateHolder\":-1,\"windowsBroken\":{\"5\":false,\"4\":false,\"7\":false,\"6\":false,\"1\":false,\"0\":false,\"3\":false,\"2\":false},\"modDoorR\":-1,\"modLightbar\":-1,\"plate\":\"SWAT4\",\"modDial\":-1,\"modArchCover\":-1,\"modFrontWheels\":-1,\"modArmor\":-1,\"modFrame\":-1,\"modSideSkirt\":-1,\"modLivery\":-1,\"model\":1127131465,\"xenonColor\":255,\"modTurbo\":false,\"tyreSmokeColor\":[255,255,255],\"color2\":1,\"modAerials\":-1,\"modStruts\":-1,\"modTransmission\":-1,\"bodyHealth\":1000.0,\"fuelLevel\":65.0,\"neonColor\":[255,0,255],\"modBackWheels\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '1', '{\"modBackWheels\":-1,\"modEngine\":-1,\"neonColor\":[0,0,0],\"modAerials\":-1,\"modTrimB\":-1,\"modDoorR\":-1,\"bodyHealth\":1000.0,\"modGrille\":-1,\"wheelColor\":156,\"modHydrolic\":-1,\"dirtLevel\":2.0,\"modSeats\":-1,\"modSmokeEnabled\":1,\"modLightbar\":-1,\"neonEnabled\":[false,false,false,false],\"wheels\":0,\"modSteeringWheel\":-1,\"modHorns\":-1,\"plate\":\"1\",\"modRightFender\":-1,\"color2\":0,\"modFrontBumper\":-1,\"model\":1912215274,\"modExhaust\":-1,\"modArmor\":-1,\"modPlateHolder\":-1,\"modSideSkirt\":-1,\"color1\":111,\"modEngineBlock\":-1,\"modDashboard\":-1,\"doorsBroken\":{\"2\":false,\"1\":false,\"0\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false},\"modSpeakers\":-1,\"modAPlate\":-1,\"modFrame\":-1,\"extras\":{\"12\":false,\"1\":1},\"modRearBumper\":-1,\"modHood\":-1,\"modTank\":-1,\"modSpoilers\":-1,\"modDial\":-1,\"engineHealth\":1000.0,\"modRoof\":-1,\"modFrontWheels\":-1,\"tyreSmokeColor\":[255,255,255],\"modLivery\":3,\"modVanityPlate\":-1,\"fuelLevel\":65.0,\"modTransmission\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"windowsBroken\":{\"2\":false,\"1\":false,\"0\":false,\"7\":false,\"6\":false,\"5\":false,\"4\":false,\"3\":false},\"modTrunk\":-1,\"windowTint\":-1,\"modFender\":-1,\"modBrakes\":-1,\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modXenon\":false,\"xenonColor\":255,\"pearlescentColor\":1,\"tyreBurst\":{\"1\":false,\"5\":false,\"0\":false,\"4\":false},\"modOrnaments\":-1,\"plateIndex\":4,\"modTrimA\":-1,\"tankHealth\":1000.0,\"modStruts\":-1,\"modArchCover\":-1,\"modDoorSpeaker\":-1}', 0, 1, 'car', NULL, 0, NULL, NULL, 7, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'ZPG 395', '{\"plateIndex\":0,\"wheelColor\":0,\"modTrunk\":-1,\"modTransmission\":-1,\"modTurbo\":false,\"windowTint\":-1,\"modRightFender\":-1,\"modFrontBumper\":-1,\"plate\":\"ZPG 395\",\"modHydrolic\":-1,\"fuelLevel\":64.9,\"modArmor\":-1,\"modExhaust\":-1,\"dirtLevel\":4.0,\"engineHealth\":1000.0,\"modSpeakers\":-1,\"modStruts\":-1,\"tyreBurst\":{\"4\":false,\"0\":false,\"5\":false,\"1\":false},\"modVanityPlate\":-1,\"extras\":{\"6\":false,\"5\":false,\"7\":false,\"2\":false,\"10\":false},\"modSuspension\":-1,\"modHorns\":-1,\"wheels\":0,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"modBrakes\":-1,\"modDoorR\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modRoof\":-1,\"modTrimA\":-1,\"modGrille\":-1,\"bodyHealth\":1000.0,\"pearlescentColor\":51,\"windowsBroken\":{\"4\":false,\"3\":false,\"6\":false,\"5\":false,\"0\":false,\"7\":false,\"2\":false,\"1\":false},\"xenonColor\":255,\"modFender\":-1,\"neonColor\":[255,255,255],\"modOrnaments\":-1,\"doorsBroken\":{\"4\":false,\"3\":false,\"6\":false,\"5\":false,\"0\":false,\"2\":false,\"1\":false},\"modBackWheels\":-1,\"modSmokeEnabled\":1,\"tankHealth\":1000.0,\"model\":-538121837,\"modHood\":-1,\"modTrimB\":-1,\"modSteeringWheel\":-1,\"modEngine\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"modAPlate\":-1,\"modPlateHolder\":-1,\"modDoorSpeaker\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modLivery\":-1,\"modFrame\":-1,\"modDial\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"color2\":27,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"modXenon\":false,\"modLightbar\":-1,\"modRearBumper\":-1,\"color1\":51}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '12', '{\"plateIndex\":4,\"wheelColor\":156,\"modTrunk\":-1,\"modTransmission\":-1,\"modSideSkirt\":-1,\"windowTint\":-1,\"modRightFender\":-1,\"modFrontBumper\":-1,\"plate\":\"12\",\"modHydrolic\":-1,\"fuelLevel\":65.0,\"modArmor\":-1,\"modExhaust\":-1,\"dirtLevel\":0.0,\"engineHealth\":1000.0,\"modSpeakers\":-1,\"modStruts\":-1,\"tyreBurst\":{\"0\":false,\"4\":false,\"5\":false,\"1\":false},\"modVanityPlate\":-1,\"extras\":{\"12\":false,\"1\":1},\"modSuspension\":-1,\"modHorns\":-1,\"wheels\":0,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"modBrakes\":-1,\"modDoorR\":-1,\"tyreSmokeColor\":[255,255,255],\"modEngineBlock\":-1,\"modRoof\":-1,\"modTrimA\":-1,\"modGrille\":-1,\"bodyHealth\":1000.0,\"color1\":111,\"windowsBroken\":{\"4\":false,\"3\":false,\"6\":false,\"5\":false,\"0\":false,\"7\":false,\"2\":false,\"1\":false},\"xenonColor\":255,\"modFender\":-1,\"neonColor\":[0,0,0],\"modOrnaments\":-1,\"doorsBroken\":{\"4\":false,\"3\":false,\"6\":false,\"5\":false,\"0\":false,\"2\":false,\"1\":false},\"modBackWheels\":-1,\"modDoorSpeaker\":-1,\"tankHealth\":1000.0,\"model\":1912215274,\"modHood\":-1,\"modShifterLeavers\":-1,\"modSteeringWheel\":-1,\"modEngine\":-1,\"modAerials\":-1,\"modFrontWheels\":-1,\"modPlateHolder\":-1,\"modTurbo\":false,\"modSmokeEnabled\":1,\"modTank\":-1,\"modAirFilter\":-1,\"modSpoilers\":-1,\"modLivery\":0,\"modFrame\":-1,\"modDial\":-1,\"modDashboard\":-1,\"modArchCover\":-1,\"modAPlate\":-1,\"color2\":0,\"pearlescentColor\":1,\"modXenon\":false,\"modLightbar\":-1,\"modRearBumper\":-1,\"modTrimB\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', 'KUTAS', '{\"modLivery\":0,\"modFrontBumper\":1,\"modHood\":-1,\"modBrakes\":-1,\"wheelColor\":0,\"modTrimA\":-1,\"modTrunk\":-1,\"modAPlate\":-1,\"modStruts\":-1,\"modAerials\":-1,\"bodyHealth\":1000.0,\"modTransmission\":-1,\"modHydrolic\":-1,\"modEngine\":-1,\"modTank\":-1,\"tyreSmokeColor\":[1,1,1],\"modSpeakers\":-1,\"wheels\":7,\"modSuspension\":3,\"modRoof\":-1,\"modGrille\":-1,\"plate\":\"KUTAS\",\"modFrame\":-1,\"dirtLevel\":5.0,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modTurbo\":false,\"modAirFilter\":-1,\"doorsBroken\":{\"4\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false},\"modSpoilers\":-1,\"modSeats\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":59.4,\"tankHealth\":1000.0,\"modTrimB\":-1,\"modFender\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modXenon\":false,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"neonColor\":[255,0,255],\"modDashboard\":-1,\"pearlescentColor\":0,\"modDoorR\":-1,\"modDial\":-1,\"model\":1501052543,\"windowTint\":3,\"modRightFender\":-1,\"color2\":0,\"modExhaust\":0,\"xenonColor\":0,\"modSideSkirt\":-1,\"modRearBumper\":2,\"windowsBroken\":{\"4\":true,\"5\":true,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false,\"7\":false},\"extras\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"1\":false},\"modPlateHolder\":-1,\"modHorns\":-1,\"tyreBurst\":{\"0\":false,\"1\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"plateIndex\":0,\"color1\":111,\"modFrontWheels\":-1,\"modLightbar\":-1,\"modArmor\":-1,\"modSmokeEnabled\":1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', 'PENISEK', '{\"modLivery\":-1,\"modFrontBumper\":0,\"modHood\":-1,\"modBrakes\":-1,\"wheelColor\":111,\"modTrimA\":-1,\"modTrunk\":-1,\"modAPlate\":-1,\"modStruts\":-1,\"modAerials\":-1,\"bodyHealth\":1000.0,\"modTransmission\":2,\"modHydrolic\":-1,\"modEngine\":-1,\"modTank\":-1,\"tyreSmokeColor\":[255,255,255],\"modSpeakers\":-1,\"wheels\":5,\"modSuspension\":4,\"modRoof\":-1,\"modGrille\":0,\"plate\":\"PENISEK\",\"modFrame\":0,\"dirtLevel\":0.0,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modTurbo\":false,\"modAirFilter\":-1,\"doorsBroken\":{\"4\":false,\"5\":false,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false},\"modSpoilers\":0,\"modSeats\":-1,\"modArchCover\":-1,\"modBackWheels\":-1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":55.0,\"tankHealth\":1000.0,\"modTrimB\":-1,\"modFender\":-1,\"modEngineBlock\":-1,\"modOrnaments\":-1,\"modXenon\":false,\"modSteeringWheel\":-1,\"modShifterLeavers\":-1,\"neonColor\":[255,0,255],\"modDashboard\":-1,\"pearlescentColor\":0,\"modDoorR\":-1,\"modDial\":-1,\"model\":294222463,\"windowTint\":3,\"modRightFender\":0,\"color2\":0,\"modExhaust\":0,\"xenonColor\":0,\"modSideSkirt\":0,\"modRearBumper\":0,\"windowsBroken\":{\"4\":true,\"5\":true,\"2\":false,\"3\":false,\"0\":false,\"1\":false,\"6\":false,\"7\":false},\"extras\":[],\"modPlateHolder\":-1,\"modHorns\":-1,\"tyreBurst\":{\"0\":false,\"1\":false,\"5\":false,\"4\":false},\"modVanityPlate\":-1,\"plateIndex\":4,\"color1\":111,\"modFrontWheels\":-1,\"modLightbar\":-1,\"modArmor\":-1,\"modSmokeEnabled\":1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', 'KUTASEK', '{\"modAPlate\":-1,\"modDoorR\":-1,\"tyreSmokeColor\":[255,255,255],\"modSeats\":-1,\"bodyHealth\":1000.0,\"modSuspension\":-1,\"wheels\":7,\"modDashboard\":-1,\"engineHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"modBrakes\":-1,\"modTrimB\":-1,\"modEngine\":-1,\"modSpoilers\":-1,\"modDial\":-1,\"plate\":\"KUTASEK\",\"model\":1501052543,\"plateIndex\":0,\"modFrontBumper\":-1,\"color1\":28,\"modShifterLeavers\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"modRearBumper\":-1,\"modTurbo\":false,\"modSmokeEnabled\":false,\"modTrunk\":-1,\"modBackWheels\":-1,\"extras\":{\"5\":false,\"2\":false,\"1\":false,\"4\":false,\"3\":false},\"tyreBurst\":{\"5\":false,\"1\":false,\"0\":false,\"4\":false},\"modSteeringWheel\":-1,\"windowTint\":-1,\"modHorns\":-1,\"modTank\":-1,\"modAerials\":-1,\"modHydrolic\":-1,\"modFrame\":-1,\"windowsBroken\":{\"6\":false,\"5\":true,\"0\":false,\"7\":false,\"2\":false,\"1\":false,\"4\":true,\"3\":false},\"fuelLevel\":65.0,\"modDoorSpeaker\":-1,\"modTransmission\":-1,\"neonColor\":[255,0,255],\"modXenon\":false,\"pearlescentColor\":0,\"modStruts\":-1,\"modRoof\":-1,\"modFrontWheels\":-1,\"tankHealth\":1000.0,\"modExhaust\":-1,\"modSideSkirt\":-1,\"modRightFender\":-1,\"modGrille\":-1,\"modOrnaments\":-1,\"modFender\":-1,\"modHood\":-1,\"modArmor\":-1,\"modAirFilter\":-1,\"xenonColor\":255,\"modLightbar\":-1,\"modArchCover\":-1,\"modLivery\":0,\"modSpeakers\":-1,\"wheelColor\":5,\"modVanityPlate\":-1,\"color2\":0,\"doorsBroken\":{\"0\":false,\"2\":false,\"1\":false,\"4\":false,\"3\":false},\"dirtLevel\":4.0}', 0, 1, 'car', NULL, 0, NULL, NULL, 87, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '2115', '{\"modDoorR\":-1,\"doorsBroken\":{\"3\":false,\"2\":false,\"5\":false,\"4\":false,\"6\":false,\"1\":false,\"0\":false},\"modTransmission\":-1,\"modLivery\":-1,\"modDashboard\":-1,\"modTrimB\":-1,\"modLightbar\":-1,\"modSeats\":-1,\"fuelLevel\":65.0,\"windowsBroken\":{\"3\":false,\"2\":false,\"5\":true,\"4\":true,\"7\":false,\"6\":false,\"1\":false,\"0\":false},\"modBrakes\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"dirtLevel\":8.0,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modStruts\":-1,\"modEngineBlock\":-1,\"modSpoilers\":-1,\"modEngine\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modHydrolic\":-1,\"modSpeakers\":-1,\"model\":294222463,\"modExhaust\":-1,\"modGrille\":-1,\"modTrunk\":-1,\"modFrontBumper\":-1,\"plateIndex\":4,\"bodyHealth\":1000.0,\"extras\":[],\"plate\":\"2115\",\"modArmor\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"color2\":1,\"modHood\":-1,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modAirFilter\":-1,\"xenonColor\":255,\"modFrame\":-1,\"wheels\":0,\"modVanityPlate\":-1,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"tankHealth\":1000.0,\"modDoorSpeaker\":-1,\"wheelColor\":27,\"color1\":2,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"pearlescentColor\":156,\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"modTank\":-1,\"modAerials\":-1,\"modAPlate\":-1}', 0, 1, 'car', NULL, 0, NULL, NULL, 192, 'legion', NULL, 0, '', 0, NULL, NULL);
INSERT INTO `owned_vehicles` (`id`, `owner`, `plate`, `vehicle`, `state`, `owner_type`, `type`, `job`, `stored`, `trunk`, `glovebox`, `vehicleid`, `last_garage`, `garage`, `carseller`, `vin`, `ssn`, `cossn`, `co_owner`) VALUES
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '2112', '{\"modDoorR\":-1,\"doorsBroken\":{\"3\":false,\"2\":false,\"4\":false,\"1\":false,\"0\":false},\"modTransmission\":-1,\"modLivery\":0,\"modDashboard\":-1,\"modTrimB\":-1,\"modLightbar\":-1,\"modSeats\":-1,\"fuelLevel\":65.0,\"windowsBroken\":{\"3\":false,\"2\":false,\"5\":true,\"4\":true,\"7\":false,\"6\":false,\"1\":false,\"0\":false},\"modBrakes\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"dirtLevel\":0.0,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modStruts\":-1,\"modEngineBlock\":-1,\"modSpoilers\":-1,\"modEngine\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modHydrolic\":-1,\"modSpeakers\":-1,\"model\":1501052543,\"modExhaust\":-1,\"modGrille\":-1,\"modTrunk\":-1,\"modFrontBumper\":-1,\"plateIndex\":0,\"bodyHealth\":1000.0,\"extras\":{\"3\":false,\"2\":false,\"5\":false,\"4\":1,\"1\":false},\"plate\":\"2112\",\"modArmor\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"color2\":0,\"modHood\":-1,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modAirFilter\":-1,\"xenonColor\":255,\"modFrame\":-1,\"wheels\":7,\"modVanityPlate\":-1,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"tankHealth\":1000.0,\"modDoorSpeaker\":-1,\"wheelColor\":5,\"color1\":28,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"pearlescentColor\":0,\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"modTank\":-1,\"modAerials\":-1,\"modAPlate\":-1}', 1, 1, 'car', NULL, 0, NULL, NULL, NULL, 'legion', NULL, 0, '', 0, NULL, NULL),
(NULL, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'NORI314', '{\"modDoorR\":-1,\"doorsBroken\":{\"3\":false,\"2\":false,\"4\":false,\"1\":false,\"0\":false},\"modTransmission\":-1,\"modLivery\":-1,\"modDashboard\":-1,\"modTrimB\":-1,\"modLightbar\":-1,\"modSeats\":-1,\"fuelLevel\":65.0,\"windowsBroken\":{\"3\":false,\"2\":false,\"5\":true,\"4\":true,\"7\":false,\"6\":true,\"1\":false,\"0\":false},\"modBrakes\":-1,\"neonColor\":[255,0,255],\"modFender\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"dirtLevel\":10.0,\"modDial\":-1,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modStruts\":-1,\"modEngineBlock\":-1,\"modSpoilers\":-1,\"modEngine\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"modOrnaments\":-1,\"modFrontWheels\":-1,\"modHydrolic\":-1,\"modSpeakers\":-1,\"model\":-1127249378,\"modExhaust\":-1,\"modGrille\":-1,\"modTrunk\":-1,\"modFrontBumper\":-1,\"plateIndex\":4,\"bodyHealth\":1000.0,\"extras\":[],\"plate\":\"NORI314\",\"modArmor\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"color2\":0,\"modHood\":-1,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modAirFilter\":-1,\"xenonColor\":255,\"modFrame\":-1,\"wheels\":5,\"modVanityPlate\":-1,\"tyreBurst\":{\"1\":false,\"0\":false,\"5\":false,\"4\":false},\"tankHealth\":1000.0,\"modDoorSpeaker\":-1,\"wheelColor\":156,\"color1\":2,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"pearlescentColor\":134,\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modXenon\":false,\"modSideSkirt\":-1,\"modTank\":-1,\"modAerials\":-1,\"modAPlate\":-1}', 0, 1, 'car', NULL, 0, NULL, NULL, 277, 'legion', NULL, 0, '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ox_doorlock`
--

CREATE TABLE `ox_doorlock` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ox_doorlock`
--

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
(32, 'gabz_mrpd 1', '{\"maxDistance\":2,\"state\":0,\"groups\":{\"police\":0,\"offpolice\":0},\"lockpick\":true,\"doors\":[{\"heading\":90,\"coords\":{\"x\":434.744384765625,\"y\":-983.078125,\"z\":30.81529998779297},\"model\":-1547307588},{\"heading\":270,\"coords\":{\"x\":434.744384765625,\"y\":-980.755615234375,\"z\":30.81529998779297},\"model\":-1547307588}],\"coords\":{\"x\":434.744384765625,\"y\":-981.9168701171875,\"z\":30.81529998779297},\"hideUi\":false}'),
(33, 'gabz_mrpd 2', '{\"maxDistance\":2,\"state\":1,\"groups\":{\"police\":0,\"offpolice\":0},\"doors\":[{\"heading\":180,\"coords\":{\"x\":458.2087097167969,\"y\":-972.2542724609375,\"z\":30.81529998779297},\"model\":-1547307588},{\"heading\":0,\"coords\":{\"x\":455.8861999511719,\"y\":-972.2542724609375,\"z\":30.81529998779297},\"model\":-1547307588}],\"coords\":{\"x\":457.0474548339844,\"y\":-972.2542724609375,\"z\":30.81529998779297},\"hideUi\":false}'),
(34, 'gabz_mrpd 3', '{\"maxDistance\":2,\"state\":1,\"groups\":{\"police\":0,\"offpolice\":0},\"doors\":[{\"heading\":0,\"coords\":{\"x\":440.73919677734377,\"y\":-998.7462158203125,\"z\":30.81529998779297},\"model\":-1547307588},{\"heading\":180,\"coords\":{\"x\":443.0617980957031,\"y\":-998.7462158203125,\"z\":30.81529998779297},\"model\":-1547307588}],\"coords\":{\"x\":441.9005126953125,\"y\":-998.7462158203125,\"z\":30.81529998779297},\"hideUi\":false}'),
(35, 'gabz_mrpd 4', '{\"coords\":{\"x\":441.1240539550781,\"y\":-977.60107421875,\"z\":30.82319068908691},\"groups\":{\"police\":0},\"heading\":0,\"lockpick\":true,\"model\":-1406685646,\"state\":1,\"maxDistance\":2}'),
(36, 'gabz_mrpd 5', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0,\"offpolice\":0},\"maxDistance\":2,\"coords\":{\"x\":441.12408447265627,\"y\":-986.2335205078125,\"z\":30.82319068908691},\"heading\":180,\"model\":-96679321}'),
(37, 'gabz_mrpd 6', '{\"coords\":{\"x\":464.1590881347656,\"y\":-974.6655883789063,\"z\":26.37070083618164},\"state\":1,\"model\":1830360419,\"heading\":270,\"groups\":{\"police\":0,\"offpolice\":0},\"maxDistance\":2,\"hideUi\":false}'),
(38, 'gabz_mrpd 7', '{\"coords\":{\"x\":464.1565856933594,\"y\":-997.50927734375,\"z\":26.37070083618164},\"state\":1,\"model\":1830360419,\"heading\":90,\"groups\":{\"police\":0,\"offpolice\":0},\"maxDistance\":2,\"hideUi\":false}'),
(39, 'gabz_mrpd 8', '{\"heading\":0,\"coords\":{\"x\":431.4118957519531,\"y\":-1000.771728515625,\"z\":26.69660949707031},\"auto\":true,\"maxDistance\":5,\"model\":2130672747,\"groups\":{\"offpolice\":0,\"police\":0},\"lockSound\":\"button-remote\",\"state\":1}'),
(40, 'gabz_mrpd 9', '{\"coords\":{\"x\":452.3005065917969,\"y\":-1000.77197265625,\"z\":26.69660949707031},\"state\":1,\"model\":2130672747,\"heading\":0,\"groups\":{\"police\":0,\"offpolice\":0},\"auto\":true,\"lockSound\":\"button-remote\",\"maxDistance\":6,\"hideUi\":false}'),
(41, 'gabz_mrpd 10', '{\"coords\":{\"x\":488.8948059082031,\"y\":-1017.2119750976563,\"z\":27.14934921264648},\"state\":1,\"model\":-1603817716,\"heading\":90,\"groups\":{\"police\":0,\"offpolice\":0},\"auto\":true,\"lockSound\":\"button-remote\",\"maxDistance\":6,\"hideUi\":false}'),
(42, 'gabz_mrpd 11', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0,\"offpolice\":0},\"maxDistance\":2,\"coords\":{\"x\":468.5714416503906,\"y\":-1014.406005859375,\"z\":26.48381996154785},\"doors\":[{\"model\":-692649124,\"heading\":0,\"coords\":{\"x\":467.36859130859377,\"y\":-1014.406005859375,\"z\":26.48381996154785}},{\"model\":-692649124,\"heading\":180,\"coords\":{\"x\":469.7742919921875,\"y\":-1014.406005859375,\"z\":26.48381996154785}}]}'),
(43, 'gabz_mrpd 12', '{\"coords\":{\"x\":475.9538879394531,\"y\":-1010.8189697265625,\"z\":26.40638923645019},\"state\":1,\"model\":-1406685646,\"heading\":180,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(44, 'gabz_mrpd 13', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":1.5,\"coords\":{\"x\":476.64471435546877,\"y\":-1008.2840576171875,\"z\":26.48004913330078},\"heading\":270,\"lockSound\":\"metal-locker\",\"model\":-53345114,\"unlockSound\":\"metallic-creak\"}'),
(45, 'gabz_mrpd 14', '{\"coords\":{\"x\":481.0083923339844,\"y\":-1004.1179809570313,\"z\":26.48004913330078},\"unlockSound\":\"metallic-creak\",\"state\":1,\"model\":-53345114,\"heading\":180,\"groups\":{\"police\":0},\"maxDistance\":2,\"lockSound\":\"metal-locker\",\"hideUi\":false}'),
(46, 'gabz_mrpd 15', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":2,\"coords\":{\"x\":477.32135009765627,\"y\":-1012.158203125,\"z\":26.48004913330078},\"heading\":0,\"lockSound\":\"metal-locker\",\"model\":-53345114,\"unlockSound\":\"metallic-creak\"}'),
(47, 'gabz_mrpd 16', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":2,\"coords\":{\"x\":480.32159423828127,\"y\":-1012.158203125,\"z\":26.48004913330078},\"heading\":0,\"lockSound\":\"metal-locker\",\"model\":-53345114,\"unlockSound\":\"metallic-creak\"}'),
(48, 'gabz_mrpd 17', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":2,\"coords\":{\"x\":483.32147216796877,\"y\":-1012.158203125,\"z\":26.48004913330078},\"heading\":0,\"lockSound\":\"metal-locker\",\"model\":-53345114,\"unlockSound\":\"metallic-creak\"}'),
(49, 'gabz_mrpd 18', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":2,\"coords\":{\"x\":486.3218688964844,\"y\":-1012.158203125,\"z\":26.48004913330078},\"heading\":0,\"lockSound\":\"metal-locker\",\"model\":-53345114,\"unlockSound\":\"metallic-creak\"}'),
(50, 'gabz_mrpd 19', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":2,\"coords\":{\"x\":484.7677001953125,\"y\":-1007.764892578125,\"z\":26.48004913330078},\"heading\":180,\"lockSound\":\"metal-locker\",\"model\":-53345114,\"unlockSound\":\"metallic-creak\"}'),
(51, 'gabz_mrpd 20', '{\"coords\":{\"x\":479.05999755859377,\"y\":-1003.1729736328125,\"z\":26.4064998626709},\"state\":1,\"model\":-288803980,\"heading\":90,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(52, 'gabz_mrpd 21', '{\"coords\":{\"x\":482.6694030761719,\"y\":-983.98681640625,\"z\":26.40547943115234},\"state\":1,\"model\":-1406685646,\"heading\":270,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(53, 'gabz_mrpd 22', '{\"coords\":{\"x\":482.67010498046877,\"y\":-987.5792236328125,\"z\":26.40547943115234},\"state\":1,\"model\":-1406685646,\"heading\":270,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(54, 'gabz_mrpd 23', '{\"coords\":{\"x\":482.6698913574219,\"y\":-992.299072265625,\"z\":26.40547943115234},\"state\":1,\"model\":-1406685646,\"heading\":270,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(55, 'gabz_mrpd 24', '{\"coords\":{\"x\":482.6702880859375,\"y\":-995.728515625,\"z\":26.40547943115234},\"state\":1,\"model\":-1406685646,\"heading\":270,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(56, 'gabz_mrpd 25', '{\"coords\":{\"x\":475.8323059082031,\"y\":-990.48388671875,\"z\":26.40547943115234},\"state\":1,\"model\":-692649124,\"heading\":135,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(57, 'gabz_mrpd 26', '{\"coords\":{\"x\":479.7507019042969,\"y\":-999.6290283203125,\"z\":30.78927040100097},\"state\":1,\"model\":-692649124,\"heading\":90,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(58, 'gabz_mrpd 27', '{\"coords\":{\"x\":487.43780517578127,\"y\":-1000.1890258789063,\"z\":30.7869701385498},\"state\":1,\"model\":-692649124,\"heading\":181,\"groups\":{\"police\":0},\"maxDistance\":2,\"hideUi\":false}'),
(59, 'gabz_mrpd 28', '{\"maxDistance\":2,\"state\":1,\"groups\":{\"police\":0},\"doors\":[{\"heading\":0,\"coords\":{\"x\":485.6133117675781,\"y\":-1002.9019775390625,\"z\":30.7869701385498},\"model\":-692649124},{\"heading\":180,\"coords\":{\"x\":488.0184020996094,\"y\":-1002.9019775390625,\"z\":30.7869701385498},\"model\":-692649124}],\"coords\":{\"x\":486.81585693359377,\"y\":-1002.9019775390625,\"z\":30.7869701385498},\"hideUi\":false}'),
(60, 'gabz_mrpd 29', '{\"coords\":{\"x\":464.30859375,\"y\":-984.5283813476563,\"z\":43.771240234375},\"state\":1,\"model\":-692649124,\"heading\":90,\"groups\":{\"police\":0},\"auto\":false,\"maxDistance\":2,\"lockpick\":false,\"hideUi\":false}'),
(93, 'gabz_mrpd 30', '{\"coords\":{\"x\":410.2601623535156,\"y\":-1021.7655029296875,\"z\":28.47683334350586},\"maxDistance\":5.5,\"groups\":{\"police\":0},\"state\":1,\"auto\":true,\"heading\":89,\"doors\":false,\"model\":1286535678}'),
(95, 'gabz_mrpd 30', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":1.5,\"coords\":{\"x\":468.72479248046877,\"y\":-1000.543701171875,\"z\":26.40548324584961},\"doors\":[{\"model\":-288803980,\"heading\":0,\"coords\":{\"x\":467.522216796875,\"y\":-1000.543701171875,\"z\":26.40548324584961}},{\"model\":-288803980,\"heading\":180,\"coords\":{\"x\":469.9273681640625,\"y\":-1000.543701171875,\"z\":26.40548324584961}}]}'),
(96, 'gabz_mrpd 31', '{\"state\":1,\"lockpick\":true,\"groups\":{\"police\":0},\"maxDistance\":1.5,\"coords\":{\"x\":471.371826171875,\"y\":-1008.99560546875,\"z\":26.40548324584961},\"doors\":[{\"model\":149284793,\"heading\":90,\"coords\":{\"x\":471.3758239746094,\"y\":-1010.1978759765625,\"z\":26.40548324584961}},{\"model\":149284793,\"heading\":270,\"coords\":{\"x\":471.36785888671877,\"y\":-1007.7933959960938,\"z\":26.40548324584961}}]}'),
(97, 'gabz_mrpd 32', '{\"coords\":{\"x\":475.953857421875,\"y\":-1006.9378051757813,\"z\":26.40638542175293},\"maxDistance\":1.5,\"groups\":{\"police\":0},\"state\":1,\"model\":-288803980,\"heading\":180,\"doors\":false}'),
(98, 'gabz_mrpd 33', '{\"heading\":270,\"state\":1,\"doors\":false,\"coords\":{\"x\":458.6543273925781,\"y\":-990.0457763671875,\"z\":30.82319259643554},\"maxDistance\":1.5,\"groups\":{\"police\":0},\"model\":-96679321,\"lockpickDifficulty\":[\"easy\"]}'),
(99, 'gabz_mrpd 34', '{\"doors\":false,\"state\":1,\"maxDistance\":2,\"coords\":{\"x\":458.08941650390627,\"y\":-995.524658203125,\"z\":30.82319259643554},\"model\":149284793,\"groups\":{\"police\":0},\"heading\":225}'),
(100, 'philbox', '{\"heading\":250,\"model\":854291622,\"coords\":{\"x\":313.4800720214844,\"y\":-595.4583129882813,\"z\":43.43391036987305},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":false}'),
(101, 'pb2', '{\"heading\":160,\"model\":854291622,\"coords\":{\"x\":309.13372802734377,\"y\":-597.75146484375,\"z\":43.43391036987305},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":false}'),
(102, 'pb', '{\"coords\":{\"x\":325.44549560546877,\"y\":-589.6663818359375,\"z\":43.43391036987305},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":340,\"model\":-434783486,\"coords\":{\"x\":324.23602294921877,\"y\":-589.2261962890625,\"z\":43.43391036987305}},{\"heading\":340,\"model\":-1700911976,\"coords\":{\"x\":326.6549987792969,\"y\":-590.1066284179688,\"z\":43.43391036987305}}]}'),
(103, 'd11', '{\"coords\":{\"x\":304.012451171875,\"y\":-581.8651123046875,\"z\":43.43391036987305},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":340,\"model\":-434783486,\"coords\":{\"x\":302.8030700683594,\"y\":-581.424560546875,\"z\":43.43391036987305}},{\"heading\":340,\"model\":-1700911976,\"coords\":{\"x\":305.22186279296877,\"y\":-582.3056030273438,\"z\":43.43391036987305}}]}'),
(104, 'pb4', '{\"coords\":{\"x\":327.69622802734377,\"y\":-593.9855346679688,\"z\":43.43391036987305},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":250,\"model\":-434783486,\"coords\":{\"x\":328.1364440917969,\"y\":-592.7760620117188,\"z\":43.43391036987305}},{\"heading\":250,\"model\":-1700911976,\"coords\":{\"x\":327.2560119628906,\"y\":-595.1950073242188,\"z\":43.43391036987305}}]}'),
(105, 'pn5', '{\"coords\":{\"x\":346.2294006347656,\"y\":-591.5126953125,\"z\":28.94709205627441},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":70,\"model\":-1700911976,\"coords\":{\"x\":346.66900634765627,\"y\":-590.3026733398438,\"z\":28.94709205627441}},{\"heading\":70,\"model\":-434783486,\"coords\":{\"x\":345.789794921875,\"y\":-592.7227172851563,\"z\":28.94709205627441}}]}'),
(106, 'p\\b7', '{\"coords\":{\"x\":349.4212951660156,\"y\":-582.7401123046875,\"z\":28.94709205627441},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":70,\"model\":-1700911976,\"coords\":{\"x\":349.8607482910156,\"y\":-581.5304565429688,\"z\":28.94709205627441}},{\"heading\":70,\"model\":-434783486,\"coords\":{\"x\":348.9818420410156,\"y\":-583.9497680664063,\"z\":28.94709205627441}}]}'),
(107, 'pb10', '{\"coords\":{\"x\":338.8866271972656,\"y\":-588.84375,\"z\":28.94709205627441},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":70,\"model\":-434783486,\"coords\":{\"x\":338.4466552734375,\"y\":-590.052978515625,\"z\":28.94709205627441}},{\"heading\":70,\"model\":-1700911976,\"coords\":{\"x\":339.32659912109377,\"y\":-587.634521484375,\"z\":28.94709205627441}}]}'),
(108, 'pb11', '{\"coords\":{\"x\":319.8402099609375,\"y\":-560.460693359375,\"z\":28.94723892211914},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":3,\"doors\":[{\"heading\":205,\"model\":1248599813,\"coords\":{\"x\":318.6656188964844,\"y\":-561.0086059570313,\"z\":28.94723892211914}},{\"heading\":25,\"model\":-1421582160,\"coords\":{\"x\":321.01483154296877,\"y\":-559.9127197265625,\"z\":28.94723892211914}}]}'),
(109, 'pb12', '{\"heading\":160,\"auto\":true,\"model\":-820650556,\"coords\":{\"x\":330.1349182128906,\"y\":-561.8331298828125,\"z\":29.77529144287109},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":7,\"doors\":false}'),
(110, 'pb13', '{\"heading\":160,\"auto\":true,\"model\":-820650556,\"coords\":{\"x\":337.2776794433594,\"y\":-564.4320068359375,\"z\":29.77529144287109},\"autolock\":5,\"state\":1,\"groups\":{\"ambulance\":0},\"maxDistance\":7,\"doors\":false}'),
(111, 'bramalsc', '{\"autolock\":5,\"maxDistance\":8,\"coords\":{\"x\":154.8095245361328,\"y\":-3023.88916015625,\"z\":8.50333595275878},\"doors\":false,\"groups\":{\"mechanic\":0},\"heading\":90,\"auto\":true,\"state\":1,\"model\":-456733639}'),
(112, 'bramalsc2', '{\"autolock\":5,\"maxDistance\":8,\"coords\":{\"x\":154.8095245361328,\"y\":-3034.05126953125,\"z\":8.50333595275878},\"doors\":false,\"groups\":{\"mechanic\":0},\"heading\":90,\"auto\":true,\"state\":1,\"model\":-456733639}'),
(113, 'dzrzwilsc', '{\"autolock\":5,\"maxDistance\":8,\"coords\":{\"x\":151.466796875,\"y\":-3011.705078125,\"z\":7.25836658477783},\"doors\":false,\"groups\":{\"mechanic\":0},\"heading\":90,\"state\":1,\"model\":-1229046235}'),
(210, 'cayo', '{\"groups\":{\"mechanic\":1},\"coords\":{\"x\":5027.1396484375,\"y\":-5732.8759765625,\"z\":18.06167411804199},\"heading\":228,\"maxDistance\":2,\"state\":0,\"model\":-607013269,\"doors\":false}'),
(211, 'cayo', '{\"groups\":{\"mechanic\":1},\"coords\":{\"x\":5032.53369140625,\"y\":-5735.6103515625,\"z\":18.06167411804199},\"heading\":138,\"maxDistance\":2,\"state\":0,\"model\":-607013269,\"doors\":false}'),
(222, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-542.7484130859375,\"y\":-119.78205871582031,\"z\":38.01466751098633},\"maxDistance\":2,\"doors\":[{\"model\":1557126584,\"heading\":202,\"coords\":{\"x\":-543.9548950195313,\"y\":-120.26951599121094,\"z\":38.01499938964844}},{\"model\":1557126584,\"heading\":22,\"coords\":{\"x\":-541.5419311523438,\"y\":-119.29460906982422,\"z\":38.01433563232422}}]}'),
(223, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-553.5692138671875,\"y\":-122.47509765625,\"z\":38.00939559936523},\"maxDistance\":2,\"doors\":[{\"model\":-543497392,\"heading\":293,\"coords\":{\"x\":-553.0604248046875,\"y\":-123.67359924316406,\"z\":38.00939559936523}},{\"model\":-543497392,\"heading\":113,\"coords\":{\"x\":-554.0780029296875,\"y\":-121.27659606933594,\"z\":38.00939559936523}}]}'),
(224, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-542.9228515625,\"y\":-132.0578155517578,\"z\":38.91766738891601},\"maxDistance\":2,\"doors\":[{\"model\":-1213562692,\"heading\":24,\"coords\":{\"x\":-543.9918212890625,\"y\":-132.51768493652345,\"z\":38.91766738891601}},{\"model\":-1213562692,\"heading\":203,\"coords\":{\"x\":-541.8538818359375,\"y\":-131.5979461669922,\"z\":38.91766738891601}}]}'),
(225, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-555.4441528320313,\"y\":-118.13206481933594,\"z\":38.00671005249023},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":292}'),
(226, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-555.134033203125,\"y\":-105.54869842529297,\"z\":39.0859375},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":23}'),
(227, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-552.5208740234375,\"y\":-106.99400329589844,\"z\":33.87060928344726},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":23}'),
(228, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-579.4078979492188,\"y\":-124.81644439697266,\"z\":34.68503952026367},\"maxDistance\":2,\"model\":-1394363762,\"doors\":false,\"heading\":23}'),
(229, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-584.7127075195313,\"y\":-127.03512573242188,\"z\":34.68503952026367},\"maxDistance\":2,\"model\":-1394363762,\"doors\":false,\"heading\":23}'),
(230, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-560.9153442382813,\"y\":-105.31591033935547,\"z\":34.12413787841797},\"maxDistance\":2,\"doors\":[{\"model\":-483591766,\"heading\":292,\"coords\":{\"x\":-561.3369750976563,\"y\":-104.31471252441406,\"z\":34.12413787841797}},{\"model\":-483591766,\"heading\":113,\"coords\":{\"x\":-560.4937133789063,\"y\":-106.31710815429688,\"z\":34.12413787841797}}]}'),
(231, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-562.078369140625,\"y\":-102.53958129882813,\"z\":34.12413787841797},\"maxDistance\":2,\"doors\":[{\"model\":-483591766,\"heading\":292,\"coords\":{\"x\":-562.4841918945313,\"y\":-101.53520202636719,\"z\":34.12413787841797}},{\"model\":-483591766,\"heading\":111,\"coords\":{\"x\":-561.6724853515625,\"y\":-103.5439682006836,\"z\":34.12413787841797}}]}'),
(232, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-563.566650390625,\"y\":-117.78721618652344,\"z\":34.11756896972656},\"maxDistance\":2,\"doors\":[{\"model\":-483591766,\"heading\":21,\"coords\":{\"x\":-564.5682983398438,\"y\":-118.19189453125,\"z\":34.11756896972656}},{\"model\":-483591766,\"heading\":202,\"coords\":{\"x\":-562.5650634765625,\"y\":-117.38253784179688,\"z\":34.11756896972656}}]}'),
(233, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-566.3433837890625,\"y\":-118.94204711914063,\"z\":34.11756896972656},\"maxDistance\":2,\"doors\":[{\"model\":-483591766,\"heading\":21,\"coords\":{\"x\":-567.3564453125,\"y\":-119.33671569824219,\"z\":34.11756896972656}},{\"model\":-483591766,\"heading\":201,\"coords\":{\"x\":-565.3302612304688,\"y\":-118.54737854003906,\"z\":34.11756896972656}}]}'),
(234, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-550.6512451171875,\"y\":-121.4378890991211,\"z\":33.92364883422851},\"maxDistance\":2,\"model\":749848321,\"doors\":false,\"heading\":292}'),
(235, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-554.9110107421875,\"y\":-118.81143188476563,\"z\":33.90147018432617},\"maxDistance\":2,\"model\":-131296141,\"doors\":false,\"heading\":112}'),
(236, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-557.1741943359375,\"y\":-122.9274673461914,\"z\":33.90085983276367},\"maxDistance\":2,\"model\":-131296141,\"doors\":false,\"heading\":114}'),
(237, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-555.3458862304688,\"y\":-127.31438446044922,\"z\":33.90383911132812},\"maxDistance\":2,\"model\":-131296141,\"doors\":false,\"heading\":293}'),
(238, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-554.450439453125,\"y\":-129.4440460205078,\"z\":33.9004898071289},\"maxDistance\":2,\"model\":-131296141,\"doors\":false,\"heading\":112}'),
(239, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-551.5534057617188,\"y\":-127.03486633300781,\"z\":33.90367889404297},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":292}'),
(240, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-546.7310180664063,\"y\":-131.05783081054688,\"z\":33.90104675292969},\"maxDistance\":2,\"model\":631614199,\"doors\":false,\"heading\":20}'),
(241, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-545.827880859375,\"y\":-130.54786682128907,\"z\":33.90298843383789},\"maxDistance\":2,\"model\":631614199,\"doors\":false,\"heading\":201}'),
(242, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-542.8187866210938,\"y\":-129.3384246826172,\"z\":33.90298843383789},\"maxDistance\":2,\"model\":631614199,\"doors\":false,\"heading\":201}'),
(243, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-541.0755004882813,\"y\":-125.51346588134766,\"z\":33.90298843383789},\"maxDistance\":2,\"model\":631614199,\"doors\":false,\"heading\":111}'),
(244, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-542.283935546875,\"y\":-122.5114974975586,\"z\":33.90298843383789},\"maxDistance\":2,\"model\":631614199,\"doors\":false,\"heading\":110}'),
(245, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-542.8069458007813,\"y\":-121.57714080810547,\"z\":33.90298843383789},\"maxDistance\":2,\"model\":631614199,\"doors\":false,\"heading\":291}'),
(246, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-556.1857299804688,\"y\":-106.90846252441406,\"z\":33.90406036376953},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":23}'),
(247, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-559.7921142578125,\"y\":-96.36569213867188,\"z\":33.90044021606445},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":24}'),
(248, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-557.2184448242188,\"y\":-98.24484252929688,\"z\":33.9008903503418},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":22}'),
(249, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-555.1697998046875,\"y\":-105.4622573852539,\"z\":43.07913970947265},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":22}'),
(250, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-551.6958618164063,\"y\":-114.49569702148438,\"z\":42.40558624267578},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":293}'),
(251, 'police', '{\"state\":1,\"groups\":{\"police\":15},\"coords\":{\"x\":-544.8995971679688,\"y\":-130.78932189941407,\"z\":42.39474487304687},\"maxDistance\":2,\"model\":-1320876379,\"doors\":false,\"heading\":293}'),
(252, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-557.570556640625,\"y\":-114.83872985839844,\"z\":42.40515518188476},\"maxDistance\":2,\"model\":-2023754432,\"doors\":false,\"heading\":292}'),
(253, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-557.1444091796875,\"y\":-125.02024841308594,\"z\":42.40032958984375},\"maxDistance\":2,\"doors\":[{\"model\":-2023754432,\"heading\":203,\"coords\":{\"x\":-555.9480590820313,\"y\":-124.51160430908203,\"z\":42.40032958984375}},{\"model\":-2023754432,\"heading\":23,\"coords\":{\"x\":-558.3407592773438,\"y\":-125.52888488769531,\"z\":42.40032958984375}}]}'),
(254, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-564.84765625,\"y\":-128.2301788330078,\"z\":42.37140274047851},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":203}'),
(255, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-565.8370361328125,\"y\":-128.57009887695313,\"z\":42.36871337890625},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":23}'),
(256, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-569.6243286132813,\"y\":-132.33218383789063,\"z\":42.36944961547851},\"maxDistance\":2,\"model\":-1320876379,\"doors\":false,\"heading\":293}'),
(257, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-555.4033813476563,\"y\":-104.903076171875,\"z\":46.87432861328125},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":23}'),
(258, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-547.13623046875,\"y\":-123.70378112792969,\"z\":47.63342666625976},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":23}'),
(259, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-560.5570068359375,\"y\":-127.81507110595703,\"z\":47.66071319580078},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":293}'),
(260, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-573.3593139648438,\"y\":-130.36688232421876,\"z\":47.63053131103515},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":203}'),
(261, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-578.0519409179688,\"y\":-136.52069091796876,\"z\":47.66526412963867},\"maxDistance\":2,\"doors\":[{\"model\":-543497392,\"heading\":23,\"coords\":{\"x\":-576.8523559570313,\"y\":-136.0211181640625,\"z\":47.66526412963867}},{\"model\":-543497392,\"heading\":202,\"coords\":{\"x\":-579.2515258789063,\"y\":-137.02024841308595,\"z\":47.66526412963867}}]}'),
(262, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-582.3270874023438,\"y\":-134.0789031982422,\"z\":47.62993240356445},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":202}'),
(263, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-582.5219116210938,\"y\":-136.9618377685547,\"z\":47.66071319580078},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":293}'),
(264, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-588.15234375,\"y\":-135.74667358398438,\"z\":47.88557434082031},\"maxDistance\":2,\"doors\":[{\"model\":-1213562692,\"heading\":248,\"coords\":{\"x\":-587.7022705078125,\"y\":-134.67245483398438,\"z\":47.88557434082031}},{\"model\":-1213562692,\"heading\":67,\"coords\":{\"x\":-588.6024780273438,\"y\":-136.8208770751953,\"z\":47.88557434082031}}]}'),
(265, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-555.390869140625,\"y\":-104.93443298339844,\"z\":50.49050903320312},\"maxDistance\":2,\"model\":-543497392,\"doors\":false,\"heading\":22}'),
(266, 'police', '{\"state\":1,\"groups\":{\"police\":1},\"coords\":{\"x\":-551.1782836914063,\"y\":-114.97247314453125,\"z\":52.11800003051758},\"maxDistance\":2,\"model\":749848321,\"doors\":false,\"heading\":20}'),
(267, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-582.6721801757813,\"y\":-195.24435424804688,\"z\":38.788818359375},\"maxDistance\":2,\"doors\":[{\"model\":-1441580718,\"heading\":210,\"coords\":{\"x\":-583.59423828125,\"y\":-195.77670288085938,\"z\":38.78913879394531}},{\"model\":-1441580718,\"heading\":30,\"coords\":{\"x\":-581.7501220703125,\"y\":-194.71200561523438,\"z\":38.78850173950195}}]}'),
(268, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-574.868896484375,\"y\":-197.95999145507813,\"z\":38.21731185913086},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":300}'),
(269, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-565.1881713867188,\"y\":-205.1836395263672,\"z\":38.21731185913086},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":30}'),
(270, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-561.5650024414063,\"y\":-208.3792266845703,\"z\":38.31303405761719},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(271, 'doj', '{\"state\":1,\"groups\":{\"doj\":4},\"coords\":{\"x\":-579.5139770507813,\"y\":-211.4532928466797,\"z\":38.21731185913086},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":120}'),
(272, 'doj', '{\"state\":1,\"groups\":{\"doj\":4},\"coords\":{\"x\":-584.6761474609375,\"y\":-202.51223754882813,\"z\":38.21731185913086},\"maxDistance\":2,\"model\":-1821777087,\"doors\":false,\"heading\":120}'),
(273, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-569.8201904296875,\"y\":-218.17092895507813,\"z\":38.43289184570312},\"maxDistance\":2,\"doors\":[{\"model\":-2030220382,\"heading\":210,\"coords\":{\"x\":-570.834716796875,\"y\":-218.76019287109376,\"z\":38.43087005615234}},{\"model\":-2030220382,\"heading\":30,\"coords\":{\"x\":-568.8057250976563,\"y\":-217.5816650390625,\"z\":38.43490982055664}}]}'),
(274, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-560.3317260742188,\"y\":-187.38734436035157,\"z\":38.31866455078125},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":176}'),
(275, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-552.0006103515625,\"y\":-182.56985473632813,\"z\":38.31851959228515},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":62}'),
(276, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-540.5362548828125,\"y\":-179.0327606201172,\"z\":38.30988311767578},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(277, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-538.772216796875,\"y\":-182.07936096191407,\"z\":38.3091926574707},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":120}'),
(278, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-529.6654663085938,\"y\":-184.64451599121095,\"z\":38.30764770507812},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(279, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-528.0910034179688,\"y\":-185.568115234375,\"z\":38.42619705200195},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":210}'),
(280, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-519.7882690429688,\"y\":-180.76766967773438,\"z\":38.43117523193359},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":30}'),
(281, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-526.5265502929688,\"y\":-191.3244171142578,\"z\":38.4279670715332},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(282, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-511.57476806640627,\"y\":-205.29306030273438,\"z\":38.42523956298828},\"maxDistance\":2,\"doors\":[{\"model\":-2030220382,\"heading\":30,\"coords\":{\"x\":-510.56219482421877,\"y\":-204.70806884765626,\"z\":38.42523956298828}},{\"model\":-2030220382,\"heading\":210,\"coords\":{\"x\":-512.5873413085938,\"y\":-205.87803649902345,\"z\":38.42523956298828}}]}'),
(283, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-515.87060546875,\"y\":-210.45712280273438,\"z\":38.84296417236328},\"maxDistance\":2,\"doors\":[{\"model\":-1847344035,\"heading\":120,\"coords\":{\"x\":-516.3992919921875,\"y\":-209.54833984375,\"z\":38.84297943115234}},{\"model\":-1847344035,\"heading\":300,\"coords\":{\"x\":-515.3418579101563,\"y\":-211.3658905029297,\"z\":38.84294509887695}}]}'),
(284, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-535.5889282226563,\"y\":-187.89329528808595,\"z\":42.9266357421875},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(285, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-533.9352416992188,\"y\":-183.5841522216797,\"z\":42.92686462402344},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":210}'),
(286, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-533.1567993164063,\"y\":-176.28453063964845,\"z\":42.98828506469726},\"maxDistance\":2,\"model\":9006550,\"doors\":false,\"heading\":120}'),
(287, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-527.349365234375,\"y\":-185.0961151123047,\"z\":42.92131042480469},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":210}'),
(288, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-521.65869140625,\"y\":-181.87490844726563,\"z\":42.92559051513672},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":210}'),
(289, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-563.9293212890625,\"y\":-204.27001953125,\"z\":42.92560195922851},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(290, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-568.4541015625,\"y\":-203.5244903564453,\"z\":42.92609786987305},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":30}'),
(292, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-574.7333984375,\"y\":-201.79234313964845,\"z\":42.9870719909668},\"maxDistance\":2,\"model\":9006550,\"doors\":false,\"heading\":301}'),
(293, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-571.4561157226563,\"y\":-210.54246520996095,\"z\":42.9205436706543},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":210}'),
(294, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-576.0961303710938,\"y\":-213.2463836669922,\"z\":42.92051696777344},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":30}'),
(295, 'doj', '{\"state\":0,\"groups\":{\"doj\":1},\"coords\":{\"x\":-562.0545654296875,\"y\":-187.88665771484376,\"z\":47.7445068359375},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":121}'),
(296, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-556.763916015625,\"y\":-184.01007080078126,\"z\":47.29444885253906},\"maxDistance\":2,\"doors\":[{\"model\":-543497392,\"heading\":30,\"coords\":{\"x\":-555.637939453125,\"y\":-183.3599853515625,\"z\":47.29444885253906}},{\"model\":-543497392,\"heading\":210,\"coords\":{\"x\":-557.8899536132813,\"y\":-184.66017150878907,\"z\":47.29444885253906}}]}'),
(297, 'doj', '{\"state\":1,\"groups\":{\"doj\":0},\"coords\":{\"x\":-550.7086791992188,\"y\":-181.3284149169922,\"z\":47.7445068359375},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":121}'),
(298, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-535.7969360351563,\"y\":-184.53231811523438,\"z\":47.74299621582031},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":308}'),
(299, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-535.3473510742188,\"y\":-185.29176330566407,\"z\":47.74287414550781},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":112}'),
(300, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-538.1726684570313,\"y\":-198.6887969970703,\"z\":47.73983001708984},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(301, 'doj', '{\"state\":0,\"groups\":{\"doj\":1},\"coords\":{\"x\":-553.2235107421875,\"y\":-207.42762756347657,\"z\":47.73983001708984},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":300}'),
(302, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-566.27490234375,\"y\":-203.16810607910157,\"z\":47.74472045898437},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":128}'),
(303, 'doj', '{\"state\":1,\"groups\":{\"doj\":1},\"coords\":{\"x\":-566.765869140625,\"y\":-202.39418029785157,\"z\":47.7443962097168},\"maxDistance\":2,\"model\":-2030220382,\"doors\":false,\"heading\":290}'),
(308, 'ambulance', '{\"state\":0,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":299.62933349609377,\"y\":-584.8292846679688,\"z\":42.28400802612305},\"maxDistance\":2,\"doors\":[{\"model\":661758796,\"heading\":250,\"coords\":{\"x\":300.0307922363281,\"y\":-583.7262573242188,\"z\":42.28400802612305}},{\"model\":-487908756,\"heading\":250,\"coords\":{\"x\":299.22784423828127,\"y\":-585.9323120117188,\"z\":42.28400802612305}}]}'),
(311, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":307.1181945800781,\"y\":-569.5689697265625,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(312, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":303.9596252441406,\"y\":-572.5579223632813,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":70}'),
(313, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":313.214599609375,\"y\":-571.7813720703125,\"z\":43.43391036987305},\"maxDistance\":2,\"doors\":[{\"model\":-1700911976,\"heading\":340,\"coords\":{\"x\":314.4241027832031,\"y\":-572.2215576171875,\"z\":43.43391036987305}},{\"model\":-434783486,\"heading\":340,\"coords\":{\"x\":312.005126953125,\"y\":-571.3411865234375,\"z\":43.43391036987305}}]}'),
(314, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":319.05206298828127,\"y\":-573.9061279296875,\"z\":43.43391036987305},\"maxDistance\":2,\"doors\":[{\"model\":-1700911976,\"heading\":340,\"coords\":{\"x\":320.26153564453127,\"y\":-574.3463134765625,\"z\":43.43391036987305}},{\"model\":-434783486,\"heading\":340,\"coords\":{\"x\":317.8425598144531,\"y\":-573.4658813476563,\"z\":43.43391036987305}}]}'),
(315, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":324.447021484375,\"y\":-575.8696899414063,\"z\":43.43391036987305},\"maxDistance\":2,\"doors\":[{\"model\":-1700911976,\"heading\":340,\"coords\":{\"x\":325.6565246582031,\"y\":-576.3099365234375,\"z\":43.43391036987305}},{\"model\":-434783486,\"heading\":340,\"coords\":{\"x\":323.237548828125,\"y\":-575.429443359375,\"z\":43.43391036987305}}]}'),
(316, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":317.27520751953127,\"y\":-578.7879638671875,\"z\":43.43391036987305},\"maxDistance\":2,\"doors\":[{\"model\":-1700911976,\"heading\":160,\"coords\":{\"x\":316.0657043457031,\"y\":-578.3477172851563,\"z\":43.43391036987305}},{\"model\":-434783486,\"heading\":160,\"coords\":{\"x\":318.48468017578127,\"y\":-579.2281494140625,\"z\":43.43391036987305}}]}'),
(317, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":326.10968017578127,\"y\":-579.2501220703125,\"z\":43.43391036987305},\"maxDistance\":2,\"doors\":[{\"model\":-1700911976,\"heading\":250,\"coords\":{\"x\":325.6694641113281,\"y\":-580.4595947265625,\"z\":43.43391036987305}},{\"model\":-434783486,\"heading\":250,\"coords\":{\"x\":326.5498962402344,\"y\":-578.0406494140625,\"z\":43.43391036987305}}]}'),
(319, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":336.162841796875,\"y\":-580.1403198242188,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(320, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":340.7818298339844,\"y\":-581.8214721679688,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(321, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":346.77392578125,\"y\":-584.00244140625,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(323, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":348.87353515625,\"y\":-587.5355224609375,\"z\":43.43391036987305},\"maxDistance\":2,\"doors\":[{\"model\":-434783486,\"heading\":250,\"coords\":{\"x\":349.3137512207031,\"y\":-586.3259887695313,\"z\":43.43391036987305}},{\"model\":-1700911976,\"heading\":250,\"coords\":{\"x\":348.4333190917969,\"y\":-588.7449951171875,\"z\":43.43391036987305}}]}'),
(324, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":352.1996765136719,\"y\":-594.1477661132813,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":250}'),
(325, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":350.8340759277344,\"y\":-597.8997192382813,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":250}'),
(326, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":345.5199279785156,\"y\":-597.3519287109375,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":70}'),
(327, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":346.885498046875,\"y\":-593.5999755859375,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":70}'),
(329, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":356.12518310546877,\"y\":-583.3624877929688,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":250}'),
(332, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":357.49078369140627,\"y\":-579.6105346679688,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":250}'),
(334, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":358.7265319824219,\"y\":-593.8814086914063,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(335, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":360.5033874511719,\"y\":-588.99951171875,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(339, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":20},\"coords\":{\"x\":336.8664855957031,\"y\":-592.5787963867188,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(340, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":339.0049743652344,\"y\":-586.703369140625,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":340}'),
(341, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":303.90869140625,\"y\":-596.5780029296875,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":250}'),
(342, 'ambulance', '{\"state\":1,\"groups\":{\"ambulance\":1},\"coords\":{\"x\":298.9548034667969,\"y\":-594.7749633789063,\"z\":43.43391036987305},\"maxDistance\":2,\"model\":854291622,\"doors\":false,\"heading\":250}'),
(345, 'ambulance', '{\"state\":1,\"groups\":{\"ballas\":0},\"coords\":{\"x\":118.83623504638672,\"y\":-1970.8836669921876,\"z\":21.47758865356445},\"maxDistance\":2,\"model\":-995467546,\"doors\":false,\"heading\":111}'),
(360, 'kawiarnia', '{\"state\":1,\"groups\":{\"kawiarnia\":1},\"coords\":{\"x\":-587.3400268554688,\"y\":-1051.8994140625,\"z\":22.41300582885742},\"maxDistance\":2,\"model\":-1283712428,\"doors\":false,\"heading\":90}'),
(361, 'kawiarnia', '{\"state\":1,\"groups\":{\"kawiarnia\":1},\"coords\":{\"x\":-590.1828002929688,\"y\":-1054.14794921875,\"z\":22.41300582885742},\"maxDistance\":2,\"model\":-60871655,\"doors\":false,\"heading\":180}'),
(362, 'kawiarnia', '{\"state\":1,\"groups\":{\"kawiarnia\":1},\"coords\":{\"x\":-594.4122924804688,\"y\":-1049.7686767578126,\"z\":22.49712753295898},\"maxDistance\":2,\"model\":2089009131,\"doors\":false,\"heading\":90}'),
(363, 'kawiarnia', '{\"state\":1,\"groups\":{\"kawiarnia\":1},\"coords\":{\"x\":-592.4738159179688,\"y\":-1056.09130859375,\"z\":22.41300582885742},\"maxDistance\":2,\"model\":-60871655,\"doors\":false,\"heading\":0}'),
(364, 'kawiarnia', '{\"state\":1,\"groups\":{\"kawiarnia\":1},\"coords\":{\"x\":-600.9105834960938,\"y\":-1059.2176513671876,\"z\":21.72143173217773},\"maxDistance\":2,\"model\":522844070,\"doors\":false,\"heading\":270}'),
(365, 'kawiarnia', '{\"state\":1,\"groups\":{\"kawiarnia\":1},\"coords\":{\"x\":-591.7698974609375,\"y\":-1066.9739990234376,\"z\":22.53749465942382},\"maxDistance\":2,\"model\":-562476388,\"doors\":false,\"heading\":270}');

-- --------------------------------------------------------

--
-- Table structure for table `ox_inventory`
--

CREATE TABLE `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ox_inventory`
--

INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
('char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'playerFreeProperty-char1:fbb5ee314bb87f08a217fed346c5d30907308527', '[{\"name\":\"carkey\",\"count\":1,\"slot\":11,\"metadata\":{\"type\":\"777 KID98\"}}]', '2024-03-27 12:55:00'),
('', 'society_police_armory_2', NULL, '2024-03-28 22:06:27'),
('char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'emslocker', NULL, '2024-03-29 14:03:34'),
('', 'viceroy', NULL, '2024-03-31 12:40:14'),
('', 'mechanic', '[{\"slot\":2,\"count\":1,\"name\":\"WEAPON_SWITCHBLADE\",\"metadata\":{\"durability\":100,\"serial\":\"384844AIE239583\",\"ammo\":100,\"components\":[],\"registered\":\"jacob globuz\"}},{\"slot\":4,\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"durability\":100,\"type\":1}},{\"slot\":5,\"count\":2,\"name\":\"sponge\"},{\"slot\":6,\"count\":1,\"name\":\"toolwytrych\"},{\"slot\":7,\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"YALLA\"}},{\"slot\":9,\"count\":1,\"name\":\"carokit\"},{\"slot\":10,\"count\":20,\"name\":\"radio\"},{\"slot\":11,\"count\":20,\"name\":\"handcuffs\"}]', '2024-04-09 20:05:00'),
('', 'society_doj_dokumenty', NULL, '2024-03-31 19:09:08'),
('', 'ballas', NULL, '2024-04-01 19:44:06'),
('', 'evidence-1', '[{\"count\":1,\"metadata\":{\"components\":[],\"serial\":\"678892RVQ526705\",\"durability\":97.20000000000016,\"registered\":\"Jacob Smitch\",\"ammo\":2},\"name\":\"WEAPON_COMBATPDW\",\"slot\":1}]', '2024-04-07 20:55:00'),
('char1:47e829a50c310da7daf10fd609fa36ba2710aab1', 'playerFreeProperty-char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '[{\"slot\":1,\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":0,\"serial\":\"100528WIT640220\"}},{\"slot\":2,\"count\":50,\"name\":\"ammo-rifle\"},{\"slot\":3,\"count\":1,\"name\":\"ammo-rifle\"},{\"slot\":4,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":5,\"count\":500,\"name\":\"ammo-rifle\"},{\"slot\":6,\"count\":470,\"name\":\"ammo-9\"},{\"slot\":7,\"count\":1,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":0,\"serial\":\"307895NVD627969\"}},{\"slot\":8,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":9,\"count\":1,\"name\":\"WEAPON_CERAMICPISTOL\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":73.80000000000149,\"ammo\":9,\"serial\":\"545264GXU203696\"}},{\"slot\":10,\"count\":1,\"name\":\"WEAPON_HEAVYPISTOL\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":0,\"serial\":\"794600XGC588525\"}},{\"slot\":11,\"count\":100,\"name\":\"ammo-rifle\"},{\"slot\":12,\"count\":1,\"name\":\"WEAPON_ADVANCEDRIFLE\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":99.48999999999998,\"ammo\":83,\"serial\":\"977696ZVW585464\"}},{\"slot\":13,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":14,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":96.05000000000024,\"ammo\":21}},{\"slot\":15,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":16,\"count\":1,\"name\":\"WEAPON_VINTAGEPISTOL\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100,\"serial\":\"692465JFR258948\"}},{\"slot\":17,\"count\":76,\"name\":\"ammo-9\"},{\"slot\":18,\"count\":1,\"name\":\"WEAPON_DOUBLEACTION\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":79.80000000000115,\"ammo\":5,\"serial\":\"826512GFW563028\"}},{\"slot\":19,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":20,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":21,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":22,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":23,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":24,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":25,\"count\":94,\"name\":\"ammo-38\"},{\"slot\":26,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100}},{\"slot\":27,\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"metadata\":{\"components\":[],\"registered\":\"Jacob Smitch\",\"durability\":100,\"ammo\":100,\"serial\":\"202885RYU283467\"}},{\"slot\":29,\"count\":50,\"name\":\"ammo-rifle2\"},{\"slot\":30,\"count\":25,\"name\":\"ammo-rifle2\"},{\"slot\":31,\"count\":1,\"name\":\"WEAPON_COMPACTRIFLE\",\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"registered\":\"Jacob Smitch\",\"serial\":\"663851WIU812129\"}},{\"slot\":33,\"count\":1,\"name\":\"WEAPON_CARBINERIFLE_MK2\",\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"registered\":\"Jacob Smitch\",\"serial\":\"982035VIJ247167\"}},{\"slot\":34,\"count\":50,\"name\":\"ammo-rifle\"},{\"slot\":35,\"count\":1,\"name\":\"WEAPON_ASSAULTSMG\",\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"registered\":\"Jacob Smitch\",\"serial\":\"826452XYR947573\"}},{\"slot\":37,\"count\":875000,\"name\":\"money\"}]', '2024-04-08 14:00:00'),
('char1:f9c26edc4589062f2ca6c77463f8617f942f078a', 'playerFreeProperty-char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '[{\"slot\":1,\"count\":2036,\"name\":\"ammo-9\"},{\"slot\":2,\"count\":1,\"name\":\"armour\"},{\"slot\":5,\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"durability\":90.40000000000052,\"serial\":\"430220GDD149338\",\"components\":[],\"ammo\":30,\"registered\":\"Jack Miller\"}},{\"slot\":6,\"count\":1,\"name\":\"radio\"},{\"slot\":7,\"count\":1,\"name\":\"WEAPON_CERAMICPISTOL\",\"metadata\":{\"durability\":100,\"serial\":\"328455SGI581642\",\"registered\":\"Jack Miller\",\"ammo\":100,\"components\":[]}},{\"slot\":9,\"count\":1,\"name\":\"WEAPON_HEAVYPISTOL\",\"metadata\":{\"durability\":100,\"serial\":\"882700WLI281009\",\"registered\":\"Jacob Smitch\",\"ammo\":0,\"components\":[]}},{\"slot\":10,\"count\":1,\"name\":\"WEAPON_FLASHLIGHT\",\"metadata\":{\"durability\":100,\"components\":[]}},{\"slot\":11,\"count\":1,\"name\":\"WEAPON_APPISTOL\",\"metadata\":{\"durability\":98.2000000000001,\"serial\":\"317796XGA355928\",\"registered\":\"Jack Miller\",\"ammo\":82,\"components\":[]}},{\"slot\":13,\"count\":1,\"name\":\"WEAPON_CERAMICPISTOL\",\"metadata\":{\"durability\":17.40000000000469,\"serial\":\"655793BCJ538415\",\"ammo\":12,\"registered\":\"Fred Polonez\",\"components\":[]}},{\"slot\":14,\"count\":1,\"name\":\"WEAPON_APPISTOL\",\"metadata\":{\"durability\":52.5000000000027,\"serial\":\"110979PNT705776\",\"ammo\":18,\"registered\":\"Fred Polonez\",\"components\":[]}},{\"slot\":22,\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"2IW279OX\"}},{\"slot\":21,\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"4ET958PH\"}}]', '2024-04-10 06:10:00'),
('char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'playerFreeProperty-char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '[{\"slot\":1,\"count\":1,\"name\":\"WEAPON_REVOLVER_MK2\",\"metadata\":{\"components\":[],\"ammo\":99,\"durability\":99.9,\"registered\":\"jacob globuz\",\"serial\":\"593598MZV561015\"}},{\"slot\":2,\"count\":100,\"name\":\"ammo-rifle\"},{\"slot\":9,\"count\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"ammo\":24,\"durability\":96.20000000000022,\"registered\":\"jacob globuz\",\"serial\":\"741789VPD264706\"}},{\"slot\":5,\"count\":1,\"name\":\"WEAPON_SPECIALCARBINE_MK2\",\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"registered\":\"jacob globuz\",\"serial\":\"463603KMS322660\"}},{\"slot\":6,\"count\":100,\"name\":\"ammo-44\"}]', '2024-04-07 23:26:43'),
('', 'kawka2', NULL, '2024-04-08 06:19:57'),
('', 'kawka1', NULL, '2024-04-08 13:34:58'),
('', 'uwu_cafe', NULL, '2024-04-08 14:34:37'),
('char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', 'playerFreeProperty-char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '[{\"name\":\"WEAPON_ASSAULTSHOTGUN\",\"slot\":1,\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"serial\":\"224056QTI200005\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_PISTOL50\",\"slot\":2,\"metadata\":{\"components\":[],\"ammo\":60,\"durability\":96.00000000000024,\"serial\":\"162894PLX775412\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_APPISTOL\",\"slot\":3,\"metadata\":{\"components\":[],\"ammo\":82,\"durability\":98.2000000000001,\"serial\":\"900667NHH851565\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_VINTAGEPISTOL\",\"slot\":4,\"metadata\":{\"components\":[],\"ammo\":2,\"registered\":\"Denis Taylor\",\"serial\":\"793119FPK782179\",\"durability\":89.5000000000006},\"count\":1},{\"name\":\"WEAPON_ASSAULTRIFLE\",\"slot\":5,\"metadata\":{\"components\":[],\"ammo\":30,\"durability\":96.60999999999989,\"serial\":\"145497YEP472251\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_APPISTOL\",\"slot\":7,\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"serial\":\"737633RNQ612342\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_MICROSMG\",\"slot\":8,\"metadata\":{\"components\":[],\"ammo\":99,\"durability\":99.9,\"serial\":\"916835XHA371183\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_ASSAULTRIFLE_MK2\",\"slot\":9,\"metadata\":{\"components\":[],\"ammo\":99,\"durability\":99.97,\"serial\":\"620278BNB476566\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"WEAPON_SNSPISTOL_MK2\",\"slot\":10,\"metadata\":{\"components\":[],\"ammo\":51,\"registered\":\"Denis Taylor\",\"serial\":\"280207DPC496098\",\"durability\":95.10000000000028},\"count\":1},{\"name\":\"WEAPON_APPISTOL\",\"slot\":11,\"metadata\":{\"components\":[],\"ammo\":90,\"durability\":99.00000000000006,\"serial\":\"820117SSY506470\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"handcuffs\",\"slot\":12,\"count\":1},{\"name\":\"WEAPON_STUNGUN\",\"slot\":13,\"metadata\":{\"components\":[],\"ammo\":100,\"durability\":100,\"serial\":\"278080IWC951544\",\"registered\":\"Denis Taylor\"},\"count\":1},{\"name\":\"ammo-9\",\"slot\":18,\"count\":366},{\"name\":\"ammo-shotgun\",\"slot\":19,\"count\":100},{\"name\":\"ammo-45\",\"slot\":17,\"count\":100},{\"name\":\"ammo-rifle2\",\"slot\":20,\"count\":57}]', '2024-04-10 19:20:00'),
('char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'playerFreeProperty-char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '[{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"987535HLT459577\",\"ammo\":100,\"registered\":\"Denis Taylor\"},\"slot\":1,\"name\":\"WEAPON_STUNGUN\",\"count\":1},{\"metadata\":{\"durability\":99.60000000000002,\"components\":[],\"serial\":\"782941CGB971127\",\"ammo\":96,\"registered\":\"Zack Wiliams\"},\"slot\":2,\"name\":\"WEAPON_APPISTOL\",\"count\":1},{\"metadata\":{\"durability\":99.5,\"components\":[],\"serial\":\"170420IWE359334\",\"ammo\":99,\"registered\":\"Zack Wiliams\"},\"slot\":3,\"name\":\"WEAPON_PISTOL_MK2\",\"count\":1},{\"metadata\":{\"durability\":74.80000000000143,\"components\":[],\"serial\":\"448889ACN536884\",\"ammo\":5,\"registered\":\"Fred Polonez\"},\"slot\":4,\"name\":\"WEAPON_SNSPISTOL_MK2\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"303619XNU369295\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":7,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"743883AUQ694006\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":8,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"981189JBS295281\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":9,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"947486CGK380422\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":10,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"294708UHB275298\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":11,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"867209ZNC104387\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":12,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"478283UBP354461\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":13,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"773099QKW325354\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":14,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"616083IWW801683\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":15,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"411529BKW955333\",\"ammo\":100,\"registered\":\"Fred Polonez\"},\"slot\":16,\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1}]', '2024-04-09 16:00:00'),
('', 'evidence-15', NULL, '2024-04-08 17:43:57'),
('', 'evidence-314', '[{\"count\":1,\"slot\":1,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"ammo\":23,\"registered\":\"Fred Polonez\",\"durability\":96.15000000000022}},{\"count\":1,\"slot\":2,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"ammo\":100,\"registered\":\"Fred Polonez\",\"durability\":100}},{\"count\":1,\"slot\":3,\"name\":\"WEAPON_STICKYBOMB\",\"metadata\":{\"components\":[],\"ammo\":100,\"registered\":\"Fred Polonez\",\"durability\":100}},{\"count\":1,\"slot\":4,\"name\":\"WEAPON_VINTAGEPISTOL\",\"metadata\":{\"components\":[],\"ammo\":100,\"registered\":\"Fred Polonez\",\"durability\":100,\"serial\":\"442813GPE525823\"}},{\"count\":1,\"slot\":6,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"components\":[],\"ammo\":12,\"registered\":\"Fred Polonez\",\"durability\":100,\"serial\":\"917878VUK568079\"}},{\"count\":1,\"slot\":7,\"name\":\"WEAPON_SNSPISTOL_MK2\",\"metadata\":{\"components\":[],\"ammo\":100,\"registered\":\"Fred Polonez\",\"durability\":100,\"serial\":\"517462TOI272965\"}},{\"count\":1,\"slot\":8,\"name\":\"WEAPON_SNSPISTOL_MK2\",\"metadata\":{\"components\":[],\"ammo\":100,\"registered\":\"Fred Polonez\",\"durability\":100,\"serial\":\"272866UAM301366\"}},{\"count\":1,\"slot\":10,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"components\":[],\"ammo\":0,\"registered\":\"Fred Polonez\",\"durability\":100,\"serial\":\"963011IWE723632\"}},{\"count\":1,\"slot\":21,\"name\":\"WEAPON_VINTAGEPISTOL\",\"metadata\":{\"components\":[],\"ammo\":100,\"registered\":\"Fred Polonez\",\"durability\":100,\"serial\":\"658060THI684936\"}}]', '2024-04-09 13:15:00'),
('', 'JEG1712606117', NULL, '2024-04-08 19:55:50'),
('char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', 'playerFreeProperty-char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '[{\"count\":5055,\"name\":\"black_money\",\"slot\":1}]', '2024-04-10 16:19:50'),
('', 'evidence-209', NULL, '2024-04-09 10:38:35'),
('', 'evidence-2', NULL, '2024-04-09 11:33:33'),
('char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', 'playerFreeProperty-char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '[{\"metadata\":{\"durability\":100,\"components\":[],\"serial\":\"690246QWV968719\",\"ammo\":0,\"registered\":\"jacob globuz\"},\"slot\":1,\"name\":\"WEAPON_HEAVYPISTOL\",\"count\":1},{\"metadata\":{\"durability\":100,\"type\":1},\"slot\":2,\"name\":\"lockpick\",\"count\":1},{\"slot\":3,\"name\":\"black_money\",\"count\":6245}]', '2024-04-09 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_accounts`
--

CREATE TABLE `pefcl_accounts` (
  `id` int(11) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT 0,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int(11) DEFAULT 25000,
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pefcl_accounts`
--

INSERT INTO `pefcl_accounts` (`id`, `number`, `accountName`, `isDefault`, `ownerIdentifier`, `role`, `balance`, `type`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, '920,8123-0178-3470', 'Konto osobiste', 1, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'owner', 869650, 'personal', '2024-04-08 14:51:11', '2024-04-10 18:34:25', NULL),
(2, '920,2734-1150-2330', 'Konto osobiste', 1, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', 'owner', 100370, 'personal', '2024-04-08 14:52:15', '2024-04-10 06:48:04', NULL),
(3, '920,3104-0340-3574', 'Konto osobiste', 1, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'owner', 28775, 'personal', '2024-04-08 15:31:28', '2024-04-10 06:22:00', NULL),
(4, '920,6048-3702-1736', 'Policja', 1, 'police', 'owner', 500, 'shared', '2024-04-08 15:36:37', '2024-04-08 15:36:37', NULL),
(5, '920,1356-1407-0213', 'Kawiarnia', 1, 'kawiarnia', 'owner', 500, 'shared', '2024-04-08 15:40:32', '2024-04-08 15:40:32', NULL),
(6, '920,0381-1147-3313', 'Konto osobiste', 1, 'char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', 'owner', 9050900, 'personal', '2024-04-08 16:27:00', '2024-04-10 19:37:00', NULL),
(7, '920,2305-2473-3608', 'Konto osobiste', 1, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', 'owner', 7365, 'personal', '2024-04-08 16:28:48', '2024-04-09 18:21:26', NULL),
(8, '920,0382-2772-3140', 'Konto osobiste', 1, 'char1:636f6db328aeabc289967ff088473d12badf4d5f', 'owner', 5000, 'personal', '2024-04-08 16:35:09', '2024-04-08 18:09:55', NULL),
(9, '920,1312-0880-1338', 'Konto osobiste', 1, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'owner', -2000, 'personal', '2024-04-08 16:43:27', '2024-04-08 20:20:19', NULL),
(10, '920,0528-1837-2381', 'Konto osobiste', 1, 'char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', 'owner', 55000, 'personal', '2024-04-08 17:14:44', '2024-04-08 17:16:53', NULL),
(11, '920,0500-3730-3641', 'Konto osobiste', 1, 'char1:464736841e79f93c754f65f47d219b81e7b0d50a', 'owner', 55000, 'personal', '2024-04-08 17:38:06', '2024-04-08 17:42:19', NULL),
(12, '920,0631-2738-3133', 'Konto osobiste', 1, 'char2:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'owner', 55000, 'personal', '2024-04-08 18:42:45', '2024-04-08 18:43:01', NULL),
(13, '920,4715-3517-2878', 'Konto osobiste', 1, 'char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', 'owner', 1000225, 'personal', '2024-04-08 19:28:20', '2024-04-10 19:27:39', NULL),
(14, '920,6758-0765-3010', 'Konto osobiste', 1, 'char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', 'owner', 55750, 'personal', '2024-04-08 19:51:32', '2024-04-08 20:06:09', NULL),
(15, '920,4473-2348-2376', 'doj', 1, 'doj', 'owner', 500, 'shared', '2024-04-09 15:50:11', '2024-04-09 15:50:11', NULL),
(16, '920,7125-2481-0804', 'Konto osobiste', 1, 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', 'owner', 60200, 'personal', '2024-04-09 18:45:58', '2024-04-10 13:20:01', NULL),
(17, '920,0663-3802-0450', 'Konto osobiste', 1, 'char1:88a205821572f32cdd64378ddb0ad372b5dc110d', 'owner', 2500, 'personal', '2024-04-10 17:09:51', '2024-04-10 17:47:10', NULL),
(18, '920,5302-3400-3854', 'Konto osobiste', 1, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', 'owner', 55000, 'personal', '2024-04-10 17:19:23', '2024-04-10 17:19:25', NULL),
(19, '920,2888-1541-1157', 'Konto osobiste', 1, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', 'owner', 55000, 'personal', '2024-04-10 18:49:18', '2024-04-10 19:03:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_cash`
--

CREATE TABLE `pefcl_cash` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT 2000,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_external_accounts`
--

CREATE TABLE `pefcl_external_accounts` (
  `id` int(11) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_invoices`
--

CREATE TABLE `pefcl_invoices` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_shared_accounts`
--

CREATE TABLE `pefcl_shared_accounts` (
  `id` int(11) NOT NULL,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pefcl_shared_accounts`
--

INSERT INTO `pefcl_shared_accounts` (`id`, `userIdentifier`, `name`, `role`, `createdAt`, `updatedAt`, `deletedAt`, `accountId`) VALUES
(1, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'Max Moonroe', 'admin', '2024-04-08 15:36:37', '2024-04-08 15:36:37', NULL, 4),
(10, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'jacob globuz', 'admin', '2024-04-09 15:51:13', '2024-04-09 15:51:13', NULL, 15),
(16, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', 'Zack Wiliams', 'admin', '2024-04-09 17:54:15', '2024-04-09 17:54:15', NULL, 4),
(17, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'Fred Polonez', 'admin', '2024-04-09 18:52:16', '2024-04-09 18:52:16', NULL, 4),
(18, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'jacob globuz', 'admin', '2024-04-09 20:37:04', '2024-04-09 20:37:04', NULL, 4),
(19, 'char1:774a6569fa5c22f519262d90560dfad85fc99c4f', 'Caroline Globuz', 'admin', '2024-04-10 15:35:37', '2024-04-10 15:35:37', NULL, 4),
(20, 'char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', 'Pedal Cwel', 'admin', '2024-04-10 17:45:28', '2024-04-10 17:45:28', NULL, 4),
(23, 'char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', 'James Naft', 'admin', '2024-04-10 19:12:31', '2024-04-10 19:12:31', NULL, 15);

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_transactions`
--

CREATE TABLE `pefcl_transactions` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int(11) DEFAULT NULL,
  `fromAccountId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pefcl_transactions`
--

INSERT INTO `pefcl_transactions` (`id`, `message`, `amount`, `type`, `createdAt`, `updatedAt`, `toAccountId`, `fromAccountId`) VALUES
(1, 'Wpłacono 60 000 USD na konto. #1', 60000, 'Incoming', '2024-04-08 14:52:45', '2024-04-08 14:52:45', 2, NULL),
(2, 'Welfare Check #2', 200, 'Incoming', '2024-04-08 14:57:06', '2024-04-08 14:57:06', 1, NULL),
(3, 'Paycheck #3', 185, 'Incoming', '2024-04-08 15:07:46', '2024-04-08 15:07:46', 2, NULL),
(4, 'Welfare Check #4', 200, 'Incoming', '2024-04-08 15:29:33', '2024-04-08 15:29:33', 1, NULL),
(5, 'unknown #5', 5000, 'Outgoing', '2024-04-08 15:33:01', '2024-04-08 15:33:01', NULL, 1),
(6, 'Wypłacono 10 000 USD z konta #6', 10000, 'Outgoing', '2024-04-08 15:33:19', '2024-04-08 15:33:19', NULL, 2),
(7, 'unknown #7', 5000, 'Outgoing', '2024-04-08 15:38:20', '2024-04-08 15:38:20', NULL, 1),
(8, 'unknown #8', 5000, 'Outgoing', '2024-04-08 15:46:18', '2024-04-08 15:46:18', NULL, 1),
(9, 'unknown #9', 50000, 'Outgoing', '2024-04-08 15:54:11', '2024-04-08 15:54:11', NULL, 1),
(10, 'Withdrew 7500 from an ATM. #10', 7500, 'Outgoing', '2024-04-08 15:54:56', '2024-04-08 15:54:56', NULL, 2),
(11, 'Withdrew 7500 from an ATM. #11', 7500, 'Outgoing', '2024-04-08 15:54:57', '2024-04-08 15:54:57', NULL, 2),
(12, 'Withdrew 7500 from an ATM. #12', 7500, 'Outgoing', '2024-04-08 15:54:57', '2024-04-08 15:54:57', NULL, 2),
(13, 'Withdrew 7500 from an ATM. #13', 7500, 'Outgoing', '2024-04-08 15:54:58', '2024-04-08 15:54:58', NULL, 2),
(14, 'Withdrew 7500 from an ATM. #14', 7500, 'Outgoing', '2024-04-08 15:54:58', '2024-04-08 15:54:58', NULL, 2),
(15, 'Withdrew 7500 from an ATM. #15', 7500, 'Outgoing', '2024-04-08 15:54:59', '2024-04-08 15:54:59', NULL, 2),
(16, 'Withdrew 7500 from an ATM. #16', 7500, 'Outgoing', '2024-04-08 15:54:59', '2024-04-08 15:54:59', NULL, 2),
(17, 'Withdrew 7500 from an ATM. #17', 7500, 'Outgoing', '2024-04-08 15:54:59', '2024-04-08 15:54:59', NULL, 2),
(18, 'Wpłacono 50 000 USD na konto. #18', 50000, 'Incoming', '2024-04-08 15:56:15', '2024-04-08 15:56:15', 2, NULL),
(19, 'unknown #19', 50000, 'Outgoing', '2024-04-08 15:57:09', '2024-04-08 15:57:09', NULL, 2),
(20, 'Wpłacono 10 000 USD na konto. #20', 10000, 'Incoming', '2024-04-08 16:14:19', '2024-04-08 16:14:19', 2, NULL),
(21, 'unknown #21', 50000, 'Outgoing', '2024-04-08 16:14:55', '2024-04-08 16:14:55', NULL, 2),
(22, 'unknown #22', 5000, 'Incoming', '2024-04-08 16:29:37', '2024-04-08 16:29:37', 6, NULL),
(23, 'unknown #23', 5000, 'Incoming', '2024-04-08 16:32:25', '2024-04-08 16:32:25', 7, NULL),
(24, 'unknown #24', 5000, 'Incoming', '2024-04-08 16:35:48', '2024-04-08 16:35:48', 8, NULL),
(25, 'unknown #25', 5000, 'Incoming', '2024-04-08 16:43:45', '2024-04-08 16:43:45', 9, NULL),
(26, 'unknown #26', 5000, 'Incoming', '2024-04-08 17:16:53', '2024-04-08 17:16:53', 10, NULL),
(27, 'Withdrew 1000 from an ATM. #27', 1000, 'Outgoing', '2024-04-08 17:23:44', '2024-04-08 17:23:44', NULL, 7),
(28, 'Withdrew 1000 from an ATM. #28', 1000, 'Outgoing', '2024-04-08 17:23:45', '2024-04-08 17:23:45', NULL, 7),
(29, 'Withdrew 1000 from an ATM. #29', 1000, 'Outgoing', '2024-04-08 17:23:45', '2024-04-08 17:23:45', NULL, 7),
(30, 'Withdrew 1000 from an ATM. #30', 1000, 'Outgoing', '2024-04-08 17:23:45', '2024-04-08 17:23:45', NULL, 7),
(31, 'Withdrew 1000 from an ATM. #31', 1000, 'Outgoing', '2024-04-08 17:23:46', '2024-04-08 17:23:46', NULL, 7),
(32, 'unknown #32', 5000, 'Incoming', '2024-04-08 17:42:19', '2024-04-08 17:42:19', 11, NULL),
(33, 'Withdrew 500 from an ATM. #33', 500, 'Outgoing', '2024-04-08 17:55:17', '2024-04-08 17:55:17', NULL, 6),
(34, 'Withdrew 500 from an ATM. #34', 500, 'Outgoing', '2024-04-08 17:55:18', '2024-04-08 17:55:18', NULL, 6),
(35, 'Wypłacono 50 000 USD z konta #35', 50000, 'Outgoing', '2024-04-08 18:09:55', '2024-04-08 18:09:55', NULL, 8),
(36, 'unknown #36', 26000, 'Incoming', '2024-04-08 18:28:33', '2024-04-08 18:28:33', 7, NULL),
(37, 'unknown #37', 130000, 'Outgoing', '2024-04-08 18:28:33', '2024-04-08 18:28:33', NULL, 3),
(38, 'unknown #38', 5000, 'Incoming', '2024-04-08 18:43:01', '2024-04-08 18:43:01', 12, NULL),
(39, 'unknown #39', 50000, 'Outgoing', '2024-04-08 19:14:06', '2024-04-08 19:14:06', NULL, 9),
(40, 'Withdrew 7500 from an ATM. #40', 7500, 'Outgoing', '2024-04-08 19:19:19', '2024-04-08 19:19:19', NULL, 7),
(41, 'Withdrew 7500 from an ATM. #41', 7500, 'Outgoing', '2024-04-08 19:19:19', '2024-04-08 19:19:19', NULL, 7),
(42, 'Withdrew 7500 from an ATM. #42', 7500, 'Outgoing', '2024-04-08 19:19:20', '2024-04-08 19:19:20', NULL, 7),
(43, 'Withdrew 7500 from an ATM. #43', 7500, 'Outgoing', '2024-04-08 19:19:20', '2024-04-08 19:19:20', NULL, 7),
(44, 'Withdrew 7500 from an ATM. #44', 7500, 'Outgoing', '2024-04-08 19:19:20', '2024-04-08 19:19:20', NULL, 7),
(45, 'Withdrew 7500 from an ATM. #45', 7500, 'Outgoing', '2024-04-08 19:19:21', '2024-04-08 19:19:21', NULL, 7),
(46, 'Withdrew 7500 from an ATM. #46', 7500, 'Outgoing', '2024-04-08 19:19:21', '2024-04-08 19:19:21', NULL, 7),
(47, 'Withdrew 7500 from an ATM. #47', 7500, 'Outgoing', '2024-04-08 19:19:21', '2024-04-08 19:19:21', NULL, 7),
(48, 'Withdrew 7500 from an ATM. #48', 7500, 'Outgoing', '2024-04-08 19:19:22', '2024-04-08 19:19:22', NULL, 7),
(49, 'Wpłacono 5000 USD na konto. #49', 5000, 'Incoming', '2024-04-08 19:21:16', '2024-04-08 19:21:16', 7, NULL),
(50, 'Wpłacono 50 000 USD na konto. #50', 50000, 'Incoming', '2024-04-08 19:21:28', '2024-04-08 19:21:28', 7, NULL),
(51, 'unknown #51', 50000, 'Outgoing', '2024-04-08 19:21:51', '2024-04-08 19:21:51', NULL, 7),
(52, 'Paycheck #52', 365, 'Incoming', '2024-04-08 19:53:16', '2024-04-08 19:53:16', 7, NULL),
(53, 'unknown #53', 5000, 'Incoming', '2024-04-08 19:57:14', '2024-04-08 19:57:14', 13, NULL),
(54, 'unknown #54', 5000, 'Incoming', '2024-04-08 19:59:04', '2024-04-08 19:59:04', 14, NULL),
(55, 'Wpłacono 1000 USD na konto. #55', 1000, 'Incoming', '2024-04-08 20:00:49', '2024-04-08 20:00:49', 14, NULL),
(56, 'unknown #56', 2400, 'Incoming', '2024-04-08 20:01:19', '2024-04-08 20:01:19', 3, NULL),
(57, 'unknown #57', 12000, 'Outgoing', '2024-04-08 20:01:19', '2024-04-08 20:01:19', NULL, 9),
(58, 'unknown #58', 250, 'Outgoing', '2024-04-08 20:06:10', '2024-04-08 20:06:10', NULL, 14),
(59, 'unknown #59', 5000, 'Incoming', '2024-04-08 20:20:19', '2024-04-08 20:20:19', 9, NULL),
(60, 'unknown #60', 25000, 'Outgoing', '2024-04-08 20:20:19', '2024-04-08 20:20:19', NULL, 2),
(61, 'Government Grant #61', 30000, 'Incoming', '2024-04-08 20:22:34', '2024-04-08 20:22:34', 2, NULL),
(62, 'Wpłacono 100 000 USD na konto. #62', 100000, 'Incoming', '2024-04-08 20:23:47', '2024-04-08 20:23:47', 2, NULL),
(63, 'unknown #63', 50000, 'Outgoing', '2024-04-09 10:20:52', '2024-04-09 10:20:52', NULL, 13),
(64, 'Withdrew 500 from an ATM. #64', 500, 'Outgoing', '2024-04-09 12:20:47', '2024-04-09 12:20:47', NULL, 6),
(65, 'unknown #65', 250, 'Outgoing', '2024-04-09 12:35:46', '2024-04-09 12:35:46', NULL, 6),
(66, 'unknown #66', 250, 'Outgoing', '2024-04-09 13:21:27', '2024-04-09 13:21:27', NULL, 6),
(67, 'Paycheck #67', 365, 'Incoming', '2024-04-09 14:18:59', '2024-04-09 14:18:59', 3, NULL),
(68, 'unknown #68', 98600, 'Incoming', '2024-04-09 14:56:19', '2024-04-09 14:56:19', 3, NULL),
(69, 'unknown #69', 493000, 'Outgoing', '2024-04-09 14:56:19', '2024-04-09 14:56:19', NULL, 7),
(70, 'Wpłacono 500 000 USD na konto. #70', 500000, 'Incoming', '2024-04-09 14:57:44', '2024-04-09 14:57:44', 7, NULL),
(71, 'Withdrew 1500 from an ATM. #71', 1500, 'Outgoing', '2024-04-09 18:21:20', '2024-04-09 18:21:20', NULL, 7),
(72, 'Withdrew 1500 from an ATM. #72', 1500, 'Outgoing', '2024-04-09 18:21:21', '2024-04-09 18:21:21', NULL, 7),
(73, 'Withdrew 1500 from an ATM. #73', 1500, 'Outgoing', '2024-04-09 18:21:21', '2024-04-09 18:21:21', NULL, 7),
(74, 'Withdrew 1500 from an ATM. #74', 1500, 'Outgoing', '2024-04-09 18:21:22', '2024-04-09 18:21:22', NULL, 7),
(75, 'Withdrew 1500 from an ATM. #75', 1500, 'Outgoing', '2024-04-09 18:21:22', '2024-04-09 18:21:22', NULL, 7),
(76, 'Withdrew 1500 from an ATM. #76', 1500, 'Outgoing', '2024-04-09 18:21:23', '2024-04-09 18:21:23', NULL, 7),
(77, 'Withdrew 1500 from an ATM. #77', 1500, 'Outgoing', '2024-04-09 18:21:23', '2024-04-09 18:21:23', NULL, 7),
(78, 'Withdrew 1500 from an ATM. #78', 1500, 'Outgoing', '2024-04-09 18:21:23', '2024-04-09 18:21:23', NULL, 7),
(79, 'Withdrew 1500 from an ATM. #79', 1500, 'Outgoing', '2024-04-09 18:21:26', '2024-04-09 18:21:26', NULL, 7),
(80, 'Withdrew 500 from an ATM. #80', 500, 'Outgoing', '2024-04-09 18:28:41', '2024-04-09 18:28:41', NULL, 6),
(81, 'unknown #81', 5000, 'Incoming', '2024-04-09 18:46:09', '2024-04-09 18:46:09', 16, NULL),
(82, 'Welfare Check #82', 200, 'Incoming', '2024-04-09 18:51:17', '2024-04-09 18:51:17', 16, NULL),
(83, 'Paycheck #83', 560, 'Incoming', '2024-04-09 19:21:26', '2024-04-09 19:21:26', 3, NULL),
(84, 'Paycheck #84', 225, 'Incoming', '2024-04-09 19:36:58', '2024-04-09 19:36:58', 13, NULL),
(85, 'Paycheck #85', 560, 'Incoming', '2024-04-09 19:46:17', '2024-04-09 19:46:17', 3, NULL),
(86, 'unknown #86', 250, 'Outgoing', '2024-04-09 20:01:10', '2024-04-09 20:01:10', NULL, 6),
(87, 'Wypłacono 250 USD z konta #87', 250, 'Outgoing', '2024-04-10 05:10:47', '2024-04-10 05:10:47', NULL, 6),
(88, 'Paycheck #88', 560, 'Incoming', '2024-04-10 06:22:00', '2024-04-10 06:22:00', 3, NULL),
(89, 'Wypłacono 200 USD z konta #89', 200, 'Outgoing', '2024-04-10 06:44:01', '2024-04-10 06:44:01', NULL, 2),
(90, 'Wypłacono 10 000 USD z konta #90', 10000, 'Outgoing', '2024-04-10 06:48:04', '2024-04-10 06:48:04', NULL, 2),
(91, 'unknown #91', 5000, 'Incoming', '2024-04-10 13:20:01', '2024-04-10 13:20:01', 16, NULL),
(92, 'Wypłacono 100 USD z konta #92', 100, 'Outgoing', '2024-04-10 13:31:07', '2024-04-10 13:31:07', NULL, 6),
(93, 'Wypłacono 1000 USD z konta #93', 1000, 'Outgoing', '2024-04-10 13:40:01', '2024-04-10 13:40:01', NULL, 6),
(94, 'unknown #94', 5000, 'Incoming', '2024-04-10 17:10:03', '2024-04-10 17:10:03', 17, NULL),
(95, 'unknown #95', 5000, 'Incoming', '2024-04-10 17:19:26', '2024-04-10 17:19:26', 18, NULL),
(96, 'Withdrew 7500 from an ATM. #96', 7500, 'Outgoing', '2024-04-10 17:47:07', '2024-04-10 17:47:07', NULL, 17),
(97, 'Withdrew 7500 from an ATM. #97', 7500, 'Outgoing', '2024-04-10 17:47:08', '2024-04-10 17:47:08', NULL, 17),
(98, 'Withdrew 7500 from an ATM. #98', 7500, 'Outgoing', '2024-04-10 17:47:08', '2024-04-10 17:47:08', NULL, 17),
(99, 'Withdrew 7500 from an ATM. #99', 7500, 'Outgoing', '2024-04-10 17:47:09', '2024-04-10 17:47:09', NULL, 17),
(100, 'Withdrew 7500 from an ATM. #100', 7500, 'Outgoing', '2024-04-10 17:47:09', '2024-04-10 17:47:09', NULL, 17),
(101, 'Withdrew 7500 from an ATM. #101', 7500, 'Outgoing', '2024-04-10 17:47:10', '2024-04-10 17:47:10', NULL, 17),
(102, 'Withdrew 7500 from an ATM. #102', 7500, 'Outgoing', '2024-04-10 17:47:10', '2024-04-10 17:47:10', NULL, 17),
(103, 'Paycheck #103', 225, 'Incoming', '2024-04-10 18:34:25', '2024-04-10 18:34:25', 1, NULL),
(104, 'unknown #104', 5000, 'Incoming', '2024-04-10 19:03:50', '2024-04-10 19:03:50', 19, NULL),
(105, 'Withdrew 5000 from an ATM. #105', 5000, 'Outgoing', '2024-04-10 19:13:16', '2024-04-10 19:13:16', NULL, 13),
(106, 'Wpłacono 1 000 000 USD na konto. #106', 1000000, 'Incoming', '2024-04-10 19:27:39', '2024-04-10 19:27:39', 13, NULL),
(107, 'Wpłacono 9 000 000 USD na konto. #107', 9000000, 'Incoming', '2024-04-10 19:37:00', '2024-04-10 19:37:00', 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `phone_calls`
--

INSERT INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
(124, '3400094', '911', 1, '2024-04-09 14:16:00', 0),
(125, '3400094', '69500877', 1, '2024-04-09 14:18:07', 0),
(126, '3400094', '69500877', 1, '2024-04-09 14:19:56', 0),
(127, '6950087', '3400094', 1, '2024-04-09 14:19:58', 1),
(128, '3400094', '6950087', 0, '2024-04-09 14:19:58', 1),
(129, '3400094', '6950087', 0, '2024-04-09 14:19:59', 1),
(130, '6950087', '3400094', 1, '2024-04-09 14:19:59', 1),
(131, '3400094', '6950087', 1, '2024-04-09 14:53:49', 0),
(132, '6950087', '3400094', 0, '2024-04-09 14:53:49', 0),
(133, '3400094', '6950087', 1, '2024-04-09 15:05:50', 0),
(134, '6950087', '3400094', 0, '2024-04-09 15:05:50', 0),
(135, '3400094', '6950087', 1, '2024-04-09 15:06:15', 0),
(136, '6950087', '3400094', 0, '2024-04-09 15:06:15', 0),
(137, '6950087', '3400094', 0, '2024-04-09 15:45:57', 0),
(138, '3400094', '6950087', 1, '2024-04-09 15:45:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `phone_messages`
--

INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
(111, '7150022', '7150022', 'wiadomosc', '2023-11-16 18:59:29', 1, 1),
(110, '7150022', '7150022', 'wiadomosc', '2023-11-16 18:59:29', 1, 0),
(112, '3400094', '6950087', 'czesć', '2024-04-09 16:09:36', 0, 0),
(113, '6950087', '3400094', 'czesć', '2024-04-09 16:09:36', 1, 1),
(114, '3400094', '6950087', 'cześć jak tam ci myja dzień', '2024-04-09 16:09:51', 0, 0),
(115, '6950087', '3400094', 'cześć jak tam ci myja dzień', '2024-04-09 16:09:51', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `phone_users_contacts`
--

INSERT INTO `phone_users_contacts` (`id`, `identifier`, `number`, `display`) VALUES
(7, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '3400094', 'zack'),
(8, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '6950087', 'Nowy kontakt'),
(9, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '6950087', 'Nowy kontakt'),
(10, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '6950087', 'Globuz');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `qf_mdt_annoucements`
--

CREATE TABLE `qf_mdt_annoucements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `annid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qf_mdt_citizen_notes`
--

CREATE TABLE `qf_mdt_citizen_notes` (
  `identifier` varchar(46) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reason` text DEFAULT NULL,
  `officer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qf_mdt_citizen_notes`
--

INSERT INTO `qf_mdt_citizen_notes` (`identifier`, `date`, `reason`, `officer`) VALUES
('char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '0000-00-00 00:00:00', 's', '[101] jacob globuz');

-- --------------------------------------------------------

--
-- Table structure for table `qf_mdt_fines`
--

CREATE TABLE `qf_mdt_fines` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `fine` decimal(10,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `officer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qf_mdt_fines`
--

INSERT INTO `qf_mdt_fines` (`id`, `identifier`, `reason`, `fine`, `date`, `officer`) VALUES
(1, 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', 'Przekroczenie prędkości', 12000.00, '0000-00-00 00:00:00', '[Brak] Willy Hills '),
(2, 'char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', 'Przekroczenie prędkości', 12000.00, '0000-00-00 00:00:00', '[101] jacob globuz '),
(3, 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', 'Przekroczenie prędkości | Jazda bez prawa jazdy', 25000.00, '0000-00-00 00:00:00', '[102] Fred Polonez ');

-- --------------------------------------------------------

--
-- Table structure for table `qf_mdt_jails`
--

CREATE TABLE `qf_mdt_jails` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `fine` decimal(10,2) DEFAULT NULL,
  `jail` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `officer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qf_mdt_jails`
--

INSERT INTO `qf_mdt_jails` (`id`, `identifier`, `reason`, `fine`, `jail`, `date`, `officer`) VALUES
(1, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'Przekroczenie prędkości | Jazda bez prawa jazdy | Napad na Kasetkę', 50000.00, 15, '0000-00-00 00:00:00', '[101] Max Moonroe '),
(2, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'Napad na Kasetkę 3x', 75000.00, 45, '0000-00-00 00:00:00', '[101] Max Moonroe '),
(3, 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', 'Jazda niepoprawnym pasem ruchu | Napad na Ammu-Nation', 102000.00, 25, '0000-00-00 00:00:00', '[69] Max Moonroe '),
(4, 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', 'Włamanie na teren prywatny | Usiłowanie zabójstwa funkcjonariusza', 130000.00, 35, '0000-00-00 00:00:00', '[101] Zack Wiliams '),
(5, 'char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', 'Jazda bez prawa jazdy | Niewłaściwe parkowanie | Jazda pojazdem niezdatnym do ruchu | Przejazd na czerownym świetle | Spowodowanie wypadku | Jazda niepoprawnym pasem ruchu | Fałszywe wezwanie pomocy | Przekroczenie prędkości | Napad na Kasetkę | Napad na Sejf | Napad na Ammu-Nation | Napad na Yacht | Napad na Jubilera', 493000.00, 125, '0000-00-00 00:00:00', '[101] jacob globuz ');

-- --------------------------------------------------------

--
-- Table structure for table `qf_mdt_notes`
--

CREATE TABLE `qf_mdt_notes` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `annid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qf_mdt_notes`
--

INSERT INTO `qf_mdt_notes` (`id`, `identifier`, `title`, `content`, `time`, `annid`) VALUES
(3, 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', 'siema', 'sdaf', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qf_mdt_vehicle_notes`
--

CREATE TABLE `qf_mdt_vehicle_notes` (
  `plate` varchar(12) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` varchar(255) DEFAULT NULL,
  `officer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qf_mdt_vehicle_notes`
--

INSERT INTO `qf_mdt_vehicle_notes` (`plate`, `date`, `note`, `officer`) VALUES
('9SQ721MX', '0000-00-00 00:00:00', 'cos tam zrobil', '[231] Max Moonroe');

-- --------------------------------------------------------

--
-- Table structure for table `queue_points`
--

CREATE TABLE `queue_points` (
  `identifier` varchar(46) NOT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue_points`
--

INSERT INTO `queue_points` (`identifier`, `points`) VALUES
('xxxxxxxxxxxxxxx', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shinyx_gangs_upgrades`
--

CREATE TABLE `shinyx_gangs_upgrades` (
  `orgname` varchar(50) DEFAULT NULL,
  `has1` int(11) DEFAULT NULL,
  `has2` int(11) DEFAULT NULL,
  `has3` int(11) DEFAULT NULL,
  `car1` varchar(50) DEFAULT NULL,
  `car2` varchar(50) DEFAULT NULL,
  `car3` varchar(50) DEFAULT NULL,
  `car4` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shinyx_gangs_upgrades`
--

INSERT INTO `shinyx_gangs_upgrades` (`orgname`, `has1`, `has2`, `has3`, `car1`, `car2`, `car3`, `car4`) VALUES
('org1', 1, 1, 1, 'asbo', '', '', 'raiden'),
('org2', 0, 0, 0, NULL, NULL, NULL, NULL),
('org3', 0, 0, 0, NULL, NULL, NULL, NULL),
('org1', 1, 1, 1, 'asbo', '', '', 'raiden'),
('org2', 0, 0, 0, NULL, NULL, NULL, NULL),
('org3', 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `society_moneywash`
--

INSERT INTO `society_moneywash` (`id`, `identifier`, `society`, `amount`) VALUES
(1, 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', 'mechanic', 2038);

-- --------------------------------------------------------

--
-- Table structure for table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `password` varchar(64) NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_likes`
--

CREATE TABLE `twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `twitter_tweets`
--

CREATE TABLE `twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `health` int(11) DEFAULT NULL,
  `badge` varchar(999) DEFAULT '',
  `armour` int(11) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) DEFAULT 0,
  `jail` int(11) NOT NULL DEFAULT 0,
  `dutyTime` int(11) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `tattoos` varchar(255) DEFAULT NULL,
  `org` varchar(20) NOT NULL DEFAULT 'unemployed',
  `org_permissions` varchar(255) NOT NULL DEFAULT '{}',
  `statistics` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `health`, `badge`, `armour`, `disabled`, `jail`, `dutyTime`, `job_id`, `tattoos`, `org`, `org_permissions`, `statistics`) VALUES
('char1:0219df07b62cf4e1a9ccf96d5cbc25d05ac123bb', '{\"money\":5841,\"bank\":1000225,\"black_money\":0}', 'user', '[{\"count\":1,\"name\":\"phone\",\"slot\":1},{\"count\":1,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"ammo\":6,\"serial\":\"711468ASN828095\",\"registered\":\"Kylian Lee\",\"components\":[],\"durability\":80.4000000000011},\"slot\":2},{\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"metadata\":{\"registered\":\"Kylian Lee\",\"serial\":\"772825POL509586\",\"components\":[],\"durability\":100},\"slot\":3},{\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"ammo\":30,\"serial\":\"621200LGQ648921\",\"registered\":\"Kylian Lee\",\"components\":[],\"durability\":93.1000000000004},\"slot\":4},{\"count\":1,\"name\":\"WEAPON_ASSAULTSHOTGUN\",\"metadata\":{\"ammo\":8,\"serial\":\"662246XKZ938698\",\"registered\":\"Kylian Lee\",\"components\":[],\"durability\":99.9},\"slot\":5},{\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"type\":1,\"durability\":100},\"slot\":30},{\"count\":3,\"name\":\"water\",\"slot\":17},{\"count\":1,\"name\":\"WEAPON_NIGHTSTICK\",\"metadata\":{\"components\":[],\"durability\":99.9},\"slot\":18},{\"count\":90,\"name\":\"ammo-shotgun\",\"slot\":23},{\"count\":5841,\"name\":\"money\",\"slot\":24},{\"count\":1,\"name\":\"gps\",\"slot\":10},{\"count\":149,\"name\":\"ammo-9\",\"slot\":11},{\"count\":1,\"name\":\"handcuffs\",\"slot\":12},{\"count\":1,\"name\":\"bandage\",\"slot\":29}]', 'police', 1, '[]', NULL, '{\"z\":35.4974365234375,\"y\":-245.39340209960938,\"x\":-498.4483642578125,\"heading\":337.3228454589844}', 'Kylian', 'Lee', '08/01/2000', 'm', 193, '{\"sun_2\":0,\"jaw_1\":0,\"hair_color_1\":62,\"chimp_4\":10,\"decals_1\":0,\"moles_2\":0,\"decals_2\":0,\"lip_thickness\":0,\"bproof_1\":0,\"beard_2\":10,\"ears_2\":0,\"complexion_2\":0,\"sex\":0,\"jaw_2\":0,\"eyebrows_2\":10,\"lipstick_4\":0,\"bags_2\":0,\"blemishes_2\":0,\"watches_1\":-1,\"bodyb_4\":0,\"lips\":10,\"mask_2\":0,\"nose_4\":7,\"lipstick_1\":0,\"eyebrows_6\":0,\"chin_1\":0,\"mask_1\":0,\"chimp_1\":10,\"blemishes_1\":0,\"cheeks_2\":0,\"makeup_3\":0,\"bracelets_2\":0,\"blend\":0,\"hair_3\":0,\"hair_color_2\":0,\"blend_skin\":2,\"chain_2\":0,\"blush_2\":0,\"nose_6\":6,\"helmet_1\":-1,\"face_3\":0,\"chest_1\":0,\"helmet_2\":0,\"sun_1\":0,\"chest_3\":0,\"hair_1\":79,\"nose_5\":6,\"moles_1\":0,\"makeup_4\":0,\"torso_1\":569,\"chin_4\":0,\"neck\":10,\"chest_2\":0,\"chin_13\":0,\"nose_1\":0,\"mom\":21,\"arms_2\":0,\"chimp_3\":10,\"pants_2\":0,\"nose_2\":7,\"blush_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"eyebrow_1\":10,\"chimp_2\":10,\"watches_2\":0,\"eye_squint\":0,\"cheeks_3\":0,\"neck_thickness\":0,\"hair_2\":0,\"pants_1\":259,\"face\":2,\"eye_color\":8,\"age_2\":0,\"bags_1\":230,\"eyebrows_5\":0,\"blush_3\":0,\"bodyb_3\":-1,\"lipstick_3\":0,\"makeup_1\":0,\"glasses_2\":0,\"beard_4\":0,\"chain_1\":291,\"arms\":1,\"tshirt_2\":0,\"shoes_1\":273,\"blend_face\":0,\"skin_3\":0,\"skin_md_weight\":50,\"glasses_1\":70,\"eyebrows_3\":1,\"torso_2\":0,\"eyebrow_2\":10,\"eyebrows_1\":2,\"chin_2\":0,\"nose_3\":7,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_1\":-1,\"skin_2\":0,\"bodyb_1\":-1,\"face_2\":0,\"eyebrows_4\":0,\"beard_3\":0,\"complexion_1\":0,\"skin\":14,\"ears_1\":41,\"dad\":0,\"beard_1\":20,\"tshirt_1\":15,\"age_1\":0,\"bodyb_2\":0,\"face_md_weight\":50,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":49.76,\"val\":497600},{\"name\":\"thirst\",\"percent\":49.82,\"val\":498200}]', 0, 23, NULL, '2024-04-08 19:49:47', '2024-04-10 19:34:55', '7160088', NULL, NULL, '209', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":34.69999999999997,\"strenght\":0.0,\"driving\":38.8,\"shooting\":5.1}'),
('char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', '{\"bank\":56880,\"black_money\":0,\"money\":18200}', 'admin', '[{\"name\":\"WEAPON_PISTOL\",\"slot\":1,\"metadata\":{\"registered\":\"Sernikov BasePack\",\"ammo\":0,\"components\":[],\"serial\":\"314889NZM257708\",\"durability\":100},\"count\":1},{\"name\":\"water\",\"slot\":2,\"count\":2},{\"name\":\"phone\",\"slot\":3,\"count\":1},{\"name\":\"money\",\"slot\":4,\"count\":18200},{\"name\":\"carkey\",\"slot\":5,\"metadata\":{\"type\":\"ADMINCAR\"},\"count\":1},{\"name\":\"bread\",\"slot\":11,\"count\":1},{\"name\":\"ammo-9\",\"slot\":12,\"count\":100}]', 'mechanic', 5, '[]', NULL, '{\"y\":-1319.6307373046876,\"z\":30.93115234375,\"heading\":130.39370727539063,\"x\":-204.42198181152345}', 'Sernikov', 'BasePack', '12/04/1997', 'm', 189, '{\"blush_1\":0,\"tshirt_2\":1,\"ears_2\":0,\"chin_13\":0,\"blend\":0,\"moles_1\":0,\"makeup_2\":0,\"lipstick_4\":0,\"tshirt_1\":0,\"face_md_weight\":50,\"bracelets_2\":0,\"chain_2\":0,\"chin_2\":0,\"eye_squint\":0,\"bodyb_3\":-1,\"complexion_2\":0,\"makeup_3\":0,\"decals_2\":0,\"complexion_1\":0,\"dad\":0,\"beard_3\":0,\"watches_2\":0,\"skin_md_weight\":50,\"sex\":0,\"chest_2\":0,\"beard_2\":0,\"chin_1\":0,\"nose_3\":0,\"hair_color_2\":0,\"watches_1\":-1,\"eyebrows_1\":0,\"pants_2\":0,\"nose_6\":0,\"bodyb_4\":0,\"eyebrows_2\":0,\"skin_3\":0,\"lipstick_3\":0,\"chimp_2\":10,\"bproof_1\":0,\"helmet_2\":0,\"sun_2\":0,\"torso_1\":7,\"mask_1\":0,\"nose_1\":0,\"eye_color\":0,\"blemishes_2\":0,\"neck_thickness\":0,\"ears_1\":-1,\"eyebrows_5\":0,\"blush_3\":0,\"chain_1\":0,\"mask_2\":0,\"cheeks_3\":0,\"nose_4\":0,\"hair_2\":0,\"jaw_1\":0,\"hair_color_1\":0,\"chin_4\":0,\"neck\":10,\"bags_1\":0,\"shoes_1\":7,\"eyebrows_6\":0,\"sun_1\":0,\"arms_2\":0,\"eyebrow_2\":10,\"moles_2\":0,\"eyebrow_1\":10,\"hair_1\":73,\"face\":0,\"age_1\":0,\"bodyb_1\":-1,\"nose_2\":0,\"glasses_2\":0,\"lipstick_1\":0,\"beard_4\":0,\"chest_3\":0,\"cheeks_2\":0,\"jaw_2\":0,\"makeup_1\":0,\"arms\":1,\"beard_1\":0,\"chimp_1\":10,\"chimp_4\":10,\"mom\":21,\"glasses_1\":5,\"helmet_1\":-1,\"skin\":8,\"torso_2\":2,\"bracelets_1\":-1,\"bags_2\":0,\"face_3\":0,\"lips\":10,\"chest_1\":0,\"cheeks_1\":0,\"blush_2\":0,\"shoes_2\":2,\"eyebrows_3\":0,\"blend_face\":0,\"blemishes_1\":0,\"age_2\":0,\"decals_1\":0,\"nose_5\":0,\"eyebrows_4\":0,\"skin_2\":0,\"pants_1\":1,\"hair_3\":1,\"bproof_2\":0,\"bodyb_2\":0,\"lipstick_2\":0,\"blend_skin\":0,\"chimp_3\":10,\"makeup_4\":0,\"lip_thickness\":0,\"face_2\":0}', '[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":908700,\"percent\":90.86999999999999},{\"name\":\"thirst\",\"val\":874825,\"percent\":87.4825}]', 0, 8, NULL, '2023-11-16 18:57:17', '2023-11-16 19:25:49', '7150022', NULL, 199, '', 0, 0, 0, 0, '', NULL, 'unemployed', '{}', NULL),
('char1:030ec26b21f4602ea536b6d004cd108b2ad83fXX', '{\"bank\":92290,\"black_money\":0,\"money\":20982421}', 'admin', '[{\"name\":\"WEAPON_MINISMG\",\"slot\":1,\"count\":1,\"metadata\":{\"serial\":\"924389WBS490159\",\"components\":[],\"durability\":81.15,\"registered\":\"Willy Hills\",\"ammo\":20}},{\"name\":\"ammo-9\",\"slot\":2,\"count\":1227},{\"name\":\"lockpick\",\"slot\":3,\"count\":1},{\"name\":\"money\",\"slot\":6,\"count\":20982421},{\"name\":\"phone\",\"slot\":7,\"count\":1},{\"name\":\"carkey\",\"slot\":46,\"count\":1,\"metadata\":{\"type\":\"ADMINCAR\"}}]', 'unemployed', 0, '[]', '[]', '{\"heading\":119.05510711669922,\"x\":96.5802230834961,\"y\":-1136.10986328125,\"z\":29.1787109375}', 'Willy', 'Hills', '12/04/1997', 'm', 189, '{\"bodyb_3\":-1,\"dad\":29,\"neck_thickness\":0,\"decals_2\":0,\"skin\":8,\"eyebrows_4\":0,\"face\":0,\"hair_1\":73,\"shoes_2\":2,\"nose_2\":10,\"age_2\":0,\"blush_1\":0,\"blend_skin\":0,\"chain_2\":0,\"pants_1\":42,\"chimp_2\":10,\"makeup_3\":0,\"cheeks_3\":10,\"moles_1\":0,\"bags_2\":0,\"mom\":43,\"sun_2\":0,\"blemishes_2\":0,\"bodyb_4\":0,\"chin_4\":0,\"watches_1\":3,\"pants_2\":0,\"decals_1\":0,\"skin_md_weight\":27,\"bodyb_1\":0,\"neck\":10,\"nose_5\":10,\"hair_color_1\":0,\"bproof_1\":0,\"eyebrows_5\":0,\"sex\":0,\"chin_13\":0,\"chain_1\":0,\"blush_3\":0,\"eyebrows_2\":7,\"ears_1\":-1,\"torso_1\":346,\"eyebrows_1\":12,\"bracelets_1\":11,\"mask_2\":0,\"eyebrow_1\":10,\"tshirt_1\":0,\"bodyb_2\":0,\"eye_color\":0,\"moles_2\":0,\"bproof_2\":0,\"skin_3\":0,\"hair_3\":2,\"chest_3\":0,\"face_2\":0,\"eyebrow_2\":10,\"torso_2\":0,\"blend_face\":0,\"jaw_1\":10,\"chimp_4\":10,\"makeup_4\":0,\"blend\":0,\"helmet_2\":0,\"nose_6\":10,\"complexion_1\":0,\"cheeks_2\":10,\"complexion_2\":0,\"nose_1\":10,\"makeup_1\":0,\"lipstick_1\":0,\"lipstick_2\":0,\"helmet_1\":-1,\"hair_color_2\":0,\"arms\":11,\"arms_2\":0,\"beard_4\":0,\"bracelets_2\":0,\"face_3\":0,\"nose_3\":10,\"glasses_2\":0,\"beard_2\":3,\"mask_1\":0,\"eyebrows_3\":0,\"sun_1\":0,\"face_md_weight\":61,\"eyebrows_6\":0,\"ears_2\":0,\"tshirt_2\":1,\"lip_thickness\":-2,\"blush_2\":0,\"chest_1\":0,\"glasses_1\":5,\"chimp_1\":10,\"cheeks_1\":10,\"bags_1\":0,\"shoes_1\":7,\"chest_2\":0,\"chimp_3\":10,\"watches_2\":0,\"nose_4\":10,\"makeup_2\":0,\"beard_3\":0,\"hair_2\":0,\"beard_1\":0,\"age_1\":0,\"blemishes_1\":0,\"chin_2\":0,\"eye_squint\":0,\"chin_1\":0,\"jaw_2\":10,\"skin_2\":0,\"lipstick_3\":0,\"lips\":10,\"lipstick_4\":0}', '[{\"percent\":0.0,\"name\":\"drunk\",\"val\":0},{\"percent\":76.77000000000001,\"name\":\"hunger\",\"val\":767700},{\"percent\":82.5775,\"name\":\"thirst\",\"val\":825775}]', 0, 3, NULL, '2023-09-14 18:41:34', '2024-04-07 21:11:16', '2200064', NULL, 200, '2137', 0, 0, 0, 0, '', NULL, 'unemployed', '{}', NULL),
('char1:14fd7aad0e3c766821e0cb3aa3bc69636518f541', '{\"bank\":55000,\"money\":40,\"black_money\":286}', 'admin', '[{\"name\":\"WEAPON_GLOCK\",\"metadata\":{\"registered\":\"Pedal Cwel\",\"ammo\":13,\"durability\":93.40000000000036,\"serial\":\"730288AIA717771\",\"components\":[]},\"slot\":1,\"count\":1},{\"name\":\"phone\",\"slot\":2,\"count\":1},{\"name\":\"carkey\",\"metadata\":{\"type\":\"KUTASEK\"},\"slot\":3,\"count\":1},{\"name\":\"money\",\"slot\":4,\"count\":40},{\"name\":\"lockpick\",\"metadata\":{\"durability\":100},\"slot\":5,\"count\":1},{\"name\":\"water\",\"slot\":6,\"count\":1},{\"name\":\"lockpick\",\"metadata\":{\"durability\":100},\"slot\":7,\"count\":1},{\"name\":\"bread\",\"slot\":8,\"count\":1},{\"name\":\"black_money\",\"slot\":9,\"count\":286},{\"name\":\"WEAPON_KNIFE\",\"metadata\":{\"durability\":99.8,\"components\":[]},\"slot\":10,\"count\":1},{\"name\":\"ammo-9\",\"slot\":11,\"count\":421},{\"name\":\"carkey\",\"metadata\":{\"type\":\"1\"},\"slot\":12,\"count\":1}]', 'police', 15, '[]', NULL, '{\"x\":274.6549377441406,\"y\":-531.1912231445313,\"z\":43.012451171875,\"heading\":155.905517578125}', 'Pedal', 'Cwel', '04/09/1998', 'm', 187, '{\"sun_2\":0,\"jaw_1\":0,\"hair_color_1\":0,\"chimp_4\":10,\"glasses_1\":0,\"moles_2\":0,\"decals_2\":0,\"bodyb_1\":-1,\"bproof_1\":0,\"mask_2\":0,\"ears_2\":0,\"complexion_2\":0,\"sex\":0,\"jaw_2\":0,\"eyebrows_2\":0,\"lipstick_4\":0,\"bags_2\":0,\"blemishes_2\":0,\"watches_1\":-1,\"bodyb_4\":0,\"eyebrow_1\":10,\"complexion_1\":0,\"nose_4\":0,\"lipstick_1\":0,\"chin_2\":0,\"ears_1\":-1,\"mask_1\":0,\"bodyb_2\":0,\"beard_2\":0,\"sun_1\":0,\"chain_1\":0,\"neck\":10,\"face_md_weight\":50,\"torso_2\":0,\"blemishes_1\":0,\"blend_skin\":0,\"chain_2\":0,\"hair_2\":0,\"blush_3\":0,\"skin_md_weight\":50,\"face_3\":0,\"chest_1\":0,\"helmet_2\":0,\"chin_1\":0,\"chest_3\":0,\"chimp_3\":10,\"lipstick_3\":0,\"moles_1\":0,\"makeup_4\":0,\"chest_2\":0,\"chin_4\":0,\"nose_3\":0,\"skin_2\":0,\"chin_13\":0,\"nose_1\":0,\"mom\":21,\"bodyb_3\":-1,\"beard_1\":0,\"pants_2\":0,\"lipstick_2\":0,\"blush_1\":0,\"shoes_2\":0,\"blend\":0,\"neck_thickness\":0,\"chimp_2\":10,\"watches_2\":0,\"blush_2\":0,\"cheeks_3\":0,\"blend_face\":0,\"face\":0,\"eyebrows_3\":0,\"cheeks_2\":0,\"bracelets_2\":0,\"age_2\":0,\"makeup_3\":0,\"glasses_2\":0,\"lips\":10,\"eye_color\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"nose_6\":0,\"hair_1\":0,\"nose_5\":0,\"arms\":0,\"tshirt_2\":0,\"shoes_1\":0,\"nose_2\":0,\"torso_1\":0,\"eyebrows_5\":0,\"pants_1\":0,\"age_1\":0,\"tshirt_1\":0,\"eyebrow_2\":10,\"eyebrows_1\":0,\"eye_squint\":0,\"skin_3\":0,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_1\":-1,\"chimp_1\":10,\"lip_thickness\":0,\"face_2\":0,\"beard_4\":0,\"beard_3\":0,\"helmet_1\":-1,\"skin\":0,\"bags_1\":0,\"decals_1\":0,\"dad\":0,\"eyebrows_6\":0,\"hair_color_2\":0,\"arms_2\":0,\"hair_3\":0,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":339400,\"percent\":33.94},{\"name\":\"thirst\",\"val\":579550,\"percent\":57.955}]', 0, 28, NULL, '2024-04-10 17:19:23', '2024-04-10 18:15:57', '9840079', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":0.79999999999999,\"strenght\":0.0,\"shooting\":1.7,\"driving\":2.3}'),
('char1:464736841e79f93c754f65f47d219b81e7b0d50a', '{\"black_money\":0,\"bank\":55000,\"money\":0}', 'user', '[{\"metadata\":{\"components\":[],\"registered\":\"Zack Wiliams\",\"serial\":\"232380POL807102\",\"durability\":100},\"name\":\"WEAPON_STUNGUN\",\"slot\":1,\"count\":1},{\"name\":\"water\",\"slot\":2,\"count\":2},{\"name\":\"phone\",\"slot\":3,\"count\":1}]', 'unemployed', 0, '[]', NULL, '{\"x\":1025.6043701171876,\"heading\":90.70865631103516,\"z\":48.0673828125,\"y\":-836.0439453125}', 'Deny', 'Lee', '11/03/2000', 'm', 150, '{\"beard_2\":0,\"complexion_2\":0,\"eyebrows_5\":0,\"beard_3\":0,\"eye_squint\":0,\"skin_3\":0,\"mask_2\":13,\"eyebrows_2\":0,\"face_3\":0,\"bproof_2\":0,\"blend_face\":0,\"chin_2\":0,\"torso_2\":0,\"bodyb_2\":0,\"chain_2\":0,\"nose_6\":0,\"blend\":0,\"moles_1\":0,\"hair_color_2\":0,\"face\":29,\"hair_2\":0,\"bags_2\":0,\"age_2\":0,\"cheeks_3\":0,\"nose_2\":0,\"eye_color\":0,\"nose_4\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"beard_1\":0,\"glasses_1\":0,\"pants_1\":4,\"neck\":10,\"eyebrows_6\":0,\"hair_1\":80,\"blush_3\":0,\"cheeks_2\":0,\"chin_1\":0,\"bags_1\":0,\"eyebrows_1\":0,\"nose_5\":0,\"lipstick_2\":0,\"skin_2\":0,\"blush_2\":0,\"chain_1\":0,\"makeup_1\":0,\"neck_thickness\":0,\"complexion_1\":0,\"nose_1\":0,\"makeup_4\":0,\"nose_3\":0,\"blemishes_2\":0,\"blush_1\":0,\"chimp_4\":10,\"helmet_2\":0,\"tshirt_1\":15,\"skin\":3,\"jaw_2\":0,\"beard_4\":0,\"age_1\":0,\"face_md_weight\":50,\"helmet_1\":-1,\"decals_1\":0,\"lipstick_4\":0,\"sun_2\":0,\"chin_13\":0,\"glasses_2\":0,\"skin_md_weight\":50,\"eyebrow_1\":10,\"lips\":10,\"blemishes_1\":0,\"watches_2\":0,\"pants_2\":0,\"bracelets_2\":0,\"chest_3\":0,\"shoes_2\":0,\"mom\":21,\"dad\":0,\"decals_2\":0,\"bracelets_1\":-1,\"bodyb_1\":-1,\"bproof_1\":0,\"hair_color_1\":0,\"eyebrows_3\":0,\"face_2\":0,\"lip_thickness\":0,\"blend_skin\":0,\"lipstick_1\":0,\"hair_3\":0,\"eyebrow_2\":10,\"watches_1\":-1,\"bodyb_3\":-1,\"makeup_2\":0,\"tshirt_2\":0,\"chimp_3\":10,\"lipstick_3\":0,\"moles_2\":0,\"sex\":0,\"makeup_3\":0,\"chin_4\":0,\"mask_1\":169,\"chest_2\":0,\"cheeks_1\":0,\"arms_2\":0,\"chimp_2\":10,\"arms\":0,\"chest_1\":0,\"torso_1\":262,\"ears_2\":0,\"bodyb_4\":0,\"jaw_1\":0,\"ears_1\":-1,\"shoes_1\":1,\"sun_1\":0}', '[{\"val\":0,\"percent\":0.0,\"name\":\"drunk\"},{\"val\":390000,\"percent\":39.0,\"name\":\"hunger\"},{\"val\":417500,\"percent\":41.75,\"name\":\"thirst\"}]', 0, 19, NULL, '2024-04-08 17:38:06', '2024-04-09 13:47:08', '1410024', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"strenght\":0.0,\"driving\":0.2,\"condition\":16.50000000000001,\"shooting\":1.6}'),
('char1:47e829a50c310da7daf10fd609fa36ba2710aab1', '{\"black_money\":0,\"money\":125000,\"bank\":-46640}', 'best', '[{\"slot\":1,\"name\":\"WEAPON_CERAMICPISTOL\",\"metadata\":{\"durability\":72.60000000000156,\"ammo\":6,\"registered\":\"Jacob Smitch\",\"serial\":\"209990JKG988137\",\"components\":[]},\"count\":1},{\"slot\":2,\"name\":\"ammo-rifle\",\"count\":50},{\"slot\":3,\"name\":\"money\",\"count\":125000},{\"slot\":5,\"name\":\"ammo-9\",\"count\":57},{\"slot\":7,\"name\":\"ammo-rifle2\",\"count\":25}]', 'police', 15, '[]', NULL, '{\"x\":415.041748046875,\"y\":-1042.25927734375,\"z\":29.4989013671875,\"heading\":280.6299133300781}', 'Jacob', 'Smitch', '11/11/2000', 'm', 180, '{\"makeup_2\":0,\"eye_color\":0,\"cheeks_2\":0,\"bodyb_1\":-1,\"shoes_2\":0,\"nose_1\":0,\"beard_2\":0,\"bproof_1\":0,\"age_2\":0,\"nose_5\":0,\"chin_1\":0,\"jaw_2\":0,\"eyebrows_2\":0,\"age_1\":0,\"bracelets_1\":-1,\"beard_3\":0,\"ears_1\":-1,\"chin_2\":0,\"bracelets_2\":0,\"chimp_2\":10,\"hair_color_2\":0,\"eyebrows_1\":0,\"chain_1\":0,\"cheeks_3\":0,\"sun_1\":0,\"face\":0,\"complexion_2\":0,\"moles_2\":0,\"skin_2\":0,\"nose_3\":0,\"blush_2\":0,\"chin_13\":0,\"bproof_2\":0,\"eyebrow_2\":10,\"blend\":0,\"makeup_1\":0,\"eyebrow_1\":10,\"skin_md_weight\":50,\"pants_2\":0,\"beard_1\":0,\"chain_2\":0,\"decals_1\":0,\"nose_6\":0,\"jaw_1\":0,\"beard_4\":0,\"lipstick_2\":0,\"lipstick_4\":0,\"blend_face\":0,\"shoes_1\":0,\"chest_2\":0,\"bodyb_3\":-1,\"skin_3\":0,\"face_2\":0,\"arms_2\":0,\"chimp_3\":10,\"chest_1\":0,\"decals_2\":0,\"hair_2\":0,\"mask_2\":0,\"nose_4\":0,\"chimp_4\":10,\"sex\":0,\"watches_2\":0,\"lips\":10,\"face_md_weight\":50,\"glasses_1\":0,\"hair_1\":5,\"sun_2\":0,\"bodyb_4\":0,\"eyebrows_4\":0,\"cheeks_1\":0,\"lipstick_3\":0,\"complexion_1\":0,\"torso_1\":0,\"makeup_3\":0,\"face_3\":0,\"torso_2\":0,\"blush_3\":0,\"eyebrows_3\":0,\"hair_color_1\":0,\"mom\":21,\"chimp_1\":10,\"moles_1\":0,\"dad\":0,\"blush_1\":0,\"helmet_2\":0,\"tshirt_2\":0,\"watches_1\":-1,\"mask_1\":0,\"neck_thickness\":0,\"glasses_2\":0,\"bodyb_2\":0,\"blend_skin\":0,\"eyebrows_6\":0,\"chest_3\":0,\"eye_squint\":0,\"bags_2\":0,\"lipstick_1\":0,\"eyebrows_5\":0,\"ears_2\":0,\"skin\":0,\"blemishes_2\":0,\"hair_3\":0,\"blemishes_1\":0,\"makeup_4\":0,\"chin_4\":0,\"bags_1\":0,\"tshirt_1\":0,\"neck\":10,\"pants_1\":0,\"lip_thickness\":0,\"helmet_1\":-1,\"nose_2\":0,\"arms\":0}', '[{\"val\":0,\"name\":\"drunk\",\"percent\":0.0},{\"val\":495200,\"name\":\"hunger\",\"percent\":49.51999999999999},{\"val\":496400,\"name\":\"thirst\",\"percent\":49.64}]', 0, 12, NULL, '2024-04-07 20:13:23', '2024-04-08 14:20:19', '7490043', NULL, NULL, '101', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"shooting\":2.99999999999999,\"driving\":0.6,\"condition\":20.90000000000001,\"strenght\":0.0}'),
('char1:49f6a2c91fc5717416a804d709a34bf1175d05d5', '{\"black_money\":1162,\"bank\":55750,\"money\":0}', 'user', '[{\"name\":\"bread\",\"slot\":1,\"count\":2},{\"name\":\"water\",\"slot\":2,\"count\":2},{\"name\":\"phone\",\"slot\":3,\"count\":1},{\"name\":\"black_money\",\"slot\":4,\"count\":1162},{\"name\":\"cola\",\"slot\":6,\"count\":1}]', 'unemployed', 0, '[]', NULL, '{\"x\":-717.4417724609375,\"heading\":243.77952575683595,\"z\":10.8125,\"y\":-1193.74951171875}', 'Seishin', 'Akuma', '16/03/2003', 'm', 213, '{\"chimp_3\":10,\"makeup_1\":0,\"cheeks_3\":7,\"shoes_1\":57,\"age_1\":0,\"beard_2\":0,\"complexion_2\":0,\"eyebrows_1\":29,\"blend\":0,\"hair_2\":0,\"hair_1\":79,\"jaw_1\":10,\"arms\":30,\"face_3\":0,\"blend_face\":5,\"lip_thickness\":0,\"watches_1\":-1,\"chest_1\":0,\"helmet_1\":-1,\"arms_2\":0,\"face_2\":45,\"bproof_1\":0,\"blemishes_2\":0,\"chin_4\":0,\"neck\":10,\"skin_md_weight\":50,\"eyebrow_1\":20,\"shoes_2\":10,\"bracelets_2\":0,\"jaw_2\":4,\"helmet_2\":0,\"beard_1\":0,\"moles_1\":0,\"bags_2\":0,\"cheeks_1\":4,\"beard_3\":0,\"chest_2\":0,\"lipstick_3\":0,\"watches_2\":0,\"bproof_2\":0,\"pants_2\":0,\"sun_1\":0,\"chimp_1\":13,\"tshirt_1\":85,\"mask_1\":0,\"chin_1\":0,\"ears_1\":26,\"age_2\":0,\"bodyb_3\":-1,\"decals_1\":0,\"sex\":0,\"makeup_2\":0,\"dad\":0,\"face_md_weight\":50,\"hair_color_1\":63,\"complexion_1\":0,\"chain_1\":0,\"lipstick_2\":0,\"bodyb_2\":0,\"chest_3\":0,\"lipstick_4\":0,\"makeup_3\":0,\"blush_3\":0,\"bracelets_1\":-1,\"eye_squint\":0,\"lipstick_1\":0,\"torso_1\":202,\"bodyb_1\":-1,\"eyebrows_3\":0,\"hair_color_2\":0,\"lips\":20,\"skin\":23,\"chimp_4\":10,\"blush_1\":0,\"bags_1\":0,\"chin_13\":0,\"decals_2\":0,\"pants_1\":26,\"skin_2\":0,\"blemishes_1\":0,\"torso_2\":0,\"eyebrow_2\":10,\"nose_4\":10,\"eyebrows_4\":0,\"blend_skin\":0,\"neck_thickness\":0,\"glasses_2\":0,\"chimp_2\":10,\"cheeks_2\":7,\"glasses_1\":0,\"nose_3\":10,\"blush_2\":0,\"bodyb_4\":0,\"makeup_4\":0,\"eyebrows_2\":10,\"chin_2\":0,\"nose_1\":10,\"hair_3\":0,\"mask_2\":0,\"nose_6\":10,\"eyebrows_5\":0,\"eyebrows_6\":0,\"ears_2\":2,\"skin_3\":0,\"moles_2\":0,\"nose_5\":10,\"nose_2\":10,\"eye_color\":3,\"chain_2\":0,\"sun_2\":0,\"mom\":21,\"face\":0,\"beard_4\":0,\"tshirt_2\":2}', '[{\"val\":0,\"percent\":0.0,\"name\":\"drunk\"},{\"val\":491200,\"percent\":49.12,\"name\":\"hunger\"},{\"val\":493400,\"percent\":49.34,\"name\":\"thirst\"}]', 0, 24, NULL, '2024-04-08 19:51:32', '2024-04-08 20:08:40', '1600042', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"strenght\":0.0,\"driving\":0.0,\"shooting\":0.0,\"condition\":0.3}'),
('char1:636f6db328aeabc289967ff088473d12badf4d5f', '{\"black_money\":3173,\"bank\":5000,\"money\":49007}', 'user', '[{\"count\":1,\"slot\":1,\"metadata\":{\"components\":[],\"serial\":\"955801AEO888107\",\"registered\":\"Zack Wiliams\",\"durability\":49.0000000000029,\"ammo\":12},\"name\":\"WEAPON_CERAMICPISTOL\"},{\"count\":2,\"slot\":3,\"name\":\"bandage\"},{\"count\":2,\"slot\":4,\"name\":\"cola\"},{\"count\":3173,\"slot\":6,\"name\":\"black_money\"},{\"count\":1,\"slot\":7,\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":1,\"slot\":8,\"name\":\"phone\"},{\"count\":1,\"slot\":9,\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":1,\"slot\":11,\"metadata\":{\"components\":[],\"durability\":98.10000000000012},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":1,\"slot\":12,\"metadata\":{\"components\":[],\"durability\":99.60000000000002},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":49007,\"slot\":13,\"name\":\"money\"},{\"count\":1,\"slot\":14,\"metadata\":{\"components\":[],\"durability\":97.40000000000012},\"name\":\"WEAPON_KNIFE\"},{\"count\":1,\"slot\":15,\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":1,\"slot\":18,\"metadata\":{\"components\":[],\"durability\":91.2000000000005},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":1,\"slot\":19,\"metadata\":{\"components\":[],\"durability\":97.10000000000017},\"name\":\"WEAPON_SWITCHBLADE\"},{\"count\":12,\"slot\":20,\"name\":\"ammo-9\"},{\"count\":1,\"slot\":24,\"metadata\":{\"components\":[],\"durability\":100},\"name\":\"WEAPON_SWITCHBLADE\"}]', 'mechanic', 1, '[]', NULL, '{\"z\":27.207275390625,\"heading\":62.36220550537109,\"x\":4965.46826171875,\"y\":-5790.0263671875}', 'Kyle', 'Murhpy', '03/02/2000', 'm', 180, '{\"chimp_3\":10,\"makeup_1\":0,\"lips\":10,\"shoes_1\":10,\"age_1\":0,\"beard_2\":0,\"complexion_2\":0,\"eyebrows_1\":0,\"blend\":0,\"hair_2\":0,\"hair_1\":50,\"jaw_1\":0,\"arms\":12,\"face_3\":0,\"chimp_1\":10,\"lip_thickness\":0,\"bags_1\":0,\"chest_1\":0,\"blush_1\":0,\"arms_2\":0,\"face_2\":0,\"mask_2\":13,\"chain_2\":0,\"chin_4\":0,\"bproof_1\":0,\"skin_md_weight\":50,\"eyebrow_1\":10,\"shoes_2\":0,\"cheeks_3\":0,\"blush_2\":0,\"helmet_2\":0,\"chest_3\":0,\"moles_1\":0,\"tshirt_1\":21,\"cheeks_1\":0,\"beard_3\":0,\"chest_2\":0,\"neck_thickness\":0,\"watches_2\":0,\"watches_1\":-1,\"pants_2\":0,\"sun_1\":0,\"bproof_2\":0,\"torso_1\":311,\"mask_1\":169,\"chin_1\":0,\"bracelets_2\":0,\"blemishes_2\":0,\"bodyb_3\":-1,\"hair_3\":0,\"face\":0,\"makeup_2\":0,\"eyebrows_2\":0,\"skin_3\":0,\"hair_color_1\":0,\"bags_2\":0,\"chain_1\":0,\"lipstick_2\":0,\"nose_1\":0,\"sex\":0,\"torso_2\":6,\"makeup_3\":0,\"blush_3\":0,\"bracelets_1\":-1,\"face_md_weight\":50,\"lipstick_1\":0,\"makeup_4\":0,\"bodyb_1\":-1,\"eyebrows_3\":0,\"glasses_1\":0,\"jaw_2\":0,\"skin\":3,\"chimp_4\":10,\"eye_squint\":0,\"age_2\":0,\"chin_13\":0,\"decals_2\":0,\"neck\":10,\"tshirt_2\":0,\"helmet_1\":-1,\"skin_2\":0,\"blend_face\":0,\"nose_3\":0,\"eyebrows_4\":0,\"blend_skin\":0,\"sun_2\":0,\"glasses_2\":0,\"chimp_2\":10,\"pants_1\":4,\"dad\":0,\"lipstick_3\":0,\"complexion_1\":0,\"bodyb_4\":0,\"decals_1\":0,\"hair_color_2\":0,\"chin_2\":0,\"cheeks_2\":0,\"nose_4\":0,\"ears_1\":-1,\"bodyb_2\":0,\"eyebrows_5\":0,\"eyebrows_6\":0,\"ears_2\":0,\"beard_1\":0,\"moles_2\":0,\"lipstick_4\":0,\"nose_2\":0,\"nose_5\":0,\"nose_6\":0,\"blemishes_1\":0,\"mom\":21,\"eyebrow_2\":10,\"beard_4\":0,\"eye_color\":0}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":91.14,\"val\":911400},{\"name\":\"thirst\",\"percent\":96.61,\"val\":966100}]', 0, 16, NULL, '2024-04-08 16:35:09', '2024-04-09 15:13:51', '4500014', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":22.5,\"shooting\":0.2,\"strenght\":0.0,\"driving\":4.49999999999999}'),
('char1:774a6569fa5c22f519262d90560dfad85fc99c4f', '{\"money\":1000,\"bank\":60200,\"black_money\":0}', 'admin', '[{\"count\":1,\"name\":\"WEAPON_VINTAGEPISTOL\",\"metadata\":{\"ammo\":7,\"serial\":\"189724QDP271646\",\"registered\":\"Caroline Globuz\",\"components\":[],\"durability\":61.50000000000219},\"slot\":1},{\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"ammo\":23,\"serial\":\"564904AYM722545\",\"durability\":93.80000000000035,\"components\":[],\"registered\":\"Caroline Globuz\"},\"slot\":2},{\"count\":623,\"name\":\"ammo-9\",\"slot\":3},{\"count\":1000,\"name\":\"money\",\"slot\":4},{\"count\":1,\"name\":\"phone\",\"slot\":5},{\"count\":1,\"name\":\"bread\",\"slot\":6},{\"count\":2,\"name\":\"water\",\"slot\":7},{\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"type\":1,\"durability\":100},\"slot\":8}]', 'police', 15, '[]', NULL, '{\"z\":98.4820556640625,\"y\":-1646.6505126953126,\"x\":335.947265625,\"heading\":337.3228454589844}', 'Caroline', 'Globuz', '04/04/1992', 'f', 200, '{\"complexion_1\":0,\"jaw_1\":0,\"hair_color_1\":15,\"chimp_4\":10,\"glasses_1\":55,\"moles_2\":0,\"decals_2\":0,\"skin_md_weight\":50,\"eyebrow_1\":10,\"mask_2\":2,\"ears_2\":0,\"complexion_2\":0,\"sex\":1,\"bodyb_2\":0,\"blemishes_1\":0,\"lipstick_4\":0,\"bags_2\":0,\"glasses_2\":0,\"watches_1\":-1,\"bodyb_4\":0,\"makeup_3\":0,\"chimp_3\":10,\"nose_4\":0,\"lipstick_1\":5,\"bodyb_1\":0,\"face_md_weight\":50,\"mask_1\":169,\"neck_thickness\":0,\"chin_1\":0,\"cheeks_2\":0,\"bracelets_2\":0,\"torso_2\":0,\"sun_2\":0,\"eyebrows_4\":0,\"chin_4\":0,\"blend_skin\":0,\"chain_2\":0,\"ears_1\":-1,\"lip_thickness\":0,\"chimp_1\":10,\"face_3\":0,\"chest_1\":0,\"helmet_2\":0,\"eyebrows_3\":0,\"hair_1\":131,\"blend_face\":0,\"beard_2\":0,\"moles_1\":0,\"makeup_4\":0,\"chin_2\":0,\"eyebrows_5\":0,\"neck\":10,\"eye_squint\":0,\"chin_13\":0,\"nose_1\":6,\"mom\":21,\"chest_3\":0,\"bodyb_3\":-1,\"pants_2\":0,\"nose_2\":0,\"blush_1\":0,\"shoes_2\":0,\"tshirt_1\":14,\"torso_1\":553,\"chimp_2\":10,\"watches_2\":0,\"blush_2\":0,\"cheeks_3\":0,\"jaw_2\":0,\"face\":21,\"pants_1\":245,\"lipstick_2\":10,\"eye_color\":10,\"age_2\":0,\"beard_1\":0,\"bproof_1\":0,\"lips\":10,\"chest_2\":0,\"lipstick_3\":20,\"makeup_1\":0,\"nose_3\":0,\"beard_4\":0,\"chain_1\":0,\"arms\":1,\"tshirt_2\":0,\"shoes_1\":250,\"hair_2\":0,\"eyebrows_2\":0,\"skin_3\":0,\"nose_5\":0,\"hair_3\":0,\"sun_1\":0,\"eyebrow_2\":10,\"eyebrows_1\":0,\"age_1\":0,\"blush_3\":0,\"bproof_2\":0,\"makeup_2\":10,\"bracelets_1\":-1,\"arms_2\":0,\"skin_2\":0,\"face_2\":0,\"decals_1\":0,\"beard_3\":0,\"nose_6\":0,\"skin\":1,\"blemishes_2\":0,\"dad\":0,\"blend\":0,\"eyebrows_6\":0,\"hair_color_2\":0,\"bags_1\":0,\"helmet_1\":-1,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":98.21,\"val\":982100},{\"name\":\"thirst\",\"percent\":98.6575,\"val\":986575}]', 0, 26, NULL, '2024-04-10 13:07:34', '2024-04-10 19:37:25', '4390081', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":6.59999999999998,\"shooting\":5.1,\"driving\":1.5,\"strenght\":0.0}'),
('char1:8281a125cbe2a07e3ddebc9ce97fcb2a4924a056', '{\"money\":1000646,\"bank\":9050900,\"black_money\":0}', 'user', '[{\"count\":1,\"name\":\"phone\",\"slot\":1},{\"count\":1,\"name\":\"WEAPON_PISTOL_MK2\",\"metadata\":{\"ammo\":12,\"serial\":\"349116RHT882837\",\"registered\":\"Denis Taylor\",\"components\":[],\"durability\":2.0},\"slot\":2},{\"count\":10,\"name\":\"bandage\",\"slot\":18},{\"count\":1,\"name\":\"water\",\"slot\":13},{\"count\":1000646,\"name\":\"money\",\"slot\":14},{\"count\":19,\"name\":\"ammo-9\",\"slot\":19}]', 'unemployed', 0, '[]', NULL, '{\"z\":103.4190673828125,\"y\":152.8219757080078,\"x\":191.60440063476563,\"heading\":79.37007904052735}', 'Denis', 'Taylor', '28/12/1999', 'm', 190, '{\"arms_2\":0,\"sun_2\":0,\"nose_2\":20,\"torso_2\":5,\"neck_thickness\":0,\"lipstick_4\":0,\"face_2\":0,\"bodyb_3\":-1,\"bracelets_2\":0,\"dad\":0,\"lipstick_3\":0,\"bproof_1\":0,\"chin_4\":0,\"mask_1\":0,\"eyebrows_6\":0,\"bags_2\":0,\"decals_1\":0,\"shoes_2\":2,\"ears_1\":-1,\"chin_2\":0,\"jaw_1\":0,\"skin_md_weight\":50,\"bracelets_1\":-1,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_3\":0,\"chimp_4\":10,\"eyebrows_4\":0,\"moles_1\":0,\"chimp_1\":10,\"bags_1\":0,\"age_1\":0,\"hair_color_2\":0,\"nose_3\":14,\"nose_6\":0,\"face_md_weight\":50,\"skin_3\":0,\"complexion_1\":0,\"lipstick_1\":0,\"hair_1\":14,\"mom\":21,\"chain_1\":251,\"makeup_3\":0,\"cheeks_2\":0,\"glasses_2\":0,\"glasses_1\":0,\"blend_face\":0,\"torso_1\":631,\"blend\":0,\"hair_3\":0,\"eyebrows_1\":0,\"complexion_2\":0,\"eye_squint\":0,\"pants_1\":239,\"eyebrows_5\":0,\"hair_color_1\":0,\"face_3\":0,\"blush_2\":0,\"lips\":10,\"tshirt_1\":294,\"lipstick_2\":0,\"ears_2\":0,\"mask_2\":0,\"chimp_2\":10,\"nose_1\":0,\"jaw_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"blush_3\":0,\"chin_13\":0,\"chest_2\":0,\"sun_1\":0,\"nose_4\":8,\"chest_1\":0,\"watches_2\":0,\"skin_2\":0,\"shoes_1\":151,\"helmet_2\":0,\"beard_2\":0,\"makeup_1\":0,\"bodyb_4\":0,\"makeup_4\":0,\"pants_2\":0,\"chain_2\":0,\"beard_4\":0,\"bodyb_2\":0,\"bodyb_1\":-1,\"tshirt_2\":1,\"blush_1\":0,\"eye_color\":0,\"chin_1\":0,\"age_2\":0,\"helmet_1\":118,\"eyebrow_2\":10,\"lip_thickness\":0,\"cheeks_1\":0,\"sex\":0,\"skin\":3,\"blemishes_1\":0,\"chimp_3\":10,\"hair_2\":0,\"nose_5\":0,\"watches_1\":-1,\"eyebrows_2\":0,\"chest_3\":0,\"beard_3\":0,\"neck\":10,\"blend_skin\":0,\"beard_1\":0,\"moles_2\":0,\"face\":0,\"blemishes_2\":0,\"arms\":0,\"eyebrow_1\":10}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":47.83,\"val\":478300},{\"name\":\"thirst\",\"percent\":48.3725,\"val\":483725}]', 0, 14, NULL, '2024-04-08 16:27:00', '2024-04-10 19:37:25', '2380041', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":100.0,\"shooting\":25.79999999999997,\"driving\":18.89999999999996,\"strenght\":0.0}'),
('char1:88a205821572f32cdd64378ddb0ad372b5dc110d', '{\"bank\":2500,\"money\":52800,\"black_money\":0}', 'user', '[{\"name\":\"WEAPON_SWITCHBLADE\",\"metadata\":{\"durability\":86.0000000000008,\"components\":[]},\"slot\":1,\"count\":1},{\"name\":\"WEAPON_BAT\",\"metadata\":{\"durability\":93.90000000000035,\"components\":[]},\"slot\":2,\"count\":1},{\"name\":\"phone\",\"slot\":3,\"count\":1},{\"name\":\"money\",\"slot\":4,\"count\":52800},{\"name\":\"bandage\",\"slot\":5,\"count\":2},{\"name\":\"water\",\"slot\":18,\"count\":3}]', 'kawiarnia', 1, '[]', NULL, '{\"x\":338.967041015625,\"y\":-675.7186889648438,\"z\":29.2630615234375,\"heading\":36.85039520263672}', 'Kamel', 'Klamerka', '11/11/2000', 'm', 200, '{\"complexion_1\":0,\"jaw_1\":0,\"hair_color_1\":0,\"chimp_4\":10,\"nose_6\":0,\"moles_2\":0,\"decals_2\":0,\"lip_thickness\":0,\"eyebrow_1\":10,\"mask_2\":0,\"ears_2\":0,\"complexion_2\":0,\"sex\":0,\"dad\":0,\"blend_face\":0,\"lipstick_4\":0,\"bags_2\":0,\"glasses_2\":0,\"watches_1\":-1,\"bodyb_4\":0,\"blemishes_1\":0,\"eyebrows_5\":0,\"nose_4\":0,\"lipstick_1\":0,\"blemishes_2\":0,\"ears_1\":-1,\"mask_1\":0,\"age_1\":0,\"chest_2\":0,\"torso_1\":63,\"eyebrows_6\":0,\"hair_3\":0,\"hair_2\":0,\"bags_1\":0,\"sun_1\":0,\"blend_skin\":0,\"chain_2\":0,\"sun_2\":0,\"skin_md_weight\":50,\"pants_1\":69,\"face_3\":0,\"chest_1\":0,\"helmet_2\":0,\"face\":0,\"hair_1\":16,\"nose_5\":0,\"lipstick_2\":0,\"moles_1\":0,\"makeup_4\":0,\"bodyb_2\":0,\"chin_4\":0,\"neck\":10,\"skin_2\":0,\"chin_13\":0,\"nose_1\":0,\"mom\":21,\"chest_3\":0,\"face_2\":0,\"pants_2\":0,\"arms_2\":0,\"blush_1\":0,\"shoes_2\":0,\"skin_3\":0,\"cheeks_2\":0,\"beard_4\":0,\"watches_2\":0,\"blush_2\":0,\"cheeks_3\":0,\"jaw_2\":0,\"makeup_3\":0,\"chin_2\":0,\"eyebrow_2\":10,\"bracelets_2\":0,\"age_2\":0,\"torso_2\":0,\"beard_2\":0,\"blush_3\":0,\"decals_1\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"lips\":10,\"nose_3\":0,\"chain_1\":0,\"arms\":19,\"tshirt_2\":0,\"shoes_1\":8,\"blend\":0,\"eye_color\":0,\"beard_1\":0,\"eye_squint\":0,\"bproof_1\":0,\"helmet_1\":-1,\"bodyb_3\":-1,\"eyebrows_1\":0,\"bodyb_1\":-1,\"eyebrows_3\":0,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_1\":-1,\"eyebrows_2\":0,\"chin_1\":0,\"chimp_1\":10,\"chimp_2\":10,\"beard_3\":0,\"chimp_3\":10,\"skin\":0,\"neck_thickness\":0,\"face_md_weight\":50,\"lipstick_3\":0,\"tshirt_1\":15,\"hair_color_2\":0,\"glasses_1\":0,\"nose_2\":0,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":49.05,\"val\":490500},{\"name\":\"thirst\",\"percent\":49.2875,\"val\":492875}]', 0, 27, NULL, '2024-04-10 17:09:51', '2024-04-10 18:02:20', '5810086', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":5.79999999999999,\"strenght\":0.0,\"shooting\":0.0,\"driving\":0.0}'),
('char1:b229afcd63b6d860a3d465d9463b1f762cba2bea', '{\"money\":1000,\"bank\":55000,\"black_money\":0}', 'user', '[{\"count\":2,\"name\":\"bread\",\"slot\":1},{\"count\":2,\"name\":\"water\",\"slot\":2},{\"count\":1000,\"name\":\"money\",\"slot\":7},{\"count\":1,\"name\":\"phone\",\"slot\":13}]', 'doj', 4, '[]', NULL, '{\"z\":36.6600341796875,\"y\":-196.94505310058595,\"x\":-380.1098937988281,\"heading\":306.1417236328125}', 'James', 'Naft', '12/12/1999', 'm', 198, '{\"arms_2\":0,\"eyebrows_5\":0,\"nose_2\":20,\"torso_2\":7,\"watches_2\":0,\"mask_2\":0,\"face_2\":45,\"bodyb_3\":-1,\"bracelets_2\":0,\"dad\":0,\"makeup_3\":0,\"bproof_1\":0,\"chin_4\":0,\"tshirt_1\":15,\"eyebrows_6\":0,\"mask_1\":0,\"decals_1\":0,\"shoes_2\":1,\"shoes_1\":262,\"chin_2\":0,\"jaw_1\":7,\"skin_md_weight\":50,\"lipstick_3\":0,\"cheeks_3\":0,\"decals_2\":0,\"eyebrows_3\":0,\"tshirt_2\":0,\"nose_5\":9,\"moles_1\":0,\"age_1\":0,\"bags_1\":124,\"blemishes_1\":0,\"blend_skin\":7,\"blush_3\":0,\"skin\":23,\"nose_6\":10,\"neck_thickness\":0,\"complexion_1\":0,\"eyebrows_1\":1,\"hair_1\":24,\"mom\":21,\"chin_13\":0,\"face_md_weight\":50,\"ears_1\":-1,\"glasses_2\":0,\"glasses_1\":5,\"neck\":0,\"torso_1\":712,\"blend\":0,\"bodyb_4\":0,\"skin_3\":0,\"complexion_2\":0,\"eye_squint\":0,\"pants_1\":195,\"hair_color_2\":48,\"hair_color_1\":15,\"face_3\":0,\"lipstick_4\":0,\"chimp_2\":20,\"cheeks_2\":10,\"lipstick_2\":0,\"ears_2\":0,\"bags_2\":0,\"helmet_1\":-1,\"nose_1\":0,\"jaw_2\":10,\"bproof_2\":0,\"eyebrow_2\":0,\"chimp_4\":8,\"blush_1\":0,\"chest_2\":0,\"blush_2\":0,\"beard_1\":0,\"chest_1\":0,\"nose_4\":15,\"skin_2\":2,\"makeup_2\":0,\"helmet_2\":0,\"beard_2\":0,\"makeup_1\":0,\"sun_2\":0,\"makeup_4\":0,\"pants_2\":6,\"chain_2\":1,\"eye_color\":14,\"bodyb_2\":0,\"cheeks_1\":0,\"chain_1\":214,\"hair_3\":0,\"sun_1\":0,\"chin_1\":0,\"age_2\":0,\"lipstick_1\":0,\"blend_face\":3,\"lip_thickness\":0,\"moles_2\":0,\"sex\":0,\"eyebrows_4\":0,\"lips\":4,\"chimp_3\":17,\"hair_2\":0,\"beard_4\":0,\"watches_1\":12,\"eyebrows_2\":10,\"chest_3\":0,\"nose_3\":13,\"chimp_1\":0,\"beard_3\":0,\"bodyb_1\":-1,\"bracelets_1\":7,\"face\":0,\"blemishes_2\":0,\"arms\":23,\"eyebrow_1\":7}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":71.61999999999999,\"val\":716200},{\"name\":\"thirst\",\"percent\":78.715,\"val\":787150}]', 0, 29, NULL, '2024-04-10 18:49:16', '2024-04-10 19:37:33', '9460044', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"strenght\":0.0,\"shooting\":0.0,\"driving\":0.0,\"condition\":8.59999999999999}'),
('char1:bcba7dcaf0ed78193b1a803dac31276e5d43b28b', '{\"money\":1.0000000000000882e32,\"bank\":-2000,\"black_money\":1668}', 'admin', '[{\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"metadata\":{\"registered\":\"Fred Polonez\",\"serial\":\"967747POL672784\",\"components\":[],\"durability\":100},\"slot\":1},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"2115\"},\"slot\":2},{\"count\":1,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"ammo\":12,\"serial\":\"569037KGQ304702\",\"registered\":\"Fred Polonez\",\"components\":[],\"durability\":74.30000000000146},\"slot\":3},{\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"ammo\":5,\"serial\":\"949239HTF166435\",\"registered\":\"Fred Polonez\",\"components\":[],\"durability\":53.9000000000026},\"slot\":4},{\"count\":1,\"name\":\"radio\",\"slot\":5},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"SWAT1\"},\"slot\":6},{\"count\":1668,\"name\":\"black_money\",\"slot\":7},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"NORI314\"},\"slot\":8},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"OKI123\"},\"slot\":9},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"7MQ467KS\"},\"slot\":10},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"314NORI\"},\"slot\":11},{\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"type\":1,\"durability\":100},\"slot\":14},{\"count\":1,\"name\":\"bodycam\",\"slot\":17},{\"count\":454,\"name\":\"ammo-9\",\"slot\":21},{\"count\":1,\"name\":\"gps\",\"slot\":22},{\"count\":1,\"name\":\"ammo-rifle\",\"slot\":23},{\"count\":1.0000000000000882e32,\"name\":\"money\",\"slot\":26},{\"count\":1,\"name\":\"handcuffs\",\"slot\":27},{\"count\":1,\"name\":\"ammo-shotgun\",\"slot\":29}]', 'mechanic', 4, '[]', NULL, '{\"z\":6.7178955078125,\"y\":-3029.80224609375,\"x\":143.64395141601563,\"heading\":164.40945434570313}', 'Fred', 'Polonez', '02/02/1999', 'm', 219, '{\"complexion_1\":0,\"jaw_1\":0,\"hair_color_1\":0,\"chimp_4\":10,\"nose_6\":11,\"moles_2\":0,\"decals_2\":0,\"skin_md_weight\":50,\"eyebrow_1\":10,\"mask_2\":0,\"ears_2\":0,\"complexion_2\":0,\"sex\":0,\"bodyb_2\":0,\"blend_face\":0,\"lipstick_4\":0,\"bags_2\":0,\"blemishes_2\":0,\"watches_1\":-1,\"bodyb_4\":0,\"lip_thickness\":0,\"bracelets_2\":0,\"nose_4\":15,\"lipstick_1\":0,\"chimp_3\":10,\"chin_1\":0,\"mask_1\":169,\"sun_2\":0,\"face_2\":0,\"torso_1\":817,\"bags_1\":0,\"eye_color\":0,\"ears_1\":-1,\"sun_1\":0,\"jaw_2\":0,\"blend_skin\":0,\"chain_2\":0,\"glasses_1\":53,\"skin_3\":0,\"bproof_1\":93,\"face_3\":0,\"chest_1\":0,\"skin_2\":0,\"chest_2\":0,\"chest_3\":0,\"hair_3\":0,\"beard_4\":0,\"moles_1\":0,\"makeup_4\":0,\"chin_4\":0,\"eyebrows_5\":0,\"neck\":10,\"eyebrows_3\":0,\"chin_13\":0,\"nose_1\":0,\"mom\":21,\"cheeks_2\":0,\"lipstick_3\":0,\"pants_2\":0,\"lipstick_2\":0,\"blush_1\":0,\"shoes_2\":0,\"tshirt_1\":15,\"nose_5\":6,\"chimp_2\":10,\"watches_2\":0,\"eye_squint\":0,\"cheeks_3\":0,\"pants_1\":217,\"hair_2\":0,\"chin_2\":0,\"hair_color_2\":0,\"helmet_1\":150,\"age_2\":0,\"helmet_2\":0,\"nose_2\":0,\"lips\":10,\"face\":0,\"eyebrows_4\":0,\"makeup_1\":0,\"decals_1\":0,\"eyebrows_2\":0,\"chain_1\":0,\"arms\":6,\"tshirt_2\":0,\"shoes_1\":25,\"beard_1\":0,\"beard_2\":0,\"eyebrow_2\":10,\"makeup_3\":0,\"blush_3\":0,\"blemishes_1\":0,\"bodyb_3\":-1,\"eyebrows_1\":0,\"face_md_weight\":50,\"bodyb_1\":-1,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_1\":-1,\"hair_1\":37,\"torso_2\":0,\"chimp_1\":10,\"blush_2\":0,\"beard_3\":0,\"dad\":0,\"skin\":0,\"arms_2\":0,\"blend\":0,\"neck_thickness\":0,\"eyebrows_6\":0,\"age_1\":0,\"glasses_2\":0,\"nose_3\":10,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":47.9,\"val\":479000},{\"name\":\"thirst\",\"percent\":48.425,\"val\":484250}]', 0, 17, NULL, '2024-04-08 16:43:27', '2024-04-10 19:37:25', '9060011', NULL, NULL, '102', 0, 0, 0, 0, '', NULL, 'lost', '{\"fireMember\":true,\"safe\":true,\"noteAdd\":true,\"wardrobeRemove\":true,\"wardrobeOpen\":true,\"hireMembers\":true,\"wardrobeAdd\":true,\"upgrades\":true,\"permissionsManage\":true,\"warehouse\":true}', '{\"strenght\":0.0,\"condition\":49.69999999999989,\"driving\":11.6,\"shooting\":47.2000000000002}'),
('char1:ed3df7e2283787c2ba4818a6242fe6c9e757519f', '{\"bank\":55000,\"black_money\":0,\"money\":1000}', 'user', '[{\"slot\":1,\"count\":1,\"name\":\"bread\"},{\"slot\":2,\"count\":2,\"name\":\"water\"},{\"slot\":3,\"count\":1,\"name\":\"phone\"},{\"slot\":4,\"count\":1000,\"name\":\"money\"}]', 'unemployed', 0, '[]', NULL, '{\"x\":412.03515625,\"y\":-984.03955078125,\"z\":30.7120361328125,\"heading\":325.9842529296875}', 'Hugo', 'Lee', '02/11/1990', 'm', 177, '{\"beard_2\":0,\"complexion_2\":0,\"eyebrows_5\":0,\"beard_3\":0,\"eye_squint\":0,\"skin_3\":0,\"bodyb_3\":-1,\"eyebrows_2\":0,\"face_3\":45,\"bproof_2\":0,\"blend_face\":0,\"chin_2\":0,\"torso_2\":0,\"bodyb_2\":0,\"chain_2\":0,\"shoes_2\":0,\"blend\":0,\"moles_1\":0,\"hair_color_2\":0,\"face\":8,\"dad\":0,\"bags_2\":0,\"chin_4\":0,\"cheeks_3\":0,\"nose_2\":0,\"face_2\":8,\"nose_4\":0,\"chimp_1\":10,\"eyebrows_4\":0,\"eyebrows_3\":0,\"helmet_2\":0,\"pants_1\":105,\"arms\":0,\"eyebrows_6\":0,\"hair_1\":79,\"eye_color\":0,\"glasses_2\":0,\"cheeks_1\":0,\"bags_1\":0,\"mask_1\":0,\"nose_5\":0,\"lipstick_2\":0,\"bodyb_1\":-1,\"blush_2\":0,\"chimp_3\":10,\"makeup_1\":0,\"lipstick_3\":0,\"complexion_1\":0,\"eyebrow_2\":10,\"makeup_4\":0,\"age_2\":0,\"sex\":0,\"blush_1\":0,\"helmet_1\":-1,\"neck\":10,\"chin_1\":0,\"skin\":23,\"jaw_2\":0,\"ears_2\":0,\"watches_2\":0,\"jaw_1\":0,\"mom\":21,\"decals_1\":0,\"lipstick_4\":0,\"sun_2\":0,\"chain_1\":0,\"nose_6\":0,\"skin_md_weight\":50,\"eyebrow_1\":10,\"lips\":10,\"chest_2\":0,\"sun_1\":0,\"hair_2\":0,\"bracelets_2\":0,\"chest_3\":0,\"nose_3\":0,\"makeup_3\":0,\"hair_color_1\":1,\"decals_2\":0,\"age_1\":0,\"pants_2\":0,\"chin_13\":0,\"neck_thickness\":0,\"blend_skin\":0,\"glasses_1\":0,\"lip_thickness\":0,\"blush_3\":0,\"lipstick_1\":0,\"hair_3\":0,\"mask_2\":0,\"watches_1\":-1,\"blemishes_1\":0,\"bracelets_1\":-1,\"tshirt_2\":0,\"blemishes_2\":0,\"torso_1\":131,\"moles_2\":0,\"beard_1\":0,\"arms_2\":0,\"eyebrows_1\":0,\"cheeks_2\":0,\"skin_2\":0,\"makeup_2\":0,\"tshirt_1\":15,\"chimp_2\":10,\"chimp_4\":10,\"chest_1\":0,\"bproof_1\":0,\"nose_1\":0,\"bodyb_4\":0,\"face_md_weight\":50,\"ears_1\":-1,\"shoes_1\":82,\"beard_4\":0}', '[{\"percent\":0.0,\"val\":0,\"name\":\"drunk\"},{\"percent\":98.50999999999999,\"val\":985100,\"name\":\"hunger\"},{\"percent\":97.64500000000001,\"val\":976450,\"name\":\"thirst\"}]', 0, 18, NULL, '2024-04-08 17:14:44', '2024-04-08 17:20:26', '2350062', NULL, NULL, '', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', NULL),
('char1:f1adb990200566adbc79969b40db0f1e69ecc2a4', '{\"money\":0,\"bank\":7365,\"black_money\":0}', 'admin', '[{\"count\":1,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"ammo\":12,\"serial\":\"199390BQB563208\",\"registered\":\"Zack Wiliams\",\"components\":[],\"durability\":82.10000000000102},\"slot\":1},{\"count\":1,\"name\":\"WEAPON_STUNGUN\",\"metadata\":{\"registered\":\"Zack Wiliams\",\"serial\":\"791536POL919536\",\"components\":[],\"durability\":100},\"slot\":2},{\"count\":1,\"name\":\"WEAPON_NIGHTSTICK\",\"metadata\":{\"components\":[],\"durability\":90.20000000000052},\"slot\":3},{\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"ammo\":30,\"serial\":\"457597SYZ412481\",\"durability\":77.80000000000126,\"components\":[],\"registered\":\"Zack Wiliams\"},\"slot\":4},{\"count\":237,\"name\":\"ammo-9\",\"slot\":30},{\"count\":1,\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"ammo\":0,\"serial\":\"194090FCY112841\",\"registered\":\"Zack Wiliams\",\"components\":[],\"durability\":97.60000000000014},\"slot\":24},{\"count\":1,\"name\":\"radio\",\"slot\":18},{\"count\":1,\"name\":\"handcuffs\",\"slot\":19},{\"count\":1,\"name\":\"gps\",\"slot\":25},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"1CX176SF\"},\"slot\":26}]', 'police', 15, '[]', NULL, '{\"z\":18.3106689453125,\"y\":-2030.228515625,\"x\":136.06153869628907,\"heading\":48.18897247314453}', 'Zack', 'Wiliams', '22/02/1999', 'm', 180, '{\"arms_2\":0,\"nose_6\":0,\"nose_2\":5,\"ears_1\":-1,\"neck_thickness\":0,\"nose_4\":15,\"face_2\":0,\"bodyb_3\":-1,\"bracelets_2\":0,\"dad\":0,\"lipstick_3\":0,\"bproof_1\":56,\"chin_4\":0,\"neck\":10,\"eyebrows_6\":0,\"mask_1\":0,\"beard_4\":0,\"shoes_2\":1,\"watches_2\":0,\"chin_2\":0,\"jaw_1\":0,\"blemishes_1\":0,\"chain_2\":0,\"sun_1\":0,\"decals_2\":0,\"eyebrows_3\":0,\"skin_md_weight\":50,\"decals_1\":0,\"moles_1\":17,\"helmet_1\":119,\"bags_1\":0,\"chimp_4\":10,\"blend_skin\":0,\"eyebrows_1\":0,\"lips\":10,\"makeup_3\":0,\"shoes_1\":135,\"complexion_1\":0,\"sun_2\":0,\"hair_1\":166,\"mom\":21,\"bodyb_1\":-1,\"hair_color_2\":30,\"chain_1\":86,\"skin\":14,\"glasses_1\":34,\"hair_3\":0,\"torso_1\":895,\"blend\":0,\"bodyb_4\":0,\"skin_3\":0,\"complexion_2\":0,\"eye_squint\":0,\"pants_1\":186,\"makeup_2\":10,\"hair_color_1\":26,\"face_3\":0,\"glasses_2\":0,\"moles_2\":0,\"chin_13\":0,\"cheeks_3\":0,\"ears_2\":0,\"blush_2\":0,\"chimp_2\":10,\"nose_1\":0,\"jaw_2\":0,\"bproof_2\":0,\"cheeks_2\":0,\"blush_3\":0,\"cheeks_1\":0,\"chest_2\":0,\"lipstick_2\":0,\"bracelets_1\":-1,\"chest_1\":0,\"nose_5\":0,\"skin_2\":3,\"eyebrows_4\":0,\"helmet_2\":0,\"beard_2\":10,\"makeup_1\":57,\"nose_3\":15,\"makeup_4\":38,\"pants_2\":0,\"face_md_weight\":50,\"chimp_3\":10,\"bodyb_2\":0,\"eyebrows_5\":0,\"tshirt_2\":0,\"eye_color\":21,\"mask_2\":0,\"chin_1\":0,\"age_2\":0,\"bags_2\":0,\"eyebrow_2\":10,\"lip_thickness\":0,\"lipstick_4\":0,\"sex\":0,\"lipstick_1\":0,\"blend_face\":10,\"beard_3\":0,\"hair_2\":0,\"watches_1\":-1,\"age_1\":0,\"eyebrows_2\":0,\"chest_3\":0,\"torso_2\":0,\"chimp_1\":10,\"blush_1\":0,\"beard_1\":28,\"tshirt_1\":15,\"face\":2,\"blemishes_2\":0,\"arms\":26,\"eyebrow_1\":20}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":47.39,\"val\":473900},{\"name\":\"thirst\",\"percent\":48.0425,\"val\":480425}]', 0, 15, NULL, '2024-04-08 16:28:48', '2024-04-10 19:37:25', '3400094', NULL, NULL, '01', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":96.0999999999995,\"strenght\":0.0,\"driving\":18.79999999999999,\"shooting\":37.10000000000005}'),
('char1:f9c26edc4589062f2ca6c77463f8617f942f078a', '{\"money\":500,\"bank\":100370,\"black_money\":0}', 'best', '[{\"count\":1,\"name\":\"phone\",\"slot\":1},{\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"type\":1,\"durability\":100},\"slot\":3},{\"count\":500,\"name\":\"money\",\"slot\":4},{\"count\":176,\"name\":\"ammo-9\",\"slot\":24},{\"count\":1,\"name\":\"bread\",\"slot\":25},{\"count\":1,\"name\":\"WEAPON_COMBATPISTOL\",\"metadata\":{\"ammo\":7,\"serial\":\"850509SRV593218\",\"registered\":\"Jack Miller\",\"components\":[],\"durability\":49.80000000000285},\"slot\":5},{\"count\":1,\"name\":\"water\",\"slot\":30}]', 'mechanic', 8, '[]', NULL, '{\"z\":18.2431640625,\"y\":-2026.3516845703126,\"x\":130.65493774414063,\"heading\":243.77952575683595}', 'Jack', 'Miller', '10/12/2000', 'm', 200, '{\"sun_2\":0,\"jaw_1\":0,\"hair_color_1\":62,\"skin_3\":0,\"nose_6\":10,\"moles_2\":0,\"decals_2\":0,\"bodyb_1\":-1,\"bproof_1\":0,\"beard_2\":0,\"ears_2\":0,\"complexion_2\":0,\"sex\":0,\"dad\":0,\"eyebrows_2\":10,\"lipstick_4\":0,\"bags_2\":0,\"glasses_2\":0,\"beard_1\":0,\"bodyb_4\":0,\"blemishes_1\":0,\"pants_1\":259,\"nose_4\":11,\"lipstick_1\":0,\"blemishes_2\":0,\"face_md_weight\":50,\"mask_1\":0,\"decals_1\":0,\"hair_1\":79,\"cheeks_2\":0,\"helmet_2\":0,\"chimp_3\":10,\"face_2\":0,\"eye_squint\":0,\"eyebrow_1\":10,\"blend_skin\":0,\"chain_2\":0,\"sun_1\":0,\"lip_thickness\":0,\"watches_1\":-1,\"face_3\":0,\"chest_1\":0,\"skin_2\":0,\"chin_2\":0,\"chest_3\":0,\"makeup_3\":0,\"eyebrows_5\":0,\"moles_1\":0,\"makeup_4\":0,\"nose_5\":4,\"chin_4\":0,\"neck\":10,\"arms_2\":0,\"chin_13\":0,\"nose_1\":0,\"mom\":21,\"mask_2\":0,\"neck_thickness\":0,\"pants_2\":3,\"nose_2\":0,\"blush_1\":0,\"shoes_2\":3,\"beard_4\":0,\"bodyb_3\":-1,\"chimp_2\":10,\"watches_2\":0,\"blush_2\":0,\"cheeks_3\":0,\"eyebrows_6\":0,\"hair_2\":0,\"eyebrows_3\":0,\"blend_face\":0,\"blend\":0,\"age_2\":0,\"bags_1\":0,\"torso_2\":0,\"lips\":10,\"bodyb_2\":0,\"lipstick_3\":0,\"makeup_1\":0,\"helmet_1\":-1,\"nose_3\":13,\"chain_1\":0,\"arms\":6,\"tshirt_2\":0,\"shoes_1\":254,\"chimp_4\":10,\"torso_1\":772,\"complexion_1\":0,\"chest_2\":0,\"ears_1\":-1,\"jaw_2\":0,\"eyebrow_2\":10,\"eyebrows_1\":0,\"glasses_1\":0,\"age_1\":0,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_1\":-1,\"face\":0,\"blush_3\":0,\"chimp_1\":10,\"chin_1\":0,\"beard_3\":0,\"eye_color\":0,\"skin\":3,\"hair_3\":0,\"lipstick_2\":0,\"eyebrows_4\":0,\"tshirt_1\":15,\"hair_color_2\":0,\"bracelets_2\":0,\"skin_md_weight\":50,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":45.64,\"val\":456400},{\"name\":\"thirst\",\"percent\":46.73,\"val\":467300}]', 0, 10, NULL, '2024-04-07 20:01:10', '2024-04-10 19:37:25', '3670077', NULL, NULL, '102', 0, 0, 0, 0, '', NULL, 'unemployed', '[]', '{\"condition\":43.29999999999988,\"strenght\":0.2,\"driving\":25.59999999999995,\"shooting\":8.49999999999997}');
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `status`, `is_dead`, `id`, `last_property`, `created_at`, `last_seen`, `phone_number`, `pincode`, `health`, `badge`, `armour`, `disabled`, `jail`, `dutyTime`, `job_id`, `tattoos`, `org`, `org_permissions`, `statistics`) VALUES
('char1:fbb5ee314bb87f08a217fed346c5d30907308527', '{\"money\":8848894,\"bank\":869650,\"black_money\":94139}', 'admin', '[{\"count\":1,\"name\":\"WEAPON_COMBATPISTOL\",\"metadata\":{\"ammo\":7,\"serial\":\"845968YQX469140\",\"registered\":\"Max Moonroe\",\"components\":[],\"durability\":69.80000000000048},\"slot\":1},{\"count\":1,\"name\":\"WEAPON_COMBATPDW\",\"metadata\":{\"ammo\":30,\"serial\":\"980493EFG662394\",\"registered\":\"Max Moonroe\",\"components\":[],\"durability\":98.80000000000008},\"slot\":2},{\"count\":1,\"name\":\"gps\",\"slot\":3},{\"count\":8848894,\"name\":\"money\",\"slot\":4},{\"count\":1,\"name\":\"danekarta\",\"slot\":5},{\"count\":1,\"name\":\"bodycam\",\"slot\":6},{\"count\":2,\"name\":\"water\",\"slot\":7},{\"count\":1,\"name\":\"phone\",\"slot\":8},{\"count\":1,\"name\":\"handcuffs\",\"slot\":9},{\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"durability\":100},\"slot\":10},{\"count\":1,\"name\":\"pustakarta\",\"slot\":11},{\"count\":94139,\"name\":\"black_money\",\"slot\":12},{\"count\":1,\"name\":\"moneywash_card\",\"slot\":13},{\"count\":1,\"name\":\"kamizelka\",\"slot\":14},{\"count\":4,\"name\":\"ammo-rifle\",\"slot\":15},{\"count\":1,\"name\":\"gps\",\"slot\":16},{\"count\":2,\"name\":\"radio\",\"slot\":19},{\"count\":1,\"name\":\"toolfixkit\",\"slot\":24},{\"count\":1,\"name\":\"toolcarokit\",\"slot\":25},{\"count\":1,\"name\":\"lockpick\",\"metadata\":{\"durability\":100},\"slot\":27},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"GED 932\"},\"slot\":31},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"2JU267HO\"},\"slot\":32},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"AYZ 690\"},\"slot\":33},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"KZS 858\"},\"slot\":34},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"8XA664TA\"},\"slot\":35},{\"count\":1,\"name\":\"carkey\",\"metadata\":{\"type\":\"8WB866EO\"},\"slot\":36}]', 'police', 1, '[]', NULL, '{\"z\":19.4901123046875,\"y\":-3122.18896484375,\"x\":563.5780029296875,\"heading\":0.0}', 'Max', 'Moonroe', '02/02/1999', 'm', 180, '{\"arms_2\":0,\"nose_6\":0,\"nose_2\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"chain_1\":294,\"neck_thickness\":0,\"neck\":10,\"nose_5\":0,\"torso_2\":4,\"watches_2\":0,\"watches_1\":-1,\"nose_4\":0,\"face_2\":0,\"mask_2\":5,\"bodyb_3\":-1,\"bracelets_2\":0,\"dad\":0,\"makeup_3\":0,\"bproof_1\":150,\"lipstick_2\":0,\"nose_3\":0,\"chin_4\":0,\"chimp_4\":10,\"eyebrows_6\":0,\"bags_2\":0,\"beard_4\":0,\"shoes_2\":0,\"faceFeatures\":{\"eyesOpening\":-1,\"chinBoneSize\":0,\"nosePeakHigh\":-1,\"noseBoneHigh\":-1,\"eyeBrownHigh\":0,\"neckThickness\":0,\"nosePeakSize\":-1,\"noseWidth\":-1,\"lipsThickness\":0,\"eyeBrownForward\":0,\"chinBoneLenght\":0,\"jawBoneBackSize\":0,\"cheeksWidth\":-1,\"chinBoneLowering\":0,\"cheeksBoneHigh\":-1,\"nosePeakLowering\":-1,\"noseBoneTwist\":-1,\"jawBoneWidth\":-1,\"cheeksBoneWidth\":-1,\"chinHole\":0},\"chin_2\":0,\"jaw_1\":0,\"blemishes_1\":0,\"chin_13\":0,\"lipstick_1\":0,\" arms_2\":0,\"eyebrows_3\":0,\"hair_color_1\":0,\"headOverlays\":{\"sunDamage\":{\"opacity\":0,\"style\":0,\"color\":0},\"eyebrows\":{\"opacity\":0,\"style\":0,\"color\":0},\"beard\":{\"opacity\":0,\"style\":0,\"color\":0},\"complexion\":{\"opacity\":0,\"style\":0,\"color\":0},\"moleAndFreckles\":{\"opacity\":0,\"style\":0,\"color\":0},\"blush\":{\"opacity\":0,\"style\":0,\"color\":0},\"lipstick\":{\"opacity\":0,\"style\":0,\"color\":0},\"makeUp\":{\"opacity\":0,\"style\":0,\"color\":0},\"blemishes\":{\"opacity\":0,\"style\":0,\"color\":0},\"chestHair\":{\"opacity\":0,\"style\":0,\"color\":0},\"bodyBlemishes\":{\"opacity\":0,\"style\":0,\"color\":0},\"ageing\":{\"opacity\":0,\"style\":0,\"color\":0}},\"moles_1\":0,\"makeup_2\":0,\"bags_1\":0,\"components\":[{\"component_id\":0,\"texture\":0,\"drawable\":0},{\"component_id\":1,\"texture\":0,\"drawable\":0},{\"component_id\":2,\"texture\":0,\"drawable\":0},{\"component_id\":3,\"texture\":0,\"drawable\":0},{\"component_id\":4,\"texture\":0,\"drawable\":159},{\"component_id\":5,\"texture\":0,\"drawable\":0},{\"component_id\":6,\"texture\":0,\"drawable\":25},{\"component_id\":7,\"texture\":0,\"drawable\":0},{\"component_id\":8,\"texture\":0,\"drawable\":15},{\"component_id\":9,\"texture\":0,\"drawable\":0},{\"component_id\":10,\"texture\":0,\"drawable\":0},{\"component_id\":11,\"texture\":1,\"drawable\":414}],\"hair_color_2\":0,\"beard_1\":0,\"lipstick_4\":0,\"decals_1\":0,\"lips\":10,\"complexion_1\":0,\"sun_1\":0,\"hair_1\":112,\"mom\":21,\"lipstick_3\":0,\"model\":\"mp_m_freemode_01\",\"eyebrows_5\":0,\"skin\":3,\"glasses_1\":0,\"chimp_1\":10,\"torso_1\":791,\"blend\":0,\"bodyb_4\":0,\"skin_3\":0,\"complexion_2\":0,\"eye_squint\":0,\"pants_1\":257,\"moles_2\":0,\"eyeColor\":0,\"face_3\":0,\"chimp_3\":10,\"headBlend\":{\"skinFirst\":0,\"shapeSecond\":0,\"skinSecond\":0,\"shapeFirst\":0,\"skinMix\":0,\"shapeMix\":0},\"eyebrow_2\":10,\"cheeks_3\":0,\"ears_2\":0,\"hair_3\":0,\"bodyb_1\":-1,\"nose_1\":0,\"jaw_2\":0,\"bproof_2\":0,\"chin_1\":0,\"hair\":{\"style\":0,\"highlight\":0,\"color\":0},\"cheeks_1\":0,\"chest_2\":0,\"blush_1\":0,\"helmet_1\":233,\"chest_1\":0,\"blush_3\":0,\"skin_2\":0,\"shoes_1\":217,\"helmet_2\":0,\"beard_2\":0,\"makeup_1\":0,\"cheeks_2\":0,\"makeup_4\":0,\"pants_2\":0,\"chain_2\":0,\"sun_2\":0,\"bodyb_2\":0,\"bracelets_1\":-1,\"tshirt_2\":0,\"chimp_2\":10,\"glasses_2\":0,\"props\":[{\"texture\":1,\"prop_id\":0,\"drawable\":184},{\"texture\":0,\"prop_id\":1,\"drawable\":0},{\"texture\":-1,\"prop_id\":2,\"drawable\":-1},{\"texture\":-1,\"prop_id\":6,\"drawable\":-1},{\"texture\":-1,\"prop_id\":7,\"drawable\":-1}],\"age_2\":0,\"skin_md_weight\":50,\"blend_face\":0,\"lip_thickness\":0,\"eyebrows_1\":0,\"sex\":0,\"blend_skin\":0,\"blush_2\":0,\"eye_color\":0,\"hair_2\":0,\"beard_3\":0,\"age_1\":0,\"eyebrows_2\":0,\"chest_3\":0,\"decals_2\":0,\"tshirt_1\":15,\"tattoos\":[],\"face_md_weight\":50,\"mask_1\":272,\"face\":0,\"blemishes_2\":0,\"arms\":0,\"eyebrow_1\":10}', '[{\"name\":\"drunk\",\"percent\":0.0,\"val\":0},{\"name\":\"hunger\",\"percent\":39.91,\"val\":399100},{\"name\":\"thirst\",\"percent\":42.4325,\"val\":424325}]', 0, 9, NULL, '2024-03-24 14:38:27', '2024-04-10 19:37:25', '9530023', NULL, 200, '69', 0, 0, 0, 0, '', '[]', 'ballas', '{\"fireMember\":true,\"safe\":true,\"noteAdd\":true,\"wardrobeRemove\":true,\"wardrobeOpen\":true,\"hireMembers\":true,\"wardrobeAdd\":true,\"upgrades\":true,\"permissionsManage\":true,\"warehouse\":true}', '{\"condition\":16.5,\"strenght\":0.8,\"driving\":0.7,\"shooting\":1.5}'),
('char2:030ec26b21f4602ea536b6d004cd108b2ad83fXX', '{\"bank\":50200,\"black_money\":0,\"money\":0}', 'admin', '[]', 'unemployed', 0, '[]', NULL, '{\"z\":56.7451171875,\"heading\":311.81103515625,\"x\":1128.1318359375,\"y\":-643.8461303710938}', 'Pedal', 'Pedal', '12/04/1997', 'm', 189, '{\"eyebrows_4\":0,\"hair_color_1\":61,\"lipstick_2\":0,\"nose_6\":0,\"chimp_4\":10,\"eyebrows_2\":0,\"bodyb_4\":0,\"makeup_1\":0,\"eye_squint\":0,\"bracelets_1\":-1,\"bproof_1\":0,\"sun_2\":0,\"skin_3\":0,\"cheeks_3\":6,\"torso_1\":43,\"hair_1\":76,\"bodyb_2\":0,\"sun_1\":0,\"blend_skin\":0,\"skin\":8,\"hair_color_2\":29,\"blush_1\":0,\"chest_3\":0,\"chin_4\":0,\"cheeks_2\":-10,\"bags_1\":0,\"ears_1\":-1,\"chin_13\":0,\"nose_3\":5,\"bracelets_2\":0,\"chest_2\":0,\"face\":0,\"blend\":0,\"moles_1\":0,\"glasses_1\":0,\"lips\":10,\"chain_1\":22,\"makeup_4\":0,\"blemishes_1\":0,\"chimp_1\":10,\"pants_1\":47,\"blend_face\":0,\"mask_2\":0,\"eyebrow_2\":10,\"makeup_3\":0,\"chimp_3\":10,\"pants_2\":0,\"tshirt_1\":15,\"neck\":10,\"hair_3\":2,\"tshirt_2\":0,\"eyebrow_1\":10,\"eye_color\":0,\"skin_2\":0,\"lip_thickness\":-2,\"jaw_1\":0,\"shoes_1\":12,\"nose_1\":-5,\"ears_2\":0,\"nose_5\":10,\"eyebrows_1\":0,\"torso_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"cheeks_1\":2,\"decals_2\":0,\"bproof_2\":0,\"beard_4\":0,\"arms\":11,\"watches_1\":-1,\"mask_1\":0,\"helmet_2\":0,\"neck_thickness\":0,\"beard_2\":10,\"chin_1\":0,\"chin_2\":0,\"makeup_2\":0,\"beard_3\":0,\"bodyb_3\":-1,\"dad\":29,\"lipstick_4\":0,\"moles_2\":0,\"blush_3\":0,\"age_1\":0,\"blemishes_2\":0,\"blush_2\":0,\"mom\":43,\"skin_md_weight\":27,\"complexion_1\":0,\"chest_1\":0,\"face_2\":0,\"shoes_2\":6,\"arms_2\":0,\"complexion_2\":0,\"sex\":0,\"nose_4\":8,\"bodyb_1\":-1,\"jaw_2\":0,\"hair_2\":0,\"eyebrows_6\":0,\"face_md_weight\":61,\"chain_2\":2,\"helmet_1\":-1,\"face_3\":0,\"chimp_2\":10,\"bags_2\":0,\"decals_1\":0,\"nose_2\":6,\"eyebrows_5\":0,\"glasses_2\":0,\"lipstick_3\":0,\"watches_2\":0,\"beard_1\":11,\"lipstick_1\":0}', '[]', 0, 4, NULL, '2023-09-30 12:04:47', '2023-11-14 20:08:57', '8340041', NULL, 200, '', 0, 0, 0, 0, '', NULL, 'unemployed', '{}', NULL),
('char2:774a6569fa5c22f519262d90560dfad85fc99c4f', '{\"bank\":28775,\"money\":981692,\"black_money\":0}', 'admin', '[{\"name\":\"WEAPON_PISTOL\",\"metadata\":{\"registered\":\"jacob globuz\",\"ammo\":11,\"durability\":38.70000000000349,\"serial\":\"151743FJR239085\",\"components\":[]},\"slot\":1,\"count\":1},{\"name\":\"WEAPON_STUNGUN\",\"metadata\":{\"registered\":\"jacob globuz\",\"serial\":\"503046POL960011\",\"durability\":100,\"components\":[]},\"slot\":2,\"count\":1},{\"name\":\"carkey\",\"metadata\":{\"type\":\"SWAT4\"},\"slot\":3,\"count\":1},{\"name\":\"carkey\",\"metadata\":{\"type\":\"ELO21\"},\"slot\":4,\"count\":1},{\"name\":\"fixkit\",\"slot\":5,\"count\":1},{\"name\":\"lockpick\",\"metadata\":{\"type\":1,\"durability\":100},\"slot\":6,\"count\":1},{\"name\":\"gps\",\"slot\":28,\"count\":1},{\"name\":\"handcuffs\",\"slot\":30,\"count\":1},{\"name\":\"money\",\"slot\":24,\"count\":981692},{\"name\":\"ammo-9\",\"slot\":25,\"count\":726},{\"name\":\"radio\",\"slot\":26,\"count\":1},{\"name\":\"bodycam\",\"slot\":27,\"count\":1}]', 'police', 15, '[]', NULL, '{\"x\":172.5230712890625,\"y\":-3032.663818359375,\"z\":5.2689208984375,\"heading\":280.6299133300781}', 'jacob', 'globuz', '04/04/1992', 'm', 200, '{\"complexion_1\":0,\"jaw_1\":0,\"hair_color_1\":15,\"chimp_4\":10,\"glasses_1\":25,\"moles_2\":0,\"decals_2\":0,\"skin_md_weight\":50,\"eyebrow_1\":10,\"beard_2\":0,\"ears_2\":0,\"complexion_2\":0,\"sex\":0,\"bodyb_2\":0,\"eyebrows_2\":0,\"lipstick_4\":0,\"bags_2\":0,\"glasses_2\":4,\"beard_1\":0,\"bodyb_4\":0,\"torso_2\":0,\"tshirt_1\":15,\"nose_4\":0,\"lipstick_1\":0,\"bracelets_2\":0,\"face_md_weight\":50,\"mask_1\":169,\"beard_4\":0,\"chimp_2\":10,\"torso_1\":817,\"watches_1\":-1,\"decals_1\":0,\"lips\":10,\"arms_2\":0,\"chest_3\":0,\"blend_skin\":0,\"chain_2\":0,\"chimp_3\":10,\"blend_face\":0,\"lipstick_2\":0,\"face_3\":0,\"chest_1\":0,\"skin_2\":0,\"hair_3\":0,\"hair_1\":24,\"lip_thickness\":0,\"dad\":0,\"moles_1\":0,\"makeup_4\":0,\"pants_1\":217,\"eyebrows_5\":0,\"nose_3\":0,\"helmet_2\":0,\"chin_13\":0,\"nose_1\":0,\"mom\":21,\"chain_1\":0,\"chimp_1\":10,\"pants_2\":0,\"nose_2\":0,\"blush_1\":0,\"shoes_2\":0,\"chin_2\":0,\"eyebrows_4\":0,\"chest_2\":0,\"watches_2\":0,\"blush_2\":0,\"cheeks_3\":0,\"bodyb_1\":-1,\"makeup_3\":0,\"eyebrows_3\":0,\"sun_2\":0,\"eye_color\":0,\"age_2\":0,\"skin_3\":0,\"bproof_1\":104,\"blush_3\":0,\"bags_1\":0,\"lipstick_3\":0,\"makeup_1\":0,\"neck\":10,\"chin_4\":0,\"nose_5\":0,\"arms\":0,\"tshirt_2\":0,\"shoes_1\":25,\"age_1\":0,\"nose_6\":0,\"sun_1\":0,\"helmet_1\":150,\"eye_squint\":0,\"blemishes_1\":0,\"eyebrow_2\":10,\"eyebrows_1\":0,\"face\":0,\"jaw_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"bracelets_1\":-1,\"blend\":0,\"cheeks_2\":0,\"face_2\":0,\"blemishes_2\":0,\"beard_3\":0,\"ears_1\":-1,\"skin\":1,\"bodyb_3\":-1,\"chin_1\":0,\"hair_2\":0,\"eyebrows_6\":0,\"hair_color_2\":0,\"neck_thickness\":0,\"mask_2\":13,\"cheeks_1\":0}', '[{\"name\":\"drunk\",\"val\":0,\"percent\":0.0},{\"name\":\"hunger\",\"val\":479100,\"percent\":47.91},{\"name\":\"thirst\",\"val\":484325,\"percent\":48.4325}]', 0, 13, NULL, '2024-04-07 20:38:49', '2024-04-10 18:15:57', '6950087', NULL, NULL, '101', 0, 0, 0, 0, '', NULL, 'ballas', '{\"fireMember\":true,\"safe\":true,\"noteAdd\":true,\"wardrobeRemove\":true,\"wardrobeOpen\":true,\"hireMembers\":true,\"wardrobeAdd\":true,\"upgrades\":true,\"permissionsManage\":true,\"warehouse\":true}', '{\"condition\":99.9,\"driving\":38.09999999999999,\"shooting\":91.30000000000021,\"strenght\":2.7}'),
('char3:030ec26b21f4602ea536b6d004cd108b2ad83fXX', '{\"black_money\":757,\"money\":34834481,\"bank\":1058480}', 'admin', '[{\"slot\":1,\"metadata\":{\"registered\":false,\"ammo\":12,\"durability\":89.39999999999992,\"components\":[]},\"name\":\"WEAPON_CERAMICPISTOL\",\"count\":1},{\"slot\":7,\"name\":\"phone\",\"count\":1},{\"slot\":8,\"name\":\"ammo-9\",\"count\":35},{\"slot\":16,\"name\":\"money\",\"count\":34834481},{\"slot\":17,\"name\":\"black_money\",\"count\":757},{\"slot\":6,\"metadata\":{\"type\":\"ADMINCAR\"},\"name\":\"carkey\",\"count\":1}]', 'unemployed', 0, '[]', NULL, '{\"heading\":85.03936767578125,\"z\":45.6072998046875,\"y\":2605.081298828125,\"x\":1851.032958984375}', 'Sernikov', 'Basepack', '12/04/1997', 'm', 189, '{\"skin_2\":0,\"lip_thickness\":0,\"decals_1\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"face\":0,\"blush_2\":0,\"nose_6\":0,\"decals_2\":0,\"hair_2\":0,\"blend\":0,\"complexion_1\":0,\"beard_2\":0,\"age_1\":0,\"mom\":21,\"blush_3\":0,\"chin_1\":0,\"eyebrow_2\":10,\"jaw_2\":0,\"sun_1\":0,\"skin_md_weight\":50,\"bodyb_3\":-1,\"hair_1\":73,\"bproof_1\":0,\"face_3\":0,\"blend_face\":0,\"lips\":10,\"helmet_2\":0,\"sun_2\":0,\"chest_2\":0,\"makeup_3\":0,\"watches_1\":-1,\"tshirt_2\":1,\"beard_3\":0,\"bodyb_1\":-1,\"chin_4\":0,\"chain_2\":0,\"chimp_3\":10,\"eye_color\":0,\"face_md_weight\":50,\"eyebrows_6\":0,\"jaw_1\":0,\"lipstick_3\":0,\"arms_2\":0,\"neck\":10,\"makeup_4\":0,\"shoes_1\":7,\"hair_color_1\":0,\"bproof_2\":0,\"beard_4\":0,\"chain_1\":0,\"complexion_2\":0,\"nose_1\":0,\"chimp_2\":10,\"watches_2\":0,\"lipstick_2\":0,\"hair_color_2\":0,\"bags_2\":0,\"skin\":8,\"shoes_2\":2,\"nose_2\":0,\"makeup_1\":0,\"pants_1\":1,\"eye_squint\":0,\"bracelets_1\":-1,\"helmet_1\":-1,\"lipstick_4\":0,\"mask_2\":0,\"dad\":0,\"nose_4\":0,\"chin_2\":0,\"nose_5\":0,\"chest_1\":0,\"blemishes_1\":0,\"nose_3\":0,\"torso_1\":403,\"cheeks_2\":0,\"bodyb_2\":0,\"tshirt_1\":0,\"bags_1\":0,\"cheeks_1\":0,\"lipstick_1\":0,\"bodyb_4\":0,\"neck_thickness\":0,\"hair_3\":1,\"glasses_1\":5,\"arms\":1,\"eyebrows_4\":0,\"eyebrow_1\":10,\"mask_1\":0,\"chin_13\":0,\"blemishes_2\":0,\"moles_2\":0,\"ears_2\":0,\"blush_1\":0,\"ears_1\":-1,\"eyebrows_2\":0,\"torso_2\":0,\"moles_1\":0,\"skin_3\":0,\"chimp_1\":10,\"glasses_2\":0,\"eyebrows_3\":0,\"age_2\":0,\"sex\":0,\"chimp_4\":10,\"chest_3\":0,\"blend_skin\":0,\"pants_2\":0,\"eyebrows_5\":0,\"cheeks_3\":0,\"bracelets_2\":0,\"beard_1\":0,\"face_2\":0}', '[{\"percent\":0.0,\"name\":\"drunk\",\"val\":0},{\"percent\":76.3,\"name\":\"hunger\",\"val\":763000},{\"percent\":82.22500000000001,\"name\":\"thirst\",\"val\":822250}]', 0, 7, NULL, '2023-11-14 20:20:09', '2024-04-07 21:11:28', '4600063', NULL, 200, '', 0, 0, 0, 0, '', NULL, 'unemployed', '{}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Dumping data for table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`, `grade`, `time`) VALUES
(0, 'drive_bike', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', NULL, -1),
(0, 'drive', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', NULL, -1),
(0, 'drive_truck', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', NULL, -1),
(0, 'test_psycho', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', NULL, -1),
(0, 'weapon', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', NULL, -1),
(0, 'pilot', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83f45', NULL, -1),
(0, 'drive_bike', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83fXX', NULL, -1),
(0, 'drive', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83fXX', NULL, -1),
(0, 'drive_truck', 'char1:030ec26b21f4602ea536b6d004cd108b2ad83fXX', NULL, -1),
(0, 'test_psycho', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'weapon', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'pilot', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'weapon', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'test_psycho', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'nnw', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'med', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'oc_insurance', 'char1:fbb5ee314bb87f08a217fed346c5d30907308527', NULL, -1),
(0, 'police_heli', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', NULL, -1),
(0, 'police_moto', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', NULL, -1),
(0, 'police_swat', 'char1:47e829a50c310da7daf10fd609fa36ba2710aab1', NULL, -1),
(0, 'oc_insurance', 'char1:f9c26edc4589062f2ca6c77463f8617f942f078a', NULL, -1),
(0, 'police_heli', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', NULL, -1),
(0, 'police_moto', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', NULL, -1),
(0, 'police_swat', 'char2:774a6569fa5c22f519262d90560dfad85fc99c4f', NULL, -1);

-- --------------------------------------------------------

--
-- Table structure for table `user_time_rank_police`
--

CREATE TABLE `user_time_rank_police` (
  `id` int(11) NOT NULL,
  `identifier` varchar(46) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
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
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
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
-- Table structure for table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `id` int(11) NOT NULL,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whitelist`
--

CREATE TABLE `whitelist` (
  `identifier` varchar(46) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

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
-- Indexes for table `banking`
--
ALTER TABLE `banking`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `dojmdt_judgments`
--
ALTER TABLE `dojmdt_judgments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dojmdt_kartoteka_notatki`
--
ALTER TABLE `dojmdt_kartoteka_notatki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dojmdt_notatki`
--
ALTER TABLE `dojmdt_notatki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `dojmdt_ogloszenia`
--
ALTER TABLE `dojmdt_ogloszenia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dojmdt_poszukiwani`
--
ALTER TABLE `dojmdt_poszukiwani`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dojmdt_raporty`
--
ALTER TABLE `dojmdt_raporty`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `lspdmdt_judgments`
--
ALTER TABLE `lspdmdt_judgments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lspdmdt_kartoteka_notatki`
--
ALTER TABLE `lspdmdt_kartoteka_notatki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lspdmdt_notatki`
--
ALTER TABLE `lspdmdt_notatki`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `lspdmdt_ogloszenia`
--
ALTER TABLE `lspdmdt_ogloszenia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lspdmdt_poszukiwani`
--
ALTER TABLE `lspdmdt_poszukiwani`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lspdmdt_raporty`
--
ALTER TABLE `lspdmdt_raporty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multichars_slots`
--
ALTER TABLE `multichars_slots`
  ADD PRIMARY KEY (`identifier`) USING BTREE,
  ADD KEY `slots` (`slots`) USING BTREE;

--
-- Indexes for table `organizations_clothes`
--
ALTER TABLE `organizations_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations_logs`
--
ALTER TABLE `organizations_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations_notes`
--
ALTER TABLE `organizations_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outfits`
--
ALTER TABLE `outfits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ox_inventory`
--
ALTER TABLE `ox_inventory`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Indexes for table `pefcl_accounts`
--
ALTER TABLE `pefcl_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD UNIQUE KEY `number_2` (`number`);

--
-- Indexes for table `pefcl_cash`
--
ALTER TABLE `pefcl_cash`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  ADD UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`);

--
-- Indexes for table `pefcl_external_accounts`
--
ALTER TABLE `pefcl_external_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`);

--
-- Indexes for table `pefcl_invoices`
--
ALTER TABLE `pefcl_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pefcl_shared_accounts`
--
ALTER TABLE `pefcl_shared_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accountId` (`accountId`);

--
-- Indexes for table `pefcl_transactions`
--
ALTER TABLE `pefcl_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `toAccountId` (`toAccountId`),
  ADD KEY `fromAccountId` (`fromAccountId`);

--
-- Indexes for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qf_mdt_annoucements`
--
ALTER TABLE `qf_mdt_annoucements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qf_mdt_fines`
--
ALTER TABLE `qf_mdt_fines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qf_mdt_jails`
--
ALTER TABLE `qf_mdt_jails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qf_mdt_notes`
--
ALTER TABLE `qf_mdt_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_points`
--
ALTER TABLE `queue_points`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  ADD KEY `FK_twitter_likes_twitter_tweets` (`tweetId`);

--
-- Indexes for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_twitter_tweets_twitter_accounts` (`authorId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_time_rank_police`
--
ALTER TABLE `user_time_rank_police`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banking`
--
ALTER TABLE `banking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `dojmdt_judgments`
--
ALTER TABLE `dojmdt_judgments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dojmdt_kartoteka_notatki`
--
ALTER TABLE `dojmdt_kartoteka_notatki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dojmdt_notatki`
--
ALTER TABLE `dojmdt_notatki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `dojmdt_ogloszenia`
--
ALTER TABLE `dojmdt_ogloszenia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dojmdt_poszukiwani`
--
ALTER TABLE `dojmdt_poszukiwani`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dojmdt_raporty`
--
ALTER TABLE `dojmdt_raporty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=715;

--
-- AUTO_INCREMENT for table `lspdmdt_judgments`
--
ALTER TABLE `lspdmdt_judgments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lspdmdt_kartoteka_notatki`
--
ALTER TABLE `lspdmdt_kartoteka_notatki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lspdmdt_notatki`
--
ALTER TABLE `lspdmdt_notatki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `lspdmdt_ogloszenia`
--
ALTER TABLE `lspdmdt_ogloszenia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lspdmdt_poszukiwani`
--
ALTER TABLE `lspdmdt_poszukiwani`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lspdmdt_raporty`
--
ALTER TABLE `lspdmdt_raporty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `outfits`
--
ALTER TABLE `outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ox_doorlock`
--
ALTER TABLE `ox_doorlock`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT for table `pefcl_accounts`
--
ALTER TABLE `pefcl_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pefcl_cash`
--
ALTER TABLE `pefcl_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pefcl_external_accounts`
--
ALTER TABLE `pefcl_external_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pefcl_invoices`
--
ALTER TABLE `pefcl_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pefcl_shared_accounts`
--
ALTER TABLE `pefcl_shared_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pefcl_transactions`
--
ALTER TABLE `pefcl_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `qf_mdt_annoucements`
--
ALTER TABLE `qf_mdt_annoucements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qf_mdt_fines`
--
ALTER TABLE `qf_mdt_fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qf_mdt_jails`
--
ALTER TABLE `qf_mdt_jails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `qf_mdt_notes`
--
ALTER TABLE `qf_mdt_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_time_rank_police`
--
ALTER TABLE `user_time_rank_police`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pefcl_shared_accounts`
--
ALTER TABLE `pefcl_shared_accounts`
  ADD CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pefcl_transactions`
--
ALTER TABLE `pefcl_transactions`
  ADD CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `twitter_likes`
--
ALTER TABLE `twitter_likes`
  ADD CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `twitter_tweets`
--
ALTER TABLE `twitter_tweets`
  ADD CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
