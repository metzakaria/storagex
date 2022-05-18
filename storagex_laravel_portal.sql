-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2022 at 11:21 AM
-- Server version: 10.3.34-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storagex_laravel_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_types`
--

INSERT INTO `asset_types` (`id`, `name`) VALUES
(1, 'Warehouse'),
(2, 'Solar Dryers'),
(3, 'Silos'),
(4, 'Cold Storage');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `short_name`) VALUES
(1, 'Access bank', 'Access');

-- --------------------------------------------------------

--
-- Table structure for table `bill_payments`
--

CREATE TABLE `bill_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `bill_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_paid` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commodities`
--

CREATE TABLE `commodities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commodities`
--

INSERT INTO `commodities` (`id`, `code`, `name`, `unit_measure`, `created_at`, `updated_at`) VALUES
(1, 'MAZ', 'Maize', 'kg', NULL, NULL),
(2, 'RCE', 'Rice', 'kg', NULL, NULL),
(3, 'SBN', 'SOYA BEAN', 'kg', NULL, NULL),
(4, 'SGM', 'Sorghum', 'kg', NULL, NULL),
(5, 'PML', 'Palm Oil', 'Ltr', NULL, NULL),
(14, 'CCA', 'Cocoa', 'kg', NULL, NULL),
(15, 'BNS', 'Beans', 'kg', NULL, NULL),
(16, 'BBN', 'Bambara Nut', 'kg', NULL, NULL),
(17, 'TMS', 'Tomatoes', 'kg', NULL, NULL),
(18, 'PPR', 'Pepper', 'kg', NULL, NULL),
(19, 'ONS', 'Onions', 'kg', NULL, NULL),
(20, 'YAM', 'Yam', 'kg', NULL, NULL),
(21, 'IPS', 'Irish Potatoes', 'kg', NULL, NULL),
(22, 'SPS', 'Sweet Potatoes', 'kg', NULL, NULL),
(23, 'WHT', 'Wheat', 'Kg', '2022-02-25 16:14:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `debit_cards`
--

CREATE TABLE `debit_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `cvv` varchar(5) DEFAULT NULL,
  `issuing_bank` int(11) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `datecreated` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `debit_cards`
--

