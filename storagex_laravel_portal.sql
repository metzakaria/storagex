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
-- Database: `storagex_laravel_portal_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(100) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping_fee` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `delivery_date`, `shipping_fee`, `created_at`, `updated_at`) VALUES
(1, '2022-02-16', 100, '2022-02-16 22:31:37', NULL);

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
  `receiver_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `transaction_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_payments`
--

INSERT INTO `bill_payments` (`id`, `member_id`, `bill_type`, `amount`, `receiver_account`, `description`, `is_paid`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'airtime', '50', NULL, 'Airtime Recharge', 1, '16486078671074328122862867', '2022-03-30 02:37:48', NULL),
(2, 1, 'airtime', '50', NULL, 'Airtime Recharge', 1, '16486079543692920668349118', '2022-03-30 02:39:15', NULL),
(3, 1, 'airtime', '25.00', NULL, 'Data Services', 1, '16486079945835410655405450', '2022-03-30 02:39:56', NULL),
(4, 1, 'airtime', '100', NULL, 'Airtime Recharge', 1, '16490859264283915868762679', '2022-04-04 15:25:27', NULL),
(5, 2, 'airtime', '100', NULL, 'Airtime Recharge', 1, '16493975131337674338845861', '2022-04-08 05:58:34', NULL),
(6, 2, 'airtime', '49.99', NULL, 'Data Services', 1, '16493976780044664122384714', '2022-04-08 06:01:19', NULL),
(7, 2, 'airtime', '100', NULL, 'Airtime Recharge', 1, '16496023495497302443233215', '2022-04-10 14:52:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_channel`
--

CREATE TABLE `chat_channel` (
  `id` int(100) NOT NULL,
  `channel_name` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_channel`
--

INSERT INTO `chat_channel` (`id`, `channel_name`, `created_at`, `updated_at`) VALUES
(1, 'Philosophy', '2022-02-19 17:29:47', '0000-00-00 00:00:00');

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
(22, 'SPS', 'Sweet Potatoes', 'kg', NULL, NULL);

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
  `authorization_code` varchar(20) DEFAULT NULL,
  `datecreated` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, '069', 'Adebayo Kolawole', NULL, NULL, 5, '1.jpg', NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-17 12:12:40'),
(2, '23', 'Obafemi Marting', NULL, NULL, 6, NULL, NULL, '08084845994', NULL, 'Soya', NULL, '2021-11-03 00:38:08', '2021-11-03 00:38:08'),
(3, '098', 'zakas', NULL, NULL, 2, '3.jpg', NULL, NULL, NULL, NULL, NULL, '2021-11-15 11:04:14', '2021-11-15 11:04:14'),
(4, '23', 'Mfon Asuquo', NULL, NULL, 2, '4.jpg', NULL, '08060002562', 'Eket', 'Soya', NULL, NULL, NULL);

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
(1, 1, 1, 1, '3500', NULL, '350000', 'SXEWR 069 MAZ 171121 ISN 3500', '2021-10-16 15:37:21', 0, NULL, 18, '2021-10-16 15:02:46', '2021-11-17 12:15:38'),
(2, 2, 1, 5, '400', NULL, '200', 'SXEWR 23 PML 151121 ISN 400', '2021-11-15 12:43:23', 0, NULL, 18, '2021-11-15 12:43:23', '2021-11-15 12:52:01'),
(3, 3, 1, 1, '100', NULL, '50000', 'SXEWR 098 MAZ 151121 ISN 100', '2021-11-15 12:52:31', 0, NULL, 18, '2021-11-15 12:52:31', '2021-11-15 12:52:31'),
(4, 1, 2, 14, '200', NULL, '1000', 'SXEWR 069 CCA 151121 MKI 200', '2021-11-15 13:01:38', 0, NULL, 18, '2021-11-15 13:01:38', '2021-11-15 13:01:38'),
(5, 1, 2, 16, '2000', '7888', '15776000', 'SXEWR 069 BBN 231121 MKI 2000', '2021-11-23 13:44:54', 0, NULL, 18, '2021-11-23 13:44:54', NULL),
(6, 4, 2, 3, '3000', '10000', '30000000', 'SXEWR 23 SBN 251121 MKI 3000', '2021-11-25 23:49:49', 0, NULL, 18, '2021-11-25 23:49:49', NULL),
(7, 1, 1, 16, '30', '5000', '150000', 'SXEWR 069 BBN 251121 ISN 30', '2021-11-25 23:52:45', 0, NULL, 18, '2021-11-25 23:52:45', NULL);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expect_amt_return` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_auctioned` tinyint(1) NOT NULL DEFAULT 0,
  `auction_id` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `t_n_c` tinyint(4) DEFAULT 0,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `investments`
--

INSERT INTO `investments` (`id`, `invest_product_id`, `member_id`, `qty_bought`, `amt_bought`, `date_invest`, `expect_amt_return`, `is_auctioned`, `auction_id`, `created_at`, `updated_at`, `t_n_c`, `payment_method`) VALUES
(1, 2, 3, '3', '1500', '2022-04-20 17:20:36', '0', 0, 0, '2022-04-20 17:20:36', NULL, 1, NULL),
(2, 2, 8, '6', '3000', '2022-04-20 18:13:08', '0', 0, 0, '2022-04-20 18:13:08', NULL, 1, NULL),
(3, 2, 8, '1', '500', '2022-04-20 18:14:34', '687.5', 1, 1, '2022-04-20 18:14:34', NULL, 1, '2');

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
(1, 1, 2, '1', '500', '500', 1, '2022-04-20 19:14:34', 8, '2022-04-20 17:42:56', '2022-04-22 00:00:00', 0);

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
(1, 'Warehouse Receipts', 'Receipt from where house and its provided by bla bla bla', 'fixed income', '10', '5000', '200', 'https://miro.medium.com/max/700/1*yAw2tQ56GdEDB09UZbE2gw.jpeg', '0', 0, 1, '2021-10-08', '2021-10-31', '1', 'Leadway Insurance', '2021-12-30 17:00:00', '2021-12-30 17:00:09', 1, 'CeeBug Technology', 0, 4),
(2, 'My New Investmen', 'This is investment by ceebug technology', 'Fixed', '15', '500', '20', 'https://miro.medium.com/max/700/1*yAw2tQ56GdEDB09UZbE2gw.jpeg', '0', 0, 1, '2021-11-17', '2021-12-31', '3', 'Leadway Insurance', '2021-12-30 17:04:02', '2021-12-30 17:04:06', 1, 'CeeBug Technology', 0, 2),
(3, 'My New Investmen', 'This is investment by ceebug technology', 'Fixed', '15', '500', '20', 'https://miro.medium.com/max/700/1*yAw2tQ56GdEDB09UZbE2gw.jpeg', '0', 0, 1, '2021-11-17', '2021-12-31', '3', 'Leadway Insurance', '2021-12-30 17:04:02', '2021-12-30 17:04:06', 1, 'CeeBug Technology', 0, 1);

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
(10, 'Taraba', 'TRB', '2021-12-15 14:02:54', NULL),
(11, 'Adamawa', 'ADW', '2021-12-15 14:02:54', NULL);

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
  `auth_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `dob` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type_id` int(11) DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `referral_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_bal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `prev_bal` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `recipient_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `cur_invest_bal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `prev_invest_bal` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `storagex_bank_id` int(11) DEFAULT NULL,
  `storagex_acct_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_membership` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `disable_wallet_bal` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `full_name`, `state_id`, `lga_id`, `photo`, `email`, `mobile`, `address`, `security_question`, `security_ans`, `bvn`, `auth_code`, `bank_id`, `bank_name`, `account_no`, `account_name`, `is_verified`, `dob`, `identity_type_id`, `identity_image`, `is_active`, `is_deleted`, `referral_code`, `cur_bal`, `prev_bal`, `user_id`, `recipient_code`, `created_at`, `updated_at`, `cur_invest_bal`, `prev_invest_bal`, `storagex_bank_id`, `storagex_acct_no`, `has_membership`, `disable_wallet_bal`) VALUES
