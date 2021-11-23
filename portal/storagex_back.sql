-- -------------------------------------------------------------
-- TablePlus 3.11.0(352)
--
-- https://tableplus.com/
--
-- Database: storagex_back
-- Generation Time: 2021-11-23 17:19:32.3700
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `asset_types`;
CREATE TABLE `asset_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `banks`;
CREATE TABLE `banks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `bill_payments`;
CREATE TABLE `bill_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `bill_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `date_paid` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bill_payments_member_id_index` (`member_id`),
  KEY `bill_payments_bill_type_index` (`bill_type`),
  KEY `bill_payments_is_paid_index` (`is_paid`),
  KEY `bill_payments_date_paid_index` (`date_paid`),
  KEY `bill_payments_date_created_index` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `commodities`;
CREATE TABLE `commodities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_measure` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `debit_cards`;
CREATE TABLE `debit_cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `card_no` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `cvv` varchar(5) DEFAULT NULL,
  `issuing_bank` int DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `datecreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `farmer_storages`;
CREATE TABLE `farmer_storages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `farmer_id` int NOT NULL,
  `ware_house_id` int DEFAULT NULL,
  `commodity_id` int DEFAULT NULL,
  `qty` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_receipt_generated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_removed` tinyint(1) NOT NULL DEFAULT '0',
  `date_removed` timestamp NULL DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmer_storages_farmer_id_index` (`farmer_id`),
  KEY `farmer_storages_ware_house_id_index` (`ware_house_id`),
  KEY `farmer_storages_commodity_id_index` (`commodity_id`),
  KEY `farmer_storages_is_removed_index` (`is_removed`),
  KEY `farmer_storages_date_receipt_generated_index` (`date_receipt_generated`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `farmers`;
CREATE TABLE `farmers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reg_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int DEFAULT NULL,
  `lga_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `produce_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `farmers_state_id_index` (`state_id`),
  KEY `farmers_lga_id_index` (`lga_id`),
  KEY `farmers_first_name_index` (`full_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `group_members`;
CREATE TABLE `group_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `group_owner_id` int DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `group_members_group_id_index` (`group_id`),
  KEY `group_members_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `group_msg_replies`;
CREATE TABLE `group_msg_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_msg_id` int DEFAULT NULL,
  `replied_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `replied_member` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_msg_replies_group_msg_id_index` (`group_msg_id`),
  KEY `group_msg_replies_replied_member_index` (`replied_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `group_msgs`;
CREATE TABLE `group_msgs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_menber` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_msgs_group_id_index` (`group_id`),
  KEY `group_msgs_created_menber_index` (`created_menber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int DEFAULT NULL,
  `lga_id` int DEFAULT NULL,
  `created_menber` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_state_id_index` (`state_id`),
  KEY `groups_lga_id_index` (`lga_id`),
  KEY `groups_created_menber_index` (`created_menber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `identity_types`;
CREATE TABLE `identity_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `identity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `investment_auctions`;
CREATE TABLE `investment_auctions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `investment_id` int NOT NULL,
  `invest_product_id` int NOT NULL DEFAULT '0',
  `qty_offer` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_sold` tinyint(1) NOT NULL DEFAULT '0',
  `date_sold` timestamp NULL DEFAULT NULL,
  `boughtby_member` int DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `offer_close_at` datetime DEFAULT NULL,
  `t_n_c` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `secondary_markets_investment_id_index` (`investment_id`),
  KEY `secondary_markets_is_sold_index` (`is_sold`),
  KEY `secondary_markets_date_sold_index` (`date_sold`),
  KEY `secondary_markets_date_created_index` (`date_created`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `investment_products`;
CREATE TABLE `investment_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invest_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_interest` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_sold` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `mature_date` date DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_auctionable` tinyint DEFAULT '1',
  `provided_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_matured` tinyint DEFAULT '0',
  `investors` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `investments`;
CREATE TABLE `investments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invest_product_id` int NOT NULL,
  `member_id` int NOT NULL,
  `qty_bought` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amt_bought` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_invest` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expect_amt_return` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_auctioned` tinyint(1) NOT NULL DEFAULT '0',
  `auction_id` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `t_n_c` tinyint DEFAULT '0',
  `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `investments_product_id_index` (`invest_product_id`),
  KEY `investments_member_id_index` (`member_id`),
  KEY `investments_date_invest_index` (`date_invest`),
  KEY `investments_is_sec_market_index` (`is_auctioned`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `lgas`;
CREATE TABLE `lgas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shortname` varchar(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `lga_id` int DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobile` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `security_question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_ans` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bvn` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` int DEFAULT NULL,
  `account_no` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `dob` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type_id` int DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `referral_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_bal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `prev_bal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cur_invest_bal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `prev_invest_bal` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `storagex_bank_id` int DEFAULT NULL,
  `storagex_acct_no` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable_wallet_bal` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`),
  KEY `index_state_id` (`state_id`),
  KEY `index_mobile` (`mobile`),
  KEY `index_is_active` (`is_active`),
  KEY `index_referral_code` (`referral_code`),
  KEY `index_user_id` (`user_id`),
  KEY `members_is_active_index` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `membership_fees`;
CREATE TABLE `membership_fees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `membership_fees_member_id_index` (`member_id`),
  KEY `membership_fees_start_date_index` (`start_date`),
  KEY `membership_fees_end_date_index` (`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `partner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `other_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `asset_type_id` int DEFAULT NULL,
  `insurance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `partners_email_unique` (`email`),
  KEY `partners_asset_type_id_index` (`asset_type_id`),
  KEY `partners_state_id_index` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `referrals`;
CREATE TABLE `referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `referred_member` int DEFAULT NULL,
  `commission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `date_paid` timestamp NULL DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `referrals_referred_member_index` (`referred_member`) USING BTREE,
  KEY `referrals_member_id_index` (`member_id`),
  KEY `referrals_is_paid_index` (`is_paid`),
  KEY `referrals_date_created_index` (`date_created`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `regular_savings`;
CREATE TABLE `regular_savings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `frequency` varchar(20) DEFAULT NULL,
  `default_payment_method` varchar(20) DEFAULT NULL,
  `autosave` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `regular_savings_transactions`;
CREATE TABLE `regular_savings_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dr_cr` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_transaction` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bal_affected` tinyint(1) NOT NULL DEFAULT '0',
  `member_id` bigint DEFAULT NULL,
  `pay_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_member_id_index` (`member_id`),
  KEY `transactions_bal_affected_index` (`bal_affected`),
  KEY `transactions_date_transaction_index` (`date_transaction`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `savings_type`;
CREATE TABLE `savings_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(30) DEFAULT NULL,
  `yearly_interest` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `states`;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `target_saving_cats`;
CREATE TABLE `target_saving_cats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `target_savings`;
CREATE TABLE `target_savings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `target_amt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_amt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_amt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yearly_interest` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `member_id` int NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `target_savings_category_id_index` (`category_id`),
  KEY `target_savings_member_id_index` (`member_id`),
  KEY `target_savings_is_current_index` (`is_current`),
  KEY `target_savings_start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_index` (`role_id`),
  KEY `users_is_active_index` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE `warehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `lga_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `asset_types` (`id`, `name`) VALUES
('1', 'Warehouse'),
('2', 'Solar Dryers'),
('3', 'Silos'),
('4', 'Cold Storage');

INSERT INTO `banks` (`id`, `bank_name`, `short_name`) VALUES
('1', 'Access bank', 'Access'),
('2', 'Diamond Bank', 'Diamond'),
('3', 'Gtbank', 'Gtb');

INSERT INTO `commodities` (`id`, `code`, `name`, `unit_measure`, `created_at`, `updated_at`) VALUES
('1', 'MAZ', 'Maize', 'kg', NULL, NULL),
('2', 'RCE', 'Rice', 'kg', NULL, NULL),
('3', 'SBN', 'SOYA BEAN', 'kg', NULL, NULL),
('4', 'SGM', 'Sorghum', 'kg', NULL, NULL),
('5', 'PML', 'Palm Oil', 'kg', NULL, NULL),
('14', 'CCA', 'Cocoa', 'kg', NULL, NULL),
('15', 'BNS', 'Beans', 'kg', NULL, NULL),
('16', 'BBN', 'Bambara Nut', 'kg', NULL, NULL),
('17', 'TMS', 'Tomatoes', 'kg', NULL, NULL),
('18', 'PPR', 'Pepper', 'kg', NULL, NULL),
('19', 'ONS', 'Onions', 'kg', NULL, NULL),
('20', 'YAM', 'Yam', 'kg', NULL, NULL),
('21', 'IPS', 'Irish Potatoes', 'kg', NULL, NULL),
('22', 'SPS', 'Sweet Potatoes', 'kg', NULL, NULL);

INSERT INTO `debit_cards` (`id`, `member_id`, `card_no`, `expire`, `cvv`, `issuing_bank`, `card_type`, `datecreated`) VALUES
('1', '18', '1234567890987654', '07/22', '234', '1', 'Visa', '2021-10-22 22:02:43');

INSERT INTO `farmer_storages` (`id`, `farmer_id`, `ware_house_id`, `commodity_id`, `qty`, `price`, `value_amount`, `receipt`, `date_receipt_generated`, `is_removed`, `date_removed`, `created_by`, `created_at`, `updated_at`) VALUES
('1', '1', '1', '1', '3500', NULL, '350000', 'SXEWR AK 069 MAZ 161021 ISN 3500', '2021-10-16 15:37:21', '0', NULL, '2', '2021-10-16 15:02:46', NULL);

INSERT INTO `farmers` (`id`, `reg_number`, `full_name`, `state_id`, `lga_id`, `location_id`, `photo`, `email`, `mobile`, `address`, `produce_description`, `created_by`, `created_at`, `updated_at`) VALUES
('1', '069', 'Adebayo Kolawole', NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-29 18:26:49', NULL),
('2', '098', 'zaka moha', NULL, NULL, '4', '2.jpg', 'metzakaria@gamil.com', NULL, NULL, NULL, NULL, '2021-10-31 11:31:45', '2021-11-03 14:21:35'),
('3', '980', 'Mr John', NULL, NULL, '6', '3.jpg', NULL, NULL, NULL, NULL, NULL, '2021-11-04 12:51:13', '2021-11-04 12:51:14'),
('4', '699', 'Mr famer', NULL, NULL, '2', NULL, 'email@farner.com', NULL, 'Lagos state', 'Corn', NULL, '2021-11-14 14:10:05', '2021-11-14 14:10:29');

INSERT INTO `identity_types` (`id`, `identity_name`) VALUES
('1', 'Voter Card'),
('2', 'NIN'),
('3', 'Driver Licience'),
('4', 'Int. passport ');

INSERT INTO `investment_auctions` (`id`, `investment_id`, `invest_product_id`, `qty_offer`, `unit_amount`, `total_amount`, `is_sold`, `date_sold`, `boughtby_member`, `date_created`, `offer_close_at`, `t_n_c`) VALUES
('1', '1', '1', '18', '18', '8', '1', '2021-10-20 20:43:42', '19', '2021-10-19 14:41:15', '2021-10-18 21:45:10', '0');

INSERT INTO `investment_products` (`id`, `name`, `description`, `invest_type`, `unit_interest`, `unit_amount`, `quantity`, `image_file`, `qty_sold`, `is_active`, `created_by`, `start_date`, `mature_date`, `location`, `insurance`, `created_at`, `updated_at`, `is_auctionable`, `provided_by`, `is_matured`, `investors`) VALUES
('1', 'Warehouse Receipts', 'Receipt from where house and its provided by bla bla bla', 'fixed income', '10', '5000', '200', NULL, '0', '0', '1', '2021-10-08', '2021-10-31', NULL, NULL, NULL, NULL, '1', NULL, '0', NULL);

INSERT INTO `investments` (`id`, `invest_product_id`, `member_id`, `qty_bought`, `amt_bought`, `date_invest`, `expect_amt_return`, `is_auctioned`, `auction_id`, `created_at`, `updated_at`, `t_n_c`, `payment_method`) VALUES
('1', '1', '18', '2', '100', '2021-10-18 21:44:56', '1', '1', NULL, NULL, NULL, '0', NULL),
('2', '2', '19', '2', '2', '2021-10-18 21:45:18', '2', '0', NULL, NULL, NULL, '0', NULL),
('3', '1', '18', '5', '90', '2021-10-19 11:48:30', NULL, '0', NULL, NULL, NULL, '1', NULL),
('4', '1', '19', '18', '8', '2021-10-20 21:43:42', '150.88695652174', '1', '1', NULL, NULL, '1', '2');

INSERT INTO `locations` (`id`, `name`, `shortname`, `created_at`, `updated_at`) VALUES
('1', 'Saki', 'SKI', '2021-10-27 14:50:54', NULL),
('2', 'Kaduna', 'KDA', '2021-10-27 14:50:54', NULL),
('3', 'Kano', 'KNO', '2021-10-27 14:50:54', NULL),
('4', 'Markudi', 'MKI', '2021-10-27 14:52:55', NULL),
('5', 'Iseyin', 'ISN', '2021-10-27 14:52:55', NULL),
('6', 'Akure', 'AKE', '2021-10-27 14:52:55', NULL),
('7', 'Abakiliki', 'AKI', '2021-10-27 14:52:55', NULL),
('8', 'Minna', 'MNA', '2021-10-27 14:52:55', NULL),
('9', 'Umuahia', 'UAA', '2021-10-27 14:52:55', NULL);

INSERT INTO `members` (`id`, `full_name`, `state_id`, `lga_id`, `photo`, `email`, `mobile`, `address`, `security_question`, `security_ans`, `bvn`, `bank_id`, `account_no`, `account_name`, `is_verified`, `dob`, `identity_type_id`, `identity_image`, `is_active`, `is_deleted`, `referral_code`, `cur_bal`, `prev_bal`, `user_id`, `created_at`, `updated_at`, `cur_invest_bal`, `prev_invest_bal`, `storagex_bank_id`, `storagex_acct_no`, `disable_wallet_bal`) VALUES
('17', '  ', NULL, NULL, NULL, 'mo@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', '0', 'VGBRW', '0', '0', '18', '2021-10-17 10:05:18', '2021-10-17 10:05:18', NULL, NULL, NULL, NULL, '0'),
('18', 'zakarioh', '1', '1', NULL, 'mox@gmailx.com', 'moxhm', 'moham', 'moham', 'moham', 'moham', '3', '1234567890', 'zak are', '0', 'moham', '1', '4949494949499', '1', '0', 'K6PCB', '101', '1', '19', '2021-10-17 10:07:49', '2021-11-13 15:24:19', '0', '100', NULL, NULL, '0'),
('19', 'zakari moh', NULL, NULL, NULL, 'm@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', '0', 'L6FLG', '0', '0', '20', '2021-10-17 10:09:02', '2021-10-17 10:09:02', NULL, NULL, NULL, NULL, '0'),
('20', 'zakari mohammed omeh', NULL, NULL, NULL, 'mc@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', '0', 'FU0RL', '0', '0', '21', '2021-10-17 10:09:49', '2021-10-17 10:09:49', NULL, NULL, NULL, NULL, '0'),
('21', 'zakari mohammed omeh', NULL, NULL, NULL, 'mcx@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', '0', 'PWII8', '0', '0', '22', '2021-10-17 10:13:38', '2021-10-17 10:13:38', NULL, NULL, NULL, NULL, '0'),
('26', 'zakari mohammed omeh', NULL, NULL, NULL, 'mcxx@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', '0', '6DOXP', '0', '0', '26', NULL, NULL, '0', '0', NULL, NULL, '0'),
('27', 'zakari mohammed omeh', NULL, NULL, NULL, 'mcz@gmailx.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', '0', 'PWZRQ', '0', '0', '27', NULL, NULL, '0', '0', NULL, NULL, '0');

INSERT INTO `membership_fees` (`id`, `member_id`, `amount`, `start_date`, `end_date`, `date_created`) VALUES
('1', '20', '10000', '2021-11-15', '2021-11-16', '2021-11-15 15:38:45');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
('34', '2014_10_12_000000_create_users_table', '1'),
('35', '2014_10_12_100000_create_password_resets_table', '1'),
('36', '2019_08_19_000000_create_failed_jobs_table', '1'),
('37', '2019_12_14_000001_create_personal_access_tokens_table', '1'),
('38', '2021_08_31_124732_create_user_roles_table', '1'),
('39', '2021_08_31_141442_create_members_table', '1'),
('40', '2021_09_02_114622_create_farmers_table', '1'),
('41', '2021_09_02_120243_create_states_table', '1'),
('42', '2021_09_02_120521_create_lgas_table', '1'),
('43', '2021_09_02_120759_create_warehouses_table', '1'),
('44', '2021_09_02_122749_create_farmer_storages_table', '1'),
('45', '2021_09_02_140823_create_commodities_table', '1'),
('46', '2021_09_02_141247_create_banks_table', '1'),
('47', '2021_09_02_141505_create_identity_types_table', '1'),
('48', '2021_09_02_141708_create_target_savings_table', '1'),
('49', '2021_09_02_142338_create_target_saving_cats_table', '1'),
('50', '2021_09_02_142600_create_transactions_table', '1'),
('51', '2021_09_02_143243_create_investment_products_table', '1'),
('52', '2021_09_02_145919_create_investments_table', '1'),
('53', '2021_09_02_151450_create_secondary_markets_table', '1'),
('54', '2021_09_02_153224_create_groups_table', '1'),
('55', '2021_09_02_153644_create_group_msgs_table', '1'),
('56', '2021_09_02_153917_create_group_msg_replies_table', '1'),
('57', '2021_09_02_154242_create_group_members_table', '1'),
('58', '2021_09_02_154615_create_referrals_table', '1'),
('59', '2021_09_02_155001_create_membership_fees_table', '1'),
('60', '2021_09_02_155507_create_partners_table', '1'),
('61', '2021_09_02_161048_create_bill_payments_table', '1'),
('62', '2021_10_17_193553_create_jobs_table', '2');

INSERT INTO `partners` (`id`, `partner_name`, `location_id`, `email`, `phone`, `address`, `other_info`, `asset_type_id`, `insurance`, `user_id`, `created_at`, `updated_at`) VALUES
('1', 'My Partner', NULL, 'example@partner.com', '089839383', 'mushin', NULL, '3', '2', NULL, '2021-11-14 14:29:58', '2021-11-14 14:29:58');

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
('1', 'App\\Models\\User', '1', 'MyAuthApp', '7d62be87f1b0b763aa55df4fc7c0cb8b1908bf68d26d5052c2c9e92ff0c953a1', '[\"*\"]', NULL, '2021-09-03 21:04:42', '2021-09-03 21:04:42'),
('2', 'App\\Models\\User', '2', 'MyAuthApp', 'd579501a454cd6e48ee13400d8f9763b042d519feda01bd4c28b2b760bac77cb', '[\"*\"]', NULL, '2021-09-04 13:40:21', '2021-09-04 13:40:21'),
('3', 'App\\Models\\User', '3', 'MyAuthApp', '6f74a0d5b8d078c390066a6e0b240d54ac73f7aa2f6bd6a5e81d659d254fcc8b', '[\"*\"]', NULL, '2021-09-04 13:40:30', '2021-09-04 13:40:30'),
('4', 'App\\Models\\User', '4', 'MyAuthApp', 'd5e42668b0ef01a3c3352b96579946e869a23e7e85759d61fae483d7c2606683', '[\"*\"]', NULL, '2021-09-04 13:40:35', '2021-09-04 13:40:35'),
('5', 'App\\Models\\User', '5', 'MyAuthApp', '8c3fbb4c33ae25eaba5c65c72ac00d4128fe767fd99777eb8d60a04340cfdef0', '[\"*\"]', NULL, '2021-09-04 13:40:40', '2021-09-04 13:40:40'),
('6', 'App\\Models\\User', '1', 'MyAuthApp', 'e0ec45e8619246464410f5a4ca2d4802472642a4147cfbe65096cd2bbb3b888e', '[\"*\"]', NULL, '2021-09-08 10:54:36', '2021-09-08 10:54:36'),
('7', 'App\\Models\\User', '7', 'MyAuthApp', 'f2aa516c46f0443af00e35e2ffc9470d0e646b3aa128c194ac65cb901dd2c26f', '[\"*\"]', NULL, '2021-09-08 10:54:54', '2021-09-08 10:54:54'),
('8', 'App\\Models\\User', '1', 'MyAuthApp', '9cc5c528a46939bff5d42bb8734e091daa40473d0105725aaa29d434d8ab5f67', '[\"*\"]', '2021-09-08 21:24:18', '2021-09-08 12:44:06', '2021-09-08 21:24:18'),
('9', 'App\\Models\\User', '18', 'MyAuthApp', '5b8361c80dc207d9ece47a79995eb5b6f4202b1d089fa6bc16f089341d12b1d8', '[\"*\"]', NULL, '2021-10-17 10:05:18', '2021-10-17 10:05:18'),
('10', 'App\\Models\\User', '19', 'MyAuthApp', '3e7216fc87adc30cf0385759fa6fb414ff933d620607d23965de574811510f8f', '[\"*\"]', NULL, '2021-10-17 10:07:49', '2021-10-17 10:07:49'),
('11', 'App\\Models\\User', '20', 'MyAuthApp', '930c746db66ad30f1e98e70b62346ace4b601fcfa1fc70e1ae14839012c42f3c', '[\"*\"]', NULL, '2021-10-17 10:09:02', '2021-10-17 10:09:02'),
('12', 'App\\Models\\User', '21', 'MyAuthApp', '5400c066625c458a8234224388b8731181b28a15c3ab610fa3862f773558f3ce', '[\"*\"]', NULL, '2021-10-17 10:09:49', '2021-10-17 10:09:49'),
('13', 'App\\Models\\User', '22', 'MyAuthApp', 'a62eb76e454c3d8bd29fd4680b650d60c714a8be73ead15130a931daf2b8a304', '[\"*\"]', NULL, '2021-10-17 10:13:38', '2021-10-17 10:13:38'),
('14', 'App\\Models\\User', '22', 'MyAuthApp', '1460145f2cc57879806dbaac9a37cca824f2e1dfa53d05280371d62e812d9bdc', '[\"*\"]', NULL, '2021-10-17 10:14:31', '2021-10-17 10:14:31'),
('15', 'App\\Models\\User', '22', 'MyAuthApp', '18e3a2afcaefbc841b2f6916f1b8257cef5b69daef519a15d32bb7abf89eae21', '[\"*\"]', NULL, '2021-10-17 10:14:42', '2021-10-17 10:14:42'),
('16', 'App\\Models\\User', '22', 'MyAuthApp', 'c69fd56be0ea740277ee3f04e4098cf5f39e5f56c4b4b8a1f3d8171278323016', '[\"*\"]', NULL, '2021-10-17 10:14:50', '2021-10-17 10:14:50'),
('17', 'App\\Models\\User', '22', 'MyAuthApp', '3f608e1006b93e028fd43505998f3fac6d6a51f1c8edbdf0b7d657484c8bca72', '[\"*\"]', NULL, '2021-10-17 10:14:56', '2021-10-17 10:14:56'),
('18', 'App\\Models\\User', '22', 'MyAuthApp', 'dfc1da40ed13178def82d6bac9a5f9c958c87f7a3f51e89136302a5aac197af1', '[\"*\"]', NULL, '2021-10-17 10:15:34', '2021-10-17 10:15:34'),
('19', 'App\\Models\\User', '22', 'MyAuthApp', '99241ee3d5acdbb3fd03e2c604c6c78dd96d4004d0873a48e1169dde96c676f5', '[\"*\"]', '2021-11-16 09:05:56', '2021-10-17 11:34:51', '2021-11-16 09:05:56'),
('20', 'App\\Models\\User', '22', 'MyAuthApp', 'f6c4668b986df5ac58d69cf8da13f95ecc1ed0573f3f7210a45acdbee7240f46', '[\"*\"]', NULL, '2021-10-27 13:22:30', '2021-10-27 13:22:30'),
('21', 'App\\Models\\User', '22', 'MyAuthApp', 'cdd57b40d17ed9c20ff5234cfe93e747d2fe7d54d4f6f215bb9a749f136c45bf', '[\"*\"]', NULL, '2021-10-27 13:22:52', '2021-10-27 13:22:52'),
('22', 'App\\Models\\User', '22', 'MyAuthApp', '6e479c37d1289a44fa653b8536df73f864faad5c97e0d51eac409f27a2cb8ed0', '[\"*\"]', NULL, '2021-10-27 13:27:08', '2021-10-27 13:27:08'),
('23', 'App\\Models\\User', '22', 'MyAuthApp', 'b8d73749fcccfad1b3eee14c9325768497fcaf5d5e4d38f59df1f11e9cd60ce3', '[\"*\"]', NULL, '2021-10-27 13:28:11', '2021-10-27 13:28:11'),
('24', 'App\\Models\\User', '22', 'MyAuthApp', '003105ebec31dfd8924c3eecc5bbba9a02693d5cf2b705d30c82dbd2f37dcd57', '[\"*\"]', NULL, '2021-10-27 13:28:31', '2021-10-27 13:28:31'),
('25', 'App\\Models\\User', '22', 'MyAuthApp', '62170a09b76d0a3488bc1e09a8da594ee6e6e02280b6ab1985f9ed90f950264c', '[\"*\"]', NULL, '2021-10-28 15:18:44', '2021-10-28 15:18:44'),
('26', 'App\\Models\\User', '22', 'MyAuthApp', '467a169b17ab720e2cbbabac9b81ab04332abcbcc18e17b0a4af6a0623aa2d47', '[\"*\"]', NULL, '2021-11-10 22:07:06', '2021-11-10 22:07:06'),
('27', 'App\\Models\\User', '22', 'MyAuthApp', 'f647b8bf34d27c65567be524215ee748f8db84d96811bdc7208285ec21738941', '[\"*\"]', NULL, '2021-11-10 22:07:13', '2021-11-10 22:07:13'),
('28', 'App\\Models\\User', '22', 'MyAuthApp', '27c6de533161f1fb4b4df959fc322abc656a309dd8b9ffb071dc2f65916d1d29', '[\"*\"]', NULL, '2021-11-10 22:07:15', '2021-11-10 22:07:15'),
('29', 'App\\Models\\User', '22', 'MyAuthApp', 'b45fc0091e32cec632c24907a8ef10183219628da05676c826f1462390b1640d', '[\"*\"]', NULL, '2021-11-12 19:31:11', '2021-11-12 19:31:11'),
('30', 'App\\Models\\User', '22', 'MyAuthApp', 'a1d87ecc4d81df89d6e9abb61283b808b961c43eb9cc0ba53392773ffb9d323f', '[\"*\"]', NULL, '2021-11-12 19:42:44', '2021-11-12 19:42:44'),
('31', 'App\\Models\\User', '22', 'MyAuthApp', 'a0256462f729db463d01f1197d8dab8ccbff977f9d126312df064ca4e3d1a3ec', '[\"*\"]', NULL, '2021-11-12 20:02:49', '2021-11-12 20:02:49'),
('32', 'App\\Models\\User', '22', 'MyAuthApp', '0708e4f72fdb5693f04633130a034b7658b504275bb97b3b177c696762351c19', '[\"*\"]', NULL, '2021-11-12 20:03:43', '2021-11-12 20:03:43'),
('33', 'App\\Models\\User', '22', 'MyAuthApp', '985d5a876c08dd70c2ac907519dadde6123a793e6a597aa262ada53a1b6407ad', '[\"*\"]', NULL, '2021-11-12 21:04:03', '2021-11-12 21:04:03'),
('34', 'App\\Models\\User', '26', 'MyAuthApp', 'b9318e525916f1275ca333a28c936a69ce26a05ca126996c446709767b2125ba', '[\"*\"]', NULL, '2021-11-17 15:28:48', '2021-11-17 15:28:48'),
('35', 'App\\Models\\User', '27', 'MyAuthApp', 'fe528c7395330cfae0a99992f369c6a907082cc30071ca0dde4be6db15bafcf0', '[\"*\"]', NULL, '2021-11-17 18:36:14', '2021-11-17 18:36:14'),
('36', 'App\\Models\\User', '22', 'MyAuthApp', '196b5a75fd6ecd9a2e4885d7998cc0bc7cf758acc5e9c6296dbaf6d699b9ff6a', '[\"*\"]', '2021-11-19 12:20:15', '2021-11-19 11:52:51', '2021-11-19 12:20:15');

INSERT INTO `referrals` (`id`, `member_id`, `referred_member`, `commission`, `is_paid`, `date_paid`, `date_created`) VALUES
('1', '18', '19', '100', '0', NULL, '2021-10-17 11:09:02'),
('2', '18', '20', '100', '0', NULL, '2021-10-17 11:09:49'),
('3', '18', '21', '100', '0', NULL, '2021-10-17 11:13:38'),
('4', '18', '26', '100', '0', NULL, '2021-11-17 16:28:48'),
('5', '18', '27', '100', '0', NULL, '2021-11-17 19:36:14');

INSERT INTO `regular_savings` (`id`, `member_id`, `amount`, `frequency`, `default_payment_method`, `autosave`, `created_at`) VALUES
('1', '2', '200', 'monthly', 'bank', '0', '2021-10-17 15:08:47'),
('2', '18', '200', 'monthly', 'bank', '0', '2021-10-17 16:20:06');

INSERT INTO `regular_savings_transactions` (`id`, `transaction_ref`, `description`, `amount`, `dr_cr`, `date_transaction`, `bal_affected`, `member_id`, `pay_method`) VALUES
('1', '4rer', 'savings', '100', 'dr', '2021-10-17 17:11:14', '1', '18', NULL),
('2', 'frer44', 'payment', '54', 'cr', '2021-10-17 17:13:06', '1', '18', NULL),
('3', '44444444', NULL, '100', NULL, '2021-10-17 21:57:33', '1', '18', 'Card'),
('4', '44444444', NULL, '100', NULL, '2021-10-17 21:58:19', '1', '18', 'Card'),
('5', '44444444', 'Wallet Funding from ATM card', '100', 'CR', '2021-10-18 11:25:56', '1', '18', 'Card'),
('6', '44444444', 'Direct withdrawal to bank account', '100', 'DR', '2021-10-18 12:07:04', '1', '18', NULL),
('7', '44444444', 'Direct withdrawal to bank account', '100', 'DR', '2021-10-18 12:08:36', '1', '18', NULL),
('8', '44444444', 'Direct withdrawal to bank account', '100', 'DR', '2021-10-18 12:09:30', '1', '18', NULL),
('9', '44444444', 'Withdrawal from investment', '1', 'CR', '2021-10-22 17:21:10', '1', '18', 'local'),
('10', '44444444', 'fransfer from investment to savings', '100', 'CR', '2021-10-22 17:40:00', '1', '18', 'local');

INSERT INTO `savings_type` (`id`, `name`, `description`, `yearly_interest`) VALUES
('1', 'Regular', 'Regular Savings', '8'),
('2', 'Target', 'Target Savings', '20');

INSERT INTO `target_saving_cats` (`id`, `cat_name`) VALUES
('1', 'Car'),
('2', 'Travel');

INSERT INTO `user_roles` (`id`, `role`, `role_code`) VALUES
('1', 'Admin', 'ADMIN'),
('2', 'Member', 'MEMBER'),
('3', 'Partner', 'PARTNER');

INSERT INTO `users` (`id`, `full_name`, `phone`, `email`, `password`, `role_id`, `is_active`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
('18', 'zakari mohammed omeh', NULL, 'mo@gmailx.com', '$2y$10$so3hvvYJG53UGK3USGCsReflpP56YbiB3HJtYTz1V0OdcE1ZZ/CSe', '1', '1', NULL, NULL, '2021-10-17 10:05:18', '2021-10-17 11:40:31'),
('19', 'zakarioh', 'moxhm', 'mox@gmailx.com', '$2y$10$so3hvvYJG53UGK3USGCsReflpP56YbiB3HJtYTz1V0OdcE1ZZ/CSe', '2', '1', NULL, NULL, '2021-10-17 10:07:49', '2021-10-22 18:47:51'),
('20', 'zakari m', NULL, 'm@gmailx.com', '$2y$10$cT4x7rJn2VJ8Pi3lFiZ/Aeh8ik5dEgNxf49h108HRZeVJtVVrMGO.', '2', '1', NULL, NULL, '2021-10-17 10:09:02', '2021-10-17 10:09:02'),
('21', 'zakari mohammed omeh', NULL, 'mc@gmailx.com', '$2y$10$KESWcf20a4M3vmHx7geUJeBSJ/ldlDxfq0g59lrmAmdwnGSmwwKc6', '2', '1', NULL, NULL, '2021-10-17 10:09:49', '2021-10-17 10:09:49'),
('22', 'zakari mohammed omeh', NULL, 'mcx@gmailx.com', '$2y$10$so3hvvYJG53UGK3USGCsReflpP56YbiB3HJtYTz1V0OdcE1ZZ/CSe', '3', '1', '2021-11-19 11:52:51', NULL, '2021-10-17 10:13:38', '2021-11-12 21:04:03'),
('26', 'zakari mohammed omeh', NULL, 'mcxx@gmailx.com', '$2y$10$6KvYNQXkZmbUTRcecrIpfenld.UaIgYxJgfRsgXeRi76Z9F4YOVaO', '2', '1', NULL, NULL, NULL, NULL),
('27', 'zakari mohammed omeh', NULL, 'mcz@gmailx.com', '$2y$10$L99T1Qzcm6VI8uIspIBln.YfSoAk9820HzoA5Ky6x0rsRQP5aNGSW', '2', '1', NULL, NULL, NULL, NULL);

INSERT INTO `warehouses` (`id`, `name`, `description`, `location_id`, `state_id`, `lga_id`, `created_at`, `updated_at`, `insurance`, `policy_number`) VALUES
('1', 'ABC', NULL, '5', NULL, NULL, '2021-10-27 14:57:50', NULL, 'Leadway', '388839289'),
('2', 'Afphanta Warehouse', 'starage of all farm produce in kaduna state', '2', NULL, NULL, '2021-11-03 14:58:22', NULL, 'Leadway Insurance', '987494'),
('3', 'vdo', 'store maiz', '1', NULL, NULL, '2021-11-04 13:52:52', NULL, NULL, NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;