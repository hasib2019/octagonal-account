DROP TABLE IF EXISTS branches;

CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `contact_email` varchar(191) DEFAULT NULL,
  `contact_phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO branches VALUES('1','Octagonal Trust','octagonal@creativeitbari.com','01618356180','DHAKA','NEW BRANCH','2024-08-31 17:12:57','2024-08-31 17:12:57');
INSERT INTO branches VALUES('2','Coder Home','adminhera@gmail.com','01618356180','Mirpur','New','2025-10-16 12:39:27','2025-10-16 12:39:27');



DROP TABLE IF EXISTS charge_limits;

CREATE TABLE `charge_limits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `minimum_amount` decimal(18,2) NOT NULL,
  `maximum_amount` decimal(18,2) NOT NULL,
  `fixed_charge` decimal(10,2) NOT NULL,
  `charge_in_percentage` decimal(10,2) NOT NULL,
  `gateway_id` bigint(20) NOT NULL,
  `gateway_type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO charge_limits VALUES('1','1000.00','100000.00','0.00','0.00','1','App\\Models\\DepositMethod','2024-04-18 19:40:36','2024-04-18 19:40:36');
INSERT INTO charge_limits VALUES('2','100.00','200000.00','0.00','0.00','1','App\\Models\\WithdrawMethod','2024-05-11 15:34:33','2024-05-11 15:34:33');



DROP TABLE IF EXISTS committees;

CREATE TABLE `committees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) unsigned NOT NULL,
  `designation_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `committees_member_id_foreign` (`member_id`),
  KEY `committees_designation_id_foreign` (`designation_id`),
  CONSTRAINT `committees_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `committees_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS currency;

CREATE TABLE `currency` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(3) NOT NULL,
  `exchange_rate` decimal(10,6) NOT NULL,
  `base_currency` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO currency VALUES('1','USD','1.000000','0','0','','2024-04-18 14:45:55');
INSERT INTO currency VALUES('4','BDT','1.000000','1','1','2024-04-18 14:45:19','2024-04-18 14:45:19');



DROP TABLE IF EXISTS database_backups;

CREATE TABLE `database_backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(191) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS deposit_methods;

CREATE TABLE `deposit_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposit_methods VALUES('1','Bank Transfer Manual','default.png','4','0.00','0.00','0.00','0.00','','1','[\"100000\",\"Manual Account\"]','2024-04-18 19:40:36','2024-04-18 19:40:36');



DROP TABLE IF EXISTS deposit_requests;

CREATE TABLE `deposit_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) unsigned NOT NULL,
  `method_id` bigint(20) unsigned NOT NULL,
  `credit_account_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `converted_amount` decimal(10,2) NOT NULL,
  `charge` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deposit_requests_member_id_foreign` (`member_id`),
  KEY `deposit_requests_method_id_foreign` (`method_id`),
  KEY `deposit_requests_credit_account_id_foreign` (`credit_account_id`),
  CONSTRAINT `deposit_requests_credit_account_id_foreign` FOREIGN KEY (`credit_account_id`) REFERENCES `savings_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposit_requests_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposit_requests_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `deposit_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO deposit_requests VALUES('2','5','1','5','1000.00','1000.00','0.00','Hasib May24','{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}','1714560496voucher_1714560314168.jpg','2','44','2024-05-01 16:48:16','2024-05-04 01:41:47');
INSERT INTO deposit_requests VALUES('3','11','1','10','1000.00','1000.00','0.00','Adnan_ May_2024','{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}','1714811746voucher_1714811363014.jpg','2','48','2024-05-04 14:35:46','2024-05-07 14:05:06');
INSERT INTO deposit_requests VALUES('4','6','1','6','1000.00','1000.00','0.00','Mustafiz - May 24','{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}','1714840249440465945_406728142284735_8071056685584437477_n.jpg','2','47','2024-05-04 22:30:49','2024-05-07 14:04:50');
INSERT INTO deposit_requests VALUES('5','2','1','2','1000.00','1000.00','0.00','May - 2024 Send to the Personal Account Of Hasib Vai inDutch Bangla','{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}','1715052778may.jpg','2','46','2024-05-07 09:32:58','2024-05-07 14:04:37');
INSERT INTO deposit_requests VALUES('6','15','1','14','5000.00','5000.00','0.00','Mar,Apr,may24, previous 2 month','{\"100000\":\"5000\",\"Manual_Account\":\"5000\"}','1715068918Screenshot_2024-05-07-13-58-31-17_21c7536209295bd9203a213b62980e19.jpg','2','45','2024-05-07 14:01:58','2024-05-07 14:02:50');
INSERT INTO deposit_requests VALUES('7','3','1','3','2000.00','2000.00','0.00','','{\"100000\":\"2000\",\"Manual_Account\":\"2000\"}','1715746985ImportedPhoto_1715746820040.jpg','2','57','2024-05-15 10:23:05','2024-05-15 10:23:27');
INSERT INTO deposit_requests VALUES('8','6','1','6','1000.00','1000.00','0.00','Mustafiz, June 24','{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}','1717332582445777065_922643919633715_4695931529079853615_n.jpg','2','58','2024-06-02 18:49:42','2024-06-02 19:45:48');
INSERT INTO deposit_requests VALUES('9','10','1','9','2000.00','2000.00','0.00','May & June included','{\"100000\":\"2000\",\"Manual_Account\":\"2000\"}','1717582075ImportedPhoto_1717581869154.jpg','2','59','2024-06-05 16:07:55','2024-06-06 09:49:36');
INSERT INTO deposit_requests VALUES('10','11','1','10','1000.00','1000.00','0.00','Adnan_June_2024','{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}','1717651782voucher_1717644808588.jpg','2','63','2024-06-06 11:29:42','2024-06-09 15:34:49');
INSERT INTO deposit_requests VALUES('11','6','1','6','1000.00','1000.00','0.00','Mustafiz June 24','{\"100000\":\"1000\",\"Manual_Account\":\"1000\"}','1719636797448799972_433752019495842_7240809699761952939_n.jpg','2','72','2024-06-29 10:53:17','2024-07-09 15:27:24');
INSERT INTO deposit_requests VALUES('12','11','1','10','1000.00','1000.00','0.00','Adnan_July_2024','{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}','1720629543voucher_1720629349175.jpg','2','78','2024-07-10 22:39:03','2024-08-08 12:54:30');
INSERT INTO deposit_requests VALUES('13','3','1','3','2000.00','2000.00','0.00','','{\"100000\":\"2000\",\"Manual_Account\":\"2000\"}','1722874658WhatsApp Image 2024-08-05 at 22.14.07_aba82e6e.jpg','2','77','2024-08-05 22:17:38','2024-08-08 12:54:25');
INSERT INTO deposit_requests VALUES('14','11','1','10','1000.00','1000.00','0.00','Adnan_August_2024','{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}','1723356102voucher_1723355924976.jpg','2','86','2024-08-11 12:01:42','2024-09-03 19:40:03');
INSERT INTO deposit_requests VALUES('15','10','1','9','2500.00','2500.00','0.00','July-August 2000.500 From previous','{\"100000\":\"2500\",\"Manual_Account\":\"2500\"}','1723722339title (12).jpg','2','85','2024-08-15 17:45:39','2024-09-03 19:39:59');
INSERT INTO deposit_requests VALUES('16','22','1','19','5000.00','5000.00','0.00','','{\"100000\":\"5000\",\"Manual_Account\":\"5000\"}','1725181297signature.jpg','2','84','2024-09-01 15:01:37','2024-09-03 19:39:57');
INSERT INTO deposit_requests VALUES('17','10','1','9','1500.00','1500.00','0.00','September-1000..Previous-500','{\"100000\":\"1500\",\"Manual_Account\":\"01834008182\"}','1725359934ImportedPhoto_1725359687189.jpg','2','83','2024-09-03 16:38:54','2024-09-03 19:39:51');
INSERT INTO deposit_requests VALUES('18','10','1','9','1500.00','1500.00','0.00','October 1000 & Previous 500','{\"100000\":\"1500\",\"Manual_Account\":\"1500\"}','1727780364title (14).jpg','2','90','2024-10-01 16:59:24','2025-06-01 22:55:24');
INSERT INTO deposit_requests VALUES('19','11','1','10','2000.00','2000.00','0.00','Adnan_September_October_2024','{\"100000\":\"2000\",\"Manual_Account\":\"04934008988\"}','1728318323voucher_1728317723979.jpg','2','89','2024-10-07 22:25:23','2025-06-01 22:55:21');
INSERT INTO deposit_requests VALUES('20','11','1','10','1000.00','1000.00','0.00','Adnan_November_2024','{\"100000\":\"1000\",\"Manual_Account\":\"04934008988\"}','1731003276voucher_1731003068367.jpg','2','88','2024-11-08 00:14:36','2025-06-01 22:55:18');



DROP TABLE IF EXISTS designations;

CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `used_option` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS email_sms_templates;

