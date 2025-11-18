-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2025 at 01:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `octagonal`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `contact_email` varchar(191) DEFAULT NULL,
  `contact_phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `contact_email`, `contact_phone`, `address`, `descriptions`, `created_at`, `updated_at`) VALUES
(1, 'Octagonal Trust', 'octagonal@creativeitbari.com', '01618356180', 'DHAKA', 'NEW BRANCH', '2024-08-31 11:12:57', '2024-08-31 11:12:57'),
(2, 'Coder Home', 'adminhera@gmail.com', '01618356180', 'Mirpur', 'New', '2025-10-16 06:39:27', '2025-10-16 06:39:27');

-- --------------------------------------------------------

--
-- Table structure for table `charge_limits`
--

CREATE TABLE `charge_limits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `minimum_amount` decimal(18,2) NOT NULL,
  `maximum_amount` decimal(18,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `gateway_id` bigint(20) NOT NULL,
  `gateway_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `charge_limits`
--

INSERT INTO `charge_limits` (`id`, `minimum_amount`, `maximum_amount`, `fixed_charge`, `charge_in_percentage`, `gateway_id`, `gateway_type`, `created_at`, `updated_at`) VALUES
(1, 1000.00, 100000.00, 0.00, 0.00, 1, 'App\\Models\\DepositMethod', '2024-04-18 13:40:36', '2024-04-18 13:40:36'),
(2, 100.00, 200000.00, 0.00, 0.00, 1, 'App\\Models\\WithdrawMethod', '2024-05-11 09:34:33', '2024-05-11 09:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(3) NOT NULL,
  `exchange_rate` decimal(10,6) NOT NULL,
  `base_currency` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `exchange_rate`, `base_currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', 1.000000, 0, 0, NULL, '2024-04-18 08:45:55'),
(4, 'BDT', 1.000000, 1, 1, '2024-04-18 08:45:19', '2024-04-18 08:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_methods`
--

CREATE TABLE `deposit_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `requirements` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit_methods`
--

INSERT INTO `deposit_methods` (`id`, `name`, `image`, `currency_id`, `minimum_amount`, `maximum_amount`, `fixed_charge`, `charge_in_percentage`, `descriptions`, `status`, `requirements`, `created_at`, `updated_at`) VALUES
(1, 'Bank Transfer Manual', 'default.png', 4, 0.00, 0.00, 0.00, 0.00, NULL, 1, '[\"100000\",\"Manual Account\"]', '2024-04-18 13:40:36', '2024-04-18 13:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `deposit_requests`
--

CREATE TABLE `deposit_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` bigint(20) UNSIGNED NOT NULL,
  `credit_account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `converted_amount` decimal(10,2) NOT NULL,
  `charge` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposit_requests`
--

INSERT INTO `deposit_requests` (`id`, `member_id`, `method_id`, `credit_account_id`, `amount`, `converted_amount`, `charge`, `description`, `requirements`, `attachment`, `status`, `transaction_id`, `created_at`, `updated_at`) VALUES
(2, 5, 1, 5, 1000.00, 1000.00, 0.00, 'Hasib May24', '{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}', '1714560496voucher_1714560314168.jpg', 2, 44, '2024-05-01 10:48:16', '2024-05-03 19:41:47'),
(3, 11, 1, 10, 1000.00, 1000.00, 0.00, 'Adnan_ May_2024', '{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}', '1714811746voucher_1714811363014.jpg', 2, 48, '2024-05-04 08:35:46', '2024-05-07 08:05:06'),
(4, 6, 1, 6, 1000.00, 1000.00, 0.00, 'Mustafiz - May 24', '{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}', '1714840249440465945_406728142284735_8071056685584437477_n.jpg', 2, 47, '2024-05-04 16:30:49', '2024-05-07 08:04:50'),
(5, 2, 1, 2, 1000.00, 1000.00, 0.00, 'May - 2024 Send to the Personal Account Of Hasib Vai inDutch Bangla', '{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}', '1715052778may.jpg', 2, 46, '2024-05-07 03:32:58', '2024-05-07 08:04:37'),
(6, 15, 1, 14, 5000.00, 5000.00, 0.00, 'Mar,Apr,may24, previous 2 month', '{\"100000\":\"5000\",\"Manual_Account\":\"5000\"}', '1715068918Screenshot_2024-05-07-13-58-31-17_21c7536209295bd9203a213b62980e19.jpg', 2, 45, '2024-05-07 08:01:58', '2024-05-07 08:02:50'),
(7, 3, 1, 3, 2000.00, 2000.00, 0.00, NULL, '{\"100000\":\"2000\",\"Manual_Account\":\"2000\"}', '1715746985ImportedPhoto_1715746820040.jpg', 2, 57, '2024-05-15 04:23:05', '2024-05-15 04:23:27'),
(8, 6, 1, 6, 1000.00, 1000.00, 0.00, 'Mustafiz, June 24', '{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}', '1717332582445777065_922643919633715_4695931529079853615_n.jpg', 2, 58, '2024-06-02 12:49:42', '2024-06-02 13:45:48'),
(9, 10, 1, 9, 2000.00, 2000.00, 0.00, 'May & June included', '{\"100000\":\"2000\",\"Manual_Account\":\"2000\"}', '1717582075ImportedPhoto_1717581869154.jpg', 2, 59, '2024-06-05 10:07:55', '2024-06-06 03:49:36'),
(10, 11, 1, 10, 1000.00, 1000.00, 0.00, 'Adnan_June_2024', '{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}', '1717651782voucher_1717644808588.jpg', 2, 63, '2024-06-06 05:29:42', '2024-06-09 09:34:49'),
(11, 6, 1, 6, 1000.00, 1000.00, 0.00, 'Mustafiz June 24', '{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}', '1719636797448799972_433752019495842_7240809699761952939_n.jpg', 2, 72, '2024-06-29 04:53:17', '2024-07-09 09:27:24'),
(12, 11, 1, 10, 1000.00, 1000.00, 0.00, 'Adnan_July_2024', '{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}', '1720629543voucher_1720629349175.jpg', 2, 78, '2024-07-10 16:39:03', '2024-08-08 06:54:30'),
(13, 3, 1, 3, 2000.00, 2000.00, 0.00, NULL, '{\"100000\":\"2000\",\"Manual_Account\":\"2000\"}', '1722874658WhatsApp Image 2024-08-05 at 22.14.07_aba82e6e.jpg', 2, 77, '2024-08-05 16:17:38', '2024-08-08 06:54:25'),
(14, 11, 1, 10, 1000.00, 1000.00, 0.00, 'Adnan_August_2024', '{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}', '1723356102voucher_1723355924976.jpg', 2, 86, '2024-08-11 06:01:42', '2024-09-03 13:40:03'),
(15, 10, 1, 9, 2500.00, 2500.00, 0.00, 'July-August 2000.500 From previous', '{\"100000\":\"2500\",\"Manual_Account\":\"2500\"}', '1723722339title (12).jpg', 2, 85, '2024-08-15 11:45:39', '2024-09-03 13:39:59'),
(16, 22, 1, 19, 5000.00, 5000.00, 0.00, NULL, '{\"100000\":\"5000\",\"Manual_Account\":\"5000\"}', '1725181297signature.jpg', 2, 84, '2024-09-01 09:01:37', '2024-09-03 13:39:57'),
(17, 10, 1, 9, 1500.00, 1500.00, 0.00, 'September-1000..Previous-500', '{\"100000\":\"1500\",\"Manual_Account\":\"01834008182\"}', '1725359934ImportedPhoto_1725359687189.jpg', 2, 83, '2024-09-03 10:38:54', '2024-09-03 13:39:51'),
(18, 10, 1, 9, 1500.00, 1500.00, 0.00, 'October 1000 & Previous 500', '{\"100000\":\"1500\",\"Manual_Account\":\"1500\"}', '1727780364title (14).jpg', 2, 90, '2024-10-01 10:59:24', '2025-06-01 16:55:24'),
(19, 11, 1, 10, 2000.00, 2000.00, 0.00, 'Adnan_September_October_2024', '{\"100000\":\"2000\",\"Manual_Account\":\"04934008988\"}', '1728318323voucher_1728317723979.jpg', 2, 89, '2024-10-07 16:25:23', '2025-06-01 16:55:21'),
(20, 11, 1, 10, 1000.00, 1000.00, 0.00, 'Adnan_November_2024', '{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}', '1731003276voucher_1731003068367.jpg', 2, 88, '2024-11-07 18:14:36', '2025-06-01 16:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `notification_body` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT 0,
  `sms_status` tinyint(4) NOT NULL DEFAULT 0,
  `notification_status` tinyint(4) NOT NULL DEFAULT 0,
  `template_mode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = all, 1 = email, 2 = sms, 3 = notification',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `name`, `slug`, `subject`, `email_body`, `sms_body`, `notification_body`, `shortcode`, `email_status`, `sms_status`, `notification_status`, `template_mode`, `created_at`, `updated_at`) VALUES
(1, 'Transfer Money', 'TRANSFER_MONEY', 'Transfer Money', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>You have received {{amount}} to {{account_number}} from {{sender_account_number}} on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, You have received {{amount}} to {{account_number}} from {{sender_account_number}} on {{dateTime}}', 'Dear {{name}}, You have received {{amount}} to {{account_number}} from {{sender_account_number}} on {{dateTime}}', '{{name}} {{account_number}} {{amount}} {{sender}} {{sender_account_number}} {{balance}} {{dateTime}}', 0, 0, 0, 0, NULL, NULL),
(2, 'Deposit Money', 'DEPOSIT_MONEY', 'Deposit Money', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your account has been credited with {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, Your account has been credited with {{amount}} on {{dateTime}}', 'Dear {{name}}, Your account has been credited with {{amount}} on {{dateTime}}', '{{name}} {{account_number}} {{amount}} {{dateTime}} {{balance}} {{depositMethod}}', 0, 0, 0, 0, NULL, NULL),
(3, 'Deposit Request Approved', 'DEPOSIT_REQUEST_APPROVED', 'Deposit Request Approved', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your deposit request has been approved. Your account {{account_number}} has been credited with {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, Your deposit request has been approved. Your account {{account_number}} has been credited with {{amount}} on {{dateTime}}', 'Dear {{name}}, Your deposit request has been approved. Your account {{account_number}} has been credited with {{amount}} on {{dateTime}}', '{{name}} {{account_number}} {{amount}} {{dateTime}} {{balance}} {{depositMethod}}', 0, 0, 0, 0, NULL, NULL),
(4, 'Loan Request Approved', 'LOAN_REQUEST_APPROVED', 'Loan Request Approved', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your loan request of {{amount}} has been approved on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, Your loan request of {{amount}} has been approved on {{dateTime}}', 'Dear {{name}}, Your loan request of {{amount}} has been approved on {{dateTime}}', '{{name}} {{amount}} {{dateTime}}', 0, 0, 0, 0, NULL, NULL),
(5, 'Withdraw Request Approved', 'WITHDRAW_REQUEST_APPROVED', 'Withdraw Request Approved', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your withdraw request has been approved. Your account has been debited with {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, Your withdraw request has been approved. Your account has been debited with {{amount}} on {{dateTime}}', 'Dear {{name}}, Your withdraw request has been approved. Your account has been debited with {{amount}} on {{dateTime}}', '{{name}} {{account_number}} {{amount}} {{withdrawMethod}} {{balance}} {{dateTime}}', 0, 0, 0, 0, NULL, NULL),
(6, 'Deposit Request Rejected', 'DEPOSIT_REQUEST_REJECTED', 'Deposit Request Rejected', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your deposit request of {{amount}} has been rejected.</div>\r\n<div>&nbsp;</div>\r\n<div>Amount:&nbsp;{{amount}}</div>\r\n<div>Deposit Method: {{depositMethod}}</div>\r\n</div>', 'Dear {{name}}, Your deposit request of {{amount}} has been rejected.', 'Dear {{name}}, Your deposit request of {{amount}} has been rejected.', '{{name}}  {{account_number}} {{amount}} {{depositMethod}} {{balance}}', 0, 0, 0, 0, NULL, NULL),
(7, 'Loan Request Rejected', 'LOAN_REQUEST_REJECTED', 'Loan Request Rejected', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your loan request of {{amount}} has been rejected on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, Your loan request of {{amount}} has been rejected on {{dateTime}}', 'Dear {{name}}, Your loan request of {{amount}} has been rejected on {{dateTime}}', '{{name}} {{amount}} {{dateTime}}', 0, 0, 0, 0, NULL, NULL),
(8, 'Withdraw Request Rejected', 'WITHDRAW_REQUEST_REJECTED', 'Withdraw Request Rejected', '<div>\r\n<div>Dear {{name}}, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>\r\n</div>', 'Dear {{name}}, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.', 'Dear {{name}}, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.', '{{name}} {{account_number}} {{amount}} {{withdrawMethod}} {{dateTime}} {{balance}}', 0, 0, 0, 0, NULL, NULL),
(9, 'Withdraw Money', 'WITHDRAW_MONEY', 'Withdraw Money', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your account has been debited with {{amount}} on {{dateTime}}</div>\r\n</div>', 'Dear {{name}}, Your account has been debited with {{amount}} on {{dateTime}}', 'Dear {{name}}, Your account has been debited with {{amount}} on {{dateTime}}', '{{name}} {{account_number}} {{amount}} {{dateTime}} {{withdrawMethod}} {{balance}}', 0, 0, 0, 0, NULL, NULL),
(10, 'Member Request Accepted', 'MEMBER_REQUEST_ACCEPTED', 'Member Request Accepted', '<div>\r\n<div>Dear {{name}},</div>\r\n<div>Your member request has been accepted by authority on {{dateTime}}. You can now login to your account by using your email and password.</div>\r\n</div>', '', '', '{{name}} {{member_no}} {{dateTime}}', 0, 0, 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_date` datetime NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_date`, `expense_category_id`, `amount`, `reference`, `note`, `attachment`, `created_user_id`, `updated_user_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, '2024-04-28 16:12:00', 1, 150.00, 'sms charge', NULL, '', 1, NULL, NULL, '2024-05-11 10:12:31', '2024-05-11 10:12:31'),
(2, '2023-06-22 16:16:00', 2, 100.00, NULL, NULL, '', 1, NULL, NULL, '2024-05-11 10:17:03', '2024-05-11 10:17:03'),
(3, '2023-09-23 16:18:00', 3, 60.00, 'cheque book processing fee', NULL, '', 1, NULL, NULL, '2024-05-11 10:18:56', '2024-05-11 10:18:56'),
(4, '2023-09-23 16:18:00', 2, 200.00, 'account maintenance', NULL, '', 1, NULL, NULL, '2024-05-11 10:19:45', '2024-05-11 10:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `color`, `description`, `created_at`, `updated_at`) VALUES
(1, 'SMS Charge', '#e31954', NULL, '2024-05-11 10:12:01', '2024-05-11 10:12:01'),
(2, 'Account Maintenance', '#ff003a', NULL, '2024-05-11 10:15:29', '2024-05-11 10:15:29'),
(3, 'Cheque Book', '#f30d41', NULL, '2024-05-11 10:15:44', '2024-05-11 10:15:44'),
(4, 'Other', '#cccccc', NULL, '2024-05-11 10:15:55', '2024-05-11 10:15:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantors`
--

CREATE TABLE `guarantors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `savings_account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interest_posting`
--

CREATE TABLE `interest_posting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_type_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` varchar(30) DEFAULT NULL,
  `loan_product_id` bigint(20) UNSIGNED NOT NULL,
  `borrower_id` bigint(20) UNSIGNED NOT NULL,
  `first_payment_date` date NOT NULL,
  `release_date` date DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `applied_amount` decimal(10,2) NOT NULL,
  `total_payable` decimal(10,2) DEFAULT NULL,
  `total_paid` decimal(10,2) DEFAULT NULL,
  `late_payment_penalties` decimal(10,2) NOT NULL,
  `attachment` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `approved_date` date DEFAULT NULL,
  `approved_user_id` bigint(20) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `loan_id`, `loan_product_id`, `borrower_id`, `first_payment_date`, `release_date`, `currency_id`, `applied_amount`, `total_payable`, `total_paid`, `late_payment_penalties`, `attachment`, `description`, `remarks`, `status`, `approved_date`, `approved_user_id`, `created_user_id`, `updated_user_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(2, '04', 1, 2, '2024-07-07', '2024-06-06', 4, 100000.00, 100000.00, 20000.00, 0.00, '1715052071মাইক্রোট্রাস্ট কো অপারেটিভ সোসাইটি  ঋণ আবেদনপত্র (1).docx', 'I need 100000 lc taka for my marriage purpose.', NULL, 1, '2024-06-06', 1, 3, NULL, NULL, '2024-05-07 03:21:11', '2024-08-08 07:07:01'),
(3, '03', 1, 1, '2024-05-11', '2024-05-11', 4, 10000.00, 10700.00, 10000.00, 0.00, '', '10k loan', '10k loan', 2, '2024-05-11', 1, 1, NULL, NULL, '2024-05-11 09:40:07', '2024-06-11 07:13:53'),
(5, '02', 1, 9, '2024-05-11', '2024-05-11', 4, 30000.00, 30000.00, 20000.00, 0.00, '', '30k loan', '30k loan', 2, '2024-05-11', 1, 1, NULL, NULL, '2024-05-11 09:51:46', '2024-08-08 07:03:12'),
(6, '01', 1, 16, '2024-02-01', '2024-03-01', 4, 75000.00, 75000.00, 10000.00, 0.00, '', 'Make Loan', NULL, 1, '2024-06-06', 1, 1, NULL, NULL, '2024-06-06 04:39:20', '2024-06-06 04:40:27'),
(7, '005', 1, 9, '2024-09-03', '2024-09-03', 4, 80000.00, 80000.00, 6666.67, 0.00, '', 'For credit card', 'Same as credit card benefit provide our trust', 1, '2024-09-03', 1, 1, NULL, NULL, '2024-09-03 13:43:32', '2024-12-30 06:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `loan_collaterals`
--

CREATE TABLE `loan_collaterals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `collateral_type` varchar(191) NOT NULL,
  `serial_number` varchar(191) DEFAULT NULL,
  `estimated_price` decimal(10,2) NOT NULL,
  `attachments` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `paid_at` date NOT NULL,
  `late_penalties` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `repayment_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `remarks` text DEFAULT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `repayment_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `loan_id`, `paid_at`, `late_penalties`, `interest`, `repayment_amount`, `total_amount`, `remarks`, `member_id`, `transaction_id`, `repayment_id`, `created_at`, `updated_at`) VALUES
(3, 5, '2024-06-03', 0.00, 0.00, 20000.00, 20000.00, 'all payment clear', 9, NULL, 182, '2024-06-03 03:54:12', '2024-06-03 03:54:12'),
(4, 6, '2024-06-06', 0.00, 0.00, 10000.00, 10000.00, NULL, 16, NULL, 193, '2024-06-06 04:40:27', '2024-06-06 04:40:27'),
(5, 3, '2024-06-11', 0.00, 11.67, 10011.67, 10011.67, 'total 10k clear', 1, NULL, 61, '2024-06-11 07:13:53', '2024-06-11 07:13:53'),
(6, 2, '2024-07-09', 0.00, 0.00, 10000.00, 10000.00, '1ST INSTALLMENT', 2, NULL, 205, '2024-07-09 04:16:34', '2024-07-09 04:16:34'),
(8, 2, '2024-08-08', 0.00, 0.00, 10000.00, 10000.00, '2 d installment', 2, NULL, 206, '2024-08-08 07:07:01', '2024-08-08 07:07:01'),
(9, 7, '2024-12-30', 0.00, 0.00, 6666.67, 6666.67, NULL, 9, 87, 217, '2024-12-30 06:40:55', '2024-12-30 06:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `loan_products`
--

CREATE TABLE `loan_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `late_payment_penalties` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `interest_rate` decimal(10,2) NOT NULL,
  `interest_type` varchar(191) NOT NULL,
  `term` int(11) NOT NULL,
  `term_period` varchar(15) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_products`
--

INSERT INTO `loan_products` (`id`, `name`, `minimum_amount`, `maximum_amount`, `late_payment_penalties`, `description`, `interest_rate`, `interest_type`, `term`, `term_period`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Micro-Member-loan', 5000.00, 500000.00, 0.00, NULL, 0.00, 'flat_rate', 12, '+1 month', 1, '2024-04-22 04:15:04', '2024-05-11 09:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayments`
--

CREATE TABLE `loan_repayments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) NOT NULL,
  `repayment_date` date NOT NULL,
  `amount_to_pay` decimal(10,2) NOT NULL,
  `penalty` decimal(10,2) NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_repayments`
--

INSERT INTO `loan_repayments` (`id`, `loan_id`, `repayment_date`, `amount_to_pay`, `penalty`, `principal_amount`, `interest`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(61, 3, '2024-05-11', 10011.67, 0.00, 10000.00, 11.67, 0.00, 1, '2024-05-11 09:40:47', '2024-06-11 07:13:53'),
(181, 5, '2024-05-11', 10000.00, 0.00, 10000.00, 0.00, 20000.00, 0, '2024-05-11 09:51:50', '2024-08-08 07:03:12'),
(182, 5, '2024-06-11', 20000.00, 0.00, 20000.00, 0.00, 0.00, 1, '2024-05-11 09:51:50', '2024-06-03 03:54:12'),
(193, 6, '2024-02-01', 10000.00, 0.00, 10000.00, 0.00, 65000.00, 1, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(194, 6, '2024-03-01', 5909.09, 0.00, 5909.09, 0.00, 59090.91, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(195, 6, '2024-04-01', 5909.09, 0.00, 5909.09, 0.00, 53181.82, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(196, 6, '2024-05-01', 5909.09, 0.00, 5909.09, 0.00, 47272.73, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(197, 6, '2024-06-01', 5909.09, 0.00, 5909.09, 0.00, 41363.64, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(198, 6, '2024-07-01', 5909.09, 0.00, 5909.09, 0.00, 35454.55, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(199, 6, '2024-08-01', 5909.09, 0.00, 5909.09, 0.00, 29545.45, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(200, 6, '2024-09-01', 5909.09, 0.00, 5909.09, 0.00, 23636.36, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(201, 6, '2024-10-01', 5909.09, 0.00, 5909.09, 0.00, 17727.27, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(202, 6, '2024-11-01', 5909.09, 0.00, 5909.09, 0.00, 11818.18, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(203, 6, '2024-12-01', 5909.09, 0.00, 5909.09, 0.00, 5909.09, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(204, 6, '2025-01-01', 5909.09, 0.00, 5909.09, 0.00, 0.00, 0, '2024-06-06 04:39:23', '2024-06-06 04:40:27'),
(205, 2, '2024-07-07', 10000.00, 0.00, 10000.00, 0.00, 90000.00, 1, '2024-06-06 04:41:03', '2024-07-09 04:16:34'),
(206, 2, '2024-08-07', 10000.00, 0.00, 10000.00, 0.00, 80000.00, 1, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(207, 2, '2024-09-07', 8000.00, 0.00, 8000.00, 0.00, 72000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(208, 2, '2024-10-07', 8000.00, 0.00, 8000.00, 0.00, 64000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(209, 2, '2024-11-07', 8000.00, 0.00, 8000.00, 0.00, 56000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(210, 2, '2024-12-07', 8000.00, 0.00, 8000.00, 0.00, 48000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(211, 2, '2025-01-07', 8000.00, 0.00, 8000.00, 0.00, 40000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(212, 2, '2025-02-07', 8000.00, 0.00, 8000.00, 0.00, 32000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(213, 2, '2025-03-07', 8000.00, 0.00, 8000.00, 0.00, 24000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(214, 2, '2025-04-07', 8000.00, 0.00, 8000.00, 0.00, 16000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(215, 2, '2025-05-07', 8000.00, 0.00, 8000.00, 0.00, 8000.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(216, 2, '2025-06-07', 8000.00, 0.00, 8000.00, 0.00, 0.00, 0, '2024-06-06 04:41:03', '2024-08-08 07:07:01'),
(217, 7, '2024-09-03', 6666.67, 0.00, 6666.67, 0.00, 73333.33, 1, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(218, 7, '2024-10-03', 6666.67, 0.00, 6666.67, 0.00, 66666.66, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(219, 7, '2024-11-03', 6666.67, 0.00, 6666.67, 0.00, 60000.00, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(220, 7, '2024-12-03', 6666.67, 0.00, 6666.67, 0.00, 53333.33, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(221, 7, '2025-01-03', 6666.67, 0.00, 6666.67, 0.00, 46666.66, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(222, 7, '2025-02-03', 6666.67, 0.00, 6666.67, 0.00, 40000.00, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(223, 7, '2025-03-03', 6666.67, 0.00, 6666.67, 0.00, 33333.33, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(224, 7, '2025-04-03', 6666.67, 0.00, 6666.67, 0.00, 26666.67, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(225, 7, '2025-05-03', 6666.67, 0.00, 6666.67, 0.00, 20000.00, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(226, 7, '2025-06-03', 6666.67, 0.00, 6666.67, 0.00, 13333.33, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(227, 7, '2025-07-03', 6666.67, 0.00, 6666.67, 0.00, 6666.67, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55'),
(228, 7, '2025-08-03', 6666.67, 0.00, 6666.67, 0.00, 0.00, 0, '2024-09-03 13:43:44', '2024-12-30 06:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `email` varchar(100) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `member_no` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `p_address` text DEFAULT NULL,
  `credit_source` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `nid_image` varchar(191) DEFAULT NULL,
  `nid` varchar(191) DEFAULT NULL,
  `custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `first_name`, `last_name`, `branch_id`, `user_id`, `status`, `email`, `country_code`, `mobile`, `business_name`, `member_no`, `gender`, `city`, `state`, `zip`, `address`, `permanent_address`, `p_address`, `credit_source`, `photo`, `nid_image`, `nid`, `custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Md. Saifur', 'Rahman', NULL, 2, 1, 'saifur1985bd@gmail.com', '880', '01829041699', '', '01', 'male', 'Dhaka', 'Dhaka', '1216', '10/a/3', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 00:37:40', '2024-04-18 06:39:35'),
(2, 'Md.Nazmul', 'Haque', NULL, 3, 1, 'nazmulhs030@gmail.com', '880', '1626100302', '', '02', 'male', 'Dhaka', 'Dhaka', '1230', 'Dhaka\r\nHajj Camp Suvo Hotel Goli', NULL, NULL, 'Job', 'default.png', NULL, NULL, NULL, '2024-04-18 00:38:08', '2024-04-18 06:39:42'),
(3, 'Tawfiqul', 'Islam', NULL, 4, 1, 'tawfiqul01@gmail.com', '880', '1676797239', '', '03', 'male', 'Dhaka', 'Dhaka', '1348', 'Vill: Binod Bari, Amin Bazar, Dhaka', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 00:40:44', '2024-04-18 06:41:01'),
(4, 'Ziaur', 'Rahman', NULL, 5, 1, 'ziaurrahaman939@gmail.com', '880', '01679714001', '', '04', 'male', 'Dahaka', 'Bashabo', '1213', 'Gulshan', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 00:41:28', '2024-04-18 06:42:25'),
(5, 'Md', 'Hasibuzzaman', NULL, 6, 1, 'hasib.2030.hu@gmail.com', '880', '01618356180', NULL, '05', 'male', 'Dhaka', 'Dhaka', '1216', 'Dhaka', NULL, NULL, 'Salary', '1713422817Hasib pasport.jpg', NULL, NULL, NULL, '2024-04-18 00:45:22', '2024-04-18 06:46:57'),
(6, 'Mustafizur', 'Rahman', NULL, 7, 1, 'mustafizurr171@gmail.com', '880', '01686026037', '', '06', 'male', 'Dhaka', 'Shyamoli', '1207', 'Adabor, Dhaka', NULL, NULL, '45000', 'default.png', NULL, NULL, NULL, '2024-04-18 00:45:32', '2024-04-18 06:45:51'),
(7, 'Sheikh', 'Tuhin', NULL, 8, 1, 'hituhin09@email.com', '880', '1701084341', '', '08', 'male', 'Dhaka', 'Dhaka', '3129', 'Shyadnagur , Baridhara ,Dhaka', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 00:50:21', '2024-04-18 07:03:57'),
(9, 'Md. Mashrur Rahman', 'Khan', NULL, 10, 1, 'mashrurrahman16@gmail.com', '880', '01534949969', '', '07', 'male', 'Dhaka', 'Dhaka', '1000', 'Saifur vai er basa', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 01:03:12', '2024-04-18 07:03:50'),
(10, 'Hrithik', 'Rudra', NULL, 11, 1, 'hrithik08.rudra@gmail.com', '880', '01875525591', '', '09', 'male', 'Dhaka', 'Dhaka', '1229', 'Block G,Bashundhara R/A', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 01:27:14', '2024-04-18 08:27:36'),
(11, 'Khandakar Anim Hassan', 'Adnan', NULL, 12, 1, 'khandakar.adnan21@gmail.com', '880', '01638147671', '', '10', 'male', 'Dhaka', 'Mirpur', '1216', '802/3, West Kazipara, Mirpur, Dhaka- 1216', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 01:53:33', '2024-04-18 08:28:26'),
(12, 'Rukaiya', 'Azmi', NULL, 13, 1, 'rukaiyaazmi@gmail.com', '880', '01975044622', 'Own', '11', 'male', 'Dhaka', 'Dhaka', '1216', 'Do', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 09:12:15', '2024-04-18 09:12:59'),
(13, 'Md Raju', 'Ahmed', NULL, 14, 1, 'rajucse1705@gmail.com', '880', '01771522411', 'own', '12', 'male', 'Dhaka', 'Dhaka', '1216', NULL, NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 09:17:37', '2024-04-18 09:17:37'),
(14, 'Md.Didarul', 'Islam', NULL, 15, 1, 'khandidar11@gmail.com', '880', '01679706957', 'Own', '13', 'male', 'Dhaka', 'Dhaka', '1216', NULL, NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-04-18 09:20:03', '2024-04-18 09:20:03'),
(15, 'Md Al', 'Mamun', NULL, 16, 1, 'md.almamun.bd@gmail.com', '880', '01717647410', 'OWN', '14', 'male', 'Dhaka', 'Dhaka', '1216', NULL, NULL, NULL, 'Salary', '1713705123Screenshot from 2024-04-21 19-12-00.png', NULL, NULL, NULL, '2024-04-21 13:12:03', '2024-04-21 13:12:03'),
(16, 'Md', 'Tarif', NULL, 17, 1, 'tarif.isjnu@gmail.com', '880', '01717967656', 'Own', '15', 'male', 'Dhaka', 'Dhaka', '1216', NULL, NULL, NULL, 'Salary', '1713705490Screenshot from 2024-04-21 19-17-32.png', NULL, NULL, NULL, '2024-04-21 13:18:10', '2024-04-21 13:18:10'),
(19, 'Bank', 'Asia', NULL, NULL, 1, 'hasib.9437.hu@gmail.com', '880', '01738356180', 'Bank', '16', 'male', 'Dhaka', 'Dhaka', '1216', '217 3rd colony, lalkuthi, Mirpur-1', NULL, NULL, 'bank interest', 'default.png', NULL, NULL, NULL, '2024-05-11 10:24:58', '2024-05-11 10:24:58'),
(20, 'Profit From Member Loan', 'Profit', NULL, NULL, 1, 'Profit@gmail.com', '880', '01738356180', 'Profit', '17', NULL, 'Dhaka', 'Dhaka', '1216', '217 3rd colony, lalkuthi, Mirpur-1', NULL, NULL, 'Profit', 'default.png', NULL, NULL, NULL, '2024-05-11 10:29:17', '2024-05-11 10:29:17'),
(21, 'Rishat', 'Amin', NULL, 18, 1, 'samiaulamin@gmail.com', '880', '1628169748', 'Micro trust', '18', 'male', 'Dhaka', 'Dhaka', '1216', 'Uttara', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-07-01 13:08:49', '2024-07-01 13:08:49'),
(22, 'Rahemul', 'Islam', NULL, 19, 1, 'rahimulislam14@gmail.com', '880', '1836999981', 'Rahemul Islam', '19', 'male', 'Dhaka', 'Dhaka', '1214', '217 3rd colony, lalkuthi, Mirpur-1', NULL, NULL, 'Salary', '1723352880Screenshot from 2024-08-11 11-07-39.png', NULL, NULL, NULL, '2024-08-11 05:08:00', '2024-08-11 05:08:00'),
(23, 'Masuma', 'Sultana', NULL, 20, 1, 'masuma.cse@gmail.com', '880', '1935741518', 'Era Infotech Ltd', '20', 'male', 'Dhaka', 'Dhaka', '1216', 'Dhaka', NULL, NULL, 'Salary', 'default.png', NULL, NULL, NULL, '2024-08-18 04:17:46', '2024-08-18 04:17:46'),
(24, 'Md.', 'nnn', NULL, 22, 1, 'hasib.123.hu@gmail.com', '880', '1738356180', 'Era Infotech Ltd', '01743532213', 'male', 'Dhaka', 'Dhaka', '1216', '217 3rd colony, lalkuthi, Mirpur-1', 'sdefwser', NULL, 'ertwet', '1763236086fashion-KV.jpg', '1763236086fashion-KV.jpg', NULL, NULL, '2025-11-15 19:48:08', '2025-11-15 19:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `member_documents`
--

CREATE TABLE `member_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `document` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_01_080940_create_settings_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_07_02_145857_create_database_backups_table', 1),
(7, '2020_07_06_142817_create_roles_table', 1),
(8, '2020_07_06_143240_create_permissions_table', 1),
(9, '2021_03_22_071324_create_setting_translations', 1),
(10, '2021_07_02_145504_create_pages_table', 1),
(11, '2021_07_02_145952_create_page_translations_table', 1),
(12, '2021_08_06_104648_create_branches_table', 1),
(13, '2021_08_07_111236_create_currency_table', 1),
(14, '2021_08_08_132702_create_payment_gateways_table', 1),
(15, '2021_08_08_152535_create_deposit_methods_table', 1),
(16, '2021_08_08_164152_create_withdraw_methods_table', 1),
(17, '2021_08_31_201125_create_navigations_table', 1),
(18, '2021_08_31_201126_create_navigation_items_table', 1),
(19, '2021_08_31_201127_create_navigation_item_translations_table', 1),
(20, '2021_10_22_070458_create_email_sms_templates_table', 1),
(21, '2022_03_21_075342_create_members_table', 1),
(22, '2022_03_24_090932_create_member_documents_table', 1),
(23, '2022_03_28_114203_create_savings_products_table', 1),
(24, '2022_04_13_073108_create_savings_accounts_table', 1),
(25, '2022_04_13_073109_create_transactions_table', 1),
(26, '2022_05_31_074804_create_expense_categories_table', 1),
(27, '2022_05_31_074918_create_expenses_table', 1),
(28, '2022_06_01_082019_create_loan_products_table', 1),
(29, '2022_06_01_083021_create_loans_table', 1),
(30, '2022_06_01_083022_create_loan_collaterals_table', 1),
(31, '2022_06_01_083025_create_loan_payments_table', 1),
(32, '2022_06_01_083069_create_loan_repayments_table', 1),
(33, '2022_06_06_072245_create_guarantors_table', 1),
(34, '2022_07_26_155338_create_deposit_requests_table', 1),
(35, '2022_07_26_163427_create_withdraw_requests_table', 1),
(36, '2022_08_09_160105_create_notifications_table', 1),
(37, '2022_08_15_055625_create_interest_posting_table', 1),
(38, '2022_08_27_151317_create_transaction_categories_table', 1),
(39, '2022_08_29_102757_create_schedule_tasks_histories_table', 1),
(40, '2022_09_13_162539_add_branch_id_to_users_table', 1),
(41, '2022_09_18_074806_add_branch_id_to_expenses_table', 1),
(42, '2022_10_16_081858_add_charge_to_deposit_requests_table', 1),
(43, '2022_10_29_095023_add_status_to_members_table', 1),
(44, '2023_01_29_093731_create_charge_limits_table', 1),
(45, '2025_11_16_000001_add_permanent_address_and_nid_to_members_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

CREATE TABLE `navigations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navigation_items`
--

CREATE TABLE `navigation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `navigation_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `target` varchar(191) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `css_class` varchar(191) DEFAULT NULL,
  `css_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navigation_item_translations`
--

CREATE TABLE `navigation_item_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `navigation_item_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text NOT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hituhin09@email.com', '$2y$10$R9ywa6mMlTnQIPWn.mR9a.rZHQT0yyeKCTSszWkqs7M9Gsx6dEFjS', '2024-04-18 01:09:25');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `is_crypto` tinyint(4) NOT NULL DEFAULT 0,
  `parameters` text DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `extra` text DEFAULT NULL,
  `exchange_rate` decimal(10,6) DEFAULT NULL,
  `fixed_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge_in_percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minimum_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `maximum_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `image`, `status`, `is_crypto`, `parameters`, `currency`, `supported_currencies`, `extra`, `exchange_rate`, `fixed_charge`, `charge_in_percentage`, `minimum_amount`, `maximum_amount`, `created_at`, `updated_at`) VALUES
(1, 'PayPal', 'PayPal', 'paypal.png', 0, 0, '{\"client_id\":\"\",\"client_secret\":\"\",\"environment\":\"sandbox\"}', NULL, '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(2, 'Stripe', 'Stripe', 'stripe.png', 0, 0, '{\"secret_key\":\"\",\"publishable_key\":\"\"}', NULL, '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(3, 'Razorpay', 'Razorpay', 'razorpay.png', 0, 0, '{\"razorpay_key_id\":\"\",\"razorpay_key_secret\":\"\"}', NULL, '{\"INR\":\"INR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(4, 'Paystack', 'Paystack', 'paystack.png', 0, 0, '{\"paystack_public_key\":\"\",\"paystack_secret_key\":\"\"}', NULL, '{\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(5, 'BlockChain', 'BlockChain', 'blockchain.png', 0, 1, '{\"blockchain_api_key\":\"\",\"blockchain_xpub\":\"\"}', NULL, '{\"BTC\":\"BTC\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(6, 'Flutterwave', 'Flutterwave', 'flutterwave.png', 0, 0, '{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\",\"environment\":\"sandbox\"}', NULL, '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(7, 'VoguePay', 'VoguePay', 'VoguePay.png', 1, 0, '{\"merchant_id\":\"\"}', NULL, '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(8, 'Mollie', 'Mollie', 'Mollie.png', 1, 0, '{\"api_key\":\"\"}', NULL, '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(9, 'CoinPayments', 'CoinPayments', 'CoinPayments.png', 1, 1, '{\"public_key\":\"\",\"private_key\":\"\",\"merchant_id\":\"\",\"ipn_secret\":\"\"}', NULL, '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL),
(10, 'Instamojo', 'Instamojo', 'instamojo.png', 1, 0, '{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\",\"environment\":\"sandbox\"}', NULL, '{\"INR\":\"INR\"}', NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role_id`, `permission`, `created_at`, `updated_at`) VALUES
(1, 1, 'dashboard.total_customer_widget', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(2, 1, 'dashboard.deposit_requests_widget', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(3, 1, 'dashboard.withdraw_requests_widget', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(4, 1, 'dashboard.loan_requests_widget', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(5, 1, 'dashboard.expense_overview_widget', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(6, 1, 'dashboard.deposit_withdraw_analytics', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(7, 1, 'dashboard.recent_transaction_widget', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(8, 1, 'members.import', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(9, 1, 'members.accept_request', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(10, 1, 'members.reject_request', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(11, 1, 'members.pending_requests', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(12, 1, 'members.send_email', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(13, 1, 'members.send_sms', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(14, 1, 'members.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(15, 1, 'members.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(16, 1, 'members.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(17, 1, 'members.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(18, 1, 'members.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(19, 1, 'member_documents.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(20, 1, 'member_documents.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(21, 1, 'member_documents.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(22, 1, 'member_documents.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(23, 1, 'savings_accounts.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(24, 1, 'savings_accounts.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(25, 1, 'savings_accounts.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(26, 1, 'savings_accounts.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(27, 1, 'savings_accounts.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(28, 1, 'interest_calculation.calculator', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(29, 1, 'interest_calculation.interest_posting', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(30, 1, 'transactions.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(31, 1, 'transactions.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(32, 1, 'transactions.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(33, 1, 'transactions.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(34, 1, 'transactions.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(35, 1, 'deposit_requests.approve', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(36, 1, 'deposit_requests.reject', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(37, 1, 'deposit_requests.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(38, 1, 'deposit_requests.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(39, 1, 'deposit_requests.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(40, 1, 'withdraw_requests.approve', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(41, 1, 'withdraw_requests.reject', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(42, 1, 'withdraw_requests.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(43, 1, 'withdraw_requests.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(44, 1, 'withdraw_requests.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(45, 1, 'expenses.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(46, 1, 'expenses.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(47, 1, 'expenses.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(48, 1, 'expenses.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(49, 1, 'expenses.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(50, 1, 'loans.admin_calculator', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(51, 1, 'loans.calculate', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(52, 1, 'loans.approve', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(53, 1, 'loans.reject', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(54, 1, 'loans.filter', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(55, 1, 'loans.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(56, 1, 'loans.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(57, 1, 'loans.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(58, 1, 'loans.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(59, 1, 'loans.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(60, 1, 'loan_collaterals.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(61, 1, 'loan_collaterals.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(62, 1, 'loan_collaterals.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(63, 1, 'loan_collaterals.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(64, 1, 'loan_collaterals.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(65, 1, 'guarantors.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(66, 1, 'guarantors.edit', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(67, 1, 'guarantors.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(68, 1, 'loan_payments.index', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(69, 1, 'loan_payments.create', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(70, 1, 'loan_payments.show', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(71, 1, 'loan_payments.destroy', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(72, 1, 'reports.account_statement', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(73, 1, 'reports.account_balances', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(74, 1, 'reports.transactions_report', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(75, 1, 'reports.loan_report', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(76, 1, 'reports.loan_due_report', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(77, 1, 'reports.expense_report', '2025-10-26 01:07:06', '2025-10-26 01:07:06'),
(78, 1, 'reports.revenue_report', '2025-10-26 01:07:06', '2025-10-26 01:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin-coder', NULL, '2025-10-26 07:05:19', '2025-10-26 07:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `savings_accounts`
--

CREATE TABLE `savings_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `savings_product_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 = action | 2 = Deactivate',
  `opening_balance` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `savings_accounts`
--

INSERT INTO `savings_accounts` (`id`, `account_number`, `member_id`, `savings_product_id`, `status`, `opening_balance`, `description`, `created_user_id`, `updated_user_id`, `created_at`, `updated_at`) VALUES
(1, '20230401001', 1, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 08:53:54', '2024-04-18 08:53:54'),
(2, '20230401002', 2, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 08:54:08', '2024-04-18 08:54:08'),
(3, '20230401003', 3, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 08:54:23', '2024-04-18 08:54:23'),
(4, '20230401004', 4, 1, 1, 500.00, NULL, 1, NULL, '2024-04-18 08:54:42', '2024-04-18 08:54:42'),
(5, '20230401005', 5, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 08:54:59', '2024-04-18 08:54:59'),
(6, '20230401006', 6, 1, 1, 500.00, NULL, 1, NULL, '2024-04-18 08:55:14', '2024-04-18 08:55:14'),
(7, '20230401007', 9, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 08:55:30', '2024-04-18 08:55:30'),
(8, '20230401008', 7, 1, 1, 500.00, NULL, 1, NULL, '2024-04-18 08:55:48', '2024-04-18 08:55:48'),
(9, '20230401009', 10, 1, 1, 500.00, NULL, 1, NULL, '2024-04-18 08:56:05', '2024-04-18 08:56:05'),
(10, '20230401010', 11, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 08:56:19', '2024-04-18 08:56:19'),
(11, '20230401011', 12, 1, 1, 1000.00, NULL, 1, 1, '2024-04-18 09:14:34', '2024-04-18 09:14:44'),
(12, '20230401012', 13, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-18 09:21:25', '2024-04-18 09:21:25'),
(13, '20230401013', 14, 1, 1, 500.00, NULL, 1, NULL, '2024-04-18 09:22:01', '2024-04-18 09:22:01'),
(14, '20230401014', 15, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-21 13:19:36', '2024-04-21 13:19:36'),
(15, '20230401015', 16, 1, 1, 1000.00, NULL, 1, NULL, '2024-04-21 13:19:58', '2024-04-21 13:19:58'),
(16, '20230401016', 19, 1, 1, 685.30, 'interest', 1, NULL, '2024-05-11 10:25:54', '2024-05-11 10:25:54'),
(17, '20230401017', 20, 1, 1, 100.00, NULL, 1, NULL, '2024-05-11 10:30:02', '2024-05-11 10:30:02'),
(18, '20230401018', 21, 1, 1, 5000.00, 'Mar24-July-24', 1, NULL, '2024-07-01 13:09:40', '2024-07-01 13:09:40'),
(19, '20230401019', 22, 1, 1, 8000.00, 'Account Open', 1, NULL, '2024-08-11 05:09:31', '2024-08-11 05:09:31'),
(20, '20230401020', 23, 1, 1, 10000.00, 'Open new account and 2 installment', 1, NULL, '2024-08-18 04:19:44', '2024-08-18 04:19:44'),
(21, 'hasib', 24, 1, 1, 12000.00, NULL, 1, NULL, '2025-11-15 19:48:08', '2025-11-15 19:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `savings_products`
--

CREATE TABLE `savings_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` bigint(20) UNSIGNED NOT NULL,
  `interest_rate` decimal(8,2) DEFAULT NULL,
  `interest_method` varchar(30) DEFAULT NULL,
  `interest_period` int(11) DEFAULT NULL,
  `interest_posting_period` int(11) DEFAULT NULL,
  `min_bal_interest_rate` decimal(10,2) DEFAULT NULL,
  `allow_withdraw` tinyint(4) NOT NULL DEFAULT 1,
  `minimum_account_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `minimum_deposit_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `maintenance_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `maintenance_fee_posting_period` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1 = active | 2 = Deactivate',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `savings_products`
--

INSERT INTO `savings_products` (`id`, `name`, `currency_id`, `interest_rate`, `interest_method`, `interest_period`, `interest_posting_period`, `min_bal_interest_rate`, `allow_withdraw`, `minimum_account_balance`, `minimum_deposit_amount`, `maintenance_fee`, `maintenance_fee_posting_period`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MT-Saving', 4, 0.00, 'daily_outstanding_balance', 12, NULL, 5000.00, 1, 500.00, 100.00, 100.00, 4, 1, '2024-04-18 08:51:20', '2024-05-11 09:35:15');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_tasks_histories`
--

CREATE TABLE `schedule_tasks_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `reference_id` bigint(20) DEFAULT NULL,
  `others` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'mail_type', 'smtp', NULL, '2024-04-18 06:33:45'),
(2, 'backend_direction', 'ltr', NULL, '2024-04-18 06:30:17'),
(3, 'language', 'English', NULL, '2024-04-18 08:46:34'),
(4, 'email_verification', 'disabled', NULL, NULL),
(5, 'allow_singup', 'yes', NULL, NULL),
(6, 'company_name', 'Microtrust Socity Management System', '2024-04-18 00:29:34', '2024-04-18 08:46:34'),
(7, 'site_title', 'Microtrust', '2024-04-18 00:29:34', '2024-04-18 08:46:34'),
(8, 'phone', '01738356180', '2024-04-18 00:29:34', '2024-04-18 08:46:34'),
(9, 'email', 'hasib.9437.hu@gmail.com', '2024-04-18 00:29:34', '2024-04-18 08:46:34'),
(10, 'timezone', 'Asia/Dhaka', '2024-04-18 00:29:34', '2024-04-18 08:46:34'),
(11, 'default_branch_name', 'Main Branch', '2024-04-18 06:29:59', '2024-04-18 08:46:34'),
(12, 'address', '217 3rd colony, lalkuthi, Mirpur-1', '2024-04-18 06:29:59', '2024-04-18 08:46:34'),
(13, 'currency_position', 'left', '2024-04-18 06:30:14', '2024-04-18 06:30:17'),
(14, 'date_format', 'Y-m-d', '2024-04-18 06:30:14', '2024-04-18 06:30:17'),
(15, 'time_format', '24', '2024-04-18 06:30:14', '2024-04-18 06:30:17'),
(16, 'member_signup', '1', '2024-04-18 06:30:14', '2024-04-18 06:30:17'),
(17, 'own_account_transfer_fee_type', 'percentage', '2024-04-18 06:30:30', '2024-04-18 06:30:30'),
(18, 'own_account_transfer_fee', '0', '2024-04-18 06:30:30', '2024-04-18 06:30:30'),
(19, 'other_account_transfer_fee_type', 'percentage', '2024-04-18 06:30:30', '2024-04-18 06:30:30'),
(20, 'other_account_transfer_fee', '0', '2024-04-18 06:30:30', '2024-04-18 06:30:30'),
(21, 'from_email', 'microtrust@creativeitbari.com	', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(22, 'from_name', 'Microtrust Do Not Reply', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(23, 'smtp_host', 'mail.creativeitbari.com', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(24, 'smtp_port', '465', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(25, 'smtp_username', 'microtrust@creativeitbari.com', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(26, 'smtp_password', 'Rajbari@12345678!@#', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(27, 'smtp_encryption', 'ssl', '2024-04-18 06:32:58', '2024-04-18 06:33:45'),
(28, 'logo', 'logo.png', '2024-04-18 08:49:45', '2024-04-18 08:49:48'),
(29, 'favicon', 'file_1713430187.png', '2024-04-18 08:49:46', '2024-04-18 08:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `trans_date` datetime NOT NULL,
  `savings_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `charge` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `gateway_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `dr_cr` varchar(2) NOT NULL,
  `type` varchar(30) NOT NULL,
  `method` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `note` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `loan_id` bigint(20) DEFAULT NULL,
  `ref_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Parent transaction id',
  `gateway_id` bigint(20) DEFAULT NULL COMMENT 'PayPal | Stripe | Other Gateway',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `transaction_details` text DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `member_id`, `trans_date`, `savings_account_id`, `charge`, `amount`, `gateway_amount`, `dr_cr`, `type`, `method`, `status`, `note`, `description`, `loan_id`, `ref_id`, `parent_id`, `gateway_id`, `created_user_id`, `updated_user_id`, `branch_id`, `transaction_details`, `tracking_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-04-27 14:53:00', 1, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:53:54', '2024-04-18 09:06:47'),
(2, 2, '2023-04-27 14:54:00', 2, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:54:08', '2024-04-18 09:15:23'),
(3, 3, '2023-04-27 14:54:00', 3, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:54:23', '2024-04-18 09:05:51'),
(4, 4, '2023-04-27 14:54:00', 4, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:54:42', '2024-04-18 09:05:11'),
(5, 5, '2023-04-27 14:54:00', 5, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:54:59', '2024-04-18 09:04:51'),
(6, 6, '2023-04-27 14:55:00', 6, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:55:14', '2024-04-18 09:04:38'),
(7, 9, '2023-04-27 14:55:00', 7, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:55:30', '2024-04-18 09:04:14'),
(8, 7, '2023-04-27 14:55:00', 8, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:55:48', '2024-04-18 09:03:00'),
(9, 10, '2023-04-27 14:56:00', 9, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:56:05', '2024-04-18 09:01:51'),
(10, 11, '2023-04-30 14:56:00', 10, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 08:56:19', '2024-04-18 09:01:22'),
(11, 12, '2023-05-22 15:14:00', 11, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 09:14:34', '2024-04-18 09:15:45'),
(12, 13, '2023-04-27 15:21:00', 12, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 09:21:25', '2024-04-18 09:22:35'),
(13, 14, '2023-04-27 15:22:00', 13, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-18 09:22:01', '2024-04-18 09:22:21'),
(15, 16, '2023-04-27 19:19:00', 15, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-21 13:19:58', '2024-04-21 13:20:31'),
(16, 1, '2023-05-31 19:22:00', 1, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'May Saifur 23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:23:04', '2024-04-21 13:23:04'),
(17, 2, '2023-06-21 19:22:00', 2, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Nazmul may-23', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-04-21 13:24:19', '2024-04-21 13:24:36'),
(18, 5, '2023-05-31 19:22:00', 5, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Hasib May-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:25:41', '2024-04-21 13:25:41'),
(19, 16, '2023-06-21 19:25:00', 15, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tarik may-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:26:36', '2024-04-21 13:26:36'),
(20, 3, '2023-04-21 19:26:00', 3, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tawfiq may-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:27:28', '2024-04-21 13:27:28'),
(21, 13, '2023-05-31 19:27:00', 12, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Raju May-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:30:23', '2024-04-21 13:30:23'),
(22, 11, '2023-05-31 19:22:00', 10, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Adnan may23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:31:01', '2024-04-21 13:31:01'),
(23, 9, '2023-05-30 19:22:00', 7, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Mashrur may23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:31:42', '2024-04-21 13:31:42'),
(24, 12, '2023-05-30 19:22:00', 11, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Rukaiya May-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:32:25', '2024-04-21 13:32:25'),
(25, 7, '2023-05-31 19:22:00', 8, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tuhin may-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:35:10', '2024-04-21 13:35:10'),
(26, 6, '2023-05-31 19:22:00', 6, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Fahim may-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:36:02', '2024-04-21 13:36:02'),
(27, 10, '2023-06-20 19:22:00', 9, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Hrithik May-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:37:38', '2024-04-21 13:37:38'),
(28, 14, '2023-04-27 19:37:00', 13, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Didar may-23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:39:34', '2024-04-21 13:39:34'),
(29, 4, '2023-06-26 19:39:00', 4, NULL, 500.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Ziarur may23', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:40:19', '2024-04-21 13:40:19'),
(30, 1, '2024-04-21 19:55:00', 1, NULL, 10000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Saifur june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:57:55', '2024-04-21 13:57:55'),
(31, 2, '2024-04-21 19:57:00', 2, NULL, 10000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Nazmul  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:58:24', '2024-04-21 13:58:24'),
(32, 3, '2024-04-21 19:58:00', 3, NULL, 8000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tawfiq  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:58:50', '2024-04-21 13:58:50'),
(33, 4, '2024-04-21 19:58:00', 4, NULL, 6000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Ziaur  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:59:16', '2024-04-21 13:59:16'),
(34, 5, '2024-04-21 19:59:00', 5, NULL, 10000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Hasib  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 13:59:40', '2024-04-21 13:59:40'),
(35, 6, '2024-04-21 19:59:00', 6, NULL, 6000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Fahim  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:00:12', '2024-04-21 14:00:12'),
(36, 7, '2024-04-21 20:00:00', 8, NULL, 7000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tuhin  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:01:00', '2024-04-21 14:01:00'),
(37, 9, '2024-04-21 20:01:00', 7, NULL, 9000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Mashrur  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:01:40', '2024-04-21 14:01:40'),
(38, 10, '2024-04-21 20:01:00', 9, NULL, 7000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Hrithik  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:02:13', '2024-04-21 14:02:13'),
(39, 11, '2024-04-21 20:02:00', 10, NULL, 10000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Adnan  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:02:44', '2024-04-21 14:02:44'),
(40, 12, '2024-04-21 20:02:00', 11, NULL, 7000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Rukaiya  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:03:12', '2024-04-21 14:03:12'),
(41, 14, '2024-04-21 20:03:00', 13, NULL, 7000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Didar  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:03:44', '2024-04-21 14:03:44'),
(42, 15, '2024-04-21 20:03:00', 14, NULL, 4000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Mamun  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:04:12', '2024-04-21 14:04:12'),
(43, 16, '2024-04-21 20:04:00', 15, NULL, 9000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tarif  june23 - April24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-04-21 14:05:12', '2024-04-21 14:05:12'),
(44, 5, '2024-05-04 01:41:47', 5, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-03 19:41:47', '2024-05-03 19:41:47'),
(45, 15, '2024-05-07 14:02:50', 14, 0.00, 5000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-07 08:02:50', '2024-05-07 08:02:50'),
(46, 2, '2024-05-07 14:04:37', 2, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-07 08:04:37', '2024-05-07 08:04:37'),
(47, 6, '2024-05-07 14:04:50', 6, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-07 08:04:50', '2024-05-07 08:04:50'),
(48, 11, '2024-05-07 14:05:06', 10, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-07 08:05:06', '2024-05-07 08:05:06'),
(50, 4, '2024-05-03 12:16:00', 4, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'may-2024\r\n#AA47C312', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:01:22', '2024-05-11 10:01:22'),
(51, 9, '2024-05-11 16:08:00', 7, NULL, 2000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'april24, may-24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:09:07', '2024-05-11 10:09:07'),
(52, 19, '2024-05-11 16:25:54', 16, NULL, 685.30, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:25:54', '2024-05-11 10:25:54'),
(53, 19, '2023-12-29 16:26:00', 16, NULL, 102.85, 0.00, 'dr', 'Account_Maintenance_Fee', 'Manual', 2, NULL, 'Tax on profit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:27:13', '2024-05-11 10:27:13'),
(54, 20, '2024-05-11 16:30:02', 17, NULL, 100.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:30:02', '2024-05-11 10:30:02'),
(55, 20, '2024-03-13 16:31:00', 17, NULL, 840.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tarif 600\r\nmasrur 240', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:33:05', '2024-05-11 10:33:05'),
(56, 20, '2024-05-04 16:34:00', 17, NULL, 100.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'saifur 100', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-11 10:34:39', '2024-05-11 10:34:39'),
(57, 3, '2024-05-15 10:23:27', 3, 0.00, 2000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-05-15 04:23:27', '2024-05-15 04:23:27'),
(58, 6, '2024-06-02 19:45:48', 6, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-02 13:45:48', '2024-06-02 13:45:48'),
(59, 10, '2024-06-06 09:49:36', 9, 0.00, 2000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-06 03:49:36', '2024-06-06 03:49:36'),
(60, 20, '2024-06-06 09:49:00', 17, NULL, 1200.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Apr,May charge', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-06 03:50:31', '2024-06-06 03:50:31'),
(61, 16, '2024-06-06 09:50:00', 15, NULL, 3000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Apr,May,June24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-06 03:51:15', '2024-06-06 03:51:15'),
(62, 2, '2024-06-06 11:00:00', 2, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Nazmul-June-24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-06 05:00:58', '2024-06-06 05:00:58'),
(63, 11, '2024-06-09 15:34:49', 10, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-09 09:34:49', '2024-06-09 09:34:49'),
(64, 20, '2024-06-09 15:34:00', 17, NULL, 155.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'masrur card bill', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-09 09:35:41', '2024-06-09 09:35:41'),
(65, 14, '2024-06-11 12:43:00', 13, NULL, 6000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Previously year all clear, may2024, june2024', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-11 06:48:48', '2024-06-11 06:48:48'),
(66, 5, '2024-06-11 12:48:00', 5, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Hasib June24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-11 07:06:51', '2024-06-11 07:06:51'),
(67, 12, '2024-06-11 16:07:00', 11, NULL, 5000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Previously 3 month23, may-24,june-24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-06-11 10:07:40', '2024-06-11 10:07:40'),
(68, 21, '2024-07-01 19:09:40', 18, NULL, 5000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-01 13:09:40', '2024-07-01 13:09:40'),
(69, 16, '2024-07-09 15:25:00', 15, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Tarik July 24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-09 09:25:55', '2024-07-09 09:25:55'),
(70, 20, '2024-07-09 15:25:00', 17, NULL, 520.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Fromn tarik', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-09 09:26:16', '2024-07-09 09:26:16'),
(71, 5, '2024-07-09 15:26:00', 5, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Hasib-July24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-09 09:26:34', '2024-07-09 09:26:34'),
(72, 6, '2024-07-09 15:27:24', 6, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-09 09:27:24', '2024-07-09 09:27:24'),
(73, 15, '2024-07-09 15:27:00', 14, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Mamun-July-24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-09 09:28:12', '2024-07-09 09:28:12'),
(74, 1, '2024-06-29 15:28:00', 1, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Saifur-July-24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-07-09 09:30:12', '2024-07-09 09:30:12'),
(75, 20, '2024-07-08 12:37:00', 17, NULL, 520.00, 0.00, 'cr', 'Bank Profit', 'Manual', 2, NULL, 'tarik vi loan profit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-08 06:38:25', '2024-08-08 06:38:25'),
(76, 2, '2024-08-08 12:38:00', 2, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'nazmul aug 24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-08 06:52:11', '2024-08-08 06:52:11'),
(77, 3, '2024-08-08 12:54:25', 3, 0.00, 2000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-08 06:54:25', '2024-08-08 06:54:25'),
(78, 11, '2024-08-08 12:54:30', 10, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-08 06:54:30', '2024-08-08 06:54:30'),
(79, 22, '2024-07-31 11:09:00', 19, NULL, 8000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '2024-08-11 05:09:31', '2024-08-11 05:10:00'),
(80, 7, '2024-08-10 11:10:00', 8, NULL, 4000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'May-aug 24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-11 05:11:38', '2024-08-11 05:11:38'),
(81, 4, '2024-08-11 11:11:00', 4, NULL, 1000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Aug 24', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-11 05:11:54', '2024-08-11 05:11:54'),
(82, 23, '2024-08-18 10:19:44', 20, NULL, 10000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-08-18 04:19:44', '2024-08-18 04:19:44'),
(83, 10, '2024-09-03 19:39:51', 9, 0.00, 1500.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-09-03 13:39:51', '2024-09-03 13:39:51'),
(84, 22, '2024-09-03 19:39:57', 19, 0.00, 5000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-09-03 13:39:57', '2024-09-03 13:39:57'),
(85, 10, '2024-09-03 19:39:59', 9, 0.00, 2500.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-09-03 13:39:59', '2024-09-03 13:39:59'),
(86, 11, '2024-09-03 19:40:03', 10, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2024-09-03 13:40:03', '2024-09-03 13:40:03'),
(87, 9, '2024-12-30 12:40:55', 7, NULL, 6666.67, 0.00, 'dr', 'Loan_Repayment', 'Online', 2, 'Loan Repayment', 'Loan Repayment', 7, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, '2024-12-30 06:40:55', '2024-12-30 06:40:55'),
(88, 11, '2025-06-01 22:55:18', 10, 0.00, 1000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-06-01 16:55:18', '2025-06-01 16:55:18'),
(89, 11, '2025-06-01 22:55:21', 10, 0.00, 2000.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-06-01 16:55:21', '2025-06-01 16:55:21'),
(90, 10, '2025-06-01 22:55:24', 9, 0.00, 1500.00, 0.00, 'cr', 'Deposit', 'Bank Transfer Manual', 2, NULL, 'Deposit Via Bank Transfer Manual', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-06-01 16:55:24', '2025-06-01 16:55:24'),
(91, 24, '2025-11-16 01:48:08', 21, NULL, 12000.00, 0.00, 'cr', 'Deposit', 'Manual', 2, NULL, 'Initial Deposit', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2025-11-15 19:48:08', '2025-11-15 19:48:08');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_categories`
--

CREATE TABLE `transaction_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `related_to` varchar(2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_categories`
--

INSERT INTO `transaction_categories` (`id`, `name`, `related_to`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Cash deposit', 'cr', 1, NULL, '2024-04-18 13:38:44', '2024-04-18 13:38:44'),
(2, 'Bank Profit', 'cr', 1, NULL, '2024-05-11 10:21:34', '2024-05-11 10:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` int(11) NOT NULL,
  `profile_picture` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user_type`, `role_id`, `branch_id`, `status`, `profile_picture`, `email_verified_at`, `password`, `provider`, `provider_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Md. Hasibuzzaman', 'hasib.9437.hu@gmail.com', 'admin', NULL, NULL, 1, 'default.png', '2024-04-18 00:28:37', '$2y$10$utVPsl/jeiodhdYfSzwq5O63KNXBPKacOUVAYGc73NFMprWMb6Opa', NULL, NULL, 'dBJCii9fB2dVOOIfuvBSrZ5wnX2ao52YH2gyjvucsw5XIRV7EqJpnqUppYhQ', '2024-04-18 00:28:37', '2024-04-18 00:28:37'),
(2, 'Md. Saifur', 'saifur1985bd@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$Qohd8wueZiiVBGthdQ./V.TLakG8ELD5PeyPmqt.HlM5kM5cDVHTK', NULL, NULL, 'bGHnzb86p544JA2kLwy4wrhlqMHeDDosEHcmyJlyMpVAjbL0loIBozWsFmom', '2024-04-18 00:37:40', '2024-04-18 06:39:35'),
(3, 'Md.Nazmul', 'nazmulhs030@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$EiezNkWf.ZDDBfjqlxpfoexLYm8ih0aDUnXHXRu6ijDb6LmNiPxaW', NULL, NULL, 'DDf2tk9e8NhyenYUwSTFxKebT5Rs6VOnwLaPQiC5zSjY6sQ8aqb4hgiwXdYz', '2024-04-18 00:38:08', '2024-04-18 06:39:42'),
(4, 'Tawfiqul', 'tawfiqul01@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$pA2SrEC846ifEv79WTTmY.6uZ1W3EXnBsywb3rfpzJCfmph31vEn2', NULL, NULL, '0u9qYvClXQ5HF3x6DedFgcyMDFtonbudeqlNkpArfowZr1ka4ZLAwXiWl2fe', '2024-04-18 00:40:44', '2024-04-18 06:41:01'),
(5, 'Ziaur', 'ziaurrahaman939@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$xNNmMH4jDLBJlH5NvbgW/.qLG4NRiNeeX.XbEHQkgtT.qhLNYTs66', NULL, NULL, NULL, '2024-04-18 00:41:28', '2024-04-18 06:42:25'),
(6, 'Md', 'hasib.2030.hu@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$iQq8cY3CZe9sSAkxUT86COrbQPs7ErOGMsZxiu/oizwkvb0TQIi9W', NULL, NULL, 'blILkQsiKTjTxq8jCsLnnCoYQjuxZQEdhazPvZHaBZVpjAZGXl8H9nrXXFFO', '2024-04-18 00:45:22', '2024-04-18 06:45:43'),
(7, 'Mustafizur Rahman', 'mustafizurr171@gmail.com', 'customer', NULL, NULL, 1, 'profile_1713452197.png', NULL, '$2y$10$rRkGu3CpggI91HswLnb0K.LlZzV8lk45pEABFh3lcULeM1UxT/yia', NULL, NULL, 'ftRmdshrBS2i9JbJ4lLO9HSSs9w9SbYGf0AHdA5jS9jFLHqDUBTBrqfFm1mm', '2024-04-18 00:45:32', '2024-04-18 14:56:37'),
(8, 'Sheikh', 'hituhin09@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$ghI3oJk99/DWL9YuSqoAv.RPn4KAwHEsI2Xv9hftNqJOtHq3XoeR6', NULL, NULL, 'FlaB18LmiRWvJi9Te7FtISYtGBJhCWc5lRKcwIMUMVkRJJku28YiU8oqCODA', '2024-04-18 00:50:21', '2025-06-01 11:36:56'),
(10, 'Md. Mashrur Rahman', 'mashrurrahman16@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$H975kpqdKv63BxM.NYnZP.zYIXuy.YyHaVHCaF7kbWgicwjeiQvX6', NULL, NULL, NULL, '2024-04-18 01:03:12', '2024-04-18 07:03:50'),
(11, 'Hrithik', 'hrithik08.rudra@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$5D5nYmvrCnWXHPl7K9HNUePhZh0sGJYV0EGW3ktaNk6Q23xqLoz0G', NULL, NULL, NULL, '2024-04-18 01:27:14', '2024-04-18 08:27:36'),
(12, 'Khandakar Anim Hassan', 'khandakar.adnan21@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$HU2bYE40p4i0zJopSE/Dnujth1/8FRjEDOqh3lAABf9X8lI30yd5W', NULL, NULL, NULL, '2024-04-18 01:53:33', '2024-04-18 08:28:26'),
(13, 'Rukaiya Azmi', 'rukaiyaazmi@gmail.com', 'customer', NULL, NULL, 1, NULL, NULL, '$2y$10$JH3ErUF2E.t972a1iNYOMOAzO2L36RDL2d82c7M.l.hMkoV2uXL9S', NULL, NULL, NULL, '2024-04-18 09:12:59', '2024-04-18 09:12:59'),
(14, 'Md Raju Ahmed', 'rajucse1705@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$MV/BnritYq5Fqy1rNwoUheJNCGF1qYpxA15gy7dckDXT05C7E085q', NULL, NULL, 'wbjSjNEN244hjC7A9lLDifmC1QVnL0r9sazNgvbc6xuRNtZ7lMDLxclOUl8o', '2024-04-18 09:17:37', '2024-04-18 09:17:37'),
(15, 'Md.Didarul Islam', 'khandidar11@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$0NibeMTqAMAACtY9J0O6wukE47pwZaQOWUScwguf2LyEASq68wFkq', NULL, NULL, 'I5uddzWVdHyzBUVMpD3GnVl83FiomYa78LdfLPQqv1MYJIn9a3jStz3ur2cw', '2024-04-18 09:20:03', '2024-04-18 09:20:03'),
(16, 'Md Almamun', 'md.almamun.bd@gmail.com', 'customer', NULL, NULL, 1, '1713705123Screenshot from 2024-04-21 19-12-00.png', NULL, '$2y$10$qEjrXXvCewIy3DOnALZw4O7WZ14OxyOjARsJC5WpQ5Q3kaAzcN4Ue', NULL, NULL, 'Kqn7pEPWqgGu27razwJiFUnRil8PhjIptQmceODlSxSFWysnF8GdOlaz8Cbi', '2024-04-21 13:12:03', '2024-04-21 13:12:03'),
(17, 'Md Tarif', 'tarif.isjnu@gmail.com', 'customer', NULL, NULL, 1, '1713705490Screenshot from 2024-04-21 19-17-32.png', NULL, '$2y$10$J.VOY2KJPj26RGo7z8aPr.f39BDzWc5JurDjIyDvXqJL1ko.En2yy', NULL, NULL, NULL, '2024-04-21 13:18:10', '2024-04-21 13:18:10'),
(18, 'Risaht Amin', 'samiaulamin@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$yCksvapOBPbQzN6B8XZgbOdsLyXiLiE/m76C8zBBQ5pK4t3J1x1Iq', NULL, NULL, 'InAp9Ci3jMPwVO73PAfpdqgijd0m8s1IkBSuex3hn9pfuRsTsZXigdk2jGno', '2024-07-01 13:08:49', '2024-07-01 13:08:49'),
(19, 'Rahemul Islam', 'rahimulislam14@gmail.com', 'customer', NULL, NULL, 1, '1723352880Screenshot from 2024-08-11 11-07-39.png', NULL, '$2y$10$20YUMjbtofCWythfJFLjP.1/35TjMnjACCMuv9eb3RtJdSkp7wJfS', NULL, NULL, NULL, '2024-08-11 05:08:00', '2024-08-11 05:08:00'),
(20, 'Masuma Sultana', 'masuma.cse@gmail.com', 'customer', NULL, NULL, 1, 'default.png', NULL, '$2y$10$tuWYxqX0fHZ/JAkdq8EbNOT1WQTS8I4BX3jl09gcpv7AFje9ECutS', NULL, NULL, NULL, '2024-08-18 04:17:46', '2024-08-18 04:17:46'),
(21, 'HERA', 'adminhera@gmail.com', 'user', 1, 2, 1, 'default.png', '2025-10-16 06:40:25', '$2y$10$V5hUu92M76R5cYlP5y4JMuW7v.vFr/64sZMPemX9Loc1fYupACLxu', NULL, NULL, 'xAKnUgkDflGXTei5DZdTQKFRxHr8y1J4O93n5SFjDCNBKEIt8LU7oJcgEmla', '2025-10-16 06:40:25', '2025-10-26 07:07:43'),
(22, 'Md. Hasibuzzaman', 'hasib.123.hu@gmail.com', 'customer', NULL, NULL, 1, '1763236086fashion-KV.jpg', NULL, '$2y$10$2Z4dl1Lo0S/auyytG6I0suc7fEkwNQSas9R.HiWYg71Yf6G9Aio7O', NULL, NULL, NULL, '2025-11-15 19:48:07', '2025-11-15 19:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `currency_id` bigint(20) NOT NULL,
  `minimum_amount` decimal(10,2) NOT NULL,
  `maximum_amount` decimal(10,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `descriptions` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `requirements` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `image`, `currency_id`, `minimum_amount`, `maximum_amount`, `fixed_charge`, `charge_in_percentage`, `descriptions`, `status`, `requirements`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'default.png', 4, 0.00, 0.00, 0.00, 0.00, '<p>Any Cash</p>', 1, '[\"Cash\",\"hasib.9437.hu@gmail.com\"]', '2024-05-11 09:34:33', '2024-05-11 09:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` bigint(20) UNSIGNED NOT NULL,
  `debit_account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `converted_amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charge_limits`
--
ALTER TABLE `charge_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposit_requests_member_id_foreign` (`member_id`),
  ADD KEY `deposit_requests_method_id_foreign` (`method_id`),
  ADD KEY `deposit_requests_credit_account_id_foreign` (`credit_account_id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guarantors_loan_id_foreign` (`loan_id`),
  ADD KEY `guarantors_member_id_foreign` (`member_id`);

--
-- Indexes for table `interest_posting`
--
ALTER TABLE `interest_posting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_collaterals`
--
ALTER TABLE `loan_collaterals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_collaterals_loan_id_foreign` (`loan_id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_payments_loan_id_foreign` (`loan_id`),
  ADD KEY `loan_payments_member_id_foreign` (`member_id`);

--
-- Indexes for table `loan_products`
--
ALTER TABLE `loan_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_documents`
--
ALTER TABLE `member_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `member_documents_member_id_foreign` (`member_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigations`
--
ALTER TABLE `navigations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `navigation_items`
--
ALTER TABLE `navigation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `navigation_items_parent_id_foreign` (`parent_id`),
  ADD KEY `navigation_items_page_id_foreign` (`page_id`),
  ADD KEY `navigation_items_navigation_id_index` (`navigation_id`);

--
-- Indexes for table `navigation_item_translations`
--
ALTER TABLE `navigation_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `navigation_item_translations_navigation_item_id_locale_unique` (`navigation_item_id`,`locale`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `savings_accounts_member_id_foreign` (`member_id`),
  ADD KEY `savings_accounts_savings_product_id_foreign` (`savings_product_id`);

--
-- Indexes for table `savings_products`
--
ALTER TABLE `savings_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `savings_products_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `schedule_tasks_histories`
--
ALTER TABLE `schedule_tasks_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_member_id_foreign` (`member_id`),
  ADD KEY `transactions_savings_account_id_foreign` (`savings_account_id`),
  ADD KEY `transactions_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_requests_member_id_foreign` (`member_id`),
  ADD KEY `withdraw_requests_method_id_foreign` (`method_id`),
  ADD KEY `withdraw_requests_debit_account_id_foreign` (`debit_account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `charge_limits`
--
ALTER TABLE `charge_limits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_methods`
--
ALTER TABLE `deposit_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guarantors`
--
ALTER TABLE `guarantors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interest_posting`
--
ALTER TABLE `interest_posting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `loan_collaterals`
--
ALTER TABLE `loan_collaterals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `loan_products`
--
ALTER TABLE `loan_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_repayments`
--
ALTER TABLE `loan_repayments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `member_documents`
--
ALTER TABLE `member_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `navigations`
--
ALTER TABLE `navigations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigation_items`
--
ALTER TABLE `navigation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navigation_item_translations`
--
ALTER TABLE `navigation_item_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `savings_products`
--
ALTER TABLE `savings_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedule_tasks_histories`
--
ALTER TABLE `schedule_tasks_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `transaction_categories`
--
ALTER TABLE `transaction_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deposit_requests`
--
ALTER TABLE `deposit_requests`
  ADD CONSTRAINT `deposit_requests_credit_account_id_foreign` FOREIGN KEY (`credit_account_id`) REFERENCES `savings_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposit_requests_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `deposit_requests_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `deposit_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD CONSTRAINT `guarantors_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guarantors_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loan_collaterals`
--
ALTER TABLE `loan_collaterals`
  ADD CONSTRAINT `loan_collaterals_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD CONSTRAINT `loan_payments_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loan_payments_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `member_documents`
--
ALTER TABLE `member_documents`
  ADD CONSTRAINT `member_documents_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `navigation_items`
--
ALTER TABLE `navigation_items`
  ADD CONSTRAINT `navigation_items_navigation_id_foreign` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `navigation_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `navigation_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `navigation_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `navigation_item_translations`
--
ALTER TABLE `navigation_item_translations`
  ADD CONSTRAINT `navigation_item_translations_navigation_item_id_foreign` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigation_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `savings_accounts`
--
ALTER TABLE `savings_accounts`
  ADD CONSTRAINT `savings_accounts_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `savings_accounts_savings_product_id_foreign` FOREIGN KEY (`savings_product_id`) REFERENCES `savings_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `savings_products`
--
ALTER TABLE `savings_products`
  ADD CONSTRAINT `savings_products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_savings_account_id_foreign` FOREIGN KEY (`savings_account_id`) REFERENCES `savings_accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD CONSTRAINT `withdraw_requests_debit_account_id_foreign` FOREIGN KEY (`debit_account_id`) REFERENCES `savings_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdraw_requests_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `withdraw_requests_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `withdraw_methods` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
