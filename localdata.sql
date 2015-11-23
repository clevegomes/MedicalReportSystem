/*
SQLyog Ultimate v8.55 
MySQL - 5.6.20 : Database - medr
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `backend_users` */

CREATE TABLE `backend_users` (
  `k` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` enum('operator') NOT NULL DEFAULT 'operator' COMMENT 'admin->operator,staff,patient',
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '1' COMMENT '1->active ,0->inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date created',
  `updated_at` datetime DEFAULT NULL COMMENT 'date updated',
  PRIMARY KEY (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `backend_users` */

insert  into `backend_users`(`k`,`role`,`username`,`password`,`full_name`,`active`,`created_at`,`updated_at`) values (1,'operator','admin','$2y$10$EGEQ/6FY1bt2m6R5YMt4/.S.OIJTtWpdaXJz3Uxx8qkd9S7Sd2qvy','Administrator',1,'2014-07-31 08:56:41','2015-11-19 00:00:00');
insert  into `backend_users`(`k`,`role`,`username`,`password`,`full_name`,`active`,`created_at`,`updated_at`) values (5,'operator','test','$2y$10$GIYm26b1WcNeDl62dHPFxuuY0e1c/wcvRvomBXnuj7iVj45lHDKzS','test',1,'2015-11-23 20:02:04',NULL);

/*Table structure for table `news` */

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`slug`,`text`) values (1,'test','test','test');
insert  into `news`(`id`,`title`,`slug`,`text`) values (2,'test','test','test');

/*Table structure for table `report_type` */

CREATE TABLE `report_type` (
  `report_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `report_type_code` varchar(50) DEFAULT NULL COMMENT 'Alpha numeric code',
  `report_type_description` varbinary(255) DEFAULT NULL COMMENT 'Report type description',
  PRIMARY KEY (`report_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `report_type` */

insert  into `report_type`(`report_type_id`,`report_type_code`,`report_type_description`) values (1,'ANA','Anatomical pathology');
insert  into `report_type`(`report_type_id`,`report_type_code`,`report_type_description`) values (2,'CYT','Cytopathology pathology');
insert  into `report_type`(`report_type_id`,`report_type_code`,`report_type_description`) values (3,'DER','Dermatopathology pathology');
insert  into `report_type`(`report_type_id`,`report_type_code`,`report_type_description`) values (4,'NEU','Neuropathology pathology');
insert  into `report_type`(`report_type_id`,`report_type_code`,`report_type_description`) values (5,'REN','Renal pathology');
insert  into `report_type`(`report_type_id`,`report_type_code`,`report_type_description`) values (6,'SUR','Surgical pathology');

/*Table structure for table `reports` */

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `report_type_code` varchar(50) DEFAULT NULL COMMENT 'code of the report type',
  `created_date` datetime DEFAULT NULL COMMENT 'date_created',
  `updated_date` datetime DEFAULT NULL COMMENT 'date_updated',
  `case_code` varchar(255) DEFAULT NULL COMMENT 'Case Code',
  `report_details` text COMMENT 'Details about the report',
  `patient_id` int(11) DEFAULT NULL COMMENT 'Patient id',
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `reports` */

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` enum('patient') NOT NULL DEFAULT 'patient',
  `email` varchar(100) NOT NULL,
  `passcode` varchar(255) NOT NULL COMMENT 'Pass code to login',
  `pass_expire_days` datetime DEFAULT NULL COMMENT 'Pass code will expire in given days',
  `first_name` varchar(50) DEFAULT NULL COMMENT 'first name',
  `last_name` varchar(50) DEFAULT NULL COMMENT 'last name',
  `active` tinyint(1) unsigned DEFAULT '0' COMMENT '1-> active ,0 -> inactive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_of_birth` date DEFAULT NULL COMMENT 'Date of birth',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`role`,`email`,`passcode`,`pass_expire_days`,`first_name`,`last_name`,`active`,`created_at`,`date_of_birth`) values (1,'patient','gomescleve@gmail.com','Pas332','2016-11-23 00:00:00','test','test',0,'2015-11-23 16:46:35','1985-11-22');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