CREATE TABLE `email_sms_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO email_sms_templates VALUES('1','Transfer Money','TRANSFER_MONEY','Transfer Money','<div>
<div>Dear {{name}},</div>
<div>You have received {{amount}} to {{account_number}} from {{sender_account_number}} on {{dateTime}}</div>
</div>','Dear {{name}}, You have received {{amount}} to {{account_number}} from {{sender_account_number}} on {{dateTime}}','Dear {{name}}, You have received {{amount}} to {{account_number}} from {{sender_account_number}} on {{dateTime}}','{{name}} {{account_number}} {{amount}} {{sender}} {{sender_account_number}} {{balance}} {{dateTime}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('2','Deposit Money','DEPOSIT_MONEY','Deposit Money','<div>
<div>Dear {{name}},</div>
<div>Your account has been credited with {{amount}} on {{dateTime}}</div>
</div>','Dear {{name}}, Your account has been credited with {{amount}} on {{dateTime}}','Dear {{name}}, Your account has been credited with {{amount}} on {{dateTime}}','{{name}} {{account_number}} {{amount}} {{dateTime}} {{balance}} {{depositMethod}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('3','Deposit Request Approved','DEPOSIT_REQUEST_APPROVED','Deposit Request Approved','<div>
<div>Dear {{name}},</div>
<div>Your deposit request has been approved. Your account {{account_number}} has been credited with {{amount}} on {{dateTime}}</div>
</div>','Dear {{name}}, Your deposit request has been approved. Your account {{account_number}} has been credited with {{amount}} on {{dateTime}}','Dear {{name}}, Your deposit request has been approved. Your account {{account_number}} has been credited with {{amount}} on {{dateTime}}','{{name}} {{account_number}} {{amount}} {{dateTime}} {{balance}} {{depositMethod}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('4','Loan Request Approved','LOAN_REQUEST_APPROVED','Loan Request Approved','<div>
<div>Dear {{name}},</div>
<div>Your loan request of {{amount}} has been approved on {{dateTime}}</div>
</div>','Dear {{name}}, Your loan request of {{amount}} has been approved on {{dateTime}}','Dear {{name}}, Your loan request of {{amount}} has been approved on {{dateTime}}','{{name}} {{amount}} {{dateTime}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('5','Withdraw Request Approved','WITHDRAW_REQUEST_APPROVED','Withdraw Request Approved','<div>
<div>Dear {{name}},</div>
<div>Your withdraw request has been approved. Your account has been debited with {{amount}} on {{dateTime}}</div>
</div>','Dear {{name}}, Your withdraw request has been approved. Your account has been debited with {{amount}} on {{dateTime}}','Dear {{name}}, Your withdraw request has been approved. Your account has been debited with {{amount}} on {{dateTime}}','{{name}} {{account_number}} {{amount}} {{withdrawMethod}} {{balance}} {{dateTime}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('6','Deposit Request Rejected','DEPOSIT_REQUEST_REJECTED','Deposit Request Rejected','<div>
<div>Dear {{name}},</div>
<div>Your deposit request of {{amount}} has been rejected.</div>
<div>&nbsp;</div>
<div>Amount:&nbsp;{{amount}}</div>
<div>Deposit Method: {{depositMethod}}</div>
</div>','Dear {{name}}, Your deposit request of {{amount}} has been rejected.','Dear {{name}}, Your deposit request of {{amount}} has been rejected.','{{name}}  {{account_number}} {{amount}} {{depositMethod}} {{balance}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('7','Loan Request Rejected','LOAN_REQUEST_REJECTED','Loan Request Rejected','<div>
<div>Dear {{name}},</div>
<div>Your loan request of {{amount}} has been rejected on {{dateTime}}</div>
</div>','Dear {{name}}, Your loan request of {{amount}} has been rejected on {{dateTime}}','Dear {{name}}, Your loan request of {{amount}} has been rejected on {{dateTime}}','{{name}} {{amount}} {{dateTime}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('8','Withdraw Request Rejected','WITHDRAW_REQUEST_REJECTED','Withdraw Request Rejected','<div>
<div>Dear {{name}}, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.</div>
</div>','Dear {{name}}, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.','Dear {{name}}, Your withdraw request has been rejected. Your transferred amount {{amount}} has returned back to your account.','{{name}} {{account_number}} {{amount}} {{withdrawMethod}} {{dateTime}} {{balance}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('9','Withdraw Money','WITHDRAW_MONEY','Withdraw Money','<div>
<div>Dear {{name}},</div>
<div>Your account has been debited with {{amount}} on {{dateTime}}</div>
</div>','Dear {{name}}, Your account has been debited with {{amount}} on {{dateTime}}','Dear {{name}}, Your account has been debited with {{amount}} on {{dateTime}}','{{name}} {{account_number}} {{amount}} {{dateTime}} {{withdrawMethod}} {{balance}}','0','0','0','0','','');
INSERT INTO email_sms_templates VALUES('10','Member Request Accepted','MEMBER_REQUEST_ACCEPTED','Member Request Accepted','<div>
<div>Dear {{name}},</div>
<div>Your member request has been accepted by authority on {{dateTime}}. You can now login to your account by using your email and password.</div>
</div>','','','{{name}} {{member_no}} {{dateTime}}','0','0','0','1','','');



DROP TABLE IF EXISTS expense_categories;

CREATE TABLE `expense_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `color` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expense_categories VALUES('1','SMS Charge','#e31954','','2024-05-11 16:12:01','2024-05-11 16:12:01');
INSERT INTO expense_categories VALUES('2','Account Maintenance','#ff003a','','2024-05-11 16:15:29','2024-05-11 16:15:29');
INSERT INTO expense_categories VALUES('3','Cheque Book','#f30d41','','2024-05-11 16:15:44','2024-05-11 16:15:44');
INSERT INTO expense_categories VALUES('4','Other','#cccccc','','2024-05-11 16:15:55','2024-05-11 16:15:55');



DROP TABLE IF EXISTS expenses;

CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `expense_date` datetime NOT NULL,
  `expense_category_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  KEY `expenses_branch_id_foreign` (`branch_id`),
  CONSTRAINT `expenses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO expenses VALUES('1','2024-04-28 16:12:00','1','150.00','sms charge','','','1','','','2024-05-11 16:12:31','2024-05-11 16:12:31');
INSERT INTO expenses VALUES('2','2023-06-22 16:16:00','2','100.00','','','','1','','','2024-05-11 16:17:03','2024-05-11 16:17:03');
INSERT INTO expenses VALUES('3','2023-09-23 16:18:00','3','60.00','cheque book processing fee','','','1','','','2024-05-11 16:18:56','2024-05-11 16:18:56');
INSERT INTO expenses VALUES('4','2023-09-23 16:18:00','2','200.00','account maintenance','','','1','','','2024-05-11 16:19:45','2024-05-11 16:19:45');



DROP TABLE IF EXISTS failed_jobs;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS guarantors;

CREATE TABLE `guarantors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) unsigned NOT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  `savings_account_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guarantors_loan_id_foreign` (`loan_id`),
  KEY `guarantors_member_id_foreign` (`member_id`),
  CONSTRAINT `guarantors_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guarantors_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS interest_posting;

CREATE TABLE `interest_posting` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_type_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS loan_collaterals;

CREATE TABLE `loan_collaterals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `collateral_type` varchar(191) NOT NULL,
  `serial_number` varchar(191) DEFAULT NULL,
  `estimated_price` decimal(10,2) NOT NULL,
  `attachments` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_collaterals_loan_id_foreign` (`loan_id`),
  CONSTRAINT `loan_collaterals_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS loan_payments;

CREATE TABLE `loan_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) unsigned NOT NULL,
  `paid_at` date NOT NULL,
  `late_penalties` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `repayment_amount` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `remarks` text DEFAULT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  `repayment_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_payments_loan_id_foreign` (`loan_id`),
  KEY `loan_payments_member_id_foreign` (`member_id`),
  CONSTRAINT `loan_payments_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loan_payments_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO loan_payments VALUES('3','5','2024-06-03','0.00','0.00','20000.00','20000.00','all payment clear','9','','182','2024-06-03 09:54:12','2024-06-03 09:54:12');
INSERT INTO loan_payments VALUES('4','6','2024-06-06','0.00','0.00','10000.00','10000.00','','16','','193','2024-06-06 10:40:27','2024-06-06 10:40:27');
INSERT INTO loan_payments VALUES('5','3','2024-06-11','0.00','11.67','10011.67','10011.67','total 10k clear','1','','61','2024-06-11 13:13:53','2024-06-11 13:13:53');
INSERT INTO loan_payments VALUES('6','2','2024-07-09','0.00','0.00','10000.00','10000.00','1ST INSTALLMENT','2','','205','2024-07-09 10:16:34','2024-07-09 10:16:34');
INSERT INTO loan_payments VALUES('8','2','2024-08-08','0.00','0.00','10000.00','10000.00','2 d installment','2','','206','2024-08-08 13:07:01','2024-08-08 13:07:01');
INSERT INTO loan_payments VALUES('9','7','2024-12-30','0.00','0.00','6666.67','6666.67','','9','87','217','2024-12-30 12:40:55','2024-12-30 12:40:55');



DROP TABLE IF EXISTS loan_products;

CREATE TABLE `loan_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO loan_products VALUES('1','Micro-Member-loan','5000.00','500000.00','0.00','','0.00','flat_rate','12','+1 month','1','2024-04-22 10:15:04','2024-05-11 15:50:14');



DROP TABLE IF EXISTS loan_repayments;

