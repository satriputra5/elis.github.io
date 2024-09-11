/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - lisensi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lisensi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `lisensi`;

/*Table structure for table `auth_activation_attempts` */

DROP TABLE IF EXISTS `auth_activation_attempts`;

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_activation_attempts` */

/*Table structure for table `auth_groups` */

DROP TABLE IF EXISTS `auth_groups`;

CREATE TABLE `auth_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `auth_groups` */

insert  into `auth_groups`(`id`,`name`,`description`) values 
(1,'administrator','administrator'),
(2,'guest','guest');

/*Table structure for table `auth_groups_permissions` */

DROP TABLE IF EXISTS `auth_groups_permissions`;

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  KEY `group_id_permission_id` (`group_id`,`permission_id`),
  CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_groups_permissions` */

/*Table structure for table `auth_groups_users` */

DROP TABLE IF EXISTS `auth_groups_users`;

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) unsigned NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_groups_users_user_id_foreign` (`user_id`),
  KEY `group_id_user_id` (`group_id`,`user_id`),
  CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_groups_users` */

/*Table structure for table `auth_logins` */

DROP TABLE IF EXISTS `auth_logins`;

CREATE TABLE `auth_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `auth_logins` */

insert  into `auth_logins`(`id`,`ip_address`,`email`,`user_id`,`date`,`success`) values 
(2,'::1','diyoners@gmail.com',NULL,'2024-07-20 20:07:34',0);

/*Table structure for table `auth_permissions` */

DROP TABLE IF EXISTS `auth_permissions`;

CREATE TABLE `auth_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permissions` */

insert  into `auth_permissions`(`id`,`name`,`description`) values 
(1,'pegawai','pegawai'),
(2,'peserta','peserta'),
(3,'useradmin','useradmin'),
(4,'guest','guest');

/*Table structure for table `auth_reset_attempts` */

DROP TABLE IF EXISTS `auth_reset_attempts`;

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_reset_attempts` */

/*Table structure for table `auth_tokens` */

DROP TABLE IF EXISTS `auth_tokens`;

CREATE TABLE `auth_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_tokens_user_id_foreign` (`user_id`),
  KEY `selector` (`selector`),
  CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_tokens` */

/*Table structure for table `auth_users_permissions` */