INSERT INTO `debit_cards` (`id`, `member_id`, `card_no`, `expire`, `cvv`, `issuing_bank`, `card_type`, `datecreated`) VALUES
(1, 18, '1234567890987654', '07/22', '234', 1, 'Visa', '2021-10-22 22:02:43'),
(2, 25, '1234567890987654', '07/22', '234', 1, 'Visa', '2021-11-20 15:24:30'),
(3, 23, '1234567890987654', '12/20', '255', 1, 'Visa', '2021-11-26 07:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg_number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `lga_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `produce_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farmers`
--

INSERT INTO `farmers` (`id`, `reg_number`, `full_name`, `state_id`, `lga_id`, `location_id`, `photo`, `email`, `mobile`, `address`, `produce_description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '01', 'Haruna Garba', NULL, NULL, 10, '1.jpg', NULL, '08029071488', 'Kurjale', 'G/CORN', NULL, NULL, NULL),
(2, '2', 'Helen Ben John', NULL, NULL, 10, '2.jpg', 'helenbenjohn1@gmail.com', '08065589409', 'Tadp road', 'Rice', NULL, NULL, NULL),
(3, '3', 'Yakubu Shehu', NULL, NULL, 10, '3.jpg', NULL, '08034259527', 'Ahmadu A Karim lga', 'Rice', NULL, NULL, NULL),
(4, '4', 'Usman Danladi', NULL, NULL, 10, '4.jpg', NULL, '07067792665', 'Vtc', 'Rice', NULL, NULL, NULL),
(6, '6', 'Bala Kure', NULL, NULL, 10, NULL, NULL, '07015860224', 'AA wase', 'Rice', NULL, NULL, NULL),
(7, '6', 'Yohanna Danjuma', NULL, NULL, 10, '7.jpg', NULL, '09020451939', 'Anguwan Mission', 'Maize', NULL, NULL, NULL),
(8, '7', 'Musa A. Ajuji', NULL, NULL, 10, '8.jpg', NULL, '08065971954', 'Usmanu anguwan wali', 'Maize', NULL, NULL, NULL),
(9, '8', 'Lazarus Yakubu Shehu', NULL, NULL, 10, '9.jpg', NULL, '08148683456', 'Ahmadu A', 'Rice', NULL, NULL, NULL),
(10, '9', 'Mohammed Gambo', NULL, NULL, 10, '10.jpg', NULL, '08088816689', 'Step 2', 'Maize', NULL, NULL, NULL),
(11, '10', 'Yusuf D. Idris', NULL, NULL, 10, '11.jpg', NULL, '09124593320', 'Anguwan Jobda', 'Maize', NULL, NULL, NULL),
(12, '11', 'Yunana Dandoka', NULL, NULL, 10, '12.jpg', NULL, '08165375171', 'Jobs B', 'Rice', NULL, NULL, NULL),
(13, '12', 'Titus Ahmed', NULL, NULL, 10, '13.jpg', NULL, '07042234431', 'lewata', 'Rice', NULL, NULL, NULL),
(16, '13', 'Umaru Ezra', NULL, NULL, 10, '16.jpg', NULL, '07034951869', 'Anguwan Gabas', 'Rice', NULL, NULL, NULL),
(17, '14', 'Vestina Z. Andrew', NULL, NULL, 10, '17.jpg', NULL, '07064723178', 'Anguwan Giwa Tafadi', 'Rice', NULL, NULL, NULL),
(18, '15', 'Umar Jibril Baraya', NULL, NULL, 10, '18.jpg', NULL, '08122440745', 'Jobai A', 'Beans', NULL, NULL, NULL),
(19, '16', 'Geoffrey B. Raymond', NULL, NULL, 10, '19.jpg', NULL, '07037677800', 'Anguwan Mission', 'Rice', NULL, NULL, NULL),
(20, '17', 'Jonah Ali', NULL, NULL, 10, '20.jpg', NULL, '07068132372', 'Anguwan Mission', 'Rice', NULL, NULL, NULL),
(21, '18', 'Auta Bala', NULL, NULL, 10, '21.jpg', NULL, '09030921575', 'Bayan sabon Kasuwa', 'Rice', NULL, NULL, NULL),
(22, '19', 'Bappa Adamu', NULL, NULL, 10, '22.jpg', NULL, '07060998162', 'Anguwan Lo', 'Rice', NULL, NULL, NULL),
(23, '20', 'Kidaya Yunana', NULL, NULL, 10, '23.jpg', NULL, '07011966418', 'Anguwan Jobs.B.', 'Rice', NULL, NULL, NULL),
(24, '21', 'Gladson Ishaku', NULL, NULL, 10, '24.jpg', NULL, '09060510933', 'Anguwan Ahmadu B', 'Rice', NULL, NULL, NULL),
(25, '22', 'Justina Umaru', NULL, NULL, 10, NULL, NULL, '07034951869', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(26, '23', 'Saidu Barde Vawi', NULL, NULL, 10, '26.jpg', NULL, '08135713937', 'Anguwan Mission', 'Rice', NULL, NULL, NULL),
(27, '25', 'Joseph Alhassan', NULL, NULL, 10, '27.jpg', NULL, '09138678341', 'Waka', 'Rice', NULL, NULL, NULL),
(28, '24', 'Mary Bako', NULL, NULL, 10, '28.jpg', NULL, '09063590806', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(29, '26', 'Madaki Likita', NULL, NULL, 10, '29.jpg', NULL, '08114492658', 'Anguwa waka', 'Rice', NULL, NULL, NULL),
(30, '27', 'Gali Y. Bazo', NULL, NULL, 10, '30.jpg', NULL, '08145945371', 'Anguwa Giwa', 'Rice', NULL, NULL, NULL),
(31, '28', 'Fumi Obidah', NULL, NULL, 10, '31.jpg', NULL, '07014145084', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(32, '29', 'Litini Hussaini', NULL, NULL, 10, '32.jpg', NULL, '09039701943', 'Ahmadu A', 'Rice', NULL, NULL, NULL),
(33, '30', 'Jude Danliti Danjuma', NULL, NULL, 10, '33.jpg', NULL, '08164176031', 'Anguwa Giwa', 'Rice', NULL, NULL, NULL),
(36, '31', 'Topri Goni Munga', NULL, NULL, 10, '36.jpg', NULL, '08134103800', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(40, '32', 'Daniel Umaru', NULL, NULL, 10, '40.jpg', NULL, '08067694831', 'Waka', 'Guineacorn', NULL, NULL, NULL),
(41, '33', 'Abubakar Yahaya', NULL, NULL, 10, '41.jpg', NULL, '07069992573', 'Aguwan yidi', 'Rice', NULL, NULL, NULL),
(42, '34', 'Shehu Abdullahi', NULL, NULL, 10, '42.jpg', NULL, '08101859576', 'Anguwan Maikasada', 'Rice', NULL, NULL, NULL),
(45, '35', 'Ruth Daboh', NULL, NULL, 10, '45.jpg', NULL, '09033993041', 'Sabin Kasuwa', 'Rice', NULL, NULL, NULL),
(46, '36', 'Martina Solomon', NULL, NULL, 10, '46.jpg', NULL, '09139111335', 'Sabin Kasuwa', 'Rice', NULL, NULL, NULL),
(47, '37', 'Janet Mustapha Salla', NULL, NULL, 10, '47.jpg', NULL, '09034991348', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(48, '38', 'Juliana Ishaku Ezra', NULL, NULL, 10, '48.jpg', NULL, '09013183860', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(50, '39', 'Maryam Umaru', NULL, NULL, 10, '50.jpg', NULL, '09137740555', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(51, '40', 'Mohammed Jafaru', NULL, NULL, 10, '51.jpg', NULL, '08105580522', 'Anguwan Ahmadu B', 'Soya beans', NULL, NULL, NULL),
(52, '41', 'Abdulhamid Umar', NULL, NULL, 10, '52.jpg', NULL, '08065430159', 'Ahmadu A', 'Maize', NULL, NULL, NULL),
(53, '42', 'Yusuf  Ahmed', NULL, NULL, 10, '53.jpg', NULL, '09027779482', 'Anguwan kwall', 'Maize', NULL, NULL, NULL),
(54, '43', 'Organizer Goni', NULL, NULL, 10, '54.jpg', NULL, '08133389402', 'Anguwan gabas', 'Maize', NULL, NULL, NULL),
(55, '44', 'Simon Tiwa', NULL, NULL, 10, '55.jpg', NULL, '08030828735', 'Anguwan gabas', 'Rice, Guinea corn', NULL, NULL, NULL),
(56, '45', 'Cosmas Joseph', NULL, NULL, 10, '56.jpg', NULL, '08106089339', 'Anguwan gabas', 'Rice, Guinea corn', NULL, NULL, NULL),
(57, '46', 'Lucy Bala', NULL, NULL, 10, '57.jpg', NULL, '07069369980', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(58, '47', 'Kanga Chiva', NULL, NULL, 10, '58.jpg', NULL, '08030828735', 'Anguwan gabas', 'Soya beans Rice', NULL, NULL, NULL),
(59, '48', 'Philip Godwin', NULL, NULL, 10, '59.jpg', NULL, '09044521945', 'Anguwan gabas', 'Maize Rice', NULL, NULL, NULL),
(60, '49', 'Friday Isa', NULL, NULL, 10, '60.jpg', NULL, '08127686224', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(61, '50', 'Hafiza Abdulhamid', NULL, NULL, 10, '61.jpg', NULL, '07048950077', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(62, '51', 'Karimatu Abdulkarim', NULL, NULL, 10, '62.jpg', NULL, '07036490865', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(63, '52', 'Shagari Adara', NULL, NULL, 10, '63.jpg', NULL, '09064787052', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(65, '53', 'Jeremiah Ishaku', NULL, NULL, 10, '65.jpg', NULL, '08163250866', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(66, '54', 'David Lamo', NULL, NULL, 10, '66.jpg', NULL, '07084633489', 'Anguwan gabas', 'Maize', NULL, NULL, NULL),
(67, '56', 'Asmau Umaru', NULL, NULL, 10, '67.jpg', NULL, '09066124853', 'Anguwan gabas', 'Soyabeans, Beniseed', NULL, NULL, NULL),
(68, '57', 'Hapsatu Adamu', NULL, NULL, 10, '68.jpg', NULL, '07089209630', 'Ahmadu A', 'Rice', NULL, NULL, NULL),
(69, '58', 'Grace Organizer', NULL, NULL, 10, '69.jpg', NULL, '08068103730', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(70, '59', 'Joseph Julde', NULL, NULL, 10, '70.jpg', NULL, '08164568410', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(71, '60', 'Danjuma Sule', NULL, NULL, 10, '71.jpg', NULL, '08027483624', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(72, '61', 'Abbas Hassan', NULL, NULL, 10, '72.jpg', NULL, '07085628484', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(73, '62', 'Ruth Dickson', NULL, NULL, 10, '73.jpg', NULL, '08061208528', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(74, '63', 'Sarauniya Samuel', NULL, NULL, 10, '74.jpg', NULL, '07039009232', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(75, '63', 'Solomon Kefas', NULL, NULL, 10, '75.jpg', NULL, '07030404281', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(76, '64', 'Jacob Ibrahim', NULL, NULL, 10, '76.jpg', NULL, '08128228052', 'Step 1', 'Rice, Maize', NULL, NULL, NULL),
(77, '65', 'Hassan Francis', NULL, NULL, 10, '77.jpg', NULL, '07030432031', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(78, '66', 'Alpher Kefas', NULL, NULL, 10, '78.jpg', NULL, '07064766399', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(79, '67', 'Nehemiah Bitrus', NULL, NULL, 10, '79.jpg', NULL, '09136646634', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(80, '68', 'Meshach Dickson', NULL, NULL, 10, '80.jpg', NULL, '08133547056', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(81, '69', 'Samuel Johnson', NULL, NULL, 10, '81.jpg', NULL, '07033347256', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(82, '70', 'Mohammed Abdulhamid', NULL, NULL, 10, '82.jpg', NULL, '07037423772', 'Anguwan gabas', 'Rice', NULL, NULL, NULL),
(83, '71', 'Nelson Langa', NULL, NULL, 10, '83.jpg', NULL, '08028177274', 'Anguwan gabas', 'Rice, Guinea corn', NULL, NULL, NULL),
(84, '72', 'Monica Cosmos', NULL, NULL, 10, '84.jpg', NULL, '08106089339', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(85, '73', 'Dickson Fanish', NULL, NULL, 10, '85.jpg', NULL, '07013430976', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(86, '74', 'Ubaida Ahmed', NULL, NULL, 10, '86.jpg', NULL, '08149654027', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(87, '75', 'Hamidu Usman', NULL, NULL, 10, '87.jpg', NULL, '08134687020', 'Ahmadu A', 'Rice, Maize', NULL, NULL, NULL),
(88, '75', 'Hamidu Usman', NULL, NULL, 10, '88.jpg', NULL, '08134687020', 'Ahmadu A', 'Rice, Maize', NULL, NULL, NULL),
(89, '76', 'Saratu Iliyasu', NULL, NULL, 10, '89.jpg', NULL, '07034831483', 'Anguwan gabas', 'Rice,', NULL, NULL, NULL),
(90, '76', 'Dudu Jibril', NULL, NULL, 10, '90.jpg', NULL, '07017128612', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(91, '77', 'Zakaria Jibril', NULL, NULL, 10, '91.jpg', NULL, '08164957963', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(92, '77', 'Grace Jibril', NULL, NULL, 10, '92.jpg', NULL, '07012485081', 'Anguwan gabas', 'Rice, Maize', NULL, NULL, NULL),
(93, '78', 'Aminu Ibrahim', NULL, NULL, 10, '93.jpg', NULL, '07088149097', 'Madakan Kifi', 'Rice, Maize', NULL, NULL, NULL),
(94, '78', 'Sabo Ezra', NULL, NULL, 10, '94.jpg', NULL, '08145694661', 'Anguwan kwall', 'Rice, Maize', NULL, NULL, NULL),
(95, '79', 'Zabura Jonah', NULL, NULL, 10, '95.jpg', NULL, '08161561405', 'Kaigama', 'Rice, Maize', NULL, NULL, NULL),
(96, '80', 'Douglass Aminu', NULL, NULL, 10, '96.jpg', NULL, '08103368022', 'Madakan Kifi', 'Rice, Maize', NULL, NULL, NULL),
(97, '80', 'Douglass Aminu', NULL, NULL, 10, '97.jpg', NULL, '08103368022', 'Madakan Kifi', 'Rice, Maize', NULL, NULL, NULL),
(98, '81', 'Markus Jatau', NULL, NULL, 10, '98.jpg', NULL, '08107106706', 'Kaigama', 'Rice, Maize', NULL, NULL, NULL),
(99, '82', 'Yayirus Kadiri', NULL, NULL, 10, '99.jpg', NULL, '08147846383', 'Gaton', 'Rice, Maize', NULL, NULL, NULL),
(100, '83', 'Joshua Agabus', NULL, NULL, 10, '100.jpg', NULL, '08103355072', 'Dakata', 'Rice, Maize', NULL, NULL, NULL),
(101, '83', 'Joshua Agabus', NULL, NULL, 10, '101.jpg', NULL, '08103355072', 'Dakata', 'Rice, Maize', NULL, NULL, NULL),
(102, '84', 'Adamu Ali', NULL, NULL, 10, '102.jpg', NULL, '08084751321', 'Dakata', 'Rice, Maize', NULL, NULL, NULL),
(103, '85', 'Shawulu Ezra', NULL, NULL, 10, '103.jpg', NULL, '07060564690', 'Anguwan kwall', 'Rice, Maize', NULL, NULL, NULL),
(104, '86', 'Mohammed Y. Hassan', NULL, NULL, 10, '104.jpg', NULL, '07015610433', 'Madakan Kifi', 'Rice, Maize', NULL, NULL, NULL),
(105, '5rtiop', 'test fam', NULL, NULL, 2, '105.jpg', 'tes@maill.com', '0927578342', NULL, 'skndm,f', NULL, NULL, NULL),
(106, '01', 'Rev J.p kawuwa', NULL, NULL, 11, NULL, 'kawuwajp@gmail.com', '08168041541', 'Gombe', 'Maize', NULL, NULL, NULL),
(107, '02', 'Joshua lonis', NULL, NULL, 11, NULL, 'lonisjoshua3@gmail.com', '08162525582', 'Gombe', 'Maize ,Rice,', NULL, NULL, NULL),
(108, '96', 'Abdul-razaq Ahmad', NULL, NULL, 10, '108.jpg', 'abdul080301120@gmail.com', '07037899191', 'No 4 Kashimbila Street Wukari', 'Rice', NULL, NULL, NULL),
(109, '97', 'Mudassir Sidi Musa', NULL, NULL, 10, '109.jpg', 'radmudassir071@gmail.com', '07064278977', 'Side Musa Resident, Chinkai', 'Rice', NULL, NULL, NULL),
(110, '98', 'Ali Yusuf', NULL, NULL, 10, '110.jpg', 'aliyusuf@gmail.com', '08102827380', 'No 29 Sokoto Street, Wukari', 'Maize', NULL, NULL, NULL),
(111, '99', 'Mohammed Usman', NULL, NULL, 10, '111.jpg', 'mk8121908@gmail.com', '08039677824', 'Opposite Fast track hotel, No 9, Muslim council area jalingo', 'Soya Beans', NULL, NULL, NULL),
(112, '567', 'Olajide Johnson', NULL, NULL, 8, NULL, NULL, '070456981745', 'Niger State', 'Soya Bean', NULL, NULL, NULL),
(113, '001', 'Eunice Briska', NULL, NULL, 11, NULL, 'eunicebriska@ail.com', '08163252698', 'Ganye LGA', 'Soya beans', NULL, NULL, NULL),
(114, '001', 'Alh Hassan Usman', NULL, NULL, 8, NULL, 'hassanshiroro@gmail.co', '0803 452 4357', 'Niger state', 'Maize, Rice,Millet, guineacorn', NULL, NULL, NULL),
(115, '010', 'Victoria Yerima', NULL, NULL, 12, NULL, 'yahuzaharunamalbangs@gmail.com', '07031582950', 'Billiri, Gombe', 'Maize', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `farmer_storages`
--

CREATE TABLE `farmer_storages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `ware_house_id` int(11) DEFAULT NULL,
  `commodity_id` int(11) DEFAULT NULL,
  `qty` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_receipt_generated` timestamp NULL DEFAULT current_timestamp(),
  `is_removed` tinyint(1) NOT NULL DEFAULT 0,
  `date_removed` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farmer_storages`
--

INSERT INTO `farmer_storages` (`id`, `farmer_id`, `ware_house_id`, `commodity_id`, `qty`, `price`, `value_amount`, `receipt`, `date_receipt_generated`, `is_removed`, `date_removed`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 113, 2, 3, '1006.20', '360', '362232', 'SXEWR 001 SBN 250222 GOM 1006.20', '2022-02-25 16:16:49', 0, NULL, 1, '2022-02-25 16:16:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `lga_id` int(11) DEFAULT NULL,
  `created_menber` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `state_id`, `lga_id`, `created_menber`, `created_at`, `updated_at`) VALUES
(1, 'General Announcement', NULL, NULL, NULL, NULL, NULL),
(2, 'Announcement', NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `group_owner_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_msgs`
--

CREATE TABLE `group_msgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_menber` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_msgs`
--

INSERT INTO `group_msgs` (`id`, `group_id`, `message`, `created_menber`, `created_at`, `updated_at`) VALUES
(1, 1, 'Testing announcement', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_msg_replies`
--

CREATE TABLE `group_msg_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_msg_id` int(11) DEFAULT NULL,
  `replied_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `replied_member` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `group_msg_replies`
--

INSERT INTO `group_msg_replies` (`id`, `group_msg_id`, `replied_message`, `replied_member`, `created_at`, `updated_at`) VALUES
(1, 1, 'This is reply to the first message', 19, '2021-12-20 11:36:58', NULL),
(2, 1, 'Another reply to the first message and now', 20, '2021-12-20 11:37:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `identity_types`
--

CREATE TABLE `identity_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identity_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `identity_types`
--

INSERT INTO `identity_types` (`id`, `identity_name`) VALUES
(1, 'Voter Card'),
(2, 'NIN'),
(3, 'Driver Licience'),
(4, 'Int. passport ');

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invest_product_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `qty_bought` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amt_bought` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_invest` timestamp NOT NULL DEFAULT current_timestamp(),
  `expect_amt_return` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_auctioned` tinyint(1) NOT NULL DEFAULT 0,
  `auction_id` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `t_n_c` tinyint(4) DEFAULT 0,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `invest_product_id`, `member_id`, `qty_bought`, `amt_bought`, `date_invest`, `expect_amt_return`, `is_auctioned`, `auction_id`, `created_at`, `updated_at`, `t_n_c`, `payment_method`) VALUES
(1, 1, 18, '2', '100', '2021-10-18 21:44:56', '1', 1, NULL, NULL, NULL, 0, NULL),
(2, 2, 19, '2', '2', '2021-10-18 21:45:18', '2', 0, NULL, NULL, NULL, 0, NULL),
(3, 1, 18, '5', '90', '2021-10-19 11:48:30', NULL, 0, NULL, NULL, NULL, 1, NULL),
(4, 1, 19, '18', '8', '2021-10-20 21:43:42', '150.88695652174', 1, 1, NULL, NULL, 1, '2'),
(5, 1, 18, '5', '90', '2021-11-26 03:38:50', NULL, 0, 0, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `investment_auctions`
--

CREATE TABLE `investment_auctions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `investment_id` int(11) NOT NULL,
  `invest_product_id` int(11) NOT NULL DEFAULT 0,
  `qty_offer` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_amount` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `date_sold` timestamp NULL DEFAULT NULL,
  `boughtby_member` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `offer_close_at` datetime DEFAULT NULL,
  `t_n_c` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investment_auctions`
--

INSERT INTO `investment_auctions` (`id`, `investment_id`, `invest_product_id`, `qty_offer`, `unit_amount`, `total_amount`, `is_sold`, `date_sold`, `boughtby_member`, `date_created`, `offer_close_at`, `t_n_c`) VALUES
(1, 1, 1, '18', '18', '8', 1, '2021-10-20 20:43:42', 19, '2021-10-19 14:41:15', '2021-10-18 21:45:10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `investment_products`
--

CREATE TABLE `investment_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invest_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_interest` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_sold` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `mature_date` date DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insurance` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_auctionable` tinyint(4) DEFAULT 1,
  `provided_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_matured` tinyint(4) DEFAULT 0,
  `investors` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investment_products`
--

INSERT INTO `investment_products` (`id`, `name`, `description`, `invest_type`, `unit_interest`, `unit_amount`, `quantity`, `image_file`, `qty_sold`, `is_active`, `created_by`, `start_date`, `mature_date`, `location`, `insurance`, `created_at`, `updated_at`, `is_auctionable`, `provided_by`, `is_matured`, `investors`) VALUES
(1, 'Warehouse Receipts', 'Receipt from where house and its provided by bla bla bla', 'fixed income', '10', '5000', '200', NULL, '0', 0, 1, '2021-10-08', '2021-10-31', NULL, NULL, NULL, NULL, 1, NULL, 0, NULL),
(2, 'My New Investmen', 'This is investment by ceebug technology', 'Fixed', '15', '500', '20', '2.jpg', '0', 0, NULL, '2021-11-17', '2021-12-31', '3', 'Leadway Insurance', NULL, NULL, 1, 'CeeBug Technology', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lgas`
--

CREATE TABLE `lgas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shortname` varchar(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `shortname`, `created_at`, `updated_at`) VALUES
(1, 'Saki', 'SKI', '2021-10-27 14:50:54', NULL),
(2, 'Kaduna', 'KDA', '2021-10-27 14:50:54', NULL),
(3, 'Kano', 'KNO', '2021-10-27 14:50:54', NULL),
(4, 'Markudi', 'MKI', '2021-10-27 14:52:55', NULL),
(5, 'Iseyin', 'ISN', '2021-10-27 14:52:55', NULL),
(6, 'Akure', 'AKE', '2021-10-27 14:52:55', NULL),
(7, 'Abakiliki', 'AKI', '2021-10-27 14:52:55', NULL),
(8, 'Minna', 'MNA', '2021-10-27 14:52:55', NULL),
(9, 'Umuahia', 'UAA', '2021-10-27 14:52:55', NULL),
(10, 'Taraba', 'TRB', '2021-12-15 14:01:58', NULL),
(11, 'Adamawa', 'ADW', '2021-12-15 14:01:58', NULL),
(12, 'Gombe', 'GOM', '2022-01-03 11:22:42', NULL),
(13, 'Bauchi', 'BAU', '2022-01-03 11:22:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `lga_id` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_ans` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bvn` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `account_no` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `dob` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type_id` int(11) DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `referral_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_bal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `prev_bal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cur_invest_bal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `prev_invest_bal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `storagex_bank_id` int(11) DEFAULT NULL,
  `storagex_acct_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_wallet_bal` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `full_name`, `state_id`, `lga_id`, `photo`, `email`, `mobile`, `address`, `security_question`, `security_ans`, `bvn`, `bank_id`, `account_no`, `account_name`, `is_verified`, `dob`, `identity_type_id`, `identity_image`, `is_active`, `is_deleted`, `referral_code`, `cur_bal`, `prev_bal`, `user_id`, `created_at`, `updated_at`, `cur_invest_bal`, `prev_invest_bal`, `storagex_bank_id`, `storagex_acct_no`, `disable_wallet_bal`) VALUES
(17, '  ', NULL, NULL, NULL, 'mo@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'VGBRW', '0', '0', 18, '2021-10-17 10:05:18', '2021-10-17 10:05:18', NULL, NULL, NULL, NULL, 0),
(18, 'zakarioh', 1, 1, 'phtoh', 'mox@gmailx.com', 'moxhm', 'moham', 'moham', 'moham', 'moham', 1, '1234567890', 'zak are', 0, 'moham', 1, '8849484', 1, 0, 'K6PCB', '101', '1', 19, '2021-10-17 10:07:49', '2021-10-22 20:47:27', '0', '100', NULL, NULL, 0),
(19, 'zakari moh', NULL, NULL, NULL, 'm@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'L6FLG', '0', '0', 20, '2021-10-17 10:09:02', '2021-10-17 10:09:02', NULL, NULL, NULL, NULL, 0),
(20, 'zakari mohammed omeh', NULL, NULL, NULL, 'mc@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'FU0RL', '0', '0', 21, '2021-10-17 10:09:49', '2021-10-17 10:09:49', NULL, NULL, NULL, NULL, 0),
(21, 'zakari mohammed omeh', NULL, NULL, NULL, 'mcx@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'PWII8', '0', '0', 22, '2021-10-17 10:13:38', '2021-10-17 10:13:38', NULL, NULL, NULL, NULL, 0),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, '0', '0', NULL, '2021-10-20 20:42:46', '2021-10-20 20:42:46', '0', '0', NULL, NULL, 0),
(23, 'Olajide Johnson', NULL, NULL, NULL, 'maintain@maintain.com', NULL, 'dfggvb', 'gggg', 'maintain', '225555888', NULL, NULL, NULL, 0, '0', NULL, NULL, 1, 0, '62OAE', '0', '0', 23, '2021-11-08 15:31:26', '2021-11-08 15:31:26', '0', '0', NULL, NULL, 0),
(25, 'AdeKola', NULL, NULL, NULL, 'maintain@maintain.coms', NULL, NULL, '5364', '5364', NULL, 1, '1234567890', 'zak are', 0, NULL, NULL, NULL, 1, 0, 'XJVTJ', '0', '0', 25, NULL, NULL, '0', '0', NULL, NULL, 0),
(26, 'kola', NULL, NULL, NULL, 'schindlerjosem@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'EFSI9', '0', '0', 26, NULL, NULL, '0', '0', NULL, NULL, 0),
(28, 'AdeKola', NULL, NULL, NULL, 'maintain@maintain.comss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, '8NHAA', '0', '0', 28, NULL, NULL, '0', '0', NULL, NULL, 0),
(29, 'lambo', NULL, NULL, NULL, 'lambo@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'PVDSP', '0', '0', 29, NULL, NULL, '0', '0', NULL, NULL, 0),
(30, 'zakari mohammed omeh', NULL, NULL, NULL, 'mcz@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'X4QZO', '0', '0', 30, NULL, NULL, '0', '0', NULL, NULL, 0),
(31, 'zakari mohammed omeh', NULL, NULL, NULL, 'mcz@gmailxcom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'XIRU5', '0', '0', 31, NULL, NULL, '0', '0', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_fees`
--

CREATE TABLE `membership_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membership_fees`
--

INSERT INTO `membership_fees` (`id`, `member_id`, `amount`, `start_date`, `end_date`, `date_created`) VALUES
(1, 20, '10000', '2021-11-15', '2022-11-15', '2021-11-15 14:37:29'),
(2, 18, '10000', '2021-11-20', '2022-11-20', '2021-11-20 19:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(34, '2014_10_12_000000_create_users_table', 1),
(35, '2014_10_12_100000_create_password_resets_table', 1),
(36, '2019_08_19_000000_create_failed_jobs_table', 1),
(37, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(38, '2021_08_31_124732_create_user_roles_table', 1),
(39, '2021_08_31_141442_create_members_table', 1),
(40, '2021_09_02_114622_create_farmers_table', 1),
(41, '2021_09_02_120243_create_states_table', 1),
(42, '2021_09_02_120521_create_lgas_table', 1),
(43, '2021_09_02_120759_create_warehouses_table', 1),
(44, '2021_09_02_122749_create_farmer_storages_table', 1),
(45, '2021_09_02_140823_create_commodities_table', 1),
(46, '2021_09_02_141247_create_banks_table', 1),
(47, '2021_09_02_141505_create_identity_types_table', 1),
(48, '2021_09_02_141708_create_target_savings_table', 1),
(49, '2021_09_02_142338_create_target_saving_cats_table', 1),
(50, '2021_09_02_142600_create_transactions_table', 1),
(51, '2021_09_02_143243_create_investment_products_table', 1),
(52, '2021_09_02_145919_create_investments_table', 1),
(53, '2021_09_02_151450_create_secondary_markets_table', 1),
(54, '2021_09_02_153224_create_groups_table', 1),
(55, '2021_09_02_153644_create_group_msgs_table', 1),
(56, '2021_09_02_153917_create_group_msg_replies_table', 1),
(57, '2021_09_02_154242_create_group_members_table', 1),
(58, '2021_09_02_154615_create_referrals_table', 1),
(59, '2021_09_02_155001_create_membership_fees_table', 1),
(60, '2021_09_02_155507_create_partners_table', 1),
(61, '2021_09_02_161048_create_bill_payments_table', 1),
(62, '2021_10_17_193553_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_type_id` int(11) DEFAULT NULL,
  `insurance` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `partner_name`, `location_id`, `email`, `phone`, `address`, `other_info`, `asset_type_id`, `insurance`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Zaks', 4, 'metzakaria@gmail.com', '0929 343 3958', '85 Lockman Avenue, Staten Island', NULL, 1, NULL, NULL, '2021-11-15 13:40:03', '2021-11-15 13:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyAuthApp', '7d62be87f1b0b763aa55df4fc7c0cb8b1908bf68d26d5052c2c9e92ff0c953a1', '[\"*\"]', NULL, '2021-09-03 21:04:42', '2021-09-03 21:04:42'),
(2, 'App\\Models\\User', 2, 'MyAuthApp', 'd579501a454cd6e48ee13400d8f9763b042d519feda01bd4c28b2b760bac77cb', '[\"*\"]', NULL, '2021-09-04 13:40:21', '2021-09-04 13:40:21'),
(3, 'App\\Models\\User', 3, 'MyAuthApp', '6f74a0d5b8d078c390066a6e0b240d54ac73f7aa2f6bd6a5e81d659d254fcc8b', '[\"*\"]', NULL, '2021-09-04 13:40:30', '2021-09-04 13:40:30'),
(4, 'App\\Models\\User', 4, 'MyAuthApp', 'd5e42668b0ef01a3c3352b96579946e869a23e7e85759d61fae483d7c2606683', '[\"*\"]', NULL, '2021-09-04 13:40:35', '2021-09-04 13:40:35'),
(5, 'App\\Models\\User', 5, 'MyAuthApp', '8c3fbb4c33ae25eaba5c65c72ac00d4128fe767fd99777eb8d60a04340cfdef0', '[\"*\"]', NULL, '2021-09-04 13:40:40', '2021-09-04 13:40:40'),
(6, 'App\\Models\\User', 1, 'MyAuthApp', 'e0ec45e8619246464410f5a4ca2d4802472642a4147cfbe65096cd2bbb3b888e', '[\"*\"]', NULL, '2021-09-08 10:54:36', '2021-09-08 10:54:36'),
(7, 'App\\Models\\User', 7, 'MyAuthApp', 'f2aa516c46f0443af00e35e2ffc9470d0e646b3aa128c194ac65cb901dd2c26f', '[\"*\"]', NULL, '2021-09-08 10:54:54', '2021-09-08 10:54:54'),
(8, 'App\\Models\\User', 1, 'MyAuthApp', '9cc5c528a46939bff5d42bb8734e091daa40473d0105725aaa29d434d8ab5f67', '[\"*\"]', '2021-09-08 21:24:18', '2021-09-08 12:44:06', '2021-09-08 21:24:18'),
(9, 'App\\Models\\User', 18, 'MyAuthApp', '5b8361c80dc207d9ece47a79995eb5b6f4202b1d089fa6bc16f089341d12b1d8', '[\"*\"]', NULL, '2021-10-17 10:05:18', '2021-10-17 10:05:18'),
(10, 'App\\Models\\User', 19, 'MyAuthApp', '3e7216fc87adc30cf0385759fa6fb414ff933d620607d23965de574811510f8f', '[\"*\"]', NULL, '2021-10-17 10:07:49', '2021-10-17 10:07:49'),
(11, 'App\\Models\\User', 20, 'MyAuthApp', '930c746db66ad30f1e98e70b62346ace4b601fcfa1fc70e1ae14839012c42f3c', '[\"*\"]', NULL, '2021-10-17 10:09:02', '2021-10-17 10:09:02'),
(12, 'App\\Models\\User', 21, 'MyAuthApp', '5400c066625c458a8234224388b8731181b28a15c3ab610fa3862f773558f3ce', '[\"*\"]', NULL, '2021-10-17 10:09:49', '2021-10-17 10:09:49'),
(13, 'App\\Models\\User', 22, 'MyAuthApp', 'a62eb76e454c3d8bd29fd4680b650d60c714a8be73ead15130a931daf2b8a304', '[\"*\"]', NULL, '2021-10-17 10:13:38', '2021-10-17 10:13:38'),
(14, 'App\\Models\\User', 22, 'MyAuthApp', '1460145f2cc57879806dbaac9a37cca824f2e1dfa53d05280371d62e812d9bdc', '[\"*\"]', NULL, '2021-10-17 10:14:31', '2021-10-17 10:14:31'),
(15, 'App\\Models\\User', 22, 'MyAuthApp', '18e3a2afcaefbc841b2f6916f1b8257cef5b69daef519a15d32bb7abf89eae21', '[\"*\"]', NULL, '2021-10-17 10:14:42', '2021-10-17 10:14:42'),
(16, 'App\\Models\\User', 22, 'MyAuthApp', 'c69fd56be0ea740277ee3f04e4098cf5f39e5f56c4b4b8a1f3d8171278323016', '[\"*\"]', NULL, '2021-10-17 10:14:50', '2021-10-17 10:14:50'),
(17, 'App\\Models\\User', 22, 'MyAuthApp', '3f608e1006b93e028fd43505998f3fac6d6a51f1c8edbdf0b7d657484c8bca72', '[\"*\"]', NULL, '2021-10-17 10:14:56', '2021-10-17 10:14:56'),
(18, 'App\\Models\\User', 22, 'MyAuthApp', 'dfc1da40ed13178def82d6bac9a5f9c958c87f7a3f51e89136302a5aac197af1', '[\"*\"]', NULL, '2021-10-17 10:15:34', '2021-10-17 10:15:34'),
(19, 'App\\Models\\User', 22, 'MyAuthApp', '99241ee3d5acdbb3fd03e2c604c6c78dd96d4004d0873a48e1169dde96c676f5', '[\"*\"]', '2021-10-22 21:03:05', '2021-10-17 11:34:51', '2021-10-22 21:03:05'),
(20, 'App\\Models\\User', 22, 'MyAuthApp', 'f6c4668b986df5ac58d69cf8da13f95ecc1ed0573f3f7210a45acdbee7240f46', '[\"*\"]', NULL, '2021-10-27 13:22:30', '2021-10-27 13:22:30'),
(21, 'App\\Models\\User', 22, 'MyAuthApp', 'cdd57b40d17ed9c20ff5234cfe93e747d2fe7d54d4f6f215bb9a749f136c45bf', '[\"*\"]', NULL, '2021-10-27 13:22:52', '2021-10-27 13:22:52'),
(22, 'App\\Models\\User', 22, 'MyAuthApp', '6e479c37d1289a44fa653b8536df73f864faad5c97e0d51eac409f27a2cb8ed0', '[\"*\"]', NULL, '2021-10-27 13:27:08', '2021-10-27 13:27:08'),
(23, 'App\\Models\\User', 22, 'MyAuthApp', 'b8d73749fcccfad1b3eee14c9325768497fcaf5d5e4d38f59df1f11e9cd60ce3', '[\"*\"]', NULL, '2021-10-27 13:28:11', '2021-10-27 13:28:11'),
(24, 'App\\Models\\User', 22, 'MyAuthApp', '003105ebec31dfd8924c3eecc5bbba9a02693d5cf2b705d30c82dbd2f37dcd57', '[\"*\"]', NULL, '2021-10-27 13:28:31', '2021-10-27 13:28:31'),
(25, 'App\\Models\\User', 22, 'MyAuthApp', 'b62a9a8cfe8ff2aaaf8dbd10ee90e91d6193e0eeb36a203ba6002f950e4437a7', '[\"*\"]', NULL, '2021-10-28 15:19:37', '2021-10-28 15:19:37'),
(26, 'App\\Models\\User', 22, 'MyAuthApp', '6fd7835858317738ca320f4c7270dcf814a5da179f44a7e87932a5130fee8136', '[\"*\"]', NULL, '2021-10-28 15:19:56', '2021-10-28 15:19:56'),
(27, 'App\\Models\\User', 22, 'MyAuthApp', '3ced416916e4e2681f8f5189ca4122f96831efbe7f2ad1f3b9ee328662202a5c', '[\"*\"]', NULL, '2021-10-28 15:52:02', '2021-10-28 15:52:02'),
(28, 'App\\Models\\User', 23, 'MyAuthApp', 'cf21cfed8de2ebdc91afaf4fad1dac54a54adfeaf4c77bb653cb44aa5aeaeba1', '[\"*\"]', NULL, '2021-11-08 15:31:26', '2021-11-08 15:31:26'),
(29, 'App\\Models\\User', 23, 'MyAuthApp', '0d649f80e3d9efe5741816e6e05dde4aa5d2b1d7b4b5d56b80a95f3e3cb9fb65', '[\"*\"]', NULL, '2021-11-08 15:35:00', '2021-11-08 15:35:00'),
(30, 'App\\Models\\User', 23, 'MyAuthApp', 'a3df0d25a18ad8ab6e205afb9fd6182cf478bea1cdca4a9a9462c49d23fafd2e', '[\"*\"]', '2021-11-11 10:53:06', '2021-11-11 10:51:58', '2021-11-11 10:53:06'),
(31, 'App\\Models\\User', 23, 'MyAuthApp', '557d88f7cef985cbcba29cfb6f348004e2e44ace2a4933131d6238ae254568c8', '[\"*\"]', NULL, '2021-11-11 16:23:27', '2021-11-11 16:23:27'),
(32, 'App\\Models\\User', 23, 'MyAuthApp', '2429b8c9cbe5e91cf6cde860795481106617a4a9f85bee148645235a64bedcfb', '[\"*\"]', NULL, '2021-11-11 16:23:59', '2021-11-11 16:23:59'),
(33, 'App\\Models\\User', 23, 'MyAuthApp', 'c48ce3c76ed22ba236ee9b0545c3869b3da75b1e9a54e916aaf54f6c175fd652', '[\"*\"]', NULL, '2021-11-11 16:24:38', '2021-11-11 16:24:38'),
(34, 'App\\Models\\User', 23, 'MyAuthApp', '7d5211af6fd426b6f7fb8328d090a8386e96331e608dcfb8c94a745f596a7b86', '[\"*\"]', NULL, '2021-11-11 16:24:44', '2021-11-11 16:24:44'),
(35, 'App\\Models\\User', 23, 'MyAuthApp', '5eb77d10f0fa6082a83109f1283140eb40d09c16c46237476701648ff2bb1063', '[\"*\"]', NULL, '2021-11-11 16:25:35', '2021-11-11 16:25:35'),
(36, 'App\\Models\\User', 23, 'MyAuthApp', 'a409a86bd6ffb8bc88d8e6dd185f32828d3d5d63edc57266fe865724a0c63153', '[\"*\"]', NULL, '2021-11-11 16:26:31', '2021-11-11 16:26:31'),
(37, 'App\\Models\\User', 23, 'MyAuthApp', '8a7be66bf82760369a45486453eda3c23b799d0cae19e16c9e98de776a2c713b', '[\"*\"]', NULL, '2021-11-11 16:27:25', '2021-11-11 16:27:25'),
(38, 'App\\Models\\User', 23, 'MyAuthApp', 'ab57acc591d21876712fcc1cc41c15b48926c4b6907d7c3ed91f4cebc646fd10', '[\"*\"]', NULL, '2021-11-11 16:30:39', '2021-11-11 16:30:39'),
(39, 'App\\Models\\User', 23, 'MyAuthApp', 'ced93163ac3e19e54b8d1d968d5d84990f517309d85e7b9db8119538c9f72285', '[\"*\"]', NULL, '2021-11-11 16:31:08', '2021-11-11 16:31:08'),
(40, 'App\\Models\\User', 23, 'MyAuthApp', 'bdb85c585e18101fc0931e74825f5fbb8d7fd0b4d2040724d3a1dfe357b82c8b', '[\"*\"]', NULL, '2021-11-11 16:31:54', '2021-11-11 16:31:54'),
(41, 'App\\Models\\User', 23, 'MyAuthApp', '2fb7aad9f45abfdb23de98f50adf1d1bc46480ddb8c9908796781dcde8bd3f61', '[\"*\"]', NULL, '2021-11-11 16:32:43', '2021-11-11 16:32:43'),
(42, 'App\\Models\\User', 23, 'MyAuthApp', '0764c97a13821a4193b287947b64b31848bb03b56b2cb6e73f6032a535e3b36a', '[\"*\"]', NULL, '2021-11-11 16:33:01', '2021-11-11 16:33:01'),
(43, 'App\\Models\\User', 23, 'MyAuthApp', '824dd9a92f62977af2b8f31390497834aa1c983ce687a8a8435fb2c912ace34a', '[\"*\"]', NULL, '2021-11-11 16:33:22', '2021-11-11 16:33:22'),
(44, 'App\\Models\\User', 23, 'MyAuthApp', '36f9d94a1ec4018c0498a1c81c5c3a7debb102566ed506df878f077a44822f7c', '[\"*\"]', NULL, '2021-11-11 16:34:08', '2021-11-11 16:34:08'),
(45, 'App\\Models\\User', 23, 'MyAuthApp', '5e5558ad8c6718b35ef4bea888aae6ebfd4ec0c941694fecd5b37a9d67c207b9', '[\"*\"]', NULL, '2021-11-11 16:38:23', '2021-11-11 16:38:23'),
(46, 'App\\Models\\User', 23, 'MyAuthApp', '7d188fb9c27d3bbb8ed13be2fd3c97d537fc67932a2fe975bc474b3437a7258e', '[\"*\"]', NULL, '2021-11-11 16:39:40', '2021-11-11 16:39:40'),
(47, 'App\\Models\\User', 23, 'MyAuthApp', 'd7458d184bb6219e07489dff07d4ef0d271b0f9ddd3787e46b04be05aae0ff67', '[\"*\"]', NULL, '2021-11-11 16:39:48', '2021-11-11 16:39:48'),
(48, 'App\\Models\\User', 23, 'MyAuthApp', '74ae5341d528dcf6110dce984b70e81bc8e084a3b81c43e41be44b2d1e6e950e', '[\"*\"]', NULL, '2021-11-11 16:40:19', '2021-11-11 16:40:19'),
(49, 'App\\Models\\User', 23, 'MyAuthApp', '8a87c05afe87df36fb883961ad99a2b2d95ab69014bc92783c58264bbabd8cc2', '[\"*\"]', NULL, '2021-11-11 16:41:39', '2021-11-11 16:41:39'),
(50, 'App\\Models\\User', 23, 'MyAuthApp', '639b27eb0e87393249cc3e84a34c49d527bdbc25afdadc316bae18cb04fc1a04', '[\"*\"]', '2021-11-12 09:07:41', '2021-11-11 16:41:57', '2021-11-12 09:07:41'),
(51, 'App\\Models\\User', 23, 'MyAuthApp', '6396cb4de683373d0d9cd01cee4a35a4f5984ac52a8b0e40638b1a3d823f64d3', '[\"*\"]', NULL, '2021-11-11 17:04:34', '2021-11-11 17:04:34'),
(52, 'App\\Models\\User', 23, 'MyAuthApp', '52261aa4fc8197070690c79046cb5c0d409efa02f7635a76ef2fac142df594df', '[\"*\"]', NULL, '2021-11-11 17:04:56', '2021-11-11 17:04:56'),
(53, 'App\\Models\\User', 23, 'MyAuthApp', '2fb5323e7b73feaef4806249c2cc1a68aa54970d4e4c03478e2f917596741f30', '[\"*\"]', NULL, '2021-11-11 17:15:35', '2021-11-11 17:15:35'),
(54, 'App\\Models\\User', 23, 'MyAuthApp', 'c27ed2136f2d455f916f86572bf72729fa1baab46365ee565b03653e54beec80', '[\"*\"]', NULL, '2021-11-11 17:17:49', '2021-11-11 17:17:49'),
(55, 'App\\Models\\User', 23, 'MyAuthApp', '8aa2482d402eafc4d247adf3926c0d8c95e532d18eb70c892f776b65e26437b6', '[\"*\"]', NULL, '2021-11-11 17:19:50', '2021-11-11 17:19:50'),
(56, 'App\\Models\\User', 23, 'MyAuthApp', '9e2ca72f438ce6782b58a326cc142b5f3f30f2788bfd8a2fd6de8cdf1b3d942c', '[\"*\"]', NULL, '2021-11-11 17:20:37', '2021-11-11 17:20:37'),
(57, 'App\\Models\\User', 23, 'MyAuthApp', 'e383b7e7ac19cc98307a12a5c77ba4a3d1e03e8d79d1c28aa0a5ae56dd7c592d', '[\"*\"]', '2021-11-12 09:58:58', '2021-11-11 18:51:00', '2021-11-12 09:58:58'),
(58, 'App\\Models\\User', 23, 'MyAuthApp', '88004fbbd5564d4ec26d296e96b6a6f87b64527b385cebd095bcd3ea47d3af7b', '[\"*\"]', NULL, '2021-11-12 08:43:43', '2021-11-12 08:43:43'),
(59, 'App\\Models\\User', 23, 'MyAuthApp', '88a883399ae5ffe2d938f8157ed541517f9c9b181854eed8ea681cfb7f0b0532', '[\"*\"]', NULL, '2021-11-12 09:03:49', '2021-11-12 09:03:49'),
(60, 'App\\Models\\User', 23, 'MyAuthApp', '9a1067a81d048d9bed14493a8c7108632fbf1b51152bbe090e02c76d93afa247', '[\"*\"]', NULL, '2021-11-12 09:07:22', '2021-11-12 09:07:22'),
(61, 'App\\Models\\User', 23, 'MyAuthApp', '4fbdbf580075b1fa25fc22e59ac6135f9fe5cf66db1acd1bc33f5eaf5e48dc52', '[\"*\"]', '2021-11-26 08:19:46', '2021-11-12 09:10:42', '2021-11-26 08:19:46'),
(62, 'App\\Models\\User', 23, 'MyAuthApp', '97628d77113621365ea7ac500c20828e1d0c766f72a3c7102167f1a88766d3f8', '[\"*\"]', NULL, '2021-11-12 12:37:27', '2021-11-12 12:37:27'),
(63, 'App\\Models\\User', 23, 'MyAuthApp', '0d25e63ac7640a5276e50a84266f135de48e560615868ed22747a0b95517013d', '[\"*\"]', NULL, '2021-11-12 13:23:17', '2021-11-12 13:23:17'),
(64, 'App\\Models\\User', 23, 'MyAuthApp', 'bed56a926501a14f53cab4865cb686a8ee6ee384e9d5802ba48bf2c774436471', '[\"*\"]', NULL, '2021-11-12 13:24:11', '2021-11-12 13:24:11'),
(65, 'App\\Models\\User', 23, 'MyAuthApp', '21cf7afb087a5d2dc8a1d5dedbff90a923fd7c793149b0384b9b369d5d9ee6cd', '[\"*\"]', NULL, '2021-11-17 13:23:58', '2021-11-17 13:23:58'),
(66, 'App\\Models\\User', 23, 'MyAuthApp', '0610659161d579ea7f6fb8be2df4b96a75684feece0993f53de6e0477c9a471a', '[\"*\"]', NULL, '2021-11-17 13:51:53', '2021-11-17 13:51:53'),
(67, 'App\\Models\\User', 23, 'MyAuthApp', '6359f50328b2c52bf849eb1bcd60403bcdb57aad0b71e23bc1884c4d9852a5c4', '[\"*\"]', NULL, '2021-11-17 14:03:09', '2021-11-17 14:03:09'),
(68, 'App\\Models\\User', 25, 'MyAuthApp', 'e7625eeec9a10cf8f64afad54da8188513233a50cfa6529a16d41f9806e0e712', '[\"*\"]', NULL, '2021-11-17 15:30:55', '2021-11-17 15:30:55'),
(69, 'App\\Models\\User', 26, 'MyAuthApp', '27f34f6ba492e77d5f096357c542da876ddd6b882a1365a915a29d3f351afb62', '[\"*\"]', NULL, '2021-11-17 15:33:27', '2021-11-17 15:33:27'),
(70, 'App\\Models\\User', 28, 'MyAuthApp', 'db63edd1064ab1c9a24afc7058333d0a468388e3cd1441775b91a088479123ea', '[\"*\"]', NULL, '2021-11-17 15:46:00', '2021-11-17 15:46:00'),
(71, 'App\\Models\\User', 25, 'MyAuthApp', '8bb1e44b9f4ee72f795e8f4eb96ebc795127c72900c686011bee68119dec854e', '[\"*\"]', NULL, '2021-11-17 15:48:35', '2021-11-17 15:48:35'),
(72, 'App\\Models\\User', 29, 'MyAuthApp', '4b93cb74d77f6d7b670a65d0733ffbfe8528ee1dad46543a7eead634ad125c34', '[\"*\"]', NULL, '2021-11-17 16:41:24', '2021-11-17 16:41:24'),
(73, 'App\\Models\\User', 29, 'MyAuthApp', '3079471fbd8797f62350140421fd40311ccd22e713387b702623ed02696b8066', '[\"*\"]', NULL, '2021-11-17 16:41:47', '2021-11-17 16:41:47'),
(74, 'App\\Models\\User', 23, 'MyAuthApp', '730c30734543a8060d77afc9b7bb0511ad5cc32f9f0c70e7d8919e62fd25e306', '[\"*\"]', NULL, '2021-11-17 17:57:32', '2021-11-17 17:57:32'),
(75, 'App\\Models\\User', 30, 'MyAuthApp', 'c87a220d80a65b7d05366a4ded2bc008803b3d46e2ce3ed0bd4125f99b26381d', '[\"*\"]', '2021-11-19 11:46:56', '2021-11-17 18:46:43', '2021-11-19 11:46:56'),
(76, 'App\\Models\\User', 31, 'MyAuthApp', '5d39a60927de0a96275c74fec36dd39822bb80db2da9a3410a8b00601a61f721', '[\"*\"]', NULL, '2021-11-17 19:25:38', '2021-11-17 19:25:38'),
(77, 'App\\Models\\User', 22, 'MyAuthApp', 'c8f2a511c7a523170b14814b87061e5728420023d79936fa3b43ec1c138863b5', '[\"*\"]', NULL, '2021-11-18 16:42:33', '2021-11-18 16:42:33'),
(78, 'App\\Models\\User', 22, 'MyAuthApp', '6cc86e3314df76fca6013af74581c6c1b33b661399558d92e4f70eb7fc6389ae', '[\"*\"]', '2021-11-26 07:45:25', '2021-11-19 12:24:57', '2021-11-26 07:45:25'),
(79, 'App\\Models\\User', 25, 'MyAuthApp', '6d937ce3fe544f7567b32a79cb91178ff7bcf465c0844fa5b87462bbff1f9113', '[\"*\"]', '2021-11-20 20:37:30', '2021-11-19 15:37:12', '2021-11-20 20:37:30'),
(80, 'App\\Models\\User', 25, 'MyAuthApp', 'a32b8a728a1542662a3012a948044a07b6db6aff5d917ef08b5e48057e22d43c', '[\"*\"]', NULL, '2021-11-19 20:22:37', '2021-11-19 20:22:37'),
(81, 'App\\Models\\User', 22, 'MyAuthApp', 'd33a1b8b474358fc5a8ad2e16075fe3bb0fb2a4b71ce44387348028bee40d727', '[\"*\"]', NULL, '2021-11-20 16:17:23', '2021-11-20 16:17:23'),
(82, 'App\\Models\\User', 22, 'MyAuthApp', '4d6479c7dda88afb591f5fc6482d8e68d77e8097525deac8c6b37ecb4873b025', '[\"*\"]', NULL, '2021-11-20 16:17:23', '2021-11-20 16:17:23'),
(83, 'App\\Models\\User', 22, 'MyAuthApp', 'e4cef7d5a6b483d53899dfe8fdaa649ae0a8b5c13cf5e0b8008ddb7a1c0969ee', '[\"*\"]', NULL, '2021-11-20 16:17:24', '2021-11-20 16:17:24'),
(84, 'App\\Models\\User', 22, 'MyAuthApp', 'd5e323b95b7f115a9d6c323823a64b1e57e55637424067f01cb8796d1783b153', '[\"*\"]', NULL, '2021-11-23 21:41:18', '2021-11-23 21:41:18'),
(85, 'App\\Models\\User', 23, 'MyAuthApp', '271a14cfd466cc13adeb432c1d6667498c87a24d79e3035dbafedd22ffc2418c', '[\"*\"]', NULL, '2021-11-26 03:58:16', '2021-11-26 03:58:16'),
(86, 'App\\Models\\User', 23, 'MyAuthApp', 'f525f6e817a6b680cf9cd9412dfa04a690149cfa3937869ed1b5267179cebf31', '[\"*\"]', NULL, '2021-11-26 04:33:52', '2021-11-26 04:33:52'),
(87, 'App\\Models\\User', 23, 'MyAuthApp', 'a26ab07e02c95a4515150c55710d7a7e370d2033af99da2a505db8da932ed2c3', '[\"*\"]', NULL, '2021-11-26 07:44:26', '2021-11-26 07:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `referred_member` int(11) DEFAULT NULL,
  `commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_paid` timestamp NULL DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`id`, `member_id`, `referred_member`, `commission`, `is_paid`, `date_paid`, `date_created`) VALUES
(1, 18, 19, '100', 0, NULL, '2021-10-17 11:09:02'),
(2, 18, 20, '100', 0, NULL, '2021-10-17 11:09:49'),
(3, 18, 21, '100', 0, NULL, '2021-10-17 11:13:38'),
(4, 22, 23, '100', 0, NULL, '2021-11-08 15:31:26'),
(5, 22, 25, '100', 0, NULL, '2021-11-17 15:30:55'),
(6, 22, 26, '100', 0, NULL, '2021-11-17 15:33:27'),
(7, 22, 28, '100', 0, NULL, '2021-11-17 15:46:00'),
(8, 22, 29, '100', 0, NULL, '2021-11-17 16:41:24'),
(9, 18, 30, '100', 0, NULL, '2021-11-17 18:46:43'),
(10, 18, 31, '100', 0, NULL, '2021-11-17 19:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `regular_savings`
--

CREATE TABLE `regular_savings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `default_payment_method` varchar(20) DEFAULT NULL,
  `autosave` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `regular_savings`
--

INSERT INTO `regular_savings` (`id`, `member_id`, `amount`, `frequency`, `default_payment_method`, `autosave`, `created_at`) VALUES
(1, 2, '200', 'monthly', 'bank', 0, '2021-10-17 15:08:47'),
(2, 18, '200', 'monthly', 'bank', 0, '2021-10-17 16:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `regular_savings_transactions`
--

CREATE TABLE `regular_savings_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dr_cr` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_transaction` timestamp NOT NULL DEFAULT current_timestamp(),
  `bal_affected` tinyint(1) NOT NULL DEFAULT 0,
  `member_id` bigint(20) DEFAULT NULL,
  `pay_method` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regular_savings_transactions`
--

INSERT INTO `regular_savings_transactions` (`id`, `transaction_ref`, `description`, `amount`, `dr_cr`, `date_transaction`, `bal_affected`, `member_id`, `pay_method`) VALUES
(1, '4rer', 'savings', '100', 'dr', '2021-10-17 17:11:14', 1, 18, NULL),
(2, 'frer44', 'payment', '54', 'cr', '2021-10-17 17:13:06', 1, 18, NULL),
(3, '44444444', NULL, '100', NULL, '2021-10-17 21:57:33', 1, 18, 'Card'),
(4, '44444444', NULL, '100', NULL, '2021-10-17 21:58:19', 1, 18, 'Card'),
(5, '44444444', 'Wallet Funding from ATM card', '100', 'CR', '2021-10-18 11:25:56', 1, 18, 'Card'),
(6, '44444444', 'Direct withdrawal to bank account', '100', 'DR', '2021-10-18 12:07:04', 1, 18, NULL),
(7, '44444444', 'Direct withdrawal to bank account', '100', 'DR', '2021-10-18 12:08:36', 1, 18, NULL),
(8, '44444444', 'Direct withdrawal to bank account', '100', 'DR', '2021-10-18 12:09:30', 1, 23, NULL),
(9, '44444444', 'Withdrawal from investment', '1', 'CR', '2021-10-22 17:21:10', 1, 23, 'local'),
(10, '44444444', 'fransfer from investment to savings', '100', 'CR', '2021-10-22 17:40:00', 1, 18, 'local'),
(11, '44444444', 'Wallet Funding from ATM card', '100', 'CR', '2021-12-19 21:32:09', 0, 23, 'Card'),
(12, '44444444', 'Wallet Funding from ATM card', '100', 'CR', '2021-12-19 21:34:40', 1, 23, 'Card'),
(13, '44444444', 'Wallet Funding from ATM card', '5000', 'CR', '2021-12-19 22:11:45', 1, 23, 'Card'),
(14, '44444444', 'Withdrawal from Savings account to bank account', '100', 'DR', '2021-12-19 22:40:09', 1, 23, NULL),
(15, '44444444', 'Withdrawal from Savings account to bank account', '500', 'DR', '2021-12-20 02:06:09', 1, 23, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `savings_type`
--

CREATE TABLE `savings_type` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `yearly_interest` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savings_type`
--

INSERT INTO `savings_type` (`id`, `name`, `description`, `yearly_interest`) VALUES
(1, 'Regular', 'Regular Savings', '8'),
(2, 'Target', 'Target Savings', '20');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stockup_cart`
--

CREATE TABLE `stockup_cart` (
  `id` int(11) NOT NULL,
  `stockup_item_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `checkout` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stockup_items`
--

CREATE TABLE `stockup_items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_unit` float(10,2) NOT NULL,
  `item_image` varchar(100) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `in_stock` tinyint(4) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockup_items`
--

INSERT INTO `stockup_items` (`id`, `item_name`, `quantity`, `price_per_unit`, `item_image`, `unit`, `in_stock`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Wheat', 40, 5000.00, 'Wheat.jpg', '50kg', 1, 'Local Wheat', '2021-12-15 21:17:36', '2021-12-15 21:17:36'),
(2, 'Onions', 100, 200.00, '/tmp/phpXjXXSk', 'Bags', 1, 'Buy Onions weekly from us at cheap rate', '2021-12-16 07:09:48', '2021-12-16 07:09:48'),
(7, 'terw;', 123, 123.00, 'rice.jpg', 'bag', 1, 'gjkl;/', '2021-12-23 18:11:52', '2021-12-23 18:11:52'),
(8, 'Corn', 12345, 2000.00, 'rice_1640358816.jpg', 'bags', 1, 'yueirhfjks;ld\'', '2021-12-24 15:13:36', '2021-12-24 15:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `stockup_members_interest`
--

CREATE TABLE `stockup_members_interest` (
  `id` int(11) NOT NULL,
  `stockup_item_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `period` int(11) NOT NULL DEFAULT 30,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stockup_purchases`
--

CREATE TABLE `stockup_purchases` (
  `id` int(11) NOT NULL,
  `stockup_item_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `quantity_of_purchase` int(11) NOT NULL,
  `cost_per_unit` decimal(10,2) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `delivery_phone_number` varchar(50) NOT NULL,
  `delivery_address` varchar(150) NOT NULL,
  `delivery_contact_person` varchar(100) NOT NULL,
  `is_paid` tinyint(4) NOT NULL DEFAULT 0,
  `date_paid` datetime DEFAULT NULL,
  `is_delivered` tinyint(4) NOT NULL DEFAULT 0,
  `date_delivered` datetime DEFAULT NULL,
  `expect_delivery_date` date DEFAULT NULL,
  `expect_delivery_time` varchar(10) DEFAULT NULL,
  `delivery_note` text DEFAULT NULL,
  `shipping_fee` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockup_purchases`
--

INSERT INTO `stockup_purchases` (`id`, `stockup_item_id`, `member_id`, `quantity_of_purchase`, `cost_per_unit`, `total_cost`, `delivery_phone_number`, `delivery_address`, `delivery_contact_person`, `is_paid`, `date_paid`, `is_delivered`, `date_delivered`, `expect_delivery_date`, `expect_delivery_time`, `delivery_note`, `shipping_fee`, `created_at`, `updated_at`) VALUES
(1, 1, 21, 5, '10000.00', '50000.00', '08122208549', 'test address', 'test person', 1, '2021-12-17 10:48:32', 0, NULL, NULL, NULL, NULL, NULL, '2021-12-17 09:49:20', '2021-12-17 09:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `target_savings`
--

CREATE TABLE `target_savings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_amt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_amt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_amt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yearly_interest` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target_savings`
--

INSERT INTO `target_savings` (`id`, `name`, `category_id`, `description`, `target_amt`, `cur_amt`, `prev_amt`, `yearly_interest`, `start_date`, `member_id`, `is_current`, `created_at`, `updated_at`) VALUES
(1, 'Buying my car', 1, 'Buying my second car', '200000', '18900', '17899', '8', '2021-11-15', 19, 1, '2021-11-15 15:06:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `target_saving_cats`
--

CREATE TABLE `target_saving_cats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target_saving_cats`
--

INSERT INTO `target_saving_cats` (`id`, `cat_name`) VALUES
(1, 'Car'),
(2, 'Travel');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `phone`, `email`, `password`, `role_id`, `is_active`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Portal Admin', NULL, 'mo@gmailx.com', '$2y$10$so3hvvYJG53UGK3USGCsReflpP56YbiB3HJtYTz1V0OdcE1ZZ/CSe', 1, 1, NULL, NULL, '2021-12-01 10:07:02', NULL),
(4, 'Evelyn Ikerekhalu', '07038058424', 'evelynikerekhalu@gmail.com', '$2y$10$ILE8Bj.4ESa.i8x7Gh08WukOuvHx7GLpzJEWj.dBiYjXqjQf9QO4K', 4, 1, NULL, NULL, '2021-12-13 12:11:02', '2021-12-13 12:11:02'),
(5, 'Salomi M Ephraim', '08074339673', 'ephraimsalomi@gmail.com', '$2y$10$WOhQcjxKvKPopp9xxQq5UukN.iu1gVPXPyjmvKVSrF/VtTguyEIZe', 4, 1, NULL, NULL, '2021-12-13 12:30:56', '2021-12-13 12:30:56'),
(6, 'Orpha mamuda', '07089257277', 'mamudaorpha67@gmail.com', '$2y$10$5y/GEmt5w.DXMeGhVYRNy.Tv8RiF/NVLBDPOT330H8beVhbrs3GS.', 4, 1, NULL, NULL, '2021-12-13 12:33:15', '2021-12-13 12:33:15'),
(7, 'Talatu F Umar', '07039718261', 'talatufetuumar@gmail.com', '$2y$10$5LTW2qdOiygXG0F/LaXGAuxJYV2bNCRIKiM1cVGtBiYiKQDVdBsuq', 4, 1, NULL, NULL, '2021-12-13 12:34:53', '2021-12-13 12:34:53'),
(8, 'Ali Hassan', '08026723578', 'alih192@gmail.com', '$2y$10$lwHPK5BjY7XmOUE4QBMf4eqRM1MktFttsFmvlanN3m2h4QUxxEJUW', 4, 1, NULL, NULL, '2021-12-13 12:36:00', '2021-12-13 12:36:00'),
(9, 'Mela Yakubu', '07038944519', 'melayakubu1@gmail.com', '$2y$10$0SojEN73rDkR6hA94dhyue64yLPr/5FUp7dGaNAkMCkARVwvql/dq', 4, 1, NULL, NULL, '2021-12-13 12:37:12', '2021-12-13 12:37:12'),
(10, 'Ladi kashere  Dabo', '08038419005', 'ladikashere39@gmail.com', '$2y$10$4AsvEzYet4E79fCbm3ROQ.JzF7IRQ8DEaizuPrfjxT7rYeTpLlH6m', 4, 1, NULL, NULL, '2021-12-13 12:38:58', '2021-12-13 12:38:58'),
(11, 'Eristo A Peyos', '08026501534', 'eristony200@gmail.com', '$2y$10$GWIzzDrUw9JF8J2SEQKQUOJykymidiWATALB/RA4MddpMqQZYP7bu', 4, 1, NULL, NULL, '2021-12-13 12:42:21', '2021-12-13 12:42:21'),
(12, 'AYUBA SALEH KURJALE', '08069630602', 'abumujaheed2020@gmail.com', '$2y$10$kJwxFw46ZFu.PqmT55UwweHcP1CudLzSPAMD3D7DX7T38AEDRlPja', 4, 1, NULL, NULL, '2021-12-13 12:48:03', '2021-12-13 12:48:03'),
(15, 'Williams A Saura', '08032880565', 'sauraaw33@gmail.com', '$2y$10$PXz9Ix2ZH1.gjQPOBHJ66.vIy3IRxos7WARjeKH2Hig0MuxX4azSa', 4, 1, NULL, NULL, '2021-12-13 14:50:48', '2021-12-13 14:50:48'),
(16, 'Godiya K. Misali', '08029409955', 'kskbia@gmail.com', '$2y$10$tnOZJEKW.mevo9GPHl3jiu8nBpoDUZ0f8QhVw8gKoDgii5Iel6sqG', 4, 1, NULL, NULL, '2021-12-13 14:51:38', '2021-12-13 14:51:38'),
(17, 'Mark Ganbeni', '07037241009', 'markodefiestaa@gmail.com', '$2y$10$UFVE1DgL9nJMtdTEUBPsVu2.sTt2StXonrT3Xe3EUpI8i6Gx1LZ3K', 4, 1, NULL, NULL, '2021-12-13 14:53:39', '2021-12-13 14:53:39'),
(18, 'Asogya Wunuji Manasseh', '07064681910', 'asogya@gmail.com', '$2y$10$K.OMIaBGq4dBEKAczu2i7uUQCigm8g4H2witeF5bGBzIrlfgk5z2m', 4, 1, NULL, NULL, '2021-12-13 14:54:43', '2021-12-13 14:54:43'),
(19, 'Hadiza adamu', '08036315466', 'hadizaadamuabeni@gmail.com', '$2y$10$KdGOVpdtXH5yysFe3Q2P7.cODLqG7asqHwai9YQw/dPu.WPttnMha', 4, 1, NULL, NULL, '2021-12-13 14:55:41', '2021-12-13 14:55:41'),
(20, 'Helen Sabo Daniel', '08095688706', 'helenhythec@gmail.com', '$2y$10$ZYNRPdfA53sKQ89hhtQceuugjphakUq1AwTZ2Tm3pBiTUElxVhYMu', 4, 1, NULL, NULL, '2021-12-13 14:56:40', '2021-12-13 14:56:40'),
(21, 'Maryam Gambo', '09066380658', 'gambomaryam47@gmail.com', '$2y$10$0u2lkiSJ0qN1IQpOFdPOrON3DvIKlKXhlQ9xZPWtiBRxXluNh/30S', 4, 1, NULL, NULL, '2021-12-13 14:58:14', '2021-12-13 14:58:14'),
(22, 'Abubakar Muhammad Dahiru', '08030607111', 'gongas2011@gmail.com', '$2y$10$BWKGnf.A0cu1/nEQ4kzKue2lwzB2Osz/JxHNQLvItdX0BxSk58PIa', 4, 1, NULL, NULL, '2021-12-13 14:59:15', '2021-12-13 14:59:15'),
(23, 'Ahmad sudi Abba', '09066380144', 'lerumabba64@gmail.com', '$2y$10$5B3MTUIw.mY/VefQDll7n.tiEpplj7V/ADB8sC27V96qys.9Wt0PS', 4, 1, NULL, NULL, '2021-12-13 15:00:05', '2021-12-13 15:00:05'),
(24, 'Tokiemo Markus', '08039120198', 'tokiemo247@gmail.com', '$2y$10$jxWC1FFXOKxMgsqE7aH3xe9Pc/ybaFtHx6ZQcE315jLaKGrdTXf3O', 4, 1, NULL, NULL, '2021-12-13 15:01:10', '2021-12-13 15:01:10'),
(25, 'Daniels Israel A.', '08039629208', 'yimidaniels@gmail.com', '$2y$10$aNKJjViKN4uiBPowrNy9qO.nEfknjI6XpDbRg2ScvHuDuXgZGo.uW', 4, 1, NULL, NULL, '2021-12-13 15:01:53', '2021-12-13 15:01:53'),
(26, 'Abdulhamid Bakoji', '08168536230', 'abdulhamidbakoji5@gmail.com', '$2y$10$Gu2sdiJv.338.PueL5xTHell3JEjWlnX18qPhW8YiYiDAGehZzr.G', 4, 1, NULL, NULL, '2021-12-13 15:03:03', '2021-12-13 15:03:03'),
(27, 'Abdul-razaq Ahmad', '07037899191', 'abdul080301120@gmail.com', '$2y$10$PR4LjLmqTOTEgBanqDINxer/qyDzlSQ/bBNiQXZfNdQoYQOWvqFzq', 4, 1, NULL, NULL, '2021-12-13 15:04:06', '2021-12-13 15:04:06'),
(28, 'Tome Williams Bala', '07080568699', 'tomewilliamsbala@gmail.com', '$2y$10$hXT/m52/9rXuaKgSnKhkWOFaNxRH2glVGdNUmQJch562o.tI7S1ky', 4, 1, NULL, NULL, '2021-12-13 15:05:10', '2021-12-13 15:05:10'),
(29, 'Amdo Jackson Annas', '07033221616', 'amdojackson38@gmail.com', '$2y$10$07MojT49jP9OV6Tb70OPpegIr159S..iIQLAFGhQJhmiQJH5/BT7u', 4, 1, NULL, NULL, '2021-12-13 15:06:17', '2021-12-13 15:06:17'),
(30, 'Daniel Bulus', '08137826857', 'bulusdaniel73@gmail.com', '$2y$10$Jr12og1jsut54Qzvk.nn.e1ZdYFGhW8oqbHxxG.Sv/qKVPobChp3q', 4, 1, NULL, NULL, '2021-12-13 15:07:17', '2021-12-13 15:07:17'),
(31, 'Danladi ishaku laukkoh', '07038772583', 'danladiishaku2019@gmail.com', '$2y$10$BGPyN7JdpR4sIRjkOg/uZeKSWkaUeOvjJMZ1hH7zmUHXn5JMqWuzK', 4, 1, NULL, NULL, '2021-12-13 15:08:16', '2021-12-13 15:08:16'),
(32, 'Rakiya Inusa Garba', '08130780285', 'rakiyagarba6@gmail.com', '$2y$10$ZGA15iovUr5zWb1XxD.rNeNJwuHuuVJOONW3GSGGTQsLBcm.TJxXS', 4, 1, NULL, NULL, '2021-12-13 15:09:21', '2021-12-13 15:09:21'),
(33, 'EMMANUEL JUSTICE', '08133361313', 'bustle29@gmail', '$2y$10$ehvZZoioZY.s1u5Q6gZfbeub82qvqR4WQC4viWTvX3C6cW4RNfbCG', 4, 1, NULL, NULL, '2021-12-13 15:10:34', '2021-12-13 15:10:34'),
(36, 'Felix Raymond', '08068066969', 'felix4real1@gmail.com', '$2y$10$HbPyUcPDYulo1YUST0IrrekXTU/oKAduc3wXROcaY8dLT0SjnMtZW', 4, 1, NULL, NULL, '2021-12-16 09:54:34', '2021-12-16 09:54:34'),
(39, 'Idris Usman Suleiman', '08035892549', 'danauta2001@yahoo.com', '$2y$10$4q3SJ2lXzC/.eIGvoGT/SOnruUxenWRVmHSatlMfyEYZbV1TQSQ6m', 4, 1, NULL, NULL, '2021-12-17 11:31:20', '2021-12-17 11:31:20'),
(40, 'Bibiana  A Adams', '08036781188', 'adamsbibiana45@gmail.com', '$2y$10$NSUBpZQOewKsCuTIo6plUevw9gt4PRKl72XrqFX15CYUoqQ6Nmwj2', 4, 1, NULL, NULL, '2021-12-17 11:32:07', '2021-12-17 11:32:07'),
(41, 'Abigail  D O Irenee', '08032591945', 'olafemiabigail@gmail.com', '$2y$10$g9rIyiSrH7yeQmnshgj02esp3snFDHrHARNLyb.LdC4I.4j.5ICrS', 4, 1, NULL, NULL, '2021-12-17 11:34:59', '2021-12-17 11:34:59'),
(42, 'Lonis Joshua', '08081455507', 'laukoleventures3@gmail.com', '$2y$10$zwWqnIzu8pBJjRo0/39wCeYeH5Wv19VOo.DztKnECopuqqbpOW/cu', 4, 1, NULL, NULL, '2021-12-17 11:37:03', '2021-12-17 11:37:03'),
(43, 'Dinatu Stephen', '08036809254', 'dinatustephen@yahoo.com', '$2y$10$4vum6eT0BQS1fqA4AruT4OQlrYB2HDLobj/bvybLXa.KLp/sraNhq', 4, 1, NULL, NULL, '2021-12-17 11:38:05', '2021-12-17 11:38:05'),
(44, 'Aliyu BA Wando', '08036500963', 'aliyuwando72@gmail.com', '$2y$10$cxd6blY39EcROR2XTshWIeqnLM8C5GSl6IoFGsJhCesa01UZxc02q', 4, 1, NULL, NULL, '2021-12-17 11:39:24', '2021-12-17 11:39:24'),
(45, 'Benjamin John', '08130609910', 'johnbenjamin380@gmail.com', '$2y$10$krjHJ5aVVMRcuhanuzJ/h.PCxLCi3rnZnobklqLs4Rx3L3tR6wLfi', 4, 1, NULL, NULL, '2021-12-20 07:13:16', '2021-12-20 07:13:16'),
(46, 'Mohamed suleiman', '08074769260', 'suleimanmohammed@gmail.com', '$2y$10$AmRNVGe3j1OeD0zPOdXNseG65WgDP9xUQaPcJvCZJBGcxZV0K/xWO', 4, 1, NULL, NULL, '2021-12-20 18:00:02', '2021-12-20 18:00:02'),
(47, 'ANANDE Aondongu Joseph', '07066521505', 'kri84jeanpascal@gmail.com', '$2y$10$eOD2KLZ3wQkK4jXykCIznOjKD83zSlJgqvguxy642ZmYq0pVjUaYq', 4, 1, NULL, NULL, '2021-12-20 18:01:01', '2021-12-20 18:01:01'),
(48, 'IORAHII AMEE RUPHINA', '09096467788', 'Rophinaamee@gmail.com', '$2y$10$pLaywWJ7VXTvywtlLqyvn.24EBG.wwWuCTE7qJ5WqaBXqDtCVyvzy', 4, 1, NULL, NULL, '2021-12-20 18:02:23', '2021-12-20 18:02:23'),
(49, 'Alumun Monica', '08161120167', 'splashmonique@gmail.com', '$2y$10$cl9Po37jbC5TboOrVysyceQzUK93VlE8QmQxK9Fw44py/YefJDfBS', 4, 1, NULL, NULL, '2021-12-22 18:11:44', '2021-12-22 18:11:44'),
(50, 'AFATYO TERESE SYLVIA', '081044049', 'afatyosylvia@gmail.com', '$2y$10$Pir7T.c5ogdohi20PeltT.KLgg17lcw66n1YDL5HxbbPfQ3F51Bby', 4, 1, NULL, NULL, '2021-12-22 18:13:06', '2021-12-22 18:13:06'),
(51, 'Afatyo Joy', '08164768511', 'afatyjoy1993@gmail.com', '$2y$10$SeXATAwVwvCts.hafeZQoOxwNE2t3hxiRHgiZJ3M0AVtldv6vOBAa', 4, 1, NULL, NULL, '2021-12-22 18:14:09', '2021-12-22 18:20:00'),
(53, 'Iortim Jerome Terna', '09061883486', 'iortim127@gmail.com', '$2y$10$xdOhSPwCMp.xN.AUIoNcTu19yioeJWipDHVEyC7kpity30m6laH9O', 4, 1, NULL, NULL, '2021-12-22 18:25:31', '2021-12-22 18:25:31'),
(54, 'Ordueh Ushahemba Jessica', '07056179352', 'orduehjessy@gmail.com', '$2y$10$h8SXXlg9JVRNk55gpnCd.OLY7JdvmvYnfCq.XgQMXBj9SxqBh6d7.', 4, 1, NULL, NULL, '2021-12-22 18:26:40', '2021-12-22 18:26:40'),
(55, 'Atond Ephraim', '07012226181', 'ephraimatondo@gmail.com', '$2y$10$eNaf7OApzyRAuqDFHy3V6.WkzMH9IYq8IfdePwpOMEeXkA0YsNRq2', 4, 1, NULL, NULL, '2021-12-22 18:33:22', '2021-12-22 18:33:22'),
(56, 'Orhena Tordue', '08060482344', 'torduei@gmail.com', '$2y$10$Bm5dPOU.P9Fb9CLMnaewWet32VqN/r.P3qv76Hjx//kuDdIz4twy.', 4, 1, NULL, NULL, '2021-12-22 18:34:00', '2021-12-22 18:34:37'),
(57, 'Ordueh Othaniel', '07040617184', 'othanofficianet@gmail.com', '$2y$10$dKe2ePqt3UL84KHr1ly6pewU/TlFjZKqs7M9WCVfGRf9zoHKb59TS', 4, 1, NULL, NULL, '2021-12-22 18:35:33', '2021-12-22 18:35:33'),
(58, 'Alueshima Alumun', '08029410599', 'alueshimaalumun@gmail.com', '$2y$10$gw8CmOpP87qzUn/J1fqQtuJDZOkz1JlUwKmLKNNZ/ahItYVtq/bEG', 4, 1, NULL, NULL, '2021-12-22 18:36:31', '2021-12-22 18:36:31'),
(59, 'Omale Sunday Alenu', '07018888060', 'sunmira2021@gmail.com', '$2y$10$VD7q5veE7IU7TVU9u2.Pj.sz7myQevzzIkdXrf4tXTnI9rU54LT42', 4, 1, NULL, NULL, '2021-12-24 21:08:07', '2021-12-24 21:09:38'),
(60, 'Dorcas Tarzoor', '08038327317', 'dorcastarzoor88@gmail.com', '$2y$10$2vImnM5u4TrvMmY1OUjuzeQu/nH0haralwsdH6iWQ50tBNacbq4mi', 4, 1, NULL, NULL, '2021-12-24 21:10:46', '2021-12-24 21:10:46'),
(63, 'Idris maigari lawanti', '08069694055', 'lawantiidris@gmail.com', '$2y$10$o9SBfXLCw8GeymlFdr5FwONNkXTFoBqj22Edeqf2DoxA1G3kJxKGO', 4, 1, NULL, NULL, '2022-01-08 14:54:10', '2022-01-08 14:54:10'),
(64, 'Ayuba ladong dalti', '08064716746', 'ayubaladongdalti1@gmail.com', '$2y$10$Ifxbjm3QKvwR6bESHs753uA9NH2Mn.9sdRsPzTw.0DSLngpLkrdOi', 4, 1, NULL, NULL, '2022-01-08 14:55:13', '2022-01-08 14:55:13'),
(65, 'Limamn Bukasha', '08138466271', 'bukashaliman1@gmail.com', '$2y$10$fm2jrKT1PSPvI7ceoHY/9elDAW0DSLoP/hVXFEVkjM0dxDLLNl62O', 4, 1, NULL, NULL, '2022-02-06 10:42:03', '2022-02-06 10:42:03'),
(66, 'Hassan Rilwan', '08062310697', 'hassanrilwanmuye@gmail.com', '$2y$10$dPTv950o3qPJqsjb4tLP3OE0ARA9sjY1f4bckq3cz8Ef4ltQgBO5K', 4, 1, NULL, NULL, '2022-02-06 10:45:17', '2022-02-06 10:45:17'),
(67, 'Mohammed Danjuma Yakub', '08065398445', 'yakdan007@gmail.com', '$2y$10$3aRGOvGeo9eVugF1EM4Rf.OWHSN1yelnmAkcFel.N6YXZ8JOFywuG', 4, 1, NULL, NULL, '2022-02-06 10:48:36', '2022-02-06 10:48:36'),
(68, 'Abdulmumin Yahaya', '08037414162', 'yahayaabdulmumin619@gmail.com', '$2y$10$1Qx/R9D82Wy1JuVMrM/IDumcV8TwDM5uy2iBYhCAPoOkfIyUJATaW', 4, 1, NULL, NULL, '2022-02-06 10:52:46', '2022-02-06 10:52:46'),
(69, 'Said Musa Alaba', '07066178121', 'musasaidualaba@gmail.com', '$2y$10$/vIzcIs79k/H6yP.5oOJFek3382B4PSmenD9sSK8607XkhmfbuCm6', 4, 1, NULL, NULL, '2022-02-06 11:00:14', '2022-02-06 11:00:14'),
(70, 'Abubakar Ndako Kutigi', '08064604799', 'abu12kutigi97@gmail.com', '$2y$10$e0eisn34PJkpQr6QM8bv6e0xRWShndLsftl7xzr.BMIJjqtajYSNK', 4, 1, NULL, NULL, '2022-02-06 11:03:15', '2022-02-06 11:03:15'),
(71, 'Adam Dorcas Lamiyiye', '07034678409', 'addoc120178@gmail.com', '$2y$10$s1/k1H11XSK2O6xItDfIX.gVQStNOSpBfkdj1EK6iDfRtO.iy71Lq', 4, 1, NULL, NULL, '2022-02-06 11:06:29', '2022-02-06 11:06:29'),
(72, 'Rafat Jibrin Ibrahim', '08036124602', 'rsfatbrahim@gmail.com', '$2y$10$/dxl16OeMivekupe.xeQ6.PLjj1gGSfJpOaUvAS7pjCWgRBFjz36S', 4, 1, NULL, NULL, '2022-02-06 11:10:22', '2022-02-06 11:10:22'),
(73, 'Aisha Garba Arizah', '07063529887', 'aishaarizah001@gmail.com', '$2y$10$nf2Pu84I2gjtuXAPXdrdH.bEkx/O4.sedEcxfsp0ONxmB4q6h2q9G', 4, 1, NULL, NULL, '2022-02-06 11:12:45', '2022-02-06 11:12:45'),
(74, 'Joseph Dauda', '09057734564', 'josephdauda927@gmail.com', '$2y$10$oO2dxewK3RDq5yJcPUQa9./PlGv8yRJ56slIjgJDR/SP4HfxMnGLi', 4, 1, NULL, NULL, '2022-02-06 11:14:49', '2022-02-06 11:14:49'),
(75, 'Hussaila Aliyu', '08037382347', 'aliyuhussaila@gmail.com', '$2y$10$k/60zdCfW/2rh5Opk1wErOwchUUC1fOvRYriHWgpaK0uKNmcqVavy', 4, 1, NULL, NULL, '2022-02-06 11:18:30', '2022-02-06 11:18:30'),
(76, 'Shittu A. Abdullahi', '08030591918', 'ashitt2a@gmail.com', '$2y$10$7jH9ldW0BqWL99KQHTUZ2uxELVWYL6.uvI7/pZOslCPvXbKrzhXVy', 4, 1, NULL, NULL, '2022-02-06 11:21:16', '2022-02-06 11:21:16'),
(77, 'Naomi K. Tsado', '08036845248', 'naomitsado6@gmail.com', '$2y$10$zIYBEgSRCOJfdM6kQm17Du3Q7qKylgAV8TfGi1/eFQs/L0wsd3bw6', 4, 1, NULL, NULL, '2022-02-06 11:23:41', '2022-02-06 11:23:41'),
(78, 'Abdullahi I. Dantsoho', '08036535455', 'abdullahiibrahim186@gmail.com', '$2y$10$9GU3JWedjnsezdDvJEck6Oq65Mn.8v3EqWue2mpMyt1qqcWXYjfae', 0, 1, NULL, NULL, '2022-02-06 11:26:21', '2022-02-06 11:26:21'),
(79, 'Ibrahim Baba Abubakar', '07034593475', 'ibrahimbabaabubaka672@gmail.com', '$2y$10$i.C7iLXylWI822jS3rE9SuT.retV/NrUh/Q9N7r3EbV2SDdkrNfka', 4, 1, NULL, NULL, '2022-02-06 11:29:32', '2022-02-06 11:29:32'),
(80, 'Mohammed Adamu', '08184255325', 'mohammedadamu271@gmail.com', '$2y$10$vkyKjP4llXQk8m/BjdwZG..7n5Tauch3N2ylzxZivDld/bQQg5HL6', 4, 1, NULL, NULL, '2022-02-06 11:32:13', '2022-02-06 11:32:13'),
(81, 'Rafat Jibrin Ibrahim', '08036124602', 'rsfatibrahim@gmail.com', '$2y$10$5bKdPecM96x3upAWjc2Vr.C8Bh2IZ/pR7TbaDCMJIfagEvroWX9xq', 4, 1, NULL, NULL, '2022-02-06 11:37:33', '2022-02-06 11:37:33'),
(85, 'Ibrahim Baba Abubakar', '07034593475', 'ibrahimbabaabubakar672@gmail.com', '$2y$10$SK4Sw3DHPbosx6GX15naje9Xx.7G/GXromW0cmlDTDit1GfgTNJX2', 4, 1, NULL, NULL, '2022-02-06 11:45:28', '2022-02-06 11:45:28'),
(86, 'Hussaina Aliyu', '08037382347', 'aliyuhussaina15@gmail.com', '$2y$10$i5p9BiIb1RTOykC6k68v8.TjCiOUfhClYYIF8jIuqH.7FIMNlhobu', 4, 1, NULL, NULL, '2022-02-06 11:48:02', '2022-02-06 11:48:02'),
(87, 'Mohammed Sani', '09066119040', 'mohammedsanim08@gmail.com', '$2y$10$eyTd/3kZsgIAXfABFiJy8.H5hIbNTzDG9ClzgC1zwYS8WP9u21O2W', 4, 1, NULL, NULL, '2022-02-06 19:44:08', '2022-02-06 19:44:08'),
(88, 'ALIYU NDAGI', '08098003808', 'aliyundagi406@gmail.com', '$2y$10$SuJ8yc2tBSPn6DMNDZpvGuURRMa6rgQPnbZz/DN6ReNQqGvO3vhRC', 4, 1, NULL, NULL, '2022-02-06 19:44:55', '2022-02-06 19:44:55'),
(89, 'Ahmed Baba Alfa', '08064516127', 'abalfa6127@gmail.com', '$2y$10$EuI4sYKOHeaoA6/OtDsWsOEYGwDeq5.XFwR6meWzgixbeyTST2qoa', 4, 1, NULL, NULL, '2022-02-07 10:05:58', '2022-02-07 10:05:58'),
(92, 'Audu Adamu', '07033318726', 'auduadamu74@gmail.com', '$2y$10$2DoVFpR5hEvekFhTUlCMce2t4uspah34E.7ENnkxsUOQwga1xbq2m', 4, 1, NULL, NULL, '2022-02-07 10:09:19', '2022-02-07 10:09:19'),
(93, 'HARUNA BALA', '08029643108', 'harunabala002@gmail.com', '$2y$10$SXn8qy.h1aEtAYuyx7IFKuThYrhDQ5wDWIEXo6EdgHV7IPZTuOeqC', 1, 1, NULL, NULL, '2022-02-07 10:10:21', '2022-02-07 10:10:21'),
(94, 'SANI AHMED', '08034533780', 'ahmedsani092@gmail.com', '$2y$10$f010Hv8bTfGp4XeOH3pguu3EkvzO8m796QknehsPEafQJsgqRmL46', 4, 1, NULL, NULL, '2022-02-07 18:23:49', '2022-02-07 18:23:49'),
(95, 'ABDULKADIR K AGAIE', '08069793845', 'abdulkadirkagaie37@gmail.com', '$2y$10$3suhplB/bQ28.PQEd9vn8.6mwR2WqkCG4vHUrBcbc26Fe759D698q', 4, 1, NULL, NULL, '2022-02-07 18:24:45', '2022-02-07 18:24:45'),
(96, 'Partners', NULL, 'partner@storagex.com.ng', '$2y$10$2H6qgw5SPt73ZjpfZjGEA.DF84mD5.MtNZ/Hclxeheav8RbvktifC', 3, 1, NULL, NULL, '2022-02-12 00:50:02', '2022-02-14 20:52:36'),
(99, 'Partner Team', NULL, 'partners@storagex.com.ng', '$2y$10$.ccfcEadupfZoJxbpj2jou0K3OhKLmis.aSdqkDSX71FOy01dR8ai', 1, 1, NULL, NULL, '2022-02-14 20:53:08', '2022-02-14 20:53:08'),
(100, 'Yahuza Haruna', '07032616519', 'yahuzaharunamalbangs@gmail.com', '$2y$10$cc9e2wOOyRtVCXkQshtBkec33v6PB5VCJ24BVsjOkbUUtPpUGRaMC', 4, 1, NULL, NULL, '2022-03-11 12:44:37', '2022-03-11 12:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role`, `role_code`) VALUES
(1, 'Admin', 'ADMIN'),
(2, 'Member', 'MEMBER'),
(3, 'Partner', 'PARTNER'),
(4, 'Agent', 'AGENT'),
(5, 'Warehouse Manager', 'WAREHOUSE MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `lga_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `description`, `location_id`, `state_id`, `lga_id`, `created_at`, `updated_at`, `insurance`, `policy_number`) VALUES
(1, 'StorageX Limawa Warehouse', 'Limawa Warehouse, Airport quarters, adjacent New Horizons school, Minna.', 8, NULL, NULL, '2022-02-13 14:02:44', NULL, 'Leadway Insurance', '2045678912'),
(2, 'StorageX Biliri Warehouse', 'Biliri Warehouse, Biliri, Gombe State', 12, NULL, NULL, '2022-02-25 16:11:55', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_payments`
--
ALTER TABLE `bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_payments_member_id_index` (`member_id`),
  ADD KEY `bill_payments_bill_type_index` (`bill_type`),
  ADD KEY `bill_payments_is_paid_index` (`is_paid`),
  ADD KEY `bill_payments_date_paid_index` (`date_paid`),
  ADD KEY `bill_payments_date_created_index` (`date_created`);

--
-- Indexes for table `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `debit_cards`
--
ALTER TABLE `debit_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmers_state_id_index` (`state_id`),
  ADD KEY `farmers_lga_id_index` (`lga_id`),
  ADD KEY `farmers_first_name_index` (`full_name`);

--
-- Indexes for table `farmer_storages`
--
ALTER TABLE `farmer_storages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `farmer_storages_farmer_id_index` (`farmer_id`),
  ADD KEY `farmer_storages_ware_house_id_index` (`ware_house_id`),
  ADD KEY `farmer_storages_commodity_id_index` (`commodity_id`),
  ADD KEY `farmer_storages_is_removed_index` (`is_removed`),
  ADD KEY `farmer_storages_date_receipt_generated_index` (`date_receipt_generated`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_state_id_index` (`state_id`),
  ADD KEY `groups_lga_id_index` (`lga_id`),
  ADD KEY `groups_created_menber_index` (`created_menber`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_members_group_id_index` (`group_id`),
  ADD KEY `group_members_member_id_index` (`member_id`);

--
-- Indexes for table `group_msgs`
--
ALTER TABLE `group_msgs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_msgs_group_id_index` (`group_id`),
  ADD KEY `group_msgs_created_menber_index` (`created_menber`);

--
-- Indexes for table `group_msg_replies`
--
ALTER TABLE `group_msg_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_msg_replies_group_msg_id_index` (`group_msg_id`),
  ADD KEY `group_msg_replies_replied_member_index` (`replied_member`);

--
-- Indexes for table `identity_types`
--
ALTER TABLE `identity_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investments_product_id_index` (`invest_product_id`),
  ADD KEY `investments_member_id_index` (`member_id`),
  ADD KEY `investments_date_invest_index` (`date_invest`),
  ADD KEY `investments_is_sec_market_index` (`is_auctioned`);

--
-- Indexes for table `investment_auctions`
--
ALTER TABLE `investment_auctions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `secondary_markets_investment_id_index` (`investment_id`),
  ADD KEY `secondary_markets_is_sold_index` (`is_sold`),
  ADD KEY `secondary_markets_date_sold_index` (`date_sold`),
  ADD KEY `secondary_markets_date_created_index` (`date_created`);

--
-- Indexes for table `investment_products`
--
ALTER TABLE `investment_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lgas`
--
ALTER TABLE `lgas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_email_unique` (`email`),
  ADD KEY `index_state_id` (`state_id`),
  ADD KEY `index_mobile` (`mobile`),
  ADD KEY `index_is_active` (`is_active`),
  ADD KEY `index_referral_code` (`referral_code`),
  ADD KEY `index_user_id` (`user_id`),
  ADD KEY `members_is_active_index` (`is_active`);

--
-- Indexes for table `membership_fees`
--
ALTER TABLE `membership_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `membership_fees_member_id_index` (`member_id`),
  ADD KEY `membership_fees_start_date_index` (`start_date`),
  ADD KEY `membership_fees_end_date_index` (`end_date`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `partners_email_unique` (`email`),
  ADD KEY `partners_asset_type_id_index` (`asset_type_id`),
  ADD KEY `partners_state_id_index` (`location_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referrals_referred_member_index` (`referred_member`) USING BTREE,
  ADD KEY `referrals_member_id_index` (`member_id`),
  ADD KEY `referrals_is_paid_index` (`is_paid`),
  ADD KEY `referrals_date_created_index` (`date_created`);

--
-- Indexes for table `regular_savings`
--
ALTER TABLE `regular_savings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `regular_savings_transactions`
--
ALTER TABLE `regular_savings_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_member_id_index` (`member_id`),
  ADD KEY `transactions_bal_affected_index` (`bal_affected`),
  ADD KEY `transactions_date_transaction_index` (`date_transaction`);

--
-- Indexes for table `savings_type`
--
ALTER TABLE `savings_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockup_cart`
--
ALTER TABLE `stockup_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockup_items`
--
ALTER TABLE `stockup_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockup_members_interest`
--
ALTER TABLE `stockup_members_interest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockup_purchases`
--
ALTER TABLE `stockup_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target_savings`
--
ALTER TABLE `target_savings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `target_savings_category_id_index` (`category_id`),
  ADD KEY `target_savings_member_id_index` (`member_id`),
  ADD KEY `target_savings_is_current_index` (`is_current`),
  ADD KEY `target_savings_start_date_index` (`start_date`);

--
-- Indexes for table `target_saving_cats`
--
ALTER TABLE `target_saving_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`),
  ADD KEY `users_is_active_index` (`is_active`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bill_payments`
--
ALTER TABLE `bill_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commodities`
--
ALTER TABLE `commodities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `debit_cards`
--
ALTER TABLE `debit_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `farmer_storages`
--
ALTER TABLE `farmer_storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_msgs`
--
ALTER TABLE `group_msgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group_msg_replies`
--
ALTER TABLE `group_msg_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `identity_types`
--
ALTER TABLE `identity_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `investment_auctions`
--
ALTER TABLE `investment_auctions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investment_products`
--
ALTER TABLE `investment_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lgas`
--
ALTER TABLE `lgas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `membership_fees`
--
ALTER TABLE `membership_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `regular_savings`
--
ALTER TABLE `regular_savings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `regular_savings_transactions`
--
ALTER TABLE `regular_savings_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `savings_type`
--
ALTER TABLE `savings_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockup_cart`
--
ALTER TABLE `stockup_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockup_items`
--
ALTER TABLE `stockup_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stockup_members_interest`
--
ALTER TABLE `stockup_members_interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockup_purchases`
--
ALTER TABLE `stockup_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `target_savings`
--
ALTER TABLE `target_savings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `target_saving_cats`
--
ALTER TABLE `target_saving_cats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