CREATE TABLE `loan_repayments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint(20) NOT NULL,
  `repayment_date` date NOT NULL,
  `amount_to_pay` decimal(10,2) NOT NULL,
  `penalty` decimal(10,2) NOT NULL,
  `principal_amount` decimal(10,2) NOT NULL,
  `interest` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO loan_repayments VALUES('61','3','2024-05-11','10011.67','0.00','10000.00','11.67','0.00','1','2024-05-11 15:40:47','2024-06-11 13:13:53');
INSERT INTO loan_repayments VALUES('181','5','2024-05-11','10000.00','0.00','10000.00','0.00','20000.00','0','2024-05-11 15:51:50','2024-08-08 13:03:12');
INSERT INTO loan_repayments VALUES('182','5','2024-06-11','20000.00','0.00','20000.00','0.00','0.00','1','2024-05-11 15:51:50','2024-06-03 09:54:12');
INSERT INTO loan_repayments VALUES('193','6','2024-02-01','10000.00','0.00','10000.00','0.00','65000.00','1','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('194','6','2024-03-01','5909.09','0.00','5909.09','0.00','59090.91','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('195','6','2024-04-01','5909.09','0.00','5909.09','0.00','53181.82','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('196','6','2024-05-01','5909.09','0.00','5909.09','0.00','47272.73','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('197','6','2024-06-01','5909.09','0.00','5909.09','0.00','41363.64','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('198','6','2024-07-01','5909.09','0.00','5909.09','0.00','35454.55','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('199','6','2024-08-01','5909.09','0.00','5909.09','0.00','29545.45','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('200','6','2024-09-01','5909.09','0.00','5909.09','0.00','23636.36','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('201','6','2024-10-01','5909.09','0.00','5909.09','0.00','17727.27','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('202','6','2024-11-01','5909.09','0.00','5909.09','0.00','11818.18','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('203','6','2024-12-01','5909.09','0.00','5909.09','0.00','5909.09','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('204','6','2025-01-01','5909.09','0.00','5909.09','0.00','0.00','0','2024-06-06 10:39:23','2024-06-06 10:40:27');
INSERT INTO loan_repayments VALUES('205','2','2024-07-07','10000.00','0.00','10000.00','0.00','90000.00','1','2024-06-06 10:41:03','2024-07-09 10:16:34');
INSERT INTO loan_repayments VALUES('206','2','2024-08-07','10000.00','0.00','10000.00','0.00','80000.00','1','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('207','2','2024-09-07','8000.00','0.00','8000.00','0.00','72000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('208','2','2024-10-07','8000.00','0.00','8000.00','0.00','64000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('209','2','2024-11-07','8000.00','0.00','8000.00','0.00','56000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('210','2','2024-12-07','8000.00','0.00','8000.00','0.00','48000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('211','2','2025-01-07','8000.00','0.00','8000.00','0.00','40000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('212','2','2025-02-07','8000.00','0.00','8000.00','0.00','32000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('213','2','2025-03-07','8000.00','0.00','8000.00','0.00','24000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('214','2','2025-04-07','8000.00','0.00','8000.00','0.00','16000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('215','2','2025-05-07','8000.00','0.00','8000.00','0.00','8000.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('216','2','2025-06-07','8000.00','0.00','8000.00','0.00','0.00','0','2024-06-06 10:41:03','2024-08-08 13:07:01');
INSERT INTO loan_repayments VALUES('217','7','2024-09-03','6666.67','0.00','6666.67','0.00','73333.33','1','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('218','7','2024-10-03','6666.67','0.00','6666.67','0.00','66666.66','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('219','7','2024-11-03','6666.67','0.00','6666.67','0.00','60000.00','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('220','7','2024-12-03','6666.67','0.00','6666.67','0.00','53333.33','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('221','7','2025-01-03','6666.67','0.00','6666.67','0.00','46666.66','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('222','7','2025-02-03','6666.67','0.00','6666.67','0.00','40000.00','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('223','7','2025-03-03','6666.67','0.00','6666.67','0.00','33333.33','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('224','7','2025-04-03','6666.67','0.00','6666.67','0.00','26666.67','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('225','7','2025-05-03','6666.67','0.00','6666.67','0.00','20000.00','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('226','7','2025-06-03','6666.67','0.00','6666.67','0.00','13333.33','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('227','7','2025-07-03','6666.67','0.00','6666.67','0.00','6666.67','0','2024-09-03 19:43:44','2024-12-30 12:40:55');
INSERT INTO loan_repayments VALUES('228','7','2025-08-03','6666.67','0.00','6666.67','0.00','0.00','0','2024-09-03 19:43:44','2024-12-30 12:40:55');



DROP TABLE IF EXISTS loans;

CREATE TABLE `loans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` varchar(30) DEFAULT NULL,
  `loan_product_id` bigint(20) unsigned NOT NULL,
  `borrower_id` bigint(20) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO loans VALUES('2','04','1','2','2024-07-07','2024-06-06','4','100000.00','100000.00','20000.00','0.00','1715052071মাইক্রোট্রাস্ট কো অপারেটিভ সোসাইটি  ঋণ আবেদনপত্র (1).docx','I need 100000 lc taka for my marriage purpose.','','1','2024-06-06','1','3','','','2024-05-07 09:21:11','2024-08-08 13:07:01');
INSERT INTO loans VALUES('3','03','1','1','2024-05-11','2024-05-11','4','10000.00','10700.00','10000.00','0.00','','10k loan','10k loan','2','2024-05-11','1','1','','','2024-05-11 15:40:07','2024-06-11 13:13:53');
INSERT INTO loans VALUES('5','02','1','9','2024-05-11','2024-05-11','4','30000.00','30000.00','20000.00','0.00','','30k loan','30k loan','2','2024-05-11','1','1','','','2024-05-11 15:51:46','2024-08-08 13:03:12');
INSERT INTO loans VALUES('6','01','1','16','2024-02-01','2024-03-01','4','75000.00','75000.00','10000.00','0.00','','Make Loan','','1','2024-06-06','1','1','','','2024-06-06 10:39:20','2024-06-06 10:40:27');
INSERT INTO loans VALUES('7','005','1','9','2024-09-03','2024-09-03','4','80000.00','80000.00','6666.67','0.00','','For credit card','Same as credit card benefit provide our trust','1','2024-09-03','1','1','','','2024-09-03 19:43:32','2024-12-30 12:40:55');



DROP TABLE IF EXISTS member_documents;

CREATE TABLE `member_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `document` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_documents_member_id_foreign` (`member_id`),
  CONSTRAINT `member_documents_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS members;

CREATE TABLE `members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `first_name_bn` varchar(100) DEFAULT NULL,
  `last_name_bn` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `nid_number` varchar(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `marital_status` enum('single','married','divorced','widowed') DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `education` varchar(100) DEFAULT NULL,
  `monthly_income` decimal(10,2) DEFAULT NULL,
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
  `nominee_name` varchar(100) DEFAULT NULL,
  `nominee_relation` varchar(50) DEFAULT NULL,
  `nominee_nid` varchar(20) DEFAULT NULL,
  `nominee_address` text DEFAULT NULL,
  `shares_count` int(11) NOT NULL DEFAULT 2,
  `reference_member_code` varchar(50) DEFAULT NULL,
  `credit_source` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `nid_image` varchar(191) DEFAULT NULL,
  `nid` varchar(191) DEFAULT NULL,
  `custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO members VALUES('1','Md. Saifur','Rahman','','','','','','','','','','','','','2','1','saifur1985bd@gmail.com','880','01829041699','','01','male','Dhaka','Dhaka','1216','10/a/3','','','','','','2','','Salary','default.png','','','','2024-04-18 06:37:40','2024-04-18 12:39:35');