(3, 'Test', NULL, NULL, 'https://sandbox.storagex.com.ng/storage/app/public/images/members/3.jpg', 'emmanzley@gmail.com', '000000999', 'hhhh', 'maintain', 'maintain', '22222222', '2303', 999992, 'Paycom', '8103141424', 'Emmanuel  Adenagbe', 0, '2022-4-20', NULL, 'https://sandbox.storagex.com.ng/storage/app/public/images/members/3.jpg', 1, 0, 'DWFOX', '483370', '484870', 3, 'RCP_0ljv1zpvqycg7ld', '2022-04-15 19:33:00', NULL, '0', '0', NULL, NULL, '1', 1),
(4, 'DPO', NULL, NULL, NULL, 'testerdaps@gmail.com', NULL, NULL, 'Your Boss', 'Zach', '56328929928', '2651', 44, 'Access Bank', '0100666231', 'ADEDAPO JOSEPH ADELEYE', 0, '2022-4-17', NULL, 'https://sandbox.storagex.com.ng/storage/app/public/images/members/4.jpg', 1, 0, 'TIZKH', '37000', '38000', 4, 'RCP_gf4tnlestokiwq5', '2022-04-17 09:13:03', NULL, '0', '0', NULL, NULL, '0', 0),
(5, 'Vicky', NULL, NULL, NULL, 'testerdaps1@gmail.com', NULL, NULL, NULL, NULL, NULL, '7645', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'ALUB1', '0', '0', 5, NULL, '2022-04-17 17:28:04', NULL, '0', '0', NULL, NULL, '0', 0),
(6, 'Emeka Nwachinemere', NULL, NULL, NULL, 'nwachinemere.emeka@gmail.com', NULL, NULL, NULL, NULL, NULL, '3899', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'IK2LA', '0', '0', 6, NULL, '2022-04-17 21:07:15', NULL, '0', '0', NULL, NULL, '0', 0),
(7, 'moses pay', NULL, NULL, NULL, 'moses@gmail.com', NULL, NULL, NULL, NULL, NULL, '6188', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 0, 'QRIGL', '0', '0', 7, NULL, '2022-04-19 14:35:12', NULL, '0', '0', NULL, NULL, '0', 0),
(8, 'zaks', NULL, NULL, 'https://sandbox.storagex.com.ng/storage/app/public/images/members/8.jpg', 'metzakaria@gmail.com', '08069335842', '9 Nathan street', 'what is ur pass', 'zak', '2583685241', '7196', 35, 'Wema Bank', '0232106976', 'MOHAMMED ZAKARI', 0, '2022-4-28', NULL, 'https://sandbox.storagex.com.ng/storage/app/public/images/members/8.jpg', 1, 0, '6K9US', '46500', '47000', 8, 'RCP_lmibhivarrx6jrh', '2022-04-19 14:35:55', NULL, '0', '0', NULL, NULL, '1', 0),
(9, 'Emmanuel Adenagbe', NULL, NULL, NULL, 'emmanzley@yahoo.com', NULL, NULL, NULL, NULL, NULL, '3119', 999992, 'Paycom', '08103141424', 'Emmanuel  Adenagbe', 0, NULL, NULL, NULL, 1, 0, 'DDZ6E', '5000', '0', 9, 'RCP_0ljv1zpvqycg7ld', '2022-04-20 20:46:25', NULL, '0', '0', NULL, NULL, '0', 0);

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
(1, 1, '1000', '2022-03-30', '2023-03-30', '2022-03-30 02:57:52'),
(2, 2, '1000', '2022-04-08', '2023-04-08', '2022-04-08 06:45:10'),
(3, 3, '1000', '2022-04-15', '2023-04-15', '2022-04-15 20:01:19'),
(4, 8, '1000', '2022-04-19', '2023-04-19', '2022-04-19 15:50:04');

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
(61, 'App\\Models\\User', 23, 'MyAuthApp', '4fbdbf580075b1fa25fc22e59ac6135f9fe5cf66db1acd1bc33f5eaf5e48dc52', '[\"*\"]', '2022-01-07 08:12:02', '2021-11-12 09:10:42', '2022-01-07 08:12:02'),
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
(87, 'App\\Models\\User', 23, 'MyAuthApp', 'a26ab07e02c95a4515150c55710d7a7e370d2033af99da2a505db8da932ed2c3', '[\"*\"]', '2022-02-14 22:46:29', '2021-11-26 07:44:26', '2022-02-14 22:46:29'),
(88, 'App\\Models\\User', 23, 'MyAuthApp', '5a7129f33dd52ae925d8da5250d7b82a04c5ecd632e8a9d4665edf4dea704cff', '[\"*\"]', NULL, '2021-12-07 21:36:18', '2021-12-07 21:36:18'),
(89, 'App\\Models\\User', 23, 'MyAuthApp', '1f1c7f8306eee7e6b64af3549adc3f6edddf7a99fd3da0acb7c2fbb570f83824', '[\"*\"]', '2021-12-31 17:05:18', '2021-12-12 23:12:45', '2021-12-31 17:05:18'),
(90, 'App\\Models\\User', 23, 'MyAuthApp', 'a818b5c074154efdca2ced377ef23921315768e9467bb786206e45134a7da067', '[\"*\"]', NULL, '2021-12-19 20:06:18', '2021-12-19 20:06:18'),
(91, 'App\\Models\\User', 37, 'MyAuthApp', '81e0e767902791fb55589f205f50f419c6d5acdd949123a5650776522ae79211', '[\"*\"]', NULL, '2021-12-31 02:45:24', '2021-12-31 02:45:24'),
(92, 'App\\Models\\User', 38, 'MyAuthApp', '1017ef69de6baa4f9fd0f9d2f94ee23c996e442331a344a331abe4ede766addf', '[\"*\"]', NULL, '2021-12-31 17:10:39', '2021-12-31 17:10:39'),
(93, 'App\\Models\\User', 38, 'MyAuthApp', '22bb17e651c4422bd3dceccc5474012d25014d745be82d0295230468eb228670', '[\"*\"]', '2021-12-31 20:42:12', '2021-12-31 17:10:56', '2021-12-31 20:42:12'),
(94, 'App\\Models\\User', 39, 'MyAuthApp', '41a02f3638a605faa474c3c409c353a89f374b6e900c7ec5d0af1bb3971d430b', '[\"*\"]', NULL, '2021-12-31 20:19:52', '2021-12-31 20:19:52'),
(95, 'App\\Models\\User', 39, 'MyAuthApp', '2f54a96dbf6f9baea3c1785eac4eaf94727dfe12ecb3f2c6302ed6156ac3f332', '[\"*\"]', '2021-12-31 21:00:13', '2021-12-31 20:20:26', '2021-12-31 21:00:13'),
(96, 'App\\Models\\User', 23, 'MyAuthApp', 'c6e0b42d85e2d6e2847dd7dbe09ab4e8395696030568ad56a15a3e03558dfede', '[\"*\"]', '2022-03-25 15:52:00', '2022-01-01 10:13:14', '2022-03-25 15:52:00'),
(97, 'App\\Models\\User', 23, 'MyAuthApp', '0db657a6b473484d94adf1d984d3eb8e8dbb11516fe2a0edeff503d670988bf9', '[\"*\"]', '2022-01-01 18:30:59', '2022-01-01 14:32:00', '2022-01-01 18:30:59'),
(98, 'App\\Models\\User', 38, 'MyAuthApp', '273a9ce1cea289b5495c0de3132f76016374c1dfd4c841612c329261d68962e0', '[\"*\"]', '2022-01-04 08:22:33', '2022-01-01 19:43:03', '2022-01-04 08:22:33'),
(99, 'App\\Models\\User', 23, 'MyAuthApp', 'd8e303113e0e18e87f30c5fcb7526c4a005171d7ddc40a50e3b75aed2fe122f6', '[\"*\"]', '2022-01-04 16:07:41', '2022-01-04 08:26:01', '2022-01-04 16:07:41'),
(100, 'App\\Models\\User', 39, 'MyAuthApp', '40e382720837fc1ff9030543ef1a339bf081cfcca5221ef0f68c5fec43bdb6fe', '[\"*\"]', '2022-01-07 08:06:25', '2022-01-06 17:24:25', '2022-01-07 08:06:25'),
(101, 'App\\Models\\User', 39, 'MyAuthApp', '9bc7b499634b1f0710f03aca1acf8947f8d91584b86be0b6b2b2783b3caa29b8', '[\"*\"]', '2022-02-02 19:10:06', '2022-01-07 08:06:29', '2022-02-02 19:10:06'),
(102, 'App\\Models\\User', 40, 'MyAuthApp', '8d6a3ff70c12f719a8f5216b0d6623d6a89125bad0ff793311926057a6a6d88a', '[\"*\"]', NULL, '2022-01-08 07:12:26', '2022-01-08 07:12:26'),
(103, 'App\\Models\\User', 40, 'MyAuthApp', '6f92d0d3702396282dd62c4404335e437fd323c3acaa0a00abbdd96629f8462c', '[\"*\"]', '2022-01-16 18:28:35', '2022-01-08 07:12:49', '2022-01-16 18:28:36'),
(104, 'App\\Models\\User', 41, 'MyAuthApp', '78e00999e3177b4123895f20384a58992936e495672bbc550ee3a04ec873d143', '[\"*\"]', NULL, '2022-01-08 07:30:43', '2022-01-08 07:30:43'),
(105, 'App\\Models\\User', 41, 'MyAuthApp', '75e9d0c81ebd1f7fa33d81b34a1144d5a828f553b01afdd6fc6438971a5ad6ce', '[\"*\"]', '2022-01-08 07:31:11', '2022-01-08 07:31:08', '2022-01-08 07:31:11'),
(106, 'App\\Models\\User', 41, 'MyAuthApp', '305667ea2e58ebaf484ce55c030ddd55bb6443c2bd4147666b21bf8524e28bbb', '[\"*\"]', '2022-01-08 14:31:30', '2022-01-08 07:31:08', '2022-01-08 14:31:30'),
(107, 'App\\Models\\User', 42, 'MyAuthApp', '9477bc3eb1cedb44feca16efa66c728fadeedec51a9b35bf11cd87aea81b6805', '[\"*\"]', NULL, '2022-01-08 07:43:18', '2022-01-08 07:43:18'),
(108, 'App\\Models\\User', 42, 'MyAuthApp', 'fd1c3e7227531110205b7a7172a1a70b492ce4e17f4bbd6bf5213109b300d754', '[\"*\"]', '2022-01-08 07:43:46', '2022-01-08 07:43:44', '2022-01-08 07:43:46'),
(109, 'App\\Models\\User', 43, 'MyAuthApp', '7330f5fb8c99c0232015b857ade77fd51b636b4e43452f44190a8985fe2b1d0a', '[\"*\"]', NULL, '2022-01-08 10:00:59', '2022-01-08 10:00:59'),
(110, 'App\\Models\\User', 43, 'MyAuthApp', '4e4f3c842fa0aa0d57c9f18b0957242c634fbbe577c8ee617a20ea1c6dbe0241', '[\"*\"]', '2022-01-08 14:32:54', '2022-01-08 10:01:14', '2022-01-08 14:32:54'),
(111, 'App\\Models\\User', 44, 'MyAuthApp', 'cc025dbd32aefaf7c941517382a19306bd5c613c49f817c0615eadc59dd65e7c', '[\"*\"]', NULL, '2022-01-08 14:14:28', '2022-01-08 14:14:28'),
(112, 'App\\Models\\User', 44, 'MyAuthApp', 'd4de398b6ef61a17b06f2d08c89ffe8e71fe23771ee48cc62a3235a0469409b3', '[\"*\"]', '2022-01-08 14:29:11', '2022-01-08 14:16:13', '2022-01-08 14:29:11'),
(113, 'App\\Models\\User', 45, 'MyAuthApp', 'a19b459e75dc6b5f8ec3b9d2256e29646bf03134e57895f7f11f73321d215e26', '[\"*\"]', NULL, '2022-01-08 14:17:20', '2022-01-08 14:17:20'),
(114, 'App\\Models\\User', 45, 'MyAuthApp', '18d3b16d2518c22d8b250a4d414eb69ba4fba61940d25d13bceeabe28edba646', '[\"*\"]', '2022-01-08 14:31:26', '2022-01-08 14:17:50', '2022-01-08 14:31:26'),
(115, 'App\\Models\\User', 44, 'MyAuthApp', '1496fe68feb8d8892386319be30ad7331461e6311e90b1049443100c30775e0b', '[\"*\"]', '2022-03-03 10:53:28', '2022-01-08 14:31:49', '2022-03-03 10:53:28'),
(116, 'App\\Models\\User', 23, 'MyAuthApp', '5c97ae7b73f42677d46945c2075b030c2464902c0368cbc385330972d69932ec', '[\"*\"]', '2022-01-19 08:24:18', '2022-01-12 19:24:17', '2022-01-19 08:24:18'),
(117, 'App\\Models\\User', 23, 'MyAuthApp', '329b2028e09c379923c42eb0b48adcb0c9dabb5f6bdf0202bee25a77efd75bce', '[\"*\"]', '2022-01-13 17:00:03', '2022-01-13 16:59:07', '2022-01-13 17:00:03'),
(118, 'App\\Models\\User', 46, 'MyAuthApp', 'd80a5cb1a6a345f9a1fc0b4efb4c180d2262e1a464f00ace88ebb09d5f47fa4f', '[\"*\"]', NULL, '2022-01-18 09:30:06', '2022-01-18 09:30:06'),
(119, 'App\\Models\\User', 46, 'MyAuthApp', '93b86f24288c450b8c68dcad33857d68b52a33092ea7f986449826dcdcb3f19c', '[\"*\"]', '2022-01-18 09:46:18', '2022-01-18 09:30:26', '2022-01-18 09:46:18'),
(120, 'App\\Models\\User', 42, 'MyAuthApp', 'b897f950b0f2b1976a54f9bff1d42b75690e0742eb55722dc9c14f814bed51bd', '[\"*\"]', '2022-01-18 12:03:12', '2022-01-18 10:49:24', '2022-01-18 12:03:12'),
(121, 'App\\Models\\User', 47, 'MyAuthApp', '888896692acded770e33f7c254c779819ce731e9bc66d8b851488c0d0329e77d', '[\"*\"]', NULL, '2022-01-18 10:54:27', '2022-01-18 10:54:27'),
(122, 'App\\Models\\User', 47, 'MyAuthApp', '7e12689ba14f08ed32fcb2ca2699b78c707818ee3ef77d0dfc9a95ea3821823b', '[\"*\"]', '2022-01-26 11:08:02', '2022-01-18 10:54:47', '2022-01-26 11:08:02'),
(123, 'App\\Models\\User', 48, 'MyAuthApp', '15c84924974bcd639be1ccf8f555d40165fa1a21a613e0fcb5a9c040b65415a5', '[\"*\"]', NULL, '2022-01-18 12:10:25', '2022-01-18 12:10:25'),
(124, 'App\\Models\\User', 48, 'MyAuthApp', 'a6d8439566a3df0626f8c89ca363725038aeeec542469a631e121dcb27a44df2', '[\"*\"]', '2022-01-18 12:16:09', '2022-01-18 12:10:57', '2022-01-18 12:16:09'),
(125, 'App\\Models\\User', 49, 'MyAuthApp', '3f12ef326ed20d2ac2b5f340be288f2a5023ca0f3920f90601b978ebbfaae22b', '[\"*\"]', NULL, '2022-01-19 11:17:21', '2022-01-19 11:17:21'),
(126, 'App\\Models\\User', 49, 'MyAuthApp', 'd5d7ab4df1116aa6d37d4b2cb2cc50d171a17f60e599daf0bbc2f615e91130e2', '[\"*\"]', '2022-01-19 11:24:10', '2022-01-19 11:18:01', '2022-01-19 11:24:10'),
(127, 'App\\Models\\User', 23, 'MyAuthApp', 'df4fe9728910221338b9622c04bcc72508a4afe6938419be337546516da4bb8d', '[\"*\"]', '2022-02-21 16:27:58', '2022-02-13 15:20:13', '2022-02-21 16:27:58'),
(128, 'App\\Models\\User', 23, 'MyAuthApp', 'f55587c477a882b47a2f2d3e8b2539def0923b909bb5a2e14e43d20a498d859d', '[\"*\"]', '2022-02-15 00:51:20', '2022-02-15 00:50:00', '2022-02-15 00:51:20'),
(129, 'App\\Models\\User', 23, 'MyAuthApp', '52d88b1b8e57b59b3147b6e92ab7b245aa22aea65fa6aea0f7dde459971d30a0', '[\"*\"]', '2022-02-22 14:08:39', '2022-02-20 12:54:26', '2022-02-22 14:08:39'),
(130, 'App\\Models\\User', 23, 'MyAuthApp', 'ead3212e136075b5dcd21d9e311dba3f88788b7e68dc6c51fe15ca032edde2c9', '[\"*\"]', NULL, '2022-02-21 12:57:59', '2022-02-21 12:57:59'),
(131, 'App\\Models\\User', 23, 'MyAuthApp', '1666fba3514569b0a964c91ded7e3d0022b607d130845e933408849a80c153d9', '[\"*\"]', '2022-02-21 16:01:25', '2022-02-21 12:59:04', '2022-02-21 16:01:25'),
(132, 'App\\Models\\User', 23, 'MyAuthApp', '5a3417d7d5841ee46a4f9eeb34b371cdbde4ea198ef3b0b0f51f4a3710d5fc4a', '[\"*\"]', NULL, '2022-02-21 16:01:45', '2022-02-21 16:01:45'),
(133, 'App\\Models\\User', 23, 'MyAuthApp', '8dd996a47dad5a2fbcb942b9e6639c15ffac576536d6878e910817962f1293b5', '[\"*\"]', NULL, '2022-02-21 16:03:42', '2022-02-21 16:03:42'),
(134, 'App\\Models\\User', 23, 'MyAuthApp', '406ef5725f9d15d7356138f7ed4c2d96816d0050856b771d0b80014d464e20f4', '[\"*\"]', NULL, '2022-02-21 16:04:14', '2022-02-21 16:04:14'),
(135, 'App\\Models\\User', 23, 'MyAuthApp', 'cfcd08144df3c7fac060defb3202e87bcc2f29303cf38c9eb11ebbabbc8e02c1', '[\"*\"]', '2022-02-21 16:13:01', '2022-02-21 16:08:19', '2022-02-21 16:13:01'),
(136, 'App\\Models\\User', 23, 'MyAuthApp', 'd411472319603361923235175637ef22fe95ad99a04cf2fc817fa0def8eded8e', '[\"*\"]', NULL, '2022-02-21 16:12:43', '2022-02-21 16:12:43'),
(137, 'App\\Models\\User', 23, 'MyAuthApp', '64f33389ae4b212bb97d411660c75e9703b39b187d059c81e9c1615036273d9e', '[\"*\"]', '2022-02-21 16:14:07', '2022-02-21 16:13:12', '2022-02-21 16:14:07'),
(138, 'App\\Models\\User', 23, 'MyAuthApp', '1bc2b6fed2822d69d405bba34d8a2481383c1896186680df9fadf08cfc279ce5', '[\"*\"]', '2022-02-21 22:32:44', '2022-02-21 16:14:53', '2022-02-21 22:32:44'),
(139, 'App\\Models\\User', 23, 'MyAuthApp', '8d4045480864233e1b4267db412a72cb35a5c197c35a1b6820d2cc0cde8e3f9d', '[\"*\"]', NULL, '2022-02-21 22:48:59', '2022-02-21 22:48:59'),
(140, 'App\\Models\\User', 23, 'MyAuthApp', '0b59e108cc5b7b1ec5d4d71ee6a810107590848c20323d708b7423be22d31c9f', '[\"*\"]', '2022-02-21 22:50:03', '2022-02-21 22:49:06', '2022-02-21 22:50:03'),
(141, 'App\\Models\\User', 23, 'MyAuthApp', 'dd7c72824dc3a39271dc47191b704d419bbc85b33b84541a9de9c2412ab9a8ff', '[\"*\"]', '2022-02-22 01:23:23', '2022-02-21 22:50:09', '2022-02-22 01:23:23'),
(142, 'App\\Models\\User', 25, 'MyAuthApp', 'a0be3e0453c7ccdf6e093294eda90bdcb0e8fd9e76de48e81e38c4df4d35d065', '[\"*\"]', '2022-02-22 02:21:05', '2022-02-22 02:15:41', '2022-02-22 02:21:05'),
(143, 'App\\Models\\User', 23, 'MyAuthApp', 'e5ab8c09933c79753d644401c1485562aabe6554aebf137390e921422fb19dc2', '[\"*\"]', '2022-02-23 23:58:32', '2022-02-22 02:21:16', '2022-02-23 23:58:32'),
(144, 'App\\Models\\User', 50, 'MyAuthApp', '2fe77f7c9d463d49734e86bb03b32181290e72bfd915271bfe42714ac6a2d203', '[\"*\"]', NULL, '2022-02-22 09:30:57', '2022-02-22 09:30:57'),
(145, 'App\\Models\\User', 50, 'MyAuthApp', 'efe09c111d700065c5ed6ccdbb3b0865e4921a4399c4f7b936ec4bd950c5453d', '[\"*\"]', '2022-02-22 09:34:59', '2022-02-22 09:31:47', '2022-02-22 09:34:59'),
(146, 'App\\Models\\User', 23, 'MyAuthApp', 'd06f796f3066e16a820f1635d75c5a6e9697666b49b1e5355e5553d6d0e60b0e', '[\"*\"]', '2022-03-29 15:27:46', '2022-02-22 14:09:58', '2022-03-29 15:27:46'),
(147, 'App\\Models\\User', 25, 'MyAuthApp', '48607c0a72b4542ab87e33dd0a7a14a9b5783408752f70b8a6e85bd81f53a57d', '[\"*\"]', '2022-02-23 23:59:34', '2022-02-23 23:59:26', '2022-02-23 23:59:34'),
(148, 'App\\Models\\User', 26, 'MyAuthApp', 'd357713361c8f13e578446f190ef418ca7b5855d059b1e13b20c61902dfb4610', '[\"*\"]', '2022-02-23 23:59:53', '2022-02-23 23:59:49', '2022-02-23 23:59:53'),
(149, 'App\\Models\\User', 23, 'MyAuthApp', '90431387a4231f8dc713649bfd24133b4533e9a032ee58d6b937c86990bd253d', '[\"*\"]', '2022-03-23 12:11:45', '2022-02-24 00:10:35', '2022-03-23 12:11:45'),
(150, 'App\\Models\\User', 51, 'MyAuthApp', 'a032bede16a1632b92953c4343af9a08cb9560dceee8bb282a700d01dfba5f6a', '[\"*\"]', NULL, '2022-02-24 18:24:12', '2022-02-24 18:24:12'),
(151, 'App\\Models\\User', 51, 'MyAuthApp', '25e46679114cac2a810f933ec255b76ea7c6f0f98b8be37b4ba6249fa36d14c5', '[\"*\"]', '2022-02-24 23:58:16', '2022-02-24 18:24:39', '2022-02-24 23:58:16'),
(152, 'App\\Models\\User', 40, 'MyAuthApp', '9b73d3ee374af96c8a9ab42723dbba51ce37e42320122d62e5442c61e396d6f4', '[\"*\"]', '2022-03-21 15:37:09', '2022-02-25 00:18:50', '2022-03-21 15:37:09'),
(153, 'App\\Models\\User', 23, 'MyAuthApp', 'dd9ebdd0362c7c1fe02676f7403425337a33674a7a22cf5798cf554385f4793e', '[\"*\"]', '2022-03-02 09:08:36', '2022-03-01 23:59:50', '2022-03-02 09:08:36'),
(154, 'App\\Models\\User', 39, 'MyAuthApp', '032ff2f31948218b83eb965794fcc0d293e7e2ff9ff2efd52737f677acf1d034', '[\"*\"]', '2022-03-06 19:00:31', '2022-03-06 18:02:53', '2022-03-06 19:00:31'),
(155, 'App\\Models\\User', 39, 'MyAuthApp', 'ad7799b660e7965fd8deb4c6603645917d169510de4615da1e333ff8e788d9f9', '[\"*\"]', '2022-03-09 20:04:26', '2022-03-06 19:00:44', '2022-03-09 20:04:26'),
(156, 'App\\Models\\User', 53, 'MyAuthApp', 'fb9573e7a9106fc654f16200f88f80ebb9da6887535e15a8e0b08be7ad49aeda', '[\"*\"]', NULL, '2022-03-11 17:11:33', '2022-03-11 17:11:33'),
(157, 'App\\Models\\User', 53, 'MyAuthApp', '63b91e2ff06fcd7be91cc7cac04882a75f72e772143df79993798f0359d46cff', '[\"*\"]', '2022-03-11 17:12:12', '2022-03-11 17:11:53', '2022-03-11 17:12:12'),
(158, 'App\\Models\\User', 54, 'MyAuthApp', 'c453961475da0f3ce2c830e2b22899fde921b3dbef3bdf1e39981816564f8676', '[\"*\"]', NULL, '2022-03-11 21:35:27', '2022-03-11 21:35:27'),
(159, 'App\\Models\\User', 54, 'MyAuthApp', '928b76a4a240edc6d90b2b53514840423b47cedf0fd2cdbc7ff758c3080a71e2', '[\"*\"]', '2022-03-11 22:12:59', '2022-03-11 21:35:48', '2022-03-11 22:12:59'),
(160, 'App\\Models\\User', 55, 'MyAuthApp', 'bc2513b2b6b5654784394e758232b35678453d9dccee7e7a538acee9037d969b', '[\"*\"]', NULL, '2022-03-13 17:56:32', '2022-03-13 17:56:32'),
(161, 'App\\Models\\User', 55, 'MyAuthApp', 'e979c5717c35fc07a5464f6343f71cc71764f4527a0f5c2940e890af9d9562db', '[\"*\"]', '2022-03-13 18:00:35', '2022-03-13 17:57:03', '2022-03-13 18:00:35'),
(162, 'App\\Models\\User', 56, 'MyAuthApp', 'f01ee711e53aca5fd782bcc3b8cd4b569f6d0c38897978b5ef0cdc48d7e91f76', '[\"*\"]', NULL, '2022-03-13 19:00:07', '2022-03-13 19:00:07'),
(163, 'App\\Models\\User', 56, 'MyAuthApp', 'cfea4800a485cf0b9f36d77ae02a9640a360864d8be340dc8e321451d09a236f', '[\"*\"]', '2022-03-13 19:01:35', '2022-03-13 19:00:28', '2022-03-13 19:01:35'),
(164, 'App\\Models\\User', 39, 'MyAuthApp', '048409367e4ecd5e2e76b47f4a5393d578d818a25774d55085f14b64e347c4e7', '[\"*\"]', '2022-03-20 19:44:41', '2022-03-20 11:54:14', '2022-03-20 19:44:41'),
(165, 'App\\Models\\User', 23, 'MyAuthApp', 'b94bef5c2f870178014ce26853f143658d1c58dd0e9c35f3b22ea2a6dfd6d0f6', '[\"*\"]', '2022-03-21 22:21:41', '2022-03-21 22:15:58', '2022-03-21 22:21:41'),
(166, 'App\\Models\\User', 40, 'MyAuthApp', '39e90ac0ca6fbf5e9ba5f74ed1712401cc426ac36208268cf5cf9b245a21950b', '[\"*\"]', '2022-03-24 02:47:21', '2022-03-24 02:46:01', '2022-03-24 02:47:21'),
(167, 'App\\Models\\User', 23, 'MyAuthApp', '9114019a3651c07ad27e0c6c06cb0bc32e0772c152447f7d3c7f7c9ee4db890a', '[\"*\"]', '2022-03-30 02:57:11', '2022-03-24 14:24:17', '2022-03-30 02:57:11'),
(168, 'App\\Models\\User', 1, 'MyAuthApp', '91de507271552124c0f1e3039303c1afcc339f340559eee09fe3470bb958c350', '[\"*\"]', NULL, '2022-03-30 03:02:27', '2022-03-30 03:02:27'),
(169, 'App\\Models\\User', 1, 'MyAuthApp', '154eae8384894bfda943de2162164d32b0962b183b82bbc5a74b2ff81d1b9532', '[\"*\"]', '2022-04-15 01:26:01', '2022-03-30 03:02:40', '2022-04-15 01:26:01'),
(170, 'App\\Models\\User', 1, 'MyAuthApp', '112e1f546dbcf6e49fcf5674e6e4425b0562162028058ccb93b67d92836c4709', '[\"*\"]', '2022-04-14 22:50:18', '2022-03-30 03:36:26', '2022-04-14 22:50:18'),
(171, 'App\\Models\\User', 1, 'MyAuthApp', '4d80a7cfec2cc727f8e4f17e62d9c32a6bbe22eaacde9b2f2cbefd4f49aecb05', '[\"*\"]', '2022-04-04 16:41:36', '2022-04-04 16:01:44', '2022-04-04 16:41:36'),
(172, 'App\\Models\\User', 2, 'MyAuthApp', '771fa54df1e252b335815a1d6b562bc28089e3081f4d9063113a58b7f058de8b', '[\"*\"]', NULL, '2022-04-07 07:53:54', '2022-04-07 07:53:54'),
(173, 'App\\Models\\User', 2, 'MyAuthApp', '08636317a50303045de06b4e3df8900599215f224e027f75325726c8e6e6960b', '[\"*\"]', '2022-04-07 07:54:15', '2022-04-07 07:54:14', '2022-04-07 07:54:15'),
(174, 'App\\Models\\User', 2, 'MyAuthApp', '6f69c9d5a51813ac426cc42cac9990962bfba34f8c8478b22dcede24f6fa5b47', '[\"*\"]', '2022-04-07 08:01:47', '2022-04-07 07:54:15', '2022-04-07 08:01:47'),
(175, 'App\\Models\\User', 3, 'MyAuthApp', '04a041b87929258ef78619ee7b290fefa91f711402e90c27abf26a08916b7fbc', '[\"*\"]', NULL, '2022-04-07 08:03:06', '2022-04-07 08:03:06'),
(176, 'App\\Models\\User', 2, 'MyAuthApp', 'bfbfba8534698fca6a33941fe4973e8ef5f8c27568fd8d3606f9592ca020e5d1', '[\"*\"]', '2022-04-08 05:48:25', '2022-04-08 04:33:55', '2022-04-08 05:48:25'),
(177, 'App\\Models\\User', 2, 'MyAuthApp', '1f22a687cfa76ee0c0695db4c327ebbd12de271a6d049cbb26f2eb3a2fd7a6f8', '[\"*\"]', '2022-04-08 07:11:21', '2022-04-08 05:48:42', '2022-04-08 07:11:21'),
(178, 'App\\Models\\User', 2, 'MyAuthApp', '22f8a37ac8d96319b12c568201c0dcfdbe3202c44953b40df9dcac8a91353a81', '[\"*\"]', '2022-04-08 07:26:16', '2022-04-08 07:11:56', '2022-04-08 07:26:16'),
(179, 'App\\Models\\User', 4, 'MyAuthApp', '601c9aa64acd2c48f4bb063b89cd58d62d8c41accd96b2b81a0b6aa85f75c682', '[\"*\"]', NULL, '2022-04-08 07:31:18', '2022-04-08 07:31:18'),
(180, 'App\\Models\\User', 2, 'MyAuthApp', '36ce0c99dad941e254de705627cade67f5d9b2a75f5c2fa3370628cb529a3fc3', '[\"*\"]', '2022-04-08 07:31:40', '2022-04-08 07:31:33', '2022-04-08 07:31:40'),
(181, 'App\\Models\\User', 4, 'MyAuthApp', '766d977d8e47d4f861b832a58ce549fc59a9c436893a013f867fe6777afd2998', '[\"*\"]', '2022-04-08 07:32:27', '2022-04-08 07:32:05', '2022-04-08 07:32:27'),
(182, 'App\\Models\\User', 2, 'MyAuthApp', '4434df0d27da982948bfad2214fa84f2ec2e9d10272ac4253874900fb7f024c2', '[\"*\"]', '2022-04-08 07:47:36', '2022-04-08 07:33:47', '2022-04-08 07:47:36'),
(183, 'App\\Models\\User', 2, 'MyAuthApp', 'f04da13b80bfffe34db4aac0f0f03b182c6ebedaf138996e9539c6c378bc9d4d', '[\"*\"]', '2022-04-10 15:52:34', '2022-04-10 15:51:45', '2022-04-10 15:52:34'),
(184, 'App\\Models\\User', 1, 'MyAuthApp', '84f04f221ef433d68d7010c56120d86964a9489562d55e59037f1f2e1734d7ef', '[\"*\"]', '2022-04-14 01:03:21', '2022-04-13 22:19:59', '2022-04-14 01:03:21'),
(185, 'App\\Models\\User', 1, 'MyAuthApp', 'ab63d8087d196915ec9bf053b2994aa023f8f5911b8f5249af32a850b7de7854', '[\"*\"]', NULL, '2022-04-14 19:54:42', '2022-04-14 19:54:42'),
(186, 'App\\Models\\User', 5, 'MyAuthApp', 'a279bc791bb565d23b252345b3b5c41f32dccd19363c1dfe455f6008dcc68857', '[\"*\"]', NULL, '2022-04-15 01:26:46', '2022-04-15 01:26:46'),
(187, 'App\\Models\\User', 5, 'MyAuthApp', 'c6f27dd03bcd8839b12b80b491e5a31ba0bd14109de1465b4144c3c0d02dd72e', '[\"*\"]', '2022-04-15 01:33:42', '2022-04-15 01:29:06', '2022-04-15 01:33:42'),
(188, 'App\\Models\\User', 3, 'MyAuthApp', '786b20ea8c69b0af875c1fb81fa46bcc6ed50120f71fec072fa5effe9ffa463e', '[\"*\"]', NULL, '2022-04-15 20:33:00', '2022-04-15 20:33:00'),
(189, 'App\\Models\\User', 3, 'MyAuthApp', '0471b69b0fb796c30180de6cc000fa6819a9f598e18acf1e24c9cfd4125a5744', '[\"*\"]', '2022-04-20 08:17:46', '2022-04-15 20:33:49', '2022-04-20 08:17:46'),
(190, 'App\\Models\\User', 4, 'MyAuthApp', '243171eabd2d5e277da3564dc8799f4d917dc384d2aa5e87569bc3aee914dc80', '[\"*\"]', NULL, '2022-04-17 10:13:03', '2022-04-17 10:13:03'),
(191, 'App\\Models\\User', 4, 'MyAuthApp', '62042423e33560b64b34eb0f13228e57ff111cb12a6da037d8a01d8be8dc21bd', '[\"*\"]', '2022-04-17 18:19:00', '2022-04-17 10:16:33', '2022-04-17 18:19:00'),
(192, 'App\\Models\\User', 5, 'MyAuthApp', 'd0c7b954bf3a87a9d27a0bc59f284eafded4d6becaaf18dc4240e2e616f4296a', '[\"*\"]', NULL, '2022-04-17 18:28:04', '2022-04-17 18:28:04'),
(193, 'App\\Models\\User', 4, 'MyAuthApp', '3f011094a2adb841685fbdd62e8c7a33c1fd142e0f9b92722240ad10fbb5ff60', '[\"*\"]', '2022-04-19 15:34:15', '2022-04-17 18:28:41', '2022-04-19 15:34:15'),
(194, 'App\\Models\\User', 6, 'MyAuthApp', 'd62317adb0bf9e02ebb7e617fdb06a3467304b055a4c6d3858d3829ff275d5f0', '[\"*\"]', NULL, '2022-04-17 22:07:15', '2022-04-17 22:07:15'),
(195, 'App\\Models\\User', 6, 'MyAuthApp', '1006e7724cfd0c7dafe12b96835e4410563dd959929fc69cf7ea6c6a5378486b', '[\"*\"]', '2022-05-06 08:46:35', '2022-04-17 22:08:19', '2022-05-06 08:46:35'),
(196, 'App\\Models\\User', 7, 'MyAuthApp', '14f0fc0c8f7d19bd80df215b603ed1cedca457e75092c75852c0036c4043f3c2', '[\"*\"]', NULL, '2022-04-19 15:35:13', '2022-04-19 15:35:13'),
(197, 'App\\Models\\User', 8, 'MyAuthApp', '75aac92f968684dc1bb0bd51f05ba54cb38c2185bae9dbfff814620062259588', '[\"*\"]', NULL, '2022-04-19 15:35:55', '2022-04-19 15:35:55'),
(198, 'App\\Models\\User', 8, 'MyAuthApp', '4e1bcc8a0942b723f0b3b573a8119a5c99af6ca4634a3fcb2e9fe231c8e7cdaa', '[\"*\"]', '2022-04-19 17:36:11', '2022-04-19 15:38:11', '2022-04-19 17:36:11'),
(199, 'App\\Models\\User', 8, 'MyAuthApp', 'f2e11117bbd9349d1f31e6fa6af6880dae3213e19106ddd45fcc693fa05dc3e5', '[\"*\"]', '2022-04-20 14:38:35', '2022-04-20 08:19:18', '2022-04-20 14:38:35'),
(200, 'App\\Models\\User', 3, 'MyAuthApp', 'c4712cc3dee7a96d2c9d4b117454e6b868dc8db33b358786a880e252234532a3', '[\"*\"]', '2022-04-20 15:01:27', '2022-04-20 11:12:09', '2022-04-20 15:01:27'),
(201, 'App\\Models\\User', 3, 'MyAuthApp', 'e018b326592e6de003f5a1aa12dd824451be11db06209779e6cde5f21c8f3749', '[\"*\"]', '2022-04-20 18:43:25', '2022-04-20 14:38:59', '2022-04-20 18:43:25'),
(202, 'App\\Models\\User', 8, 'MyAuthApp', '0da3ab457ea48b13ee0ab64b8536b0a3ae830c837ef1a57c14ebd0d4debcf392', '[\"*\"]', '2022-04-20 21:45:05', '2022-04-20 19:12:00', '2022-04-20 21:45:05'),
(203, 'App\\Models\\User', 9, 'MyAuthApp', '2f2ca6c7e61f7acb4dd8b1a309af68eb474d8db874570933a2453740e42d3ea8', '[\"*\"]', NULL, '2022-04-20 21:46:25', '2022-04-20 21:46:25'),
(204, 'App\\Models\\User', 9, 'MyAuthApp', '2f2bb2b925bdd2fca1b6d7a0189de3f0dfd27d259494c23a074eed80504f2a99', '[\"*\"]', '2022-04-30 01:19:46', '2022-04-20 21:47:41', '2022-04-30 01:19:46'),
(205, 'App\\Models\\User', 3, 'MyAuthApp', '4ec0cd27a1e838d9e540585d5156131b8d06af463c0693fc8be2b506e5c4b7b1', '[\"*\"]', '2022-05-04 02:50:56', '2022-05-04 02:50:10', '2022-05-04 02:50:56');

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
(1, 2, 4, '100', 0, NULL, '2022-04-08 06:31:18');

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
(1, '44444444', 'Wallet Funding from ATM card', '500000', 'CR', '2022-04-15 20:02:13', 1, 3, 'Card'),
(2, '44444444', 'Withdrawal from Savings account to bank account', '5000', 'DR', '2022-04-15 20:10:32', 1, 3, NULL),
(3, '44444444', 'Wallet Funding from ATM card', '40000', 'CR', '2022-04-17 17:40:26', 1, 4, 'Card'),
(4, '44444444', 'Withdrawal from Savings account to bank account', '5000', 'DR', '2022-04-17 17:44:13', 1, 4, NULL),
(5, '44444444', 'Wallet Funding from ATM card', '3000', 'CR', '2022-04-17 17:48:46', 1, 4, 'Card'),
(6, '44444444', 'Wallet Funding from ATM card', '1000', 'CR', '2022-04-19 14:40:13', 1, 8, 'Card'),
(7, '44444444', 'Wallet Funding from ATM card', '1000', 'CR', '2022-04-19 15:53:03', 1, 8, 'Card'),
(8, '44444444', 'Wallet Funding from ATM card', '50000', 'CR', '2022-04-20 13:05:16', 1, 8, 'Card'),
(9, '44444444', 'Wallet Funding from ATM card', '5000', 'CR', '2022-04-30 00:19:31', 1, 9, 'Card');

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
  `stockup_item_id` int(100) NOT NULL,
  `member_id` int(11) NOT NULL,
  `qty` int(11) DEFAULT 0,
  `checkout` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `total` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockup_cart`
--

INSERT INTO `stockup_cart` (`id`, `stockup_item_id`, `member_id`, `qty`, `checkout`, `total`, `created_at`, `updated_at`) VALUES
(3, 4, 9, 1, '0', 1000, '2022-04-20 22:05:34', '2022-04-20 22:05:34');

-- --------------------------------------------------------

--
-- Table structure for table `stockup_items`
--

CREATE TABLE `stockup_items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_unit` float(10,2) NOT NULL,
  `item_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_stock` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockup_items`