DROP TABLE IF EXISTS `auth_users_permissions`;

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) unsigned NOT NULL DEFAULT 0,
  `permission_id` int(11) unsigned NOT NULL DEFAULT 0,
  KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  KEY `user_id_permission_id` (`user_id`,`permission_id`),
  CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_users_permissions` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`version`,`class`,`group`,`namespace`,`time`,`batch`) values 
(1,'2017-11-20-223112','Myth\\Auth\\Database\\Migrations\\CreateAuthTables','default','Myth\\Auth',1721460135,1);

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `pegawai_id` int(11) NOT NULL DEFAULT 0,
  `pegawai_pin` varchar(32) NOT NULL,
  `pegawai_nip` varchar(30) DEFAULT NULL,
  `pegawai_nama` varchar(255) NOT NULL,
  `pegawai_alias` varchar(50) DEFAULT NULL,
  `pegawai_pwd` varchar(10) NOT NULL DEFAULT '0',
  `pegawai_rfid` varchar(32) NOT NULL DEFAULT '0',
  `pegawai_privilege` varchar(50) NOT NULL DEFAULT '0' COMMENT '-1: Invalid, 0: User,  1: Operator, 2: Sub Admin, 3: Admin',
  `pegawai_telp` varchar(20) DEFAULT NULL,
  `pegawai_status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '0:Non Aktif; 1:Aktif; 2:Berhenti',
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pembagian1_id` int(11) DEFAULT 0,
  `pembagian2_id` int(11) DEFAULT 0,
  `pembagian3_id` int(11) DEFAULT 0,
  `pembagian4_id` int(11) DEFAULT NULL,
  `pembagian5_id` int(11) DEFAULT NULL,
  `tgl_mulai_kerja` date DEFAULT NULL,
  `tgl_resign` date DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:Laki-laki, 2:Perempuan',
  `tgl_masuk_pertama` date DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT '',
  `tmp_img` mediumtext DEFAULT NULL,
  `nama_bank` varchar(50) DEFAULT '',
  `nama_rek` varchar(100) DEFAULT '',
  `no_rek` varchar(20) DEFAULT '',
  `new_pegawai_id` int(11) DEFAULT NULL,
  `golongan` int(1) DEFAULT NULL,
  `grup` varchar(10) DEFAULT NULL,
  `grup_t` varchar(10) DEFAULT NULL,
  `grup_jam_kerja` varchar(10) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  PRIMARY KEY (`pegawai_id`),
  UNIQUE KEY `pegawai_pin` (`pegawai_pin`),
  UNIQUE KEY `pegawai_nip` (`pegawai_nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pegawai` */

/*Table structure for table `pembagian1` */

DROP TABLE IF EXISTS `pembagian1`;

CREATE TABLE `pembagian1` (
  `pembagian1_id` int(11) NOT NULL DEFAULT 0,
  `pembagian1_nama` varchar(100) DEFAULT NULL,
  `pembagian1_ket` varchar(255) DEFAULT '',
  PRIMARY KEY (`pembagian1_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembagian1` */

/*Table structure for table `pembagian2` */

DROP TABLE IF EXISTS `pembagian2`;

CREATE TABLE `pembagian2` (
  `pembagian2_id` int(11) NOT NULL DEFAULT 0,
  `pembagian2_nama` varchar(100) DEFAULT NULL,
  `pembagian2_ket` varchar(255) DEFAULT '',
  PRIMARY KEY (`pembagian2_id`),
  UNIQUE KEY `pembagian2_nama` (`pembagian2_nama`),
  UNIQUE KEY `pembagian2_ket` (`pembagian2_ket`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembagian2` */

/*Table structure for table `pembagian3` */

DROP TABLE IF EXISTS `pembagian3`;

CREATE TABLE `pembagian3` (
  `pembagian3_id` int(11) NOT NULL DEFAULT 0,
  `pembagian3_nama` varchar(100) DEFAULT NULL,
  `pembagian3_ket` varchar(255) DEFAULT '',
  PRIMARY KEY (`pembagian3_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pembagian3` */

/*Table structure for table `skill_certification` */

DROP TABLE IF EXISTS `skill_certification`;

CREATE TABLE `skill_certification` (
  `id` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `name_skill` varchar(100) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_section` int(11) DEFAULT NULL,
  `first_date_certif` date DEFAULT NULL,
  `end_date_certif` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_certification_skill_type_foreign` (`id_type`),
  KEY `skill_cretification_skill_section_foreign` (`id_section`),
  CONSTRAINT `skill_certification_skill_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `skill_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skill_cretification_skill_section_foreign` FOREIGN KEY (`id_section`) REFERENCES `skill_section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_certification` */

/*Table structure for table `skill_section` */

DROP TABLE IF EXISTS `skill_section`;

CREATE TABLE `skill_section` (
  `id` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_section` */

/*Table structure for table `skill_type` */

DROP TABLE IF EXISTS `skill_type`;

CREATE TABLE `skill_type` (
  `id` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `skill_type` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`password_hash`,`reset_hash`,`reset_at`,`reset_expires`,`activate_hash`,`status`,`status_message`,`active`,`force_pass_reset`,`created_at`,`updated_at`,`deleted_at`) values 
(2,'diyon@gmail.com','diyon','$2y$10$8SWJdmSUyc1U34nsZjMM/uiPBR0mMxycap8jkhhg/pDx960ptULBK',NULL,NULL,NULL,NULL,NULL,NULL,1,0,'2024-07-20 19:33:13','2024-07-20 19:33:13',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