INSERT INTO members VALUES('2','Md.Nazmul','Haque','','','','','','','','','','','','','3','1','nazmulhs030@gmail.com','880','1626100302','','02','male','Dhaka','Dhaka','1230','Dhaka
Hajj Camp Suvo Hotel Goli','','','','','','2','','Job','default.png','','','','2024-04-18 06:38:08','2024-04-18 12:39:42');
INSERT INTO members VALUES('3','Tawfiqul','Islam','','','','','','','','','','','','','4','1','tawfiqul01@gmail.com','880','1676797239','','03','male','Dhaka','Dhaka','1348','Vill: Binod Bari, Amin Bazar, Dhaka','','','','','','2','','Salary','default.png','','','','2024-04-18 06:40:44','2024-04-18 12:41:01');
INSERT INTO members VALUES('4','Ziaur','Rahman','','','','','','','','','','','','','5','1','ziaurrahaman939@gmail.com','880','01679714001','','04','male','Dahaka','Bashabo','1213','Gulshan','','','','','','2','','Salary','default.png','','','','2024-04-18 06:41:28','2024-04-18 12:42:25');
INSERT INTO members VALUES('5','Md','Hasibuzzaman','','','','','','','','','','','','','6','1','hasib.2030.hu@gmail.com','880','01618356180','','05','male','Dhaka','Dhaka','1216','Dhaka','','','','','','2','','Salary','1713422817Hasib pasport.jpg','','','','2024-04-18 06:45:22','2024-04-18 12:46:57');
INSERT INTO members VALUES('6','Mustafizur','Rahman','','','','','','','','','','','','','7','1','mustafizurr171@gmail.com','880','01686026037','','06','male','Dhaka','Shyamoli','1207','Adabor, Dhaka','','','','','','2','','45000','default.png','','','','2024-04-18 06:45:32','2024-04-18 12:45:51');
INSERT INTO members VALUES('7','Sheikh','Tuhin','','','','','','','','','','','','','8','1','hituhin09@email.com','880','1701084341','','08','male','Dhaka','Dhaka','3129','Shyadnagur , Baridhara ,Dhaka','','','','','','2','','Salary','default.png','','','','2024-04-18 06:50:21','2024-04-18 13:03:57');
INSERT INTO members VALUES('9','Md. Mashrur Rahman','Khan','','','','','','','','','','','','','10','1','mashrurrahman16@gmail.com','880','01534949969','','07','male','Dhaka','Dhaka','1000','Saifur vai er basa','','','','','','2','','Salary','default.png','','','','2024-04-18 07:03:12','2024-04-18 13:03:50');
INSERT INTO members VALUES('10','Hrithik','Rudra','','','','','','','','','','','','','11','1','hrithik08.rudra@gmail.com','880','01875525591','','09','male','Dhaka','Dhaka','1229','Block G,Bashundhara R/A','','','','','','2','','Salary','default.png','','','','2024-04-18 07:27:14','2024-04-18 14:27:36');
INSERT INTO members VALUES('11','Khandakar Anim Hassan','Adnan','','','','','','','','','','','','','12','1','khandakar.adnan21@gmail.com','880','01638147671','','10','male','Dhaka','Mirpur','1216','802/3, West Kazipara, Mirpur, Dhaka- 1216','','','','','','2','','Salary','default.png','','','','2024-04-18 07:53:33','2024-04-18 14:28:26');
INSERT INTO members VALUES('12','Rukaiya','Azmi','','','','','','','','','','','','','13','1','rukaiyaazmi@gmail.com','880','01975044622','Own','11','male','Dhaka','Dhaka','1216','Do','','','','','','2','','Salary','default.png','','','','2024-04-18 15:12:15','2024-04-18 15:12:59');
INSERT INTO members VALUES('13','Md Raju','Ahmed','','','','','','','','','','','','','14','1','rajucse1705@gmail.com','880','01771522411','own','12','male','Dhaka','Dhaka','1216','','','','','','','2','','Salary','default.png','','','','2024-04-18 15:17:37','2024-04-18 15:17:37');
INSERT INTO members VALUES('14','Md.Didarul','Islam','','','','','','','','','','','','','15','1','khandidar11@gmail.com','880','01679706957','Own','13','male','Dhaka','Dhaka','1216','','','','','','','2','','Salary','default.png','','','','2024-04-18 15:20:03','2024-04-18 15:20:03');
INSERT INTO members VALUES('15','Md Al','Mamun','','','','','','','','','','','','','16','1','md.almamun.bd@gmail.com','880','01717647410','OWN','14','male','Dhaka','Dhaka','1216','','','','','','','2','','Salary','1713705123Screenshot from 2024-04-21 19-12-00.png','','','','2024-04-21 19:12:03','2024-04-21 19:12:03');
INSERT INTO members VALUES('16','Md','Tarif','','','','','','','','','','','','','17','1','tarif.isjnu@gmail.com','880','01717967656','Own','15','male','Dhaka','Dhaka','1216','','','','','','','2','','Salary','1713705490Screenshot from 2024-04-21 19-17-32.png','','','','2024-04-21 19:18:10','2024-04-21 19:18:10');
INSERT INTO members VALUES('19','Bank','Asia','','','','','','','','','','','','','','1','hasib.9437.hu@gmail.com','880','01738356180','Bank','16','male','Dhaka','Dhaka','1216','217 3rd colony, lalkuthi, Mirpur-1','','','','','','2','','bank interest','default.png','','','','2024-05-11 16:24:58','2024-05-11 16:24:58');
INSERT INTO members VALUES('20','Profit From Member Loan','Profit','','','','','','','','','','','','','','1','Profit@gmail.com','880','01738356180','Profit','17','','Dhaka','Dhaka','1216','217 3rd colony, lalkuthi, Mirpur-1','','','','','','2','','Profit','default.png','','','','2024-05-11 16:29:17','2024-05-11 16:29:17');
INSERT INTO members VALUES('21','Rishat','Amin','','','','','','','','','','','','','18','1','samiaulamin@gmail.com','880','1628169748','Micro trust','18','male','Dhaka','Dhaka','1216','Uttara','','','','','','2','','Salary','default.png','','','','2024-07-01 19:08:49','2024-07-01 19:08:49');
INSERT INTO members VALUES('22','Rahemul','Islam','','','','','','','','','','','','','19','1','rahimulislam14@gmail.com','880','1836999981','Rahemul Islam','19','male','Dhaka','Dhaka','1214','217 3rd colony, lalkuthi, Mirpur-1','','','','','','2','','Salary','1723352880Screenshot from 2024-08-11 11-07-39.png','','','','2024-08-11 11:08:00','2024-08-11 11:08:00');
INSERT INTO members VALUES('23','Masuma','Sultana','','','','','','','','','','','','','20','1','masuma.cse@gmail.com','880','1935741518','Era Infotech Ltd','20','male','Dhaka','Dhaka','1216','Dhaka','','','','','','2','','Salary','default.png','','','','2024-08-18 10:17:46','2024-08-18 10:17:46');
INSERT INTO members VALUES('24','Md.','nnn','','','','','','','','','','','','','22','1','hasib.123.hu@gmail.com','880','1738356180','Era Infotech Ltd','01743532213','male','Dhaka','Dhaka','1216','217 3rd colony, lalkuthi, Mirpur-1','','','','','','2','','ertwet','1763236086fashion-KV.jpg','1763236086fashion-KV.jpg','','','2025-11-16 01:48:08','2025-11-16 01:48:08');
INSERT INTO members VALUES('26','123','456','Md.','Hasibuzzaman','Md. Bokul Hossain','Zarina Begum','5976797547','2025-11-19','asfasdf','single','asdfsadf','new','234234.00','','23','1','12345@gmail.com','','01738356180','','25','male','','','','asdfsdaf','asdfasdf','asdf','asdf','asf','asdf','2','','','1763489957fashion-KV.jpg','1763489957fashion-KV.jpg','5976797547','','2025-11-18 18:19:17','2025-11-19 00:20:35');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2019_08_19_000000_create_failed_jobs_table','1');
INSERT INTO migrations VALUES('4','2019_09_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('5','2019_12_14_000001_create_personal_access_tokens_table','1');
INSERT INTO migrations VALUES('6','2020_07_02_145857_create_database_backups_table','1');
INSERT INTO migrations VALUES('7','2020_07_06_142817_create_roles_table','1');
INSERT INTO migrations VALUES('8','2020_07_06_143240_create_permissions_table','1');
INSERT INTO migrations VALUES('9','2021_03_22_071324_create_setting_translations','1');
INSERT INTO migrations VALUES('10','2021_07_02_145504_create_pages_table','1');
INSERT INTO migrations VALUES('11','2021_07_02_145952_create_page_translations_table','1');
INSERT INTO migrations VALUES('12','2021_08_06_104648_create_branches_table','1');
INSERT INTO migrations VALUES('13','2021_08_07_111236_create_currency_table','1');
INSERT INTO migrations VALUES('14','2021_08_08_132702_create_payment_gateways_table','1');
INSERT INTO migrations VALUES('15','2021_08_08_152535_create_deposit_methods_table','1');
INSERT INTO migrations VALUES('16','2021_08_08_164152_create_withdraw_methods_table','1');
INSERT INTO migrations VALUES('17','2021_08_31_201125_create_navigations_table','1');
INSERT INTO migrations VALUES('18','2021_08_31_201126_create_navigation_items_table','1');
INSERT INTO migrations VALUES('19','2021_08_31_201127_create_navigation_item_translations_table','1');
INSERT INTO migrations VALUES('20','2021_10_22_070458_create_email_sms_templates_table','1');
INSERT INTO migrations VALUES('21','2022_03_21_075342_create_members_table','1');
INSERT INTO migrations VALUES('22','2022_03_24_090932_create_member_documents_table','1');
INSERT INTO migrations VALUES('23','2022_03_28_114203_create_savings_products_table','1');
INSERT INTO migrations VALUES('24','2022_04_13_073108_create_savings_accounts_table','1');
INSERT INTO migrations VALUES('25','2022_04_13_073109_create_transactions_table','1');
INSERT INTO migrations VALUES('26','2022_05_31_074804_create_expense_categories_table','1');
INSERT INTO migrations VALUES('27','2022_05_31_074918_create_expenses_table','1');
INSERT INTO migrations VALUES('28','2022_06_01_082019_create_loan_products_table','1');
INSERT INTO migrations VALUES('29','2022_06_01_083021_create_loans_table','1');
INSERT INTO migrations VALUES('30','2022_06_01_083022_create_loan_collaterals_table','1');
INSERT INTO migrations VALUES('31','2022_06_01_083025_create_loan_payments_table','1');
INSERT INTO migrations VALUES('32','2022_06_01_083069_create_loan_repayments_table','1');
INSERT INTO migrations VALUES('33','2022_06_06_072245_create_guarantors_table','1');
INSERT INTO migrations VALUES('34','2022_07_26_155338_create_deposit_requests_table','1');
INSERT INTO migrations VALUES('35','2022_07_26_163427_create_withdraw_requests_table','1');
INSERT INTO migrations VALUES('36','2022_08_09_160105_create_notifications_table','1');
INSERT INTO migrations VALUES('37','2022_08_15_055625_create_interest_posting_table','1');
INSERT INTO migrations VALUES('38','2022_08_27_151317_create_transaction_categories_table','1');
INSERT INTO migrations VALUES('39','2022_08_29_102757_create_schedule_tasks_histories_table','1');
INSERT INTO migrations VALUES('40','2022_09_13_162539_add_branch_id_to_users_table','1');
INSERT INTO migrations VALUES('41','2022_09_18_074806_add_branch_id_to_expenses_table','1');
INSERT INTO migrations VALUES('42','2022_10_16_081858_add_charge_to_deposit_requests_table','1');
INSERT INTO migrations VALUES('43','2022_10_29_095023_add_status_to_members_table','1');
INSERT INTO migrations VALUES('44','2023_01_29_093731_create_charge_limits_table','1');
INSERT INTO migrations VALUES('45','2025_11_16_000001_add_permanent_address_and_nid_to_members_table','2');
INSERT INTO migrations VALUES('46','2025_11_18_133701_add_cooperative_fields_to_members_table','3');
INSERT INTO migrations VALUES('47','2025_11_19_000100_create_designations_table','4');
INSERT INTO migrations VALUES('48','2025_11_19_000110_create_committees_table','4');



DROP TABLE IF EXISTS navigation_item_translations;

CREATE TABLE `navigation_item_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_item_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigation_item_translations_navigation_item_id_locale_unique` (`navigation_item_id`,`locale`),
  CONSTRAINT `navigation_item_translations_navigation_item_id_foreign` FOREIGN KEY (`navigation_item_id`) REFERENCES `navigation_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS navigation_items;

CREATE TABLE `navigation_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `navigation_id` bigint(20) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `page_id` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `target` varchar(191) NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `position` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `css_class` varchar(191) DEFAULT NULL,
  `css_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `navigation_items_parent_id_foreign` (`parent_id`),
  KEY `navigation_items_page_id_foreign` (`page_id`),
  KEY `navigation_items_navigation_id_index` (`navigation_id`),
  CONSTRAINT `navigation_items_navigation_id_foreign` FOREIGN KEY (`navigation_id`) REFERENCES `navigations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_items_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `navigation_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS navigations;

CREATE TABLE `navigations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS notifications;

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS page_translations;

CREATE TABLE `page_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text NOT NULL,
  `body` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS pages;

CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO password_resets VALUES('hituhin09@email.com','$2y$10$R9ywa6mMlTnQIPWn.mR9a.rZHQT0yyeKCTSszWkqs7M9Gsx6dEFjS','2024-04-18 07:09:25');



DROP TABLE IF EXISTS payment_gateways;

CREATE TABLE `payment_gateways` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO payment_gateways VALUES('1','PayPal','PayPal','paypal.png','0','0','{\"client_id\":\"\",\"client_secret\":\"\",\"environment\":\"sandbox\"}','','{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"USD\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('2','Stripe','Stripe','stripe.png','0','0','{\"secret_key\":\"\",\"publishable_key\":\"\"}','','{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('3','Razorpay','Razorpay','razorpay.png','0','0','{\"razorpay_key_id\":\"\",\"razorpay_key_secret\":\"\"}','','{\"INR\":\"INR\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('4','Paystack','Paystack','paystack.png','0','0','{\"paystack_public_key\":\"\",\"paystack_secret_key\":\"\"}','','{\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('5','BlockChain','BlockChain','blockchain.png','0','1','{\"blockchain_api_key\":\"\",\"blockchain_xpub\":\"\"}','','{\"BTC\":\"BTC\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('6','Flutterwave','Flutterwave','flutterwave.png','0','0','{\"public_key\":\"\",\"secret_key\":\"\",\"encryption_key\":\"\",\"environment\":\"sandbox\"}','','{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('7','VoguePay','VoguePay','VoguePay.png','1','0','{\"merchant_id\":\"\"}','','{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('8','Mollie','Mollie','Mollie.png','1','0','{\"api_key\":\"\"}','','{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('9','CoinPayments','CoinPayments','CoinPayments.png','1','1','{\"public_key\":\"\",\"private_key\":\"\",\"merchant_id\":\"\",\"ipn_secret\":\"\"}','','{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}','','','0.00','0.00','0.00','0.00','','');
INSERT INTO payment_gateways VALUES('10','Instamojo','Instamojo','instamojo.png','1','0','{\"api_key\":\"\",\"auth_token\":\"\",\"salt\":\"\",\"environment\":\"sandbox\"}','','{\"INR\":\"INR\"}','','','0.00','0.00','0.00','0.00','','');



DROP TABLE IF EXISTS permissions;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL,
  `permission` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES('1','1','dashboard.total_customer_widget','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('2','1','dashboard.deposit_requests_widget','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('3','1','dashboard.withdraw_requests_widget','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('4','1','dashboard.loan_requests_widget','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('5','1','dashboard.expense_overview_widget','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('6','1','dashboard.deposit_withdraw_analytics','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('7','1','dashboard.recent_transaction_widget','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('8','1','members.import','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('9','1','members.accept_request','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('10','1','members.reject_request','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('11','1','members.pending_requests','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('12','1','members.send_email','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('13','1','members.send_sms','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('14','1','members.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('15','1','members.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('16','1','members.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('17','1','members.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('18','1','members.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('19','1','member_documents.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('20','1','member_documents.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('21','1','member_documents.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('22','1','member_documents.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('23','1','savings_accounts.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('24','1','savings_accounts.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('25','1','savings_accounts.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('26','1','savings_accounts.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('27','1','savings_accounts.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('28','1','interest_calculation.calculator','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('29','1','interest_calculation.interest_posting','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('30','1','transactions.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('31','1','transactions.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('32','1','transactions.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('33','1','transactions.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('34','1','transactions.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('35','1','deposit_requests.approve','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('36','1','deposit_requests.reject','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('37','1','deposit_requests.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('38','1','deposit_requests.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('39','1','deposit_requests.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('40','1','withdraw_requests.approve','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('41','1','withdraw_requests.reject','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('42','1','withdraw_requests.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('43','1','withdraw_requests.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('44','1','withdraw_requests.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('45','1','expenses.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('46','1','expenses.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('47','1','expenses.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('48','1','expenses.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('49','1','expenses.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('50','1','loans.admin_calculator','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('51','1','loans.calculate','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('52','1','loans.approve','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('53','1','loans.reject','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('54','1','loans.filter','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('55','1','loans.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('56','1','loans.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('57','1','loans.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('58','1','loans.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('59','1','loans.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('60','1','loan_collaterals.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('61','1','loan_collaterals.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('62','1','loan_collaterals.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('63','1','loan_collaterals.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('64','1','loan_collaterals.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('65','1','guarantors.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('66','1','guarantors.edit','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('67','1','guarantors.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('68','1','loan_payments.index','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('69','1','loan_payments.create','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('70','1','loan_payments.show','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('71','1','loan_payments.destroy','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('72','1','reports.account_statement','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('73','1','reports.account_balances','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('74','1','reports.transactions_report','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('75','1','reports.loan_report','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('76','1','reports.loan_due_report','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('77','1','reports.expense_report','2025-10-26 07:07:06','2025-10-26 07:07:06');
INSERT INTO permissions VALUES('78','1','reports.revenue_report','2025-10-26 07:07:06','2025-10-26 07:07:06');



DROP TABLE IF EXISTS personal_access_tokens;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS roles;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES('1','Admin-coder','','2025-10-26 13:05:19','2025-10-26 13:05:19');



DROP TABLE IF EXISTS savings_accounts;

CREATE TABLE `savings_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_number` varchar(30) NOT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  `savings_product_id` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL COMMENT '1 = action | 2 = Deactivate',
  `opening_balance` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_accounts_member_id_foreign` (`member_id`),
  KEY `savings_accounts_savings_product_id_foreign` (`savings_product_id`),
  CONSTRAINT `savings_accounts_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `savings_accounts_savings_product_id_foreign` FOREIGN KEY (`savings_product_id`) REFERENCES `savings_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO savings_accounts VALUES('1','20230401001','1','1','1','1000.00','','1','','2024-04-18 14:53:54','2024-04-18 14:53:54');
INSERT INTO savings_accounts VALUES('2','20230401002','2','1','1','1000.00','','1','','2024-04-18 14:54:08','2024-04-18 14:54:08');
INSERT INTO savings_accounts VALUES('3','20230401003','3','1','1','1000.00','','1','','2024-04-18 14:54:23','2024-04-18 14:54:23');
INSERT INTO savings_accounts VALUES('4','20230401004','4','1','1','500.00','','1','','2024-04-18 14:54:42','2024-04-18 14:54:42');
INSERT INTO savings_accounts VALUES('5','20230401005','5','1','1','1000.00','','1','','2024-04-18 14:54:59','2024-04-18 14:54:59');
INSERT INTO savings_accounts VALUES('6','20230401006','6','1','1','500.00','','1','','2024-04-18 14:55:14','2024-04-18 14:55:14');
INSERT INTO savings_accounts VALUES('7','20230401007','9','1','1','1000.00','','1','','2024-04-18 14:55:30','2024-04-18 14:55:30');
INSERT INTO savings_accounts VALUES('8','20230401008','7','1','1','500.00','','1','','2024-04-18 14:55:48','2024-04-18 14:55:48');
INSERT INTO savings_accounts VALUES('9','20230401009','10','1','1','500.00','','1','','2024-04-18 14:56:05','2024-04-18 14:56:05');
INSERT INTO savings_accounts VALUES('10','20230401010','11','1','1','1000.00','','1','','2024-04-18 14:56:19','2024-04-18 14:56:19');
INSERT INTO savings_accounts VALUES('11','20230401011','12','1','1','1000.00','','1','1','2024-04-18 15:14:34','2024-04-18 15:14:44');
INSERT INTO savings_accounts VALUES('12','20230401012','13','1','1','1000.00','','1','','2024-04-18 15:21:25','2024-04-18 15:21:25');
INSERT INTO savings_accounts VALUES('13','20230401013','14','1','1','500.00','','1','','2024-04-18 15:22:01','2024-04-18 15:22:01');
INSERT INTO savings_accounts VALUES('14','20230401014','15','1','1','1000.00','','1','','2024-04-21 19:19:36','2024-04-21 19:19:36');
INSERT INTO savings_accounts VALUES('15','20230401015','16','1','1','1000.00','','1','','2024-04-21 19:19:58','2024-04-21 19:19:58');
INSERT INTO savings_accounts VALUES('16','20230401016','19','1','1','685.30','interest','1','','2024-05-11 16:25:54','2024-05-11 16:25:54');
INSERT INTO savings_accounts VALUES('17','20230401017','20','1','1','100.00','','1','','2024-05-11 16:30:02','2024-05-11 16:30:02');
INSERT INTO savings_accounts VALUES('18','20230401018','21','1','1','5000.00','Mar24-July-24','1','','2024-07-01 19:09:40','2024-07-01 19:09:40');
INSERT INTO savings_accounts VALUES('19','20230401019','22','1','1','8000.00','Account Open','1','','2024-08-11 11:09:31','2024-08-11 11:09:31');
INSERT INTO savings_accounts VALUES('20','20230401020','23','1','1','10000.00','Open new account and 2 installment','1','','2024-08-18 10:19:44','2024-08-18 10:19:44');
INSERT INTO savings_accounts VALUES('21','hasib','24','1','1','12000.00','','1','','2025-11-16 01:48:08','2025-11-16 01:48:08');
INSERT INTO savings_accounts VALUES('22','0000022','26','1','0','0.00','','1','','2025-11-18 18:19:17','2025-11-18 18:19:17');



DROP TABLE IF EXISTS savings_products;

CREATE TABLE `savings_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `savings_products_currency_id_foreign` (`currency_id`),
  CONSTRAINT `savings_products_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO savings_products VALUES('1','MT-Saving','4','0.00','daily_outstanding_balance','12','','5000.00','1','500.00','100.00','100.00','4','1','2024-04-18 14:51:20','2024-05-11 15:35:15');



DROP TABLE IF EXISTS schedule_tasks_histories;

CREATE TABLE `schedule_tasks_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `reference_id` bigint(20) DEFAULT NULL,
  `others` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS setting_translations;

CREATE TABLE `setting_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `setting_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_translations_setting_id_locale_unique` (`setting_id`,`locale`),
  CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','mail_type','smtp','','2024-04-18 12:33:45');
INSERT INTO settings VALUES('2','backend_direction','ltr','','2024-04-18 12:30:17');
INSERT INTO settings VALUES('3','language','English','','2024-04-18 14:46:34');
INSERT INTO settings VALUES('4','email_verification','disabled','','');
INSERT INTO settings VALUES('5','allow_singup','yes','','');
INSERT INTO settings VALUES('6','company_name','Microtrust Socity Management System','2024-04-18 06:29:34','2024-04-18 14:46:34');
INSERT INTO settings VALUES('7','site_title','Microtrust','2024-04-18 06:29:34','2024-04-18 14:46:34');
INSERT INTO settings VALUES('8','phone','01738356180','2024-04-18 06:29:34','2024-04-18 14:46:34');
INSERT INTO settings VALUES('9','email','hasib.9437.hu@gmail.com','2024-04-18 06:29:34','2024-04-18 14:46:34');
INSERT INTO settings VALUES('10','timezone','Asia/Dhaka','2024-04-18 06:29:34','2024-04-18 14:46:34');
INSERT INTO settings VALUES('11','default_branch_name','Main Branch','2024-04-18 12:29:59','2024-04-18 14:46:34');
INSERT INTO settings VALUES('12','address','217 3rd colony, lalkuthi, Mirpur-1','2024-04-18 12:29:59','2024-04-18 14:46:34');
INSERT INTO settings VALUES('13','currency_position','left','2024-04-18 12:30:14','2024-04-18 12:30:17');
INSERT INTO settings VALUES('14','date_format','Y-m-d','2024-04-18 12:30:14','2024-04-18 12:30:17');
INSERT INTO settings VALUES('15','time_format','24','2024-04-18 12:30:14','2024-04-18 12:30:17');
INSERT INTO settings VALUES('16','member_signup','1','2024-04-18 12:30:14','2024-04-18 12:30:17');
INSERT INTO settings VALUES('17','own_account_transfer_fee_type','percentage','2024-04-18 12:30:30','2024-04-18 12:30:30');
INSERT INTO settings VALUES('18','own_account_transfer_fee','0','2024-04-18 12:30:30','2024-04-18 12:30:30');
INSERT INTO settings VALUES('19','other_account_transfer_fee_type','percentage','2024-04-18 12:30:30','2024-04-18 12:30:30');
INSERT INTO settings VALUES('20','other_account_transfer_fee','0','2024-04-18 12:30:30','2024-04-18 12:30:30');
INSERT INTO settings VALUES('21','from_email','microtrust@creativeitbari.com	','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('22','from_name','Microtrust Do Not Reply','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('23','smtp_host','mail.creativeitbari.com','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('24','smtp_port','465','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('25','smtp_username','microtrust@creativeitbari.com','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('26','smtp_password','Rajbari@12345678!@#','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('27','smtp_encryption','ssl','2024-04-18 12:32:58','2024-04-18 12:33:45');
INSERT INTO settings VALUES('28','logo','logo.png','2024-04-18 14:49:45','2024-04-18 14:49:48');
INSERT INTO settings VALUES('29','favicon','file_1713430187.png','2024-04-18 14:49:46','2024-04-18 14:49:47');



DROP TABLE IF EXISTS transaction_categories;

CREATE TABLE `transaction_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `related_to` varchar(2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transaction_categories VALUES('1','Cash deposit','cr','1','','2024-04-18 19:38:44','2024-04-18 19:38:44');
INSERT INTO transaction_categories VALUES('2','Bank Profit','cr','1','','2024-05-11 16:21:34','2024-05-11 16:21:34');



DROP TABLE IF EXISTS transactions;

CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) unsigned NOT NULL,
  `trans_date` datetime NOT NULL,
  `savings_account_id` bigint(20) unsigned DEFAULT NULL,
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
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Parent transaction id',
  `gateway_id` bigint(20) DEFAULT NULL COMMENT 'PayPal | Stripe | Other Gateway',
  `created_user_id` bigint(20) DEFAULT NULL,
  `updated_user_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) DEFAULT NULL,
  `transaction_details` text DEFAULT NULL,
  `tracking_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_member_id_foreign` (`member_id`),
  KEY `transactions_savings_account_id_foreign` (`savings_account_id`),
  KEY `transactions_parent_id_foreign` (`parent_id`),
  CONSTRAINT `transactions_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_savings_account_id_foreign` FOREIGN KEY (`savings_account_id`) REFERENCES `savings_accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO transactions VALUES('1','1','2023-04-27 14:53:00','1','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:53:54','2024-04-18 15:06:47');
INSERT INTO transactions VALUES('2','2','2023-04-27 14:54:00','2','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:54:08','2024-04-18 15:15:23');
INSERT INTO transactions VALUES('3','3','2023-04-27 14:54:00','3','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:54:23','2024-04-18 15:05:51');
INSERT INTO transactions VALUES('4','4','2023-04-27 14:54:00','4','','500.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:54:42','2024-04-18 15:05:11');
INSERT INTO transactions VALUES('5','5','2023-04-27 14:54:00','5','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:54:59','2024-04-18 15:04:51');
INSERT INTO transactions VALUES('6','6','2023-04-27 14:55:00','6','','500.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:55:14','2024-04-18 15:04:38');
INSERT INTO transactions VALUES('7','9','2023-04-27 14:55:00','7','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:55:30','2024-04-18 15:04:14');
INSERT INTO transactions VALUES('8','7','2023-04-27 14:55:00','8','','500.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:55:48','2024-04-18 15:03:00');
INSERT INTO transactions VALUES('9','10','2023-04-27 14:56:00','9','','500.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:56:05','2024-04-18 15:01:51');
INSERT INTO transactions VALUES('10','11','2023-04-30 14:56:00','10','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 14:56:19','2024-04-18 15:01:22');
INSERT INTO transactions VALUES('11','12','2023-05-22 15:14:00','11','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 15:14:34','2024-04-18 15:15:45');
INSERT INTO transactions VALUES('12','13','2023-04-27 15:21:00','12','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 15:21:25','2024-04-18 15:22:35');
INSERT INTO transactions VALUES('13','14','2023-04-27 15:22:00','13','','500.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-18 15:22:01','2024-04-18 15:22:21');
INSERT INTO transactions VALUES('15','16','2023-04-27 19:19:00','15','','1000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-04-21 19:19:58','2024-04-21 19:20:31');
INSERT INTO transactions VALUES('16','1','2023-05-31 19:22:00','1','','1000.00','0.00','cr','Deposit','Manual','2','','May Saifur 23','','','','','1','','','','','2024-04-21 19:23:04','2024-04-21 19:23:04');
INSERT INTO transactions VALUES('17','2','2023-06-21 19:22:00','2','','1000.00','0.00','cr','Deposit','Manual','2','','Nazmul may-23','','','','','1','1','','','','2024-04-21 19:24:19','2024-04-21 19:24:36');
INSERT INTO transactions VALUES('18','5','2023-05-31 19:22:00','5','','1000.00','0.00','cr','Deposit','Manual','2','','Hasib May-23','','','','','1','','','','','2024-04-21 19:25:41','2024-04-21 19:25:41');
INSERT INTO transactions VALUES('19','16','2023-06-21 19:25:00','15','','1000.00','0.00','cr','Deposit','Manual','2','','Tarik may-23','','','','','1','','','','','2024-04-21 19:26:36','2024-04-21 19:26:36');
INSERT INTO transactions VALUES('20','3','2023-04-21 19:26:00','3','','1000.00','0.00','cr','Deposit','Manual','2','','Tawfiq may-23','','','','','1','','','','','2024-04-21 19:27:28','2024-04-21 19:27:28');
INSERT INTO transactions VALUES('21','13','2023-05-31 19:27:00','12','','1000.00','0.00','cr','Deposit','Manual','2','','Raju May-23','','','','','1','','','','','2024-04-21 19:30:23','2024-04-21 19:30:23');
INSERT INTO transactions VALUES('22','11','2023-05-31 19:22:00','10','','1000.00','0.00','cr','Deposit','Manual','2','','Adnan may23','','','','','1','','','','','2024-04-21 19:31:01','2024-04-21 19:31:01');
INSERT INTO transactions VALUES('23','9','2023-05-30 19:22:00','7','','1000.00','0.00','cr','Deposit','Manual','2','','Mashrur may23','','','','','1','','','','','2024-04-21 19:31:42','2024-04-21 19:31:42');
INSERT INTO transactions VALUES('24','12','2023-05-30 19:22:00','11','','1000.00','0.00','cr','Deposit','Manual','2','','Rukaiya May-23','','','','','1','','','','','2024-04-21 19:32:25','2024-04-21 19:32:25');
INSERT INTO transactions VALUES('25','7','2023-05-31 19:22:00','8','','500.00','0.00','cr','Deposit','Manual','2','','Tuhin may-23','','','','','1','','','','','2024-04-21 19:35:10','2024-04-21 19:35:10');
INSERT INTO transactions VALUES('26','6','2023-05-31 19:22:00','6','','500.00','0.00','cr','Deposit','Manual','2','','Fahim may-23','','','','','1','','','','','2024-04-21 19:36:02','2024-04-21 19:36:02');
INSERT INTO transactions VALUES('27','10','2023-06-20 19:22:00','9','','500.00','0.00','cr','Deposit','Manual','2','','Hrithik May-23','','','','','1','','','','','2024-04-21 19:37:38','2024-04-21 19:37:38');
INSERT INTO transactions VALUES('28','14','2023-04-27 19:37:00','13','','500.00','0.00','cr','Deposit','Manual','2','','Didar may-23','','','','','1','','','','','2024-04-21 19:39:34','2024-04-21 19:39:34');
INSERT INTO transactions VALUES('29','4','2023-06-26 19:39:00','4','','500.00','0.00','cr','Deposit','Manual','2','','Ziarur may23','','','','','1','','','','','2024-04-21 19:40:19','2024-04-21 19:40:19');
INSERT INTO transactions VALUES('30','1','2024-04-21 19:55:00','1','','10000.00','0.00','cr','Deposit','Manual','2','','Saifur june23 - April24','','','','','1','','','','','2024-04-21 19:57:55','2024-04-21 19:57:55');
INSERT INTO transactions VALUES('31','2','2024-04-21 19:57:00','2','','10000.00','0.00','cr','Deposit','Manual','2','','Nazmul  june23 - April24','','','','','1','','','','','2024-04-21 19:58:24','2024-04-21 19:58:24');
INSERT INTO transactions VALUES('32','3','2024-04-21 19:58:00','3','','8000.00','0.00','cr','Deposit','Manual','2','','Tawfiq  june23 - April24','','','','','1','','','','','2024-04-21 19:58:50','2024-04-21 19:58:50');
INSERT INTO transactions VALUES('33','4','2024-04-21 19:58:00','4','','6000.00','0.00','cr','Deposit','Manual','2','','Ziaur  june23 - April24','','','','','1','','','','','2024-04-21 19:59:16','2024-04-21 19:59:16');
INSERT INTO transactions VALUES('34','5','2024-04-21 19:59:00','5','','10000.00','0.00','cr','Deposit','Manual','2','','Hasib  june23 - April24','','','','','1','','','','','2024-04-21 19:59:40','2024-04-21 19:59:40');
INSERT INTO transactions VALUES('35','6','2024-04-21 19:59:00','6','','6000.00','0.00','cr','Deposit','Manual','2','','Fahim  june23 - April24','','','','','1','','','','','2024-04-21 20:00:12','2024-04-21 20:00:12');
INSERT INTO transactions VALUES('36','7','2024-04-21 20:00:00','8','','7000.00','0.00','cr','Deposit','Manual','2','','Tuhin  june23 - April24','','','','','1','','','','','2024-04-21 20:01:00','2024-04-21 20:01:00');
INSERT INTO transactions VALUES('37','9','2024-04-21 20:01:00','7','','9000.00','0.00','cr','Deposit','Manual','2','','Mashrur  june23 - April24','','','','','1','','','','','2024-04-21 20:01:40','2024-04-21 20:01:40');
INSERT INTO transactions VALUES('38','10','2024-04-21 20:01:00','9','','7000.00','0.00','cr','Deposit','Manual','2','','Hrithik  june23 - April24','','','','','1','','','','','2024-04-21 20:02:13','2024-04-21 20:02:13');
INSERT INTO transactions VALUES('39','11','2024-04-21 20:02:00','10','','10000.00','0.00','cr','Deposit','Manual','2','','Adnan  june23 - April24','','','','','1','','','','','2024-04-21 20:02:44','2024-04-21 20:02:44');
INSERT INTO transactions VALUES('40','12','2024-04-21 20:02:00','11','','7000.00','0.00','cr','Deposit','Manual','2','','Rukaiya  june23 - April24','','','','','1','','','','','2024-04-21 20:03:12','2024-04-21 20:03:12');
INSERT INTO transactions VALUES('41','14','2024-04-21 20:03:00','13','','7000.00','0.00','cr','Deposit','Manual','2','','Didar  june23 - April24','','','','','1','','','','','2024-04-21 20:03:44','2024-04-21 20:03:44');
INSERT INTO transactions VALUES('42','15','2024-04-21 20:03:00','14','','4000.00','0.00','cr','Deposit','Manual','2','','Mamun  june23 - April24','','','','','1','','','','','2024-04-21 20:04:12','2024-04-21 20:04:12');
INSERT INTO transactions VALUES('43','16','2024-04-21 20:04:00','15','','9000.00','0.00','cr','Deposit','Manual','2','','Tarif  june23 - April24','','','','','1','','','','','2024-04-21 20:05:12','2024-04-21 20:05:12');
INSERT INTO transactions VALUES('44','5','2024-05-04 01:41:47','5','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-05-04 01:41:47','2024-05-04 01:41:47');
INSERT INTO transactions VALUES('45','15','2024-05-07 14:02:50','14','0.00','5000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-05-07 14:02:50','2024-05-07 14:02:50');
INSERT INTO transactions VALUES('46','2','2024-05-07 14:04:37','2','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-05-07 14:04:37','2024-05-07 14:04:37');
INSERT INTO transactions VALUES('47','6','2024-05-07 14:04:50','6','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-05-07 14:04:50','2024-05-07 14:04:50');
INSERT INTO transactions VALUES('48','11','2024-05-07 14:05:06','10','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-05-07 14:05:06','2024-05-07 14:05:06');
INSERT INTO transactions VALUES('50','4','2024-05-03 12:16:00','4','','1000.00','0.00','cr','Deposit','Manual','2','','may-2024
#AA47C312','','','','','1','','','','','2024-05-11 16:01:22','2024-05-11 16:01:22');
INSERT INTO transactions VALUES('51','9','2024-05-11 16:08:00','7','','2000.00','0.00','cr','Deposit','Manual','2','','april24, may-24','','','','','1','','','','','2024-05-11 16:09:07','2024-05-11 16:09:07');
INSERT INTO transactions VALUES('52','19','2024-05-11 16:25:54','16','','685.30','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','','','','','2024-05-11 16:25:54','2024-05-11 16:25:54');
INSERT INTO transactions VALUES('53','19','2023-12-29 16:26:00','16','','102.85','0.00','dr','Account_Maintenance_Fee','Manual','2','','Tax on profit','','','','','1','','','','','2024-05-11 16:27:13','2024-05-11 16:27:13');
INSERT INTO transactions VALUES('54','20','2024-05-11 16:30:02','17','','100.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','','','','','2024-05-11 16:30:02','2024-05-11 16:30:02');
INSERT INTO transactions VALUES('55','20','2024-03-13 16:31:00','17','','840.00','0.00','cr','Deposit','Manual','2','','Tarif 600
masrur 240','','','','','1','','','','','2024-05-11 16:33:05','2024-05-11 16:33:05');
INSERT INTO transactions VALUES('56','20','2024-05-04 16:34:00','17','','100.00','0.00','cr','Deposit','Manual','2','','saifur 100','','','','','1','','','','','2024-05-11 16:34:39','2024-05-11 16:34:39');
INSERT INTO transactions VALUES('57','3','2024-05-15 10:23:27','3','0.00','2000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-05-15 10:23:27','2024-05-15 10:23:27');
INSERT INTO transactions VALUES('58','6','2024-06-02 19:45:48','6','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-06-02 19:45:48','2024-06-02 19:45:48');
INSERT INTO transactions VALUES('59','10','2024-06-06 09:49:36','9','0.00','2000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-06-06 09:49:36','2024-06-06 09:49:36');
INSERT INTO transactions VALUES('60','20','2024-06-06 09:49:00','17','','1200.00','0.00','cr','Deposit','Manual','2','','Apr,May charge','','','','','1','','','','','2024-06-06 09:50:31','2024-06-06 09:50:31');
INSERT INTO transactions VALUES('61','16','2024-06-06 09:50:00','15','','3000.00','0.00','cr','Deposit','Manual','2','','Apr,May,June24','','','','','1','','','','','2024-06-06 09:51:15','2024-06-06 09:51:15');
INSERT INTO transactions VALUES('62','2','2024-06-06 11:00:00','2','','1000.00','0.00','cr','Deposit','Manual','2','','Nazmul-June-24','','','','','1','','','','','2024-06-06 11:00:58','2024-06-06 11:00:58');
INSERT INTO transactions VALUES('63','11','2024-06-09 15:34:49','10','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-06-09 15:34:49','2024-06-09 15:34:49');
INSERT INTO transactions VALUES('64','20','2024-06-09 15:34:00','17','','155.00','0.00','cr','Deposit','Manual','2','','masrur card bill','','','','','1','','','','','2024-06-09 15:35:41','2024-06-09 15:35:41');
INSERT INTO transactions VALUES('65','14','2024-06-11 12:43:00','13','','6000.00','0.00','cr','Deposit','Manual','2','','Previously year all clear, may2024, june2024','','','','','1','','','','','2024-06-11 12:48:48','2024-06-11 12:48:48');
INSERT INTO transactions VALUES('66','5','2024-06-11 12:48:00','5','','1000.00','0.00','cr','Deposit','Manual','2','','Hasib June24','','','','','1','','','','','2024-06-11 13:06:51','2024-06-11 13:06:51');
INSERT INTO transactions VALUES('67','12','2024-06-11 16:07:00','11','','5000.00','0.00','cr','Deposit','Manual','2','','Previously 3 month23, may-24,june-24','','','','','1','','','','','2024-06-11 16:07:40','2024-06-11 16:07:40');
INSERT INTO transactions VALUES('68','21','2024-07-01 19:09:40','18','','5000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','','','','','2024-07-01 19:09:40','2024-07-01 19:09:40');
INSERT INTO transactions VALUES('69','16','2024-07-09 15:25:00','15','','1000.00','0.00','cr','Deposit','Manual','2','','Tarik July 24','','','','','1','','','','','2024-07-09 15:25:55','2024-07-09 15:25:55');
INSERT INTO transactions VALUES('70','20','2024-07-09 15:25:00','17','','520.00','0.00','cr','Deposit','Manual','2','','Fromn tarik','','','','','1','','','','','2024-07-09 15:26:16','2024-07-09 15:26:16');
INSERT INTO transactions VALUES('71','5','2024-07-09 15:26:00','5','','1000.00','0.00','cr','Deposit','Manual','2','','Hasib-July24','','','','','1','','','','','2024-07-09 15:26:34','2024-07-09 15:26:34');
INSERT INTO transactions VALUES('72','6','2024-07-09 15:27:24','6','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-07-09 15:27:24','2024-07-09 15:27:24');
INSERT INTO transactions VALUES('73','15','2024-07-09 15:27:00','14','','1000.00','0.00','cr','Deposit','Manual','2','','Mamun-July-24','','','','','1','','','','','2024-07-09 15:28:12','2024-07-09 15:28:12');
INSERT INTO transactions VALUES('74','1','2024-06-29 15:28:00','1','','1000.00','0.00','cr','Deposit','Manual','2','','Saifur-July-24','','','','','1','','','','','2024-07-09 15:30:12','2024-07-09 15:30:12');
INSERT INTO transactions VALUES('75','20','2024-07-08 12:37:00','17','','520.00','0.00','cr','Bank Profit','Manual','2','','tarik vi loan profit','','','','','1','','','','','2024-08-08 12:38:25','2024-08-08 12:38:25');
INSERT INTO transactions VALUES('76','2','2024-08-08 12:38:00','2','','1000.00','0.00','cr','Deposit','Manual','2','','nazmul aug 24','','','','','1','','','','','2024-08-08 12:52:11','2024-08-08 12:52:11');
INSERT INTO transactions VALUES('77','3','2024-08-08 12:54:25','3','0.00','2000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-08-08 12:54:25','2024-08-08 12:54:25');
INSERT INTO transactions VALUES('78','11','2024-08-08 12:54:30','10','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-08-08 12:54:30','2024-08-08 12:54:30');
INSERT INTO transactions VALUES('79','22','2024-07-31 11:09:00','19','','8000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','1','','','','2024-08-11 11:09:31','2024-08-11 11:10:00');
INSERT INTO transactions VALUES('80','7','2024-08-10 11:10:00','8','','4000.00','0.00','cr','Deposit','Manual','2','','May-aug 24','','','','','1','','','','','2024-08-11 11:11:38','2024-08-11 11:11:38');
INSERT INTO transactions VALUES('81','4','2024-08-11 11:11:00','4','','1000.00','0.00','cr','Deposit','Manual','2','','Aug 24','','','','','1','','','','','2024-08-11 11:11:54','2024-08-11 11:11:54');
INSERT INTO transactions VALUES('82','23','2024-08-18 10:19:44','20','','10000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','','','','','2024-08-18 10:19:44','2024-08-18 10:19:44');
INSERT INTO transactions VALUES('83','10','2024-09-03 19:39:51','9','0.00','1500.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-09-03 19:39:51','2024-09-03 19:39:51');
INSERT INTO transactions VALUES('84','22','2024-09-03 19:39:57','19','0.00','5000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-09-03 19:39:57','2024-09-03 19:39:57');
INSERT INTO transactions VALUES('85','10','2024-09-03 19:39:59','9','0.00','2500.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-09-03 19:39:59','2024-09-03 19:39:59');
INSERT INTO transactions VALUES('86','11','2024-09-03 19:40:03','10','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2024-09-03 19:40:03','2024-09-03 19:40:03');
INSERT INTO transactions VALUES('87','9','2024-12-30 12:40:55','7','','6666.67','0.00','dr','Loan_Repayment','Online','2','Loan Repayment','Loan Repayment','7','','','','10','','','','','2024-12-30 12:40:55','2024-12-30 12:40:55');
INSERT INTO transactions VALUES('88','11','2025-06-01 22:55:18','10','0.00','1000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2025-06-01 22:55:18','2025-06-01 22:55:18');
INSERT INTO transactions VALUES('89','11','2025-06-01 22:55:21','10','0.00','2000.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2025-06-01 22:55:21','2025-06-01 22:55:21');
INSERT INTO transactions VALUES('90','10','2025-06-01 22:55:24','9','0.00','1500.00','0.00','cr','Deposit','Bank Transfer Manual','2','','Deposit Via Bank Transfer Manual','','','','','1','','','','','2025-06-01 22:55:24','2025-06-01 22:55:24');
INSERT INTO transactions VALUES('91','24','2025-11-16 01:48:08','21','','12000.00','0.00','cr','Deposit','Manual','2','','Initial Deposit','','','','','1','','','','','2025-11-16 01:48:08','2025-11-16 01:48:08');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) unsigned DEFAULT NULL,
  `status` int(11) NOT NULL,
  `profile_picture` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_branch_id_foreign` (`branch_id`),
  CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Md. Hasibuzzaman','hasib.9437.hu@gmail.com','admin','','','1','default.png','2024-04-18 06:28:37','$2y$10$utVPsl/jeiodhdYfSzwq5O63KNXBPKacOUVAYGc73NFMprWMb6Opa','','','yMXdmtBTQcByo35azra2Xn82v2pOAYhpP8bcbAkYLlQnyJcpxZIFZ2coZ1HA','2024-04-18 06:28:37','2024-04-18 06:28:37');
INSERT INTO users VALUES('2','Md. Saifur','saifur1985bd@gmail.com','customer','','','1','default.png','','$2y$10$Qohd8wueZiiVBGthdQ./V.TLakG8ELD5PeyPmqt.HlM5kM5cDVHTK','','','bGHnzb86p544JA2kLwy4wrhlqMHeDDosEHcmyJlyMpVAjbL0loIBozWsFmom','2024-04-18 06:37:40','2024-04-18 12:39:35');
INSERT INTO users VALUES('3','Md.Nazmul','nazmulhs030@gmail.com','customer','','','1','default.png','','$2y$10$EiezNkWf.ZDDBfjqlxpfoexLYm8ih0aDUnXHXRu6ijDb6LmNiPxaW','','','DDf2tk9e8NhyenYUwSTFxKebT5Rs6VOnwLaPQiC5zSjY6sQ8aqb4hgiwXdYz','2024-04-18 06:38:08','2024-04-18 12:39:42');
INSERT INTO users VALUES('4','Tawfiqul','tawfiqul01@gmail.com','customer','','','1','default.png','','$2y$10$pA2SrEC846ifEv79WTTmY.6uZ1W3EXnBsywb3rfpzJCfmph31vEn2','','','0u9qYvClXQ5HF3x6DedFgcyMDFtonbudeqlNkpArfowZr1ka4ZLAwXiWl2fe','2024-04-18 06:40:44','2024-04-18 12:41:01');
INSERT INTO users VALUES('5','Ziaur','ziaurrahaman939@gmail.com','customer','','','1','default.png','','$2y$10$xNNmMH4jDLBJlH5NvbgW/.qLG4NRiNeeX.XbEHQkgtT.qhLNYTs66','','','','2024-04-18 06:41:28','2024-04-18 12:42:25');
INSERT INTO users VALUES('6','Md','hasib.2030.hu@gmail.com','customer','','','1','default.png','','$2y$10$iQq8cY3CZe9sSAkxUT86COrbQPs7ErOGMsZxiu/oizwkvb0TQIi9W','','','blILkQsiKTjTxq8jCsLnnCoYQjuxZQEdhazPvZHaBZVpjAZGXl8H9nrXXFFO','2024-04-18 06:45:22','2024-04-18 12:45:43');
INSERT INTO users VALUES('7','Mustafizur Rahman','mustafizurr171@gmail.com','customer','','','1','profile_1713452197.png','','$2y$10$rRkGu3CpggI91HswLnb0K.LlZzV8lk45pEABFh3lcULeM1UxT/yia','','','ftRmdshrBS2i9JbJ4lLO9HSSs9w9SbYGf0AHdA5jS9jFLHqDUBTBrqfFm1mm','2024-04-18 06:45:32','2024-04-18 20:56:37');
INSERT INTO users VALUES('8','Sheikh','hituhin09@gmail.com','customer','','','1','default.png','','$2y$10$ghI3oJk99/DWL9YuSqoAv.RPn4KAwHEsI2Xv9hftNqJOtHq3XoeR6','','','FlaB18LmiRWvJi9Te7FtISYtGBJhCWc5lRKcwIMUMVkRJJku28YiU8oqCODA','2024-04-18 06:50:21','2025-06-01 17:36:56');
INSERT INTO users VALUES('10','Md. Mashrur Rahman','mashrurrahman16@gmail.com','customer','','','1','default.png','','$2y$10$H975kpqdKv63BxM.NYnZP.zYIXuy.YyHaVHCaF7kbWgicwjeiQvX6','','','','2024-04-18 07:03:12','2024-04-18 13:03:50');
INSERT INTO users VALUES('11','Hrithik','hrithik08.rudra@gmail.com','customer','','','1','default.png','','$2y$10$5D5nYmvrCnWXHPl7K9HNUePhZh0sGJYV0EGW3ktaNk6Q23xqLoz0G','','','','2024-04-18 07:27:14','2024-04-18 14:27:36');
INSERT INTO users VALUES('12','Khandakar Anim Hassan','khandakar.adnan21@gmail.com','customer','','','1','default.png','','$2y$10$HU2bYE40p4i0zJopSE/Dnujth1/8FRjEDOqh3lAABf9X8lI30yd5W','','','','2024-04-18 07:53:33','2024-04-18 14:28:26');
INSERT INTO users VALUES('13','Rukaiya Azmi','rukaiyaazmi@gmail.com','customer','','','1','','','$2y$10$JH3ErUF2E.t972a1iNYOMOAzO2L36RDL2d82c7M.l.hMkoV2uXL9S','','','','2024-04-18 15:12:59','2024-04-18 15:12:59');
INSERT INTO users VALUES('14','Md Raju Ahmed','rajucse1705@gmail.com','customer','','','1','default.png','','$2y$10$MV/BnritYq5Fqy1rNwoUheJNCGF1qYpxA15gy7dckDXT05C7E085q','','','wbjSjNEN244hjC7A9lLDifmC1QVnL0r9sazNgvbc6xuRNtZ7lMDLxclOUl8o','2024-04-18 15:17:37','2024-04-18 15:17:37');
INSERT INTO users VALUES('15','Md.Didarul Islam','khandidar11@gmail.com','customer','','','1','default.png','','$2y$10$0NibeMTqAMAACtY9J0O6wukE47pwZaQOWUScwguf2LyEASq68wFkq','','','I5uddzWVdHyzBUVMpD3GnVl83FiomYa78LdfLPQqv1MYJIn9a3jStz3ur2cw','2024-04-18 15:20:03','2024-04-18 15:20:03');
INSERT INTO users VALUES('16','Md Almamun','md.almamun.bd@gmail.com','customer','','','1','1713705123Screenshot from 2024-04-21 19-12-00.png','','$2y$10$qEjrXXvCewIy3DOnALZw4O7WZ14OxyOjARsJC5WpQ5Q3kaAzcN4Ue','','','Kqn7pEPWqgGu27razwJiFUnRil8PhjIptQmceODlSxSFWysnF8GdOlaz8Cbi','2024-04-21 19:12:03','2024-04-21 19:12:03');
INSERT INTO users VALUES('17','Md Tarif','tarif.isjnu@gmail.com','customer','','','1','1713705490Screenshot from 2024-04-21 19-17-32.png','','$2y$10$J.VOY2KJPj26RGo7z8aPr.f39BDzWc5JurDjIyDvXqJL1ko.En2yy','','','','2024-04-21 19:18:10','2024-04-21 19:18:10');
INSERT INTO users VALUES('18','Risaht Amin','samiaulamin@gmail.com','customer','','','1','default.png','','$2y$10$yCksvapOBPbQzN6B8XZgbOdsLyXiLiE/m76C8zBBQ5pK4t3J1x1Iq','','','InAp9Ci3jMPwVO73PAfpdqgijd0m8s1IkBSuex3hn9pfuRsTsZXigdk2jGno','2024-07-01 19:08:49','2024-07-01 19:08:49');
INSERT INTO users VALUES('19','Rahemul Islam','rahimulislam14@gmail.com','customer','','','1','1723352880Screenshot from 2024-08-11 11-07-39.png','','$2y$10$20YUMjbtofCWythfJFLjP.1/35TjMnjACCMuv9eb3RtJdSkp7wJfS','','','','2024-08-11 11:08:00','2024-08-11 11:08:00');
INSERT INTO users VALUES('20','Masuma Sultana','masuma.cse@gmail.com','customer','','','1','default.png','','$2y$10$tuWYxqX0fHZ/JAkdq8EbNOT1WQTS8I4BX3jl09gcpv7AFje9ECutS','','','','2024-08-18 10:17:46','2024-08-18 10:17:46');
INSERT INTO users VALUES('21','HERA','adminhera@gmail.com','user','1','2','1','default.png','2025-10-16 12:40:25','$2y$10$V5hUu92M76R5cYlP5y4JMuW7v.vFr/64sZMPemX9Loc1fYupACLxu','','','xAKnUgkDflGXTei5DZdTQKFRxHr8y1J4O93n5SFjDCNBKEIt8LU7oJcgEmla','2025-10-16 12:40:25','2025-10-26 13:07:43');
INSERT INTO users VALUES('22','Md. Hasibuzzaman','hasib.123.hu@gmail.com','customer','','','1','1763236086fashion-KV.jpg','','$2y$10$2Z4dl1Lo0S/auyytG6I0suc7fEkwNQSas9R.HiWYg71Yf6G9Aio7O','','','','2025-11-16 01:48:07','2025-11-16 01:48:07');
INSERT INTO users VALUES('23','123 456','12345@gmail.com','customer','','','1','1763489957fashion-KV.jpg','','$2y$10$ezFBseEdKwOEybB5iRBI4.kYaaWeM1DOlEC28KgPWq6.SipxvMPcq','','','','2025-11-18 18:19:17','2025-11-18 18:19:17');



DROP TABLE IF EXISTS withdraw_methods;

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO withdraw_methods VALUES('1','Cash','default.png','4','0.00','0.00','0.00','0.00','<p>Any Cash</p>','1','[\"Cash\",\"hasib.9437.hu@gmail.com\"]','2024-05-11 15:34:33','2024-05-11 15:34:33');



DROP TABLE IF EXISTS withdraw_requests;

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) unsigned NOT NULL,
  `method_id` bigint(20) unsigned NOT NULL,
  `debit_account_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `converted_amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `transaction_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `withdraw_requests_member_id_foreign` (`member_id`),
  KEY `withdraw_requests_method_id_foreign` (`method_id`),
  KEY `withdraw_requests_debit_account_id_foreign` (`debit_account_id`),
  CONSTRAINT `withdraw_requests_debit_account_id_foreign` FOREIGN KEY (`debit_account_id`) REFERENCES `savings_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `withdraw_requests_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `withdraw_requests_method_id_foreign` FOREIGN KEY (`method_id`) REFERENCES `withdraw_methods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