--

INSERT INTO `stockup_items` (`id`, `item_name`, `quantity`, `price_per_unit`, `item_image`, `unit`, `description`, `in_stock`, `created_at`, `updated_at`) VALUES
(1, 'Rodo', 20, 1000.00, 'https://organicfoods.com.ng/wp-content/uploads/2019/09/atarodo.jpg', 12, 'Need to buy Atarodo (Fresh Pepper)? Then our Atarodo (Fresh Pepper) will be your best friend. Our Atarodo (Fresh Pepper) is  directly from our farm. They are healthy, rich in fiber and many other nutrients.\r\n\r\nFresh Pepper (Atarodo)  helps to reduce the build-up of excess body fat and aids metabolism.', 10, '2021-12-20 21:12:45', '2021-12-20 21:12:45'),
(2, 'Onions', 20, 1000.00, 'https://organicfoods.com.ng/wp-content/uploads/2019/09/red-onions.jpg', 12, 'Most of the benefits come from antioxidants. Research shows that one particular antioxidant, called quercetin, protects health in several ways. One study shows that quercetin fights inflammation and boosts the immune system.', 1, '2021-12-20 21:18:40', '2021-12-20 21:18:40'),
(3, 'Rice', 20, 1000.00, 'https://organicfoods.com.ng/wp-content/uploads/2019/09/african-pear.jpg', 12, 'Most of the benefits come from antioxidants. Research shows that one particular antioxidant, called quercetin, protects health in several ways. One study shows that quercetin fights inflammation and boosts the immune system.', 1, '2021-12-20 21:18:40', '2021-12-20 21:18:40'),
(4, 'PawPaw', 20, 1000.00, 'https://organicfoods.com.ng/wp-content/uploads/2019/09/pawpaw-1.jpg', 12, 'Most of the benefits come from antioxidants. Research shows that one particular antioxidant, called quercetin, protects health in several ways. One study shows that quercetin fights inflammation and boosts the immune system.', 1, '2021-12-20 21:18:40', '2021-12-20 21:18:40');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockup_members_interest`
--

INSERT INTO `stockup_members_interest` (`id`, `stockup_item_id`, `member_id`, `period`, `created_at`, `updated_at`) VALUES
(1, 2, 8, 1, '2022-04-20 11:17:45', '2022-04-20 11:17:45'),
(3, 3, 8, 1, '2022-04-20 11:18:16', '2022-04-20 11:18:16'),
(4, 4, 9, 1, '2022-04-20 22:04:25', '2022-04-20 22:04:25'),
(5, 1, 9, 1, '2022-04-20 22:04:29', '2022-04-20 22:04:29');

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
  `delivery_phone_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(4) DEFAULT 0,
  `is_delivered` tinyint(4) DEFAULT 0,
  `date_delivered` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expect_delivery_at` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stockup_purchases`
--

INSERT INTO `stockup_purchases` (`id`, `stockup_item_id`, `member_id`, `quantity_of_purchase`, `cost_per_unit`, `total_cost`, `delivery_phone_number`, `delivery_address`, `is_paid`, `is_delivered`, `date_delivered`, `expect_delivery_at`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 1, '1000.00', '1000.00', '000000999', 'hhhh', 1, 0, '10AM to 2PM', '0000-00-00 00:00:00', '1650053355', '2022-04-15 20:09:15', '2022-04-15 20:09:15'),
(2, 2, 3, 1, '1000.00', '1000.00', '000000999', 'hhhh', 1, 0, '10AM to 2PM', '0000-00-00 00:00:00', '1650053355', '2022-04-15 20:09:15', '2022-04-15 20:09:15'),
(3, 1, 3, 1, '1000.00', '1000.00', '000000999', 'hhhh', 1, 0, '10AM to 2PM', '0000-00-00 00:00:00', '1650053355', '2022-04-15 20:09:15', '2022-04-15 20:09:15'),
(4, 1, 8, 1, '1000.00', '1000.00', '08069335842', '9 Nathan street', 1, 0, '10AM to 2PM', '0000-00-00 00:00:00', '1650487226', '2022-04-20 20:40:26', '2022-04-20 20:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `target_savings`
--

CREATE TABLE `target_savings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `frequency` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_amt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_to_save` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_amt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `prev_amt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `yearly_interest` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `preferred_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `default_payment_method` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target_savings`
--

INSERT INTO `target_savings` (`id`, `name`, `category_id`, `frequency`, `target_amt`, `amount_to_save`, `cur_amt`, `prev_amt`, `yearly_interest`, `start_date`, `preferred_time`, `end_date`, `member_id`, `is_current`, `default_payment_method`, `created_at`, `updated_at`) VALUES
(1, 'hij', 1, 'Monthly', '50000', '10000', '99000', '100000', '0', '2022-04-15', '09:03:00', '2022-04-30', 3, 0, 'Card', '2022-04-15 20:03:46', NULL),
(2, 'buy car', 1, 'Weekly', '1000000', '1000', '0', '0', '0', '2022-04-17', '06:51:00', '2022-04-17', 4, 0, 'Card', '2022-04-17 17:55:13', NULL),
(3, 'my target save', 1, 'Weekly', '20000', '1000', '0', '0', '0', '2022-04-19', '04:56:00', '2022-04-19', 8, 0, 'Card', '2022-04-19 15:57:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `target_savings_transactions`
--

CREATE TABLE `target_savings_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `target_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Dumping data for table `target_savings_transactions`
--

INSERT INTO `target_savings_transactions` (`id`, `target_id`, `transaction_ref`, `description`, `amount`, `dr_cr`, `date_transaction`, `bal_affected`, `member_id`, `pay_method`) VALUES
(1, '1', 'ref 928', 'Withdrawal from Savings account to bank account', '2000', 'DR', '2022-04-20 16:47:19', 1, 3, NULL),
(2, '1', 'ref 972', 'Withdrawal from Savings account to bank account', '1000', 'DR', '2022-04-20 16:58:36', 0, 3, NULL),
(3, '1', 'ref 981', 'Withdrawal from Savings account to bank account', '1000', 'DR', '2022-04-20 16:59:17', 0, 3, NULL),
(4, '1', 'ref 962', 'Withdrawal from Savings account to bank account', '1000', 'DR', '2022-04-20 17:01:02', 0, 3, NULL),
(5, '1', 'ref 935', 'Withdrawal from Savings account to bank account', '1000', 'DR', '2022-04-20 17:01:25', 1, 3, NULL);

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
(3, 'Test', '000000999', 'emmanzley@gmail.com', '$2y$10$hRJZaNXK6kGTJ5iEwX7QMeVACu8mm7F.ZUSzEJK9LCHT//34YBYJa', 2, 1, '2022-05-04 02:50:10', NULL, NULL, NULL),
(4, 'DPO', '', 'testerdaps@gmail.com', '$2y$10$BlULL6o5BZWMXgg0Qcjr7O/hOy6Vm7CRpTPobJsIWpMAV.UoOV3Z.', 2, 1, '2022-04-17 18:28:41', NULL, NULL, NULL),
(5, 'Vicky', NULL, 'testerdaps1@gmail.com', '$2y$10$IpQ9Cayoz8EsFFva3lAqNOgJqQyZEuFOXs/wBBZI3MJwaWynPCFbC', 2, 1, NULL, NULL, NULL, NULL),
(6, 'Emeka Nwachinemere', NULL, 'nwachinemere.emeka@gmail.com', '$2y$10$dZzyEwfWa9fOwhR/fVWXCucAbXgU2KqNg939EgLMjeCG90NEYsFW2', 2, 1, '2022-04-17 22:08:19', NULL, NULL, NULL),
(7, 'moses pay', NULL, 'moses@gmail.com', '$2y$10$olthiYjHALrx0ESVlXDkBeaWQKG91WWmU4nP4aTqiuQI/Yj1HRAuy', 2, 1, NULL, NULL, NULL, NULL),
(8, 'zaks', '08069335842', 'metzakaria@gmail.com', '$2y$10$f44WgN1/YAeh1h7.nnPFde/UTHEleFnTSi03BotdUfVqfT7IulSxy', 2, 1, '2022-04-20 19:12:00', NULL, NULL, NULL),
(9, 'Emmanuel Adenagbe', '', 'emmanzley@yahoo.com', '$2y$10$ngzAVLt3TB4NbScPU2KNFum9VxVzDK1j6d5qRYeEadMRawKgp6KGO', 2, 1, '2022-04-20 21:47:41', NULL, NULL, NULL);

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
(1, 'ABC', 'starage of all farm produce in kaduna state', 5, NULL, NULL, '2021-10-27 14:57:50', '2021-11-15 12:58:47', 'Leadway', '388839289'),
(2, 'Ab Micro Storage', 'Micro farmers produce storage in this warehouse', 4, NULL, NULL, '2021-11-15 12:57:48', '2021-11-15 12:57:48', 'Aiico Insurance', '00098');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `bill_payments_date_created_index` (`created_at`);

--
-- Indexes for table `chat_channel`
--
ALTER TABLE `chat_channel`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `target_savings_transactions`
--
ALTER TABLE `target_savings_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_member_id_index` (`member_id`),
  ADD KEY `transactions_bal_affected_index` (`bal_affected`),
  ADD KEY `transactions_date_transaction_index` (`date_transaction`);

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
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chat_channel`
--
ALTER TABLE `chat_channel`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commodities`
--
ALTER TABLE `commodities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `debit_cards`
--
ALTER TABLE `debit_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `farmers`
--
ALTER TABLE `farmers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `farmer_storages`
--
ALTER TABLE `farmer_storages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_msgs`
--
ALTER TABLE `group_msgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_msg_replies`
--
ALTER TABLE `group_msg_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `identity_types`
--
ALTER TABLE `identity_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `investment_auctions`
--
ALTER TABLE `investment_auctions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `investment_products`
--
ALTER TABLE `investment_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `membership_fees`
--
ALTER TABLE `membership_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `regular_savings`
--
ALTER TABLE `regular_savings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regular_savings_transactions`
--
ALTER TABLE `regular_savings_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stockup_items`
--
ALTER TABLE `stockup_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stockup_members_interest`
--
ALTER TABLE `stockup_members_interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stockup_purchases`
--
ALTER TABLE `stockup_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `target_savings`
--
ALTER TABLE `target_savings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `target_savings_transactions`
--
ALTER TABLE `target_savings_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `target_saving_cats`
--
ALTER TABLE `target_saving_cats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
